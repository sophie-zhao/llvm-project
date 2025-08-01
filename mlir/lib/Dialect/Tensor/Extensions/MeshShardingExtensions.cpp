//===- ShardingInterfaceImpl.cpp ------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Mesh/Interfaces/ShardingInterface.h"
#include "mlir/Dialect/Mesh/Interfaces/ShardingInterfaceImpl.h"
#include "mlir/Dialect/Tensor/IR/ShardingInterfaceImpl.h"
#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/IR/DialectRegistry.h"

using namespace mlir;
using namespace mlir::tensor;
using namespace mlir::mesh;

namespace {

// Sharding of tensor.empty/tensor.splat
template <typename OpTy>
struct CreatorOpShardingInterface
    : public ShardingInterface::ExternalModel<CreatorOpShardingInterface<OpTy>,
                                              OpTy> {
  SmallVector<utils::IteratorType> getLoopIteratorTypes(Operation *op) const {
    auto ndims = mlir::cast<ShapedType>(op->getResult(0).getType()).getRank();
    return SmallVector<utils::IteratorType>(ndims,
                                            utils::IteratorType::parallel);
  }

  SmallVector<AffineMap> getIndexingMaps(Operation *op) const {
    MLIRContext *ctx = op->getContext();
    Value val = op->getResult(0);
    auto type = dyn_cast<RankedTensorType>(val.getType());
    if (!type)
      return {};
    return SmallVector<AffineMap>(
        op->getNumOperands() + op->getNumResults(),
        {AffineMap::getMultiDimIdentityMap(type.getRank(), ctx)});
  }

  LogicalResult spmdize(Operation *op, ArrayRef<Value> spmdizedOperands,
                        ArrayRef<MeshSharding> operandShardings,
                        ArrayRef<MeshSharding> resultShardings,
                        IRMapping &spmdizationMap,
                        SymbolTableCollection &symbolTable,
                        OpBuilder &builder) const {
    assert(resultShardings.size() == 1);
    auto resType = cast<RankedTensorType>(op->getResult(0).getType());
    mlir::mesh::MeshOp mesh;
    ShapedType shardType;
    if (resType.getRank() > 0) {
      mesh = mesh::getMesh(op, resultShardings[0].getMeshAttr(), symbolTable);
      shardType =
          cast<ShapedType>(mesh::shardType(resType, mesh, resultShardings[0]));
    } else {
      shardType = resType;
    }
    Operation *newOp = nullptr;
    // if the sharding introduces a new dynamic dimension, we take it from
    // the dynamic sharding info. For now bail out if it's not
    // provided.
    if (!shardType.hasStaticShape()) {
      assert(op->getResult(0).hasOneUse());
      SmallVector<Value> newOperands;
      auto oldType = cast<ShapedType>(resType);
      assert(oldType.getRank() == shardType.getRank());
      int currOldOprndNum = -1;
      mesh::ShardShapeOp shapeForDevice;
      ValueRange device;
      Operation *newSharding = nullptr;
      for (auto i = 0; i < oldType.getRank(); ++i) {
        if (!oldType.isDynamicDim(i) && shardType.isDynamicDim(i)) {
          if (!newSharding) {
            newSharding =
                ShardingOp::create(builder, op->getLoc(), resultShardings[0]);
            device =
                mesh::ProcessMultiIndexOp::create(builder, op->getLoc(), mesh)
                    .getResults();
            shapeForDevice = mesh::ShardShapeOp::create(
                builder, op->getLoc(), oldType.getShape(), spmdizedOperands,
                newSharding->getResult(0), device);
          }
          newOperands.emplace_back(shapeForDevice.getResult()[i]);
        } else if (oldType.isDynamicDim(i)) {
          assert(shardType.isDynamicDim(i));
          newOperands.emplace_back(spmdizedOperands[++currOldOprndNum]);
        }
      }
      newOp = OpTy::create(builder, op->getLoc(), shardType, newOperands);
      spmdizationMap.map(op->getResult(0), newOp->getResult(0));
    } else {
      // `clone` will populate the mapping of old to new results.
      newOp = builder.clone(*op, spmdizationMap);
    }
    newOp->getResult(0).setType(shardType);

    return success();
  }
};
} // namespace

void mlir::tensor::registerShardingInterfaceExternalModels(
    DialectRegistry &registry) {

  registry.addExtension(+[](MLIRContext *ctx, TensorDialect *dialect) {
    EmptyOp::template attachInterface<CreatorOpShardingInterface<EmptyOp>>(
        *ctx);
    SplatOp::template attachInterface<CreatorOpShardingInterface<SplatOp>>(
        *ctx);
  });
}
