//==- LoongArchSchedLA464V.td - LA464 Scheduling Defs -*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//

  // LSX / LASX INSTRUCTION


  // LSX / LASX INSTRUCTION INTEGER   

  // 128/256-bit integer ALU
  let Latency = 2 in {
     def : WriteRes<WriteVALU128, [LA464_VF]>;
     def : WriteRes<WriteVALU256, [LA464_VF]>;
  }

  // 128/256-bit integer MUL
  let Latency = 2 in {
     def : WriteRes<WriteVMUL128, [LA464_VF]>;
     def : WriteRes<WriteVMUL256, [LA464_VF]>;
  }

  // 128/256-bit integer MADD
  let Latency = 16 in {
     def : WriteRes<WriteVMADD128, [LA464_VF]>;
     def : WriteRes<WriteVMADD256, [LA464_VF]>;
  }
  let Latency = 28 in {
     def : WriteRes<WriteVMADDQ128, [LA464_VF]>;
     def : WriteRes<WriteVMADDQ256, [LA464_VF]>;
  }

  // 128/256-bit integer DIV
  let Latency = 70 in {
     def : WriteRes<WriteVDIV128B, [LA464_VF]>;
     def : WriteRes<WriteVDIV256B, [LA464_VF]>;
  }
  let Latency = 42 in {
     def : WriteRes<WriteVDIV128H, [LA464_VF]>;
     def : WriteRes<WriteVDIV256H, [LA464_VF]>;
  }
  let Latency = 34 in {
     def : WriteRes<WriteVDIV128W, [LA464_VF]>;
     def : WriteRes<WriteVDIV256W, [LA464_VF]>;
  }
  let Latency = 46 in {
     def : WriteRes<WriteVDIV128D, [LA464_VF]>;
     def : WriteRes<WriteVDIV256D, [LA464_VF]>;
  }

  // 128/256-bit integer SAT
  let Latency = 2 in {
     def : WriteRes<WriteVSAT128, [LA464_VF]>;
     def : WriteRes<WriteVSAT256, [LA464_VF]>;
  }

  // 128/256-bit integer EXT
  let Latency = 2 in {
     def : WriteRes<WriteVEXT128, [LA464_VF]>;
     def : WriteRes<WriteVEXT256, [LA464_VF]>;
  }

  // 128/256-bit integer SIGNCOV
  let Latency = 2 in {
     def : WriteRes<WriteVSIGNCOV128, [LA464_VF]>;
     def : WriteRes<WriteVSIGNCOV256, [LA464_VF]>;
  }

  // 128/256-bit integer MSK
  let Latency = 2 in {
     def : WriteRes<WriteVMSK128, [LA464_VF]>;
     def : WriteRes<WriteVMSK256, [LA464_VF]>;
  }

  // 128/256-bit integer LDI
  let Latency = 2 in {
     def : WriteRes<WriteVLDI128, [LA464_VF]>;
     def : WriteRes<WriteVLDI256, [LA464_VF]>;
  }

  // 128/256-bit integer BIT
  let Latency = 2 in {
     def : WriteRes<WriteVBIT128, [LA464_VF]>;
     def : WriteRes<WriteVBIT256, [LA464_VF]>;
  }

  // 128/256-bit integer SHIFT
  let Latency = 2 in {
     def : WriteRes<WriteVSHIFT128, [LA464_VF]>;
     def : WriteRes<WriteVSHIFT256, [LA464_VF]>;
  }

  // 128/256-bit integer SLLWIL
  let Latency = 4 in {
     def : WriteRes<WriteVSLLWIL128, [LA464_VF]>;
     def : WriteRes<WriteVSLLWIL256, [LA464_VF]>;
  }
  // 128/256-bit integer EXTL
  let Latency = 2 in {
     def : WriteRes<WriteVEXTL128, [LA464_VF]>;
     def : WriteRes<WriteVEXTL256, [LA464_VF]>;
  }

  // 128/256-bit integer SHIFT R
  let Latency = 2 in {
     def : WriteRes<WriteVSHIFTR128, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTR256, [LA464_VF]>;
  }

  // 128/256-bit integer SHIFT N
  let Latency = 4 in {
     def : WriteRes<WriteVSHIFTN128, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTN256, [LA464_VF]>;
  }

  // 128/256-bit integer SHIFT NI
  let Latency = 16 in {
     def : WriteRes<WriteVSHIFTNI128, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTNI256, [LA464_VF]>;
  }
  let Latency = 12 in {
     def : WriteRes<WriteVSHIFTNI128Q, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTNI256Q, [LA464_VF]>;
  }

  // 128/256-bit integer SHIFT RN
  let Latency = 4 in {
     def : WriteRes<WriteVSHIFTRN128, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTRN256, [LA464_VF]>;
  }

  // 128/256-bit integer SHIFT RNI
  let Latency = 16 in {
     def : WriteRes<WriteVSHIFTRNI128, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTRNI256, [LA464_VF]>;
  }
  let Latency = 12 in {
     def : WriteRes<WriteVSHIFTRNI128Q, [LA464_VF]>;
     def : WriteRes<WriteVSHIFTRNI256Q, [LA464_VF]>;
  }

  // 128/256-bit integer S SHIFT N
  let Latency = 4 in {
     def : WriteRes<WriteVSSHIFTN128, [LA464_VF]>;
     def : WriteRes<WriteVSSHIFTN256, [LA464_VF]>;
  }

  // 128/256-bit integer S SHIFT NI
  let Latency = 16 in {
     def : WriteRes<WriteVSSHIFTNI128, [LA464_VF]>;
     def : WriteRes<WriteVSSHIFTNI256, [LA464_VF]>;
  }
  let Latency = 12 in {
     def : WriteRes<WriteVSSHIFTNI128Q, [LA464_VF]>;
     def : WriteRes<WriteVSSHIFTNI256Q, [LA464_VF]>;
  }

  // 128/256-bit integer S SHIFT RN
  let Latency = 4 in {
     def : WriteRes<WriteVSSHIFTRN128, [LA464_VF]>;
     def : WriteRes<WriteVSSHIFTRN256, [LA464_VF]>;
  }

  // 128/256-bit integer S SHIFT RNI
  let Latency = 16 in {
     def : WriteRes<WriteVSSHIFTRNI128, [LA464_VF]>;
     def : WriteRes<WriteVSSHIFTRNI256, [LA464_VF]>;
  }
  let Latency = 12 in {
     def : WriteRes<WriteVSSHIFTRNI128Q, [LA464_VF]>;
     def : WriteRes<WriteVSSHIFTRNI256Q, [LA464_VF]>;
  }

  // 128/256-bit integer CLO CLZ
  let Latency = 2 in {
     def : WriteRes<WriteVCLO128, [LA464_VF]>;
     def : WriteRes<WriteVCLZ128, [LA464_VF]>;
     def : WriteRes<WriteVCLO256, [LA464_VF]>;
     def : WriteRes<WriteVCLZ256, [LA464_VF]>;
  }

  // 128/256-bit integer PCNT
  let Latency = 2 in {
     def : WriteRes<WriteVPCNT128, [LA464_VF]>;
     def : WriteRes<WriteVPCNT256, [LA464_VF]>;
  }

  // 128/256-bit integer BITCLR / BITCLRI
  let Latency = 2 in {
     def : WriteRes<WriteVBITCLR128, [LA464_VF]>;
     def : WriteRes<WriteVBITCLR256, [LA464_VF]>;
  }
  // 128/256-bit integer BITSET / BITSETI
  let Latency = 2 in {
     def : WriteRes<WriteVBITSET128, [LA464_VF]>;
     def : WriteRes<WriteVBITSET256, [LA464_VF]>;
  }
  // 128/256-bit integer BITREV / BITREVI
  let Latency = 2 in {
     def : WriteRes<WriteVBITREV128, [LA464_VF]>;
     def : WriteRes<WriteVBITREV256, [LA464_VF]>;
  }

  // 128/256-bit integer FRSTP / FRSTPI
  let Latency = 8 in {
     def : WriteRes<WriteVFRSTP128, [LA464_VF]>;
     def : WriteRes<WriteVFRSTP256, [LA464_VF]>;
  }


  // LSX / LASX INSTRUCTION FLOATING-POINT   

  // 128/256-bit FADD / FSUB / FMUL
  let Latency = 2 in {
     def : WriteRes<WriteVFALU128, [LA464_VF]>;
     def : WriteRes<WriteVFALU256, [LA464_VF]>;
  }
  // 128/256-bit FDIV.S
  let Latency = 43 in {
     def : WriteRes<WriteVFDIVS128, [LA464_VF]>;
     def : WriteRes<WriteVFDIVS256, [LA464_VF]>;
  }
  // 128/256-bit FDIV.D
  let Latency = 50 in {
     def : WriteRes<WriteVFDIVD128, [LA464_VF]>;
     def : WriteRes<WriteVFDIVD256, [LA464_VF]>;
  }

  // 128/256-bit FMADD FMSUB FNMADD FNMSUB
  let Latency = 2 in {
     def : WriteRes<WriteVFADD128, [LA464_VF]>;
     def : WriteRes<WriteVFADD256, [LA464_VF]>;
  }

  // 128/256-bit FMAX FMIN FMAXA FMINA
  let Latency = 2 in {
     def : WriteRes<WriteVFMAXMIN128, [LA464_VF]>;
     def : WriteRes<WriteVFMAXMIN256, [LA464_VF]>;
  }

  // 128/256-bit FLOGB
  let Latency = 2 in {
     def : WriteRes<WriteVFLOGB128, [LA464_VF]>;
     def : WriteRes<WriteVFLOGB256, [LA464_VF]>;
  }

  // 128/256-bit FCLASS
  let Latency = 2 in {
     def : WriteRes<WriteVFCLASS128, [LA464_VF]>;
     def : WriteRes<WriteVFCLASS256, [LA464_VF]>;
  }

  // 128/256-bit FSQRT.S 
  let Latency = 80 in {
     def : WriteRes<WriteVFSQRTS128, [LA464_VF]>;
     def : WriteRes<WriteVFSQRTS256, [LA464_VF]>;
  }
  // 128/256-bit FSQRT.D 
  let Latency = 74 in {
     def : WriteRes<WriteVFSQRTD128, [LA464_VF]>;
     def : WriteRes<WriteVFSQRTD256, [LA464_VF]>;
  }

  // 128/256-bit FRECIP.S 
  let Latency = 56 in {
     def : WriteRes<WriteVFRECIPS128, [LA464_VF]>;
     def : WriteRes<WriteVFRECIPS256, [LA464_VF]>;
  }
  // 128/256-bit FRECIP.D 
  let Latency = 49 in {
     def : WriteRes<WriteVFRECIPD128, [LA464_VF]>;
     def : WriteRes<WriteVFRECIPD256, [LA464_VF]>;
  }

  // 128/256-bit FRSQRT.S 
  let Latency = 124 in {
     def : WriteRes<WriteVFRSQRTS128, [LA464_VF]>;
     def : WriteRes<WriteVFRSQRTS256, [LA464_VF]>;
  }
  // 128/256-bit FRSQRT.D 
  let Latency = 110 in {
     def : WriteRes<WriteVFRSQRTD128, [LA464_VF]>;
     def : WriteRes<WriteVFRSQRTD256, [LA464_VF]>;
  }

  // 128/256-bit FCVT
  let Latency = 4 in {
     def : WriteRes<WriteVFCVT128, [LA464_VF]>;
     def : WriteRes<WriteVFCVT256, [LA464_VF]>;
  }

  // 128/256-bit FRINT
  let Latency = 2 in {
     def : WriteRes<WriteVFRINT128, [LA464_VF]>;
     def : WriteRes<WriteVFRINT256, [LA464_VF]>;
  }

  // 128/256-bit FTINTS
  let Latency = 2 in {
     def : WriteRes<WriteVFTINTS128, [LA464_VF]>;
     def : WriteRes<WriteVFTINTS256, [LA464_VF]>;
  }

  // 128/256-bit FTINTD
  let Latency = 4 in {
     def : WriteRes<WriteVFTINTD128, [LA464_VF]>;
     def : WriteRes<WriteVFTINTD256, [LA464_VF]>;
  }

  // 128/256-bit FFINT
  let Latency = 2 in {
     def : WriteRes<WriteVFFINT128, [LA464_VF]>;
     def : WriteRes<WriteVFFINT256, [LA464_VF]>;
  }

  // 128/256-bit FFINTD
  let Latency = 4 in {
     def : WriteRes<WriteVFFINTD128, [LA464_VF]>;
     def : WriteRes<WriteVFFINTD256, [LA464_VF]>;
  }

  // 128/256-bit SEQ
  let Latency = 4 in {
     def : WriteRes<WriteVSEQ128, [LA464_VF]>;
     def : WriteRes<WriteVSEQ256, [LA464_VF]>;
  }

  // 128/256-bit SEL
  let Latency = 2 in {
     def : WriteRes<WriteVSEL128, [LA464_VF]>;
     def : WriteRes<WriteVSEL256, [LA464_VF]>;
  }

  // 128/256-bit SLT
  let Latency = 2 in {
     def : WriteRes<WriteVSLT128, [LA464_VF]>;
     def : WriteRes<WriteVSLT256, [LA464_VF]>;
  }

  // 128/256-bit FCMP
  let Latency = 2 in {
     def : WriteRes<WriteVFCMP128, [LA464_VF]>;
     def : WriteRes<WriteVFCMP256, [LA464_VF]>;
  }

  // 128/256-bit BITSELV
  let Latency = 2 in {
     def : WriteRes<WriteVBITSELV128, [LA464_VF]>;
     def : WriteRes<WriteVBITSELV256, [LA464_VF]>;
  }

  // 128/256-bit BITSELB
  let Latency = 4 in {
     def : WriteRes<WriteVBITSELB128, [LA464_VF]>;
     def : WriteRes<WriteVBITSELB256, [LA464_VF]>;
  }

  // 128/256-bit VSETZ
  let Latency = 2 in {
     def : WriteRes<WriteVSETZ128, [LA464_VF]>;
     def : WriteRes<WriteVSETZ256, [LA464_VF]>;
  }

  // 128/256-bit VINSGR2VR
  let Latency = 4 in {
     def : WriteRes<WriteVINSGR2VR128, [LA464_VF]>;
     def : WriteRes<WriteVINSGR2VR256, [LA464_VF]>;
  }

  // 128/256-bit VPICKVE2GR
  let Latency = 4 in {
     def : WriteRes<WriteVPICKVE2GR128, [LA464_VF]>;
     def : WriteRes<WriteVPICKVE2GR256, [LA464_VF]>;
  }

  // 128/256-bit VREPLVE
  let Latency = 4 in {
     def : WriteRes<WriteVREPLVE128, [LA464_VF]>;
     def : WriteRes<WriteVREPLVE256, [LA464_VF]>;
  }

  // 128/256-bit VREPLVEI
  let Latency = 2 in {
     def : WriteRes<WriteVREPLVEI128, [LA464_VF]>;
     def : WriteRes<WriteVREPLVEI256, [LA464_VF]>;
  }

  // 256-bit XVINSVE0
  let Latency = 4 in {
     def : WriteRes<WriteVINSVE0, [LA464_VF]>;
  }

  // 256-bit VPICKVE
  let Latency = 2 in {
     def : WriteRes<WriteVPICKVE, [LA464_VF]>;
  }

  // 128/256-bit VBSLL
  let Latency = 2 in {
     def : WriteRes<WriteVBSLL128, [LA464_VF]>;
     def : WriteRes<WriteVBSLL256, [LA464_VF]>;
  }

  // 128/256-bit VPACK
  let Latency = 2 in {
     def : WriteRes<WriteVPACK128, [LA464_VF]>;
     def : WriteRes<WriteVPACK256, [LA464_VF]>;
  }

  // 128/256-bit VPICK
  let Latency = 2 in {
     def : WriteRes<WriteVPICK128, [LA464_VF]>;
     def : WriteRes<WriteVPICK256, [LA464_VF]>;
  }

  // 128/256-bit VILV
  let Latency = 2 in {
     def : WriteRes<WriteVILV128, [LA464_VF]>;
     def : WriteRes<WriteVILV256, [LA464_VF]>;
  }

  // 128/256-bit SHUF
  let Latency = 4 in {
     def : WriteRes<WriteSHUF128, [LA464_VF]>;
     def : WriteRes<WriteSHUF256, [LA464_VF]>;
  }

  // 128/256-bit SHUFI
  let Latency = 2 in {
     def : WriteRes<WriteSHUFI128, [LA464_VF]>;
     def : WriteRes<WriteSHUFI256, [LA464_VF]>;
  }
  // 128/256-bit SHUFID
  let Latency = 4 in {
     def : WriteRes<WriteSHUFID128, [LA464_VF]>;
     def : WriteRes<WriteSHUFID256, [LA464_VF]>;
  }

  // 256-bit PERM
  let Latency = 2 in {
     def : WriteRes<WritePERM256, [LA464_VF]>;
  }

  // 128/256-bit PERMI
  let Latency = 4 in {
     def : WriteRes<WritePERMIW128, [LA464_VF]>;
     def : WriteRes<WritePERMIW256, [LA464_VF]>;
  }

  // 256-bit PERMID
  let Latency = 2 in {
     def : WriteRes<WritePERMID256, [LA464_VF]>;
  }

  // 256-bit PERMIQ
  let Latency = 12 in {
     def : WriteRes<WritePERMIQ256, [LA464_VF]>;
  }

  // 128/256-bit VEXTRINS
  let Latency = 4 in {
     def : WriteRes<WriteVEXTRINS128, [LA464_VF]>;
     def : WriteRes<WriteVEXTRINS256, [LA464_VF]>;
  }

  // 128/256-bit VLD
  let Latency = 2 in {
     def : WriteRes<WriteVLD128, [LA464_VF]>;
     def : WriteRes<WriteVLD256, [LA464_VF]>;
  }

  // 128/256-bit VLDSTX
  let Latency = 4 in {
     def : WriteRes<WriteVLDST128, [LA464_VF]>;
     def : WriteRes<WriteVLDST256, [LA464_VF]>;
  }

  // 128/256-bit VLDREPL
  let Latency = 2 in {
     def : WriteRes<WriteVLDREPL128, [LA464_VF]>;
     def : WriteRes<WriteVLDREPL256, [LA464_VF]>;
  }

  // 128/256-bit VSTELM
  let Latency = 4 in {
     def : WriteRes<WriteVSTELM128, [LA464_VF]>;
     def : WriteRes<WriteVSTELM256, [LA464_VF]>;
  }

