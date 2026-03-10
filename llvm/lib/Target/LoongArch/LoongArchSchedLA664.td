//==- LoongArchSchedLA664.td - LA664 Scheduling Defs -*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//

def LA664Model : SchedMachineModel {
  let MicroOpBufferSize = 256;         // LA664 BufferSize
  let LoopMicroOpBufferSize = 128;    // LA664 Loop BufferSize

  let IssueWidth = 6;                // 6 micro-op is dispatched per cycle.
  let LoadLatency = 3;               // Cycles for loads to access the cache.

  let MispredictPenalty = 16;        // Based on estimate of pipeline depth.

  let PostRAScheduler = true;
       
  let CompleteModel = 0; 
}

let SchedModel = LA664Model in {

  // The LA664 microarchitecure has 12 pipelines:
  //      4 integer pipelines
  //      4 vector floating-point pipelines
  //      4 load / store pipelines

  let BufferSize = 0 in {

  // Each processor resource of the LA664 is pipelined, so the scheduler 
  // needs to avoid scheduling instructions that use processor resource 
  // conflicts in the same cycle.

    // def LA664_INT_0     : ProcResource<1>;
    // def LA664_INT_1     : ProcResource<1>;
    // def LA664_INT_2     : ProcResource<1>;
    // def LA664_INT_3     : ProcResource<1>;
    def LA664_INT       : ProcResource<4>;

    // def LA664_VF_0      : ProcResource<1>;
    // def LA664_VF_1      : ProcResource<1>;
    // def LA664_VF_2      : ProcResource<1>;
    // def LA664_VF_3      : ProcResource<1>;
    def LA664_VF        : ProcResource<4>;

    // def LA664_LDST_0    : ProcResource<1>;
    // def LA664_LDST_1    : ProcResource<1>;
    // def LA664_LDST_2    : ProcResource<1>;
    // def LA664_LDST_3    : ProcResource<1>;
    def LA664_LDST      : ProcResource<4>;
  }
  // def LA664_INT  : ProcResGroup<[LA664_INT_0,LA664_INT_1,LA664_INT_2,LA664_INT_3]>;
  // def LA664_VF   : ProcResGroup<[LA664_VF_0,LA664_VF_1,LA664_VF_2,LA664_VF_3]>;
  // def LA664_LDST : ProcResGroup<[LA664_LDST_0,LA664_LDST_1,LA664_LDST_2,LA664_LDST_3]>;

  // BASE INSTRUCTION
  // integer instruction latency ALU
  let Latency = 1 in {
     def : WriteRes<WriteIALU, [LA664_INT]>;
     def : WriteRes<WriteIALU32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIALU, 0>;
  def : ReadAdvance<ReadIALU32, 0>;

  // integer instruction latency ALSL
  let Latency = 1 in {
     def : WriteRes<WriteIALSL, [LA664_INT]>;
     def : WriteRes<WriteIALSL32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIALSL, 0>;
  def : ReadAdvance<ReadIALSL32, 0>;

  // integer instruction latency MUL
  let Latency = 4 in {
     def : WriteRes<WriteIMUL, [LA664_INT]>;
     def : WriteRes<WriteIMUL32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIMUL, 0>;
  def : ReadAdvance<ReadIMUL32, 0>;

  // integer instruction latency DIV
  // Worst case latency is used.
  let Latency = 33 in {
     def : WriteRes<WriteIDIV, [LA664_INT]>;
     def : WriteRes<WriteIDIV32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIDIV, 0>;
  def : ReadAdvance<ReadIDIV32, 0>;

  // integer instruction latency SHIFT
  let Latency = 1 in {
     def : WriteRes<WriteIShift, [LA664_INT]>;
     def : WriteRes<WriteIShift32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIShift, 0>;
  def : ReadAdvance<ReadIShift32, 0>;

  // integer instruction latency EXT
  let Latency = 1 in {
     def : WriteRes<WriteIEXT, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIEXT, 0>;

  // integer instruction latency CLO / CLZ / CTO / CTZ
  let Latency = 1 in {
     def : WriteRes<WriteICL, [LA664_INT]>;
     def : WriteRes<WriteICL32, [LA664_INT]>;
     def : WriteRes<WriteICT, [LA664_INT]>;
     def : WriteRes<WriteICT32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadICL, 0>;
  def : ReadAdvance<ReadICL32, 0>;
  def : ReadAdvance<ReadICT, 0>;
  def : ReadAdvance<ReadICT32, 0>;

  // integer instruction latency BytePick
  let Latency = 1 in {
     def : WriteRes<WriteIBytePick, [LA664_INT]>;
     def : WriteRes<WriteIBytePick32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIBytePick, 0>;
  def : ReadAdvance<ReadIBytePick32, 0>;

  // integer instruction latency REV
  let Latency = 1 in {
     def : WriteRes<WriteIRev, [LA664_INT]>;
     def : WriteRes<WriteIRev32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIRev, 0>;
  def : ReadAdvance<ReadIRev32, 0>;

  // integer instruction latency BitRev
  let Latency = 1 in {
     def : WriteRes<WriteIBitRev, [LA664_INT]>;
     def : WriteRes<WriteIBitRev32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIBitRev, 0>;
  def : ReadAdvance<ReadIBitRev32, 0>;

  // integer instruction latency BSTRINS
  let Latency = 1 in {
     def : WriteRes<WriteIBstrins, [LA664_INT]>;
     def : WriteRes<WriteIBstrins32, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIBstrins, 0>;
  def : ReadAdvance<ReadIBstrins32, 0>;

  // integer instruction latency BSTRPICK
  let Latency = 1 in {
     def : WriteRes<WriteIBstrPick, [LA664_INT]>;
     def : WriteRes<WriteIBstrPick32, [LA664_INT]>;

  }
  def : ReadAdvance<ReadIBstrPick, 0>;
  def : ReadAdvance<ReadIBstrPick32, 0>;

  // integer instruction latency SELECT TODO
  let Latency = 1 in {
     def : WriteRes<WriteIMASK, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIMASK, 0>;

  // integer instruction latency Jump
  let Latency = 1 in {
     def : WriteRes<WriteIJump, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIJump, 0>;

  // integer instruction latency LD ST LDX STX
  let Latency = 4 in {
     def : WriteRes<WriteLD, [LA664_LDST]>;
     def : WriteRes<WriteLDX, [LA664_LDST]>;
  }
  let Latency = 4 in { // TODO
     def : WriteRes<WriteST, [LA664_LDST]>;
     def : WriteRes<WriteSTX, [LA664_LDST]>;
  }
  def : ReadAdvance<ReadSTData, 0>;
  def : ReadAdvance<ReadMemBase, 0>;
  def : ReadAdvance<ReadMemOffset, 0>;

  // integer instruction latency LDPTR STPTR
  let Latency = 4 in {
     def : WriteRes<WriteLDPTR, [LA664_LDST]>;
  }
  let Latency = 4 in { // TODO
     def : WriteRes<WriteSTPTR, [LA664_LDST]>;
  }

  // integer instruction latency LDGT LDLE STGT STLE
  let Latency = 4 in {
     def : WriteRes<WriteLDGT, [LA664_LDST]>;
     def : WriteRes<WriteLDLE, [LA664_LDST]>;
     def : WriteRes<WriteSTGT, [LA664_LDST]>;
     def : WriteRes<WriteSTLE, [LA664_LDST]>;
  }
  def : ReadAdvance<ReadMemCmp, 0>;

  // floating-point instruction latency FADD FSUB FMUL FDIV FMADD FMINMAX
  let Latency = 3 in {
     def : WriteRes<WriteFADD, [LA664_VF]>;
  }
  let Latency = 5 in {
     def : WriteRes<WriteFMADD, [LA664_VF]>;
  }
  let Latency = 5 in { 
     def : WriteRes<WriteFMUL, [LA664_VF]>;
  }
  let Latency = 2 in {
     def : WriteRes<WriteFMinMax, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFADD, 0>;
  def : ReadAdvance<ReadFMUL, 0>;
  def : ReadAdvance<ReadFMADD, 0>;
  def : ReadAdvance<ReadFMinMax, 0>;
  // Worst case latency is used.
  let Latency = 19 in {
     def : WriteRes<WriteFDIV, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFDIV, 0>;

  // floating-point instruction latency FABS FNEG FSQRT FRECIP FRSQRT FSCALEB FLOGB FCOPYSIGN FCLASS FCMP
  let Latency = 1 in {
     def : WriteRes<WriteFABS, [LA664_VF]>;
     def : WriteRes<WriteFNEG, [LA664_VF]>;
     def : WriteRes<WriteFCOPYSIGN, [LA664_VF]>;
     def : WriteRes<WriteFCMP, [LA664_VF]>;
  }
  let Latency = 4 in {
     def : WriteRes<WriteFSCALEB, [LA664_VF]>;
     def : WriteRes<WriteFLOGB, [LA664_VF]>;
  }
  let Latency = 2 in {
     def : WriteRes<WriteFCLASS, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFABS, 0>;
  def : ReadAdvance<ReadFNEG, 0>;
  def : ReadAdvance<ReadFSCALEB, 0>;
  def : ReadAdvance<ReadFLOGB, 0>;
  def : ReadAdvance<ReadFCOPYSIGN, 0>;
  def : ReadAdvance<ReadFCLASS, 0>;
  def : ReadAdvance<ReadFCMP, 0>;
  // Worst case latency is used.  fsqrt.s 8-22, fsqrt.d 8-36, frecip.s 8-16, frecip.d 8-23 TODO
  let Latency = 18 in {
     def : WriteRes<WriteFSQRT, [LA664_VF]>;
     def : WriteRes<WriteFRECIP, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFSQRT, 0>;
  def : ReadAdvance<ReadFRECIP, 0>;
  // Worst case latency is used. frsqrt.s 11-33, frsqrt.d 11-54 TODO
  let Latency = 24 in {
     def : WriteRes<WriteFRSQRT, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFRSQRT, 0>;

  // floating-point instruction latency FCVT FSEL
  let Latency = 2 in {
     def : WriteRes<WriteFCvtStoD, [LA664_VF]>;
     def : WriteRes<WriteFCvtDtoS, [LA664_VF]>;
  }

   let Latency = 4 in {
     def : WriteRes<WriteFCvtStoW, [LA664_VF]>;
     def : WriteRes<WriteFCvtStoL, [LA664_VF]>;
     def : WriteRes<WriteFCvtDtoW, [LA664_VF]>;
     def : WriteRes<WriteFCvtDtoL, [LA664_VF]>;

     def : WriteRes<WriteFCvtWtoS, [LA664_VF]>;
     def : WriteRes<WriteFCvtWtoD, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoS, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoD, [LA664_VF]>;

     def : WriteRes<WriteFCvtWtoS_RM, [LA664_VF]>;
     def : WriteRes<WriteFCvtWtoD_RM, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoS_RM, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoD_RM, [LA664_VF]>;

     def : WriteRes<WriteFCvtWtoS_RP, [LA664_VF]>;
     def : WriteRes<WriteFCvtWtoD_RP, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoS_RP, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoD_RP, [LA664_VF]>;

     def : WriteRes<WriteFCvtWtoS_RZ, [LA664_VF]>;
     def : WriteRes<WriteFCvtWtoD_RZ, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoS_RZ, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoD_RZ, [LA664_VF]>;

     def : WriteRes<WriteFCvtWtoS_RNE, [LA664_VF]>;
     def : WriteRes<WriteFCvtWtoD_RNE, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoS_RNE, [LA664_VF]>;
     def : WriteRes<WriteFCvtLtoD_RNE, [LA664_VF]>;

     def : WriteRes<WriteFCvtFStoIS, [LA664_VF]>;
     def : WriteRes<WriteFCvtFDtoID, [LA664_VF]>;
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
  let Latency = 1 in {
     def : WriteRes<WriteFSEL, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFSEL, 0>;

  // floating-point instruction latency FMOV
  let Latency = 1 in {
     def : WriteRes<WriteFMovS, [LA664_VF]>;
     def : WriteRes<WriteFMovD, [LA664_VF]>;
     def : WriteRes<WriteFMoveFRtoCF, [LA664_VF]>;
     def : WriteRes<WriteFMoveCFtoFR, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFMovS, 0>;
  def : ReadAdvance<ReadFMovD, 0>;
  def : ReadAdvance<ReadFMoveFRtoCF, 0>;
  def : ReadAdvance<ReadFMoveCFtoFR, 0>;
  let Latency = 2 in {
     def : WriteRes<WriteFMovGRtoFRW, [LA664_VF]>;
     def : WriteRes<WriteFMovGRtoFRD, [LA664_VF]>;
     def : WriteRes<WriteFMovFRtoGRS, [LA664_VF]>;
     def : WriteRes<WriteFMovFRHtoGRS, [LA664_VF]>;
     def : WriteRes<WriteFMovFRtoGRD, [LA664_VF]>;
     def : WriteRes<WriteFMoveCFtoGR, [LA664_VF]>;
     def : WriteRes<WriteFMoveGRtoCF, [LA664_VF]>;
  }
  let Latency = 3 in {
     def : WriteRes<WriteFMovGRtoFRHW, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFMovGRtoFRW, 0>;
  def : ReadAdvance<ReadFMovGRtoFRHW, 0>;
  def : ReadAdvance<ReadFMovGRtoFRD, 0>;
  def : ReadAdvance<ReadFMovFRtoGRS, 0>;
  def : ReadAdvance<ReadFMovFRHtoGRS, 0>;
  def : ReadAdvance<ReadFMovFRtoGRD, 0>;
  let Latency = 7 in {
     def : WriteRes<WriteFMovFCSRtoGR, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFMovFCSRtoGR, 0>;
  def : ReadAdvance<ReadFMoveCFtoGR, 0>;
  let Latency = 15 in {
     def : WriteRes<WriteFMovGRtoFCSR, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFMovGRtoFCSR, 0>;
  def : ReadAdvance<ReadFMoveGRtoCF, 0>;

  // floating-point instruction latency FJUMP BCEQZ or BCNEZ TODO
  let Latency = 1 in {
     def : WriteRes<WriteFJump, [LA664_VF]>;
  }
  def : ReadAdvance<ReadFJump, 0>;

  // floating-point instruction latency FLD FST FLDX FSTX
  let Latency = 5 in {
     def : WriteRes<WriteFLD, [LA664_LDST]>;
     def : WriteRes<WriteFLDX, [LA664_LDST]>;
  }
  // FST FSTX N.A. TODO
  let Latency = 5 in {
     def : WriteRes<WriteFST, [LA664_LDST]>;
     def : WriteRes<WriteFSTX, [LA664_LDST]>;
  }
  def : ReadAdvance<ReadFSTData, 0>;
  def : ReadAdvance<ReadFMemBase, 0>;
  def : ReadAdvance<ReadFMemOffset, 0>;

  // floating-point instruction latency FLDGT FLDLE FSTGT FSTLE
  let Latency = 5 in {
     def : WriteRes<WriteFLDGT, [LA664_LDST]>;
     def : WriteRes<WriteFLDLE, [LA664_LDST]>;
     def : WriteRes<WriteFSTGT, [LA664_LDST]>;
     def : WriteRes<WriteFSTLE, [LA664_LDST]>;
  }
  def : ReadAdvance<ReadFMemCmp, 0>;

  // LA664 unsupport base instruction  TODO 
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
  let Latency = 1 in {
     def : WriteRes<WriteIPCAdd, [LA664_INT]>;
  }
  def : ReadAdvance<ReadIPCAdd, 0>;

  let Unsupported = true in {  // TODO
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

  // #include "LoongArchSchedLA664V.td"

}
