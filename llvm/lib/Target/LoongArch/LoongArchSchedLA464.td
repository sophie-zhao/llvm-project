//==- LoongArchSchedLA464.td - LA464 Scheduling Defs -*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//

def LA464Model : SchedMachineModel {
  let MicroOpBufferSize = 0;         // LA464 BufferSize
  let LoopMicroOpBufferSize = 48;    // LA464 Loop BufferSize 

  let IssueWidth = 4;                // 4 micro-op is dispatched per cycle.
  let LoadLatency = 4;               // Cycles for loads to access the cache.

  let MispredictPenalty = 16;        // Based on estimate of pipeline depth.
  /// MispredictPenalty's old value is 16.

  let PostRAScheduler = true;
       
  let CompleteModel = 0; 
}

let SchedModel = LA464Model in {

  // The LA464 microarchitecure has 8 pipelines:
  //      4 integer pipelines
  //      2 vector floating-point pipelines
  //      2 load / store pipelines

  let BufferSize = 0 in {

  // Each processor resource of the LA464 is pipelined, so the scheduler 
  // needs to avoid scheduling instructions that use processor resource 
  // conflicts in the same cycle.

    // def LA464_INT_0     : ProcResource<1>;
    // def LA464_INT_1     : ProcResource<1>;
    // def LA464_INT_2     : ProcResource<1>;
    // def LA464_INT_3     : ProcResource<1>;
    def LA464_INT       : ProcResource<4>;

    // def LA464_VF_0      : ProcResource<1>;
    // def LA464_VF_1      : ProcResource<1>;
    def LA464_VF        : ProcResource<2>;

    // def LA464_LDST_0    : ProcResource<1>;
    // def LA464_LDST_1    : ProcResource<1>;
    def LA464_LDST      : ProcResource<2>;
  }
  // def LA464_INT  : ProcResGroup<[LA464_INT_0,LA464_INT_1,LA464_INT_2,LA464_INT_3]>;
  // def LA464_VF   : ProcResGroup<[LA464_VF_0,LA464_VF_1]>;
  // def LA464_LDST : ProcResGroup<[LA464_LDST_0,LA464_LDST_1]>;

  // BASE INSTRUCTION
  // integer instruction latency ALU
  let Latency = 1 in {
     def : WriteRes<WriteIALU, [LA464_INT]>;
     def : WriteRes<WriteIALU32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIALU, 0>;
  def : ReadAdvance<ReadIALU32, 0>;

  // integer instruction latency ALSL
  let Latency = 1 in {
     def : WriteRes<WriteIALSL, [LA464_INT]>;
     def : WriteRes<WriteIALSL32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIALSL, 0>;
  def : ReadAdvance<ReadIALSL32, 0>;

  // integer instruction latency MUL
  let Latency = 2 in {
     def : WriteRes<WriteIMUL, [LA464_INT]>;
     def : WriteRes<WriteIMUL32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIMUL, 0>;
  def : ReadAdvance<ReadIMUL32, 0>;

  // integer instruction latency DIV
  let Latency = 12 in {
     def : WriteRes<WriteIDIV, [LA464_INT]>;
     def : WriteRes<WriteIDIV32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIDIV, 0>;
  def : ReadAdvance<ReadIDIV32, 0>;

  // integer instruction latency SHIFT
  let Latency = 1 in {
     def : WriteRes<WriteIShift, [LA464_INT]>;
     def : WriteRes<WriteIShift32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIShift, 0>;
  def : ReadAdvance<ReadIShift32, 0>;

  // integer instruction latency EXT
  let Latency = 1 in {
     def : WriteRes<WriteIEXT, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIEXT, 0>;

  // integer instruction latency CLO / CLZ / CTO / CTZ
  let Latency = 1 in {
     def : WriteRes<WriteICL, [LA464_INT]>;
     def : WriteRes<WriteICL32, [LA464_INT]>;
     def : WriteRes<WriteICT, [LA464_INT]>;
     def : WriteRes<WriteICT32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadICL, 0>;
  def : ReadAdvance<ReadICL32, 0>;
  def : ReadAdvance<ReadICT, 0>;
  def : ReadAdvance<ReadICT32, 0>;

  // integer instruction latency BytePick
  let Latency = 2 in {
     def : WriteRes<WriteIBytePick, [LA464_INT]>;
     def : WriteRes<WriteIBytePick32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIBytePick, 0>;
  def : ReadAdvance<ReadIBytePick32, 0>;

  // integer instruction latency REV
  let Latency = 1 in {
     def : WriteRes<WriteIRev, [LA464_INT]>;
     def : WriteRes<WriteIRev32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIRev, 0>;
  def : ReadAdvance<ReadIRev32, 0>;

  // integer instruction latency BitRev
  let Latency = 1 in {
     def : WriteRes<WriteIBitRev, [LA464_INT]>;
     def : WriteRes<WriteIBitRev32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIBitRev, 0>;
  def : ReadAdvance<ReadIBitRev32, 0>;

  // integer instruction latency BSTRINS
  let Latency = 4 in {
     def : WriteRes<WriteIBstrins, [LA464_INT]>;
     def : WriteRes<WriteIBstrins32, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIBstrins, 0>;
  def : ReadAdvance<ReadIBstrins32, 0>;

  // integer instruction latency BSTRPICK
  let Latency = 1 in {
     def : WriteRes<WriteIBstrPick, [LA464_INT]>;
     def : WriteRes<WriteIBstrPick32, [LA464_INT]>;

  }
  def : ReadAdvance<ReadIBstrPick, 0>;
  def : ReadAdvance<ReadIBstrPick32, 0>;

  // integer instruction latency SELECT
  let Latency = 1 in {
     def : WriteRes<WriteIMASK, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIMASK, 0>;

  // integer instruction latency Jump
  let Latency = 4 in {
     def : WriteRes<WriteIJump, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIJump, 0>;

  // integer instruction latency LD ST LDX STX
  let Latency = 2 in {
     def : WriteRes<WriteLD, [LA464_LDST]>;
  }
  let Latency = 4 in {
     def : WriteRes<WriteST, [LA464_LDST]>;
     def : WriteRes<WriteLDX, [LA464_LDST]>;
     def : WriteRes<WriteSTX, [LA464_LDST]>;
  }
  def : ReadAdvance<ReadSTData, 0>;
  def : ReadAdvance<ReadMemBase, 0>;
  def : ReadAdvance<ReadMemOffset, 0>;

  // integer instruction latency LDPTR STPTR
  let Latency = 2 in {
     def : WriteRes<WriteLDPTR, [LA464_LDST]>;
  }
  let Latency = 4 in {
     def : WriteRes<WriteSTPTR, [LA464_LDST]>;
  }

  // integer instruction latency LDGT LDLE STGT STLE
  let Latency = 4 in {
     def : WriteRes<WriteLDGT, [LA464_LDST]>;
     def : WriteRes<WriteLDLE, [LA464_LDST]>;
     def : WriteRes<WriteSTGT, [LA464_LDST]>;
     def : WriteRes<WriteSTLE, [LA464_LDST]>;
  }
  def : ReadAdvance<ReadMemCmp, 0>;

  // floating-point instruction latency FADD FSUB FMUL FDIV FMADD FMINMAX
  let Latency = 2 in {
     def : WriteRes<WriteFADD, [LA464_VF]>;
     def : WriteRes<WriteFMUL, [LA464_VF]>;
     def : WriteRes<WriteFMADD, [LA464_VF]>;
     def : WriteRes<WriteFMinMax, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFADD, 0>;
  def : ReadAdvance<ReadFMUL, 0>;
  def : ReadAdvance<ReadFMADD, 0>;
  def : ReadAdvance<ReadFMinMax, 0>;
  let Latency = 18 in {
     def : WriteRes<WriteFDIV, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFDIV, 0>;

  // floating-point instruction latency FABS FNEG FSQRT FRECIP FRSQRT FSCALEB FLOGB FCOPYSIGN FCLASS FCMP
  let Latency = 2 in {
     def : WriteRes<WriteFABS, [LA464_VF]>;
     def : WriteRes<WriteFNEG, [LA464_VF]>;
     def : WriteRes<WriteFSCALEB, [LA464_VF]>;
     def : WriteRes<WriteFLOGB, [LA464_VF]>;
     def : WriteRes<WriteFCOPYSIGN, [LA464_VF]>;
     def : WriteRes<WriteFCLASS, [LA464_VF]>;
     def : WriteRes<WriteFCMP, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFABS, 0>;
  def : ReadAdvance<ReadFNEG, 0>;
  def : ReadAdvance<ReadFSCALEB, 0>;
  def : ReadAdvance<ReadFLOGB, 0>;
  def : ReadAdvance<ReadFCOPYSIGN, 0>;
  def : ReadAdvance<ReadFCLASS, 0>;
  def : ReadAdvance<ReadFCMP, 0>;
  let Latency = 18 in {
     def : WriteRes<WriteFSQRT, [LA464_VF]>;
     def : WriteRes<WriteFRECIP, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFSQRT, 0>;
  def : ReadAdvance<ReadFRECIP, 0>;
  let Latency = 24 in {
     def : WriteRes<WriteFRSQRT, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFRSQRT, 0>;

  // floating-point instruction latency FCVT FSEL
  let Latency = 2 in {
     def : WriteRes<WriteFCvtStoD, [LA464_VF]>;
     def : WriteRes<WriteFCvtDtoS, [LA464_VF]>;

     def : WriteRes<WriteFCvtStoW, [LA464_VF]>;
     def : WriteRes<WriteFCvtStoL, [LA464_VF]>;
     def : WriteRes<WriteFCvtDtoW, [LA464_VF]>;
     def : WriteRes<WriteFCvtDtoL, [LA464_VF]>;

     def : WriteRes<WriteFCvtWtoS, [LA464_VF]>;
     def : WriteRes<WriteFCvtWtoD, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoS, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoD, [LA464_VF]>;

     def : WriteRes<WriteFCvtWtoS_RM, [LA464_VF]>;
     def : WriteRes<WriteFCvtWtoD_RM, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoS_RM, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoD_RM, [LA464_VF]>;

     def : WriteRes<WriteFCvtWtoS_RP, [LA464_VF]>;
     def : WriteRes<WriteFCvtWtoD_RP, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoS_RP, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoD_RP, [LA464_VF]>;

     def : WriteRes<WriteFCvtWtoS_RZ, [LA464_VF]>;
     def : WriteRes<WriteFCvtWtoD_RZ, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoS_RZ, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoD_RZ, [LA464_VF]>;

     def : WriteRes<WriteFCvtWtoS_RNE, [LA464_VF]>;
     def : WriteRes<WriteFCvtWtoD_RNE, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoS_RNE, [LA464_VF]>;
     def : WriteRes<WriteFCvtLtoD_RNE, [LA464_VF]>;

     def : WriteRes<WriteFCvtFStoIS, [LA464_VF]>;
     def : WriteRes<WriteFCvtFDtoID, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFCvtStoD, 0>;
  def : ReadAdvance<ReadFCvtDtoS, 0>;

  def : ReadAdvance<ReadFCvtStoW, 0>;
  def : ReadAdvance<ReadFCvtStoL, 0>;
  def : ReadAdvance<ReadFCvtDtoW, 0>;
  def : ReadAdvance<ReadFCvtDtoL, 0>;

  def : ReadAdvance<ReadFCvtWtoS, 0>;
  def : ReadAdvance<ReadFCvtWtoD, 0>;
  def : ReadAdvance<ReadFCvtLtoS, 0>;
  def : ReadAdvance<ReadFCvtLtoD, 0>;

  def : ReadAdvance<ReadFCvtWtoS_RM, 0>;
  def : ReadAdvance<ReadFCvtWtoD_RM, 0>;
  def : ReadAdvance<ReadFCvtLtoS_RM, 0>;
  def : ReadAdvance<ReadFCvtLtoD_RM, 0>;

  def : ReadAdvance<ReadFCvtWtoS_RP, 0>;
  def : ReadAdvance<ReadFCvtWtoD_RP, 0>;
  def : ReadAdvance<ReadFCvtLtoS_RP, 0>;
  def : ReadAdvance<ReadFCvtLtoD_RP, 0>;

  def : ReadAdvance<ReadFCvtWtoS_RZ, 0>;
  def : ReadAdvance<ReadFCvtWtoD_RZ, 0>;
  def : ReadAdvance<ReadFCvtLtoS_RZ, 0>;
  def : ReadAdvance<ReadFCvtLtoD_RZ, 0>;

  def : ReadAdvance<ReadFCvtWtoS_RNE, 0>;
  def : ReadAdvance<ReadFCvtWtoD_RNE, 0>;
  def : ReadAdvance<ReadFCvtLtoS_RNE, 0>;
  def : ReadAdvance<ReadFCvtLtoD_RNE, 0>;

  def : ReadAdvance<ReadFCvtFStoIS, 0>;
  def : ReadAdvance<ReadFCvtFDtoID, 0>;
  let Latency = 4 in {
     def : WriteRes<WriteFSEL, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFSEL, 0>;

  // floating-point instruction latency FMOV
  let Latency = 2 in {
     def : WriteRes<WriteFMovS, [LA464_VF]>;
     def : WriteRes<WriteFMovD, [LA464_VF]>;
     def : WriteRes<WriteFMoveFRtoCF, [LA464_VF]>;
     def : WriteRes<WriteFMoveCFtoFR, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFMovS, 0>;
  def : ReadAdvance<ReadFMovD, 0>;
  def : ReadAdvance<ReadFMoveFRtoCF, 0>;
  def : ReadAdvance<ReadFMoveCFtoFR, 0>;
  let Latency = 4 in {
     def : WriteRes<WriteFMovGRtoFRW, [LA464_VF]>;
     def : WriteRes<WriteFMovGRtoFRHW, [LA464_VF]>;
     def : WriteRes<WriteFMovGRtoFRD, [LA464_VF]>;
     def : WriteRes<WriteFMovFRtoGRS, [LA464_VF]>;
     def : WriteRes<WriteFMovFRHtoGRS, [LA464_VF]>;
     def : WriteRes<WriteFMovFRtoGRD, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFMovGRtoFRW, 0>;
  def : ReadAdvance<ReadFMovGRtoFRHW, 0>;
  def : ReadAdvance<ReadFMovGRtoFRD, 0>;
  def : ReadAdvance<ReadFMovFRtoGRS, 0>;
  def : ReadAdvance<ReadFMovFRHtoGRS, 0>;
  def : ReadAdvance<ReadFMovFRtoGRD, 0>;
  let Latency = 28 in {
     def : WriteRes<WriteFMovFCSRtoGR, [LA464_VF]>;
     def : WriteRes<WriteFMoveCFtoGR, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFMovFCSRtoGR, 0>;
  def : ReadAdvance<ReadFMoveCFtoGR, 0>;
  let Latency = 60 in {
     def : WriteRes<WriteFMovGRtoFCSR, [LA464_VF]>;
     def : WriteRes<WriteFMoveGRtoCF, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFMovGRtoFCSR, 0>;
  def : ReadAdvance<ReadFMoveGRtoCF, 0>;

  // floating-point instruction latency FJUMP
  let Latency = 4 in {
     def : WriteRes<WriteFJump, [LA464_VF]>;
  }
  def : ReadAdvance<ReadFJump, 0>;

  // floating-point instruction latency FLD FST FLDX FSTX
  let Latency = 2 in {
     def : WriteRes<WriteFLD, [LA464_LDST]>;
  }
  let Latency = 4 in {
     def : WriteRes<WriteFST, [LA464_LDST]>;
     def : WriteRes<WriteFLDX, [LA464_LDST]>;
     def : WriteRes<WriteFSTX, [LA464_LDST]>;
  }
  def : ReadAdvance<ReadFSTData, 0>;
  def : ReadAdvance<ReadFMemBase, 0>;
  def : ReadAdvance<ReadFMemOffset, 0>;

  // floating-point instruction latency FLDGT FLDLE FSTGT FSTLE
  let Latency = 4 in {
     def : WriteRes<WriteFLDGT, [LA464_LDST]>;
     def : WriteRes<WriteFLDLE, [LA464_LDST]>;
     def : WriteRes<WriteFSTGT, [LA464_LDST]>;
     def : WriteRes<WriteFSTLE, [LA464_LDST]>;
  }
  def : ReadAdvance<ReadFMemCmp, 0>;

  // LA464 unsupport base instruction 
  let Unsupported = true in {
     def : WriteRes<WriteFRECIPE,[]>;
     def : WriteRes<WriteFRSQRTE,[]>;
     def : ReadAdvance<ReadFRECIPE, 0>;
     def : ReadAdvance<ReadFRSQRTE, 0>;
  }

  // integer instruction latency PCADD
  // because the llvm-mca Machine Code Analyzer using it.
  // let Unsupported = false in {
  //    def : WriteRes<WriteIPCAdd, [LA464_INT]>;
  // }
  let Latency = 2 in {
     def : WriteRes<WriteIPCAdd, [LA464_INT]>;
  }
  def : ReadAdvance<ReadIPCAdd, 0>;

  let Unsupported = true in {
    def : WriteRes<WriteAtomic, []>;
    def : ReadAdvance<ReadAtomic, 0>;
  }

  let Unsupported = true in {
    def : WriteRes<WritePseudo, []>;
    def : ReadAdvance<ReadPseudo, 0>;
  }

  let Unsupported = true in {
    def : WriteRes<WriteOthers, []>;
    def : ReadAdvance<ReadOthers, 0>;
  }

  // #include "LoongArchSchedLA464V.td"

}
