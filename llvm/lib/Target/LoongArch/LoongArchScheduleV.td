//===-- LoongArchScheduleV.td - LoongArch Scheduling Definitions ---*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

/// Define scheduler resources associated with def operands.

/// Vector instruction - LSX / LASX


/// Vector instruction - integer 

def WriteVALU128         : SchedWrite;   // 128-bit integer ALU
def WriteVALU256         : SchedWrite;   // 256-bit integer ALU
def ReadVALU128          : SchedRead;    // 128-bit integer ALU
def ReadVALU256          : SchedRead;    // 256-bit integer ALU
//===----------------------------------------------------------------------===//
// VADD.B/H/W/D/Q                        Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSUB.B/H/W/D/Q                        Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADD.B/H/W/D/Q                       Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSUB.B/H/W/D/Q                       Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDI.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128]>
// VSUBI.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128]>
// XVADDI.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256]>
// XVSUBI.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256]>

// VNEG.B/H/W/D                          Sched<[WriteVALU128, ReadVALU128]>
// XVNEG.B/H/W/D                         Sched<[WriteVALU256, ReadVALU256]>

// VSADD.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSSUB.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVSADD.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSSUB.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VSADD.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSSUB.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVSADD.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSSUB.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VHADDW.H/W/D/Q.B/H/W/D                Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VHSUBW.H/W/D/Q.B/H/W/D                Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VHADDW.HU/WU/DU/QU.BU/HU/WU/DU        Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VHSUBW.HU/WU/DU/QU.BU/HU/WU/DU        Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVHADDW.H/W/D/Q.B/H/W/D               Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVHSUBW.H/W/D/Q.B/H/W/D               Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVHADDW.HU/WU/DU/QU.BU/HU/WU/DU       Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVHSUBW.HU/WU/DU/QU.BU/HU/WU/DU       Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDWEV.H/W/D/Q.B/H/W/D               Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSUBWEV.H/W/D/Q.B/H/W/D               Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADDWEV.H/W/D/Q.B/H/W/D              Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSUBWEV.H/W/D/Q.B/H/W/D              Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDWOD.H/W/D/Q.B/H/W/D               Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSUBWOD.H/W/D/Q.B/H/W/D               Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADDWOD.H/W/D/Q.B/H/W/D              Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSUBWOD.H/W/D/Q.B/H/W/D              Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDWEV.H/W/D/Q.BU/HU/WU/DU           Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSUBWEV.H/W/D/Q.BU/HU/WU/DU           Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADDWEV.H/W/D/Q.BU/HU/WU/DU          Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSUBWEV.H/W/D/Q.BU/HU/WU/DU          Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDWOD.H/W/D/Q.BU/HU/WU/DU           Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VSUBWOD.H/W/D/Q.BU/HU/WU/DU           Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADDWOD.H/W/D/Q.BU/HU/WU/DU          Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVSUBWOD.H/W/D/Q.BU/HU/WU/DU          Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDWEV.H/W/D/Q.BU/HU/WU/DU.B/H/W/D   Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VADDWOD.H/W/D/Q.BU/HU/WU/DU.B/H/W/D   Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADDWEV.H/W/D/Q.BU/HU/WU/DU.B/H/W/D  Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVADDWOD.H/W/D/Q.BU/HU/WU/DU.B/H/W/D  Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VAVG.B/H/W/D                          Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VAVGR.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VAVG.BU/HU/WU/DU                      Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VAVGR.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVAVG.B/H/W/D                         Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVAVGR.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVAVG.BU/HU/WU/DU                     Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVAVGR.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VABSD.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VABSD.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVABSD.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVABSD.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VADDA.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVADDA.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VMAX.B/H/W/D                          Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VMIN.B/H/W/D                          Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VMAX.BU/HU/WU/DU                      Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// VMIN.BU/HU/WU/DU                      Sched<[WriteVALU128, ReadVALU128, ReadVALU128]>
// XVMAX.B/H/W/D                         Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVMIN.B/H/W/D                         Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVMAX.BU/HU/WU/DU                     Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>
// XVMIN.BU/HU/WU/DU                     Sched<[WriteVALU256, ReadVALU256, ReadVALU256]>

// VMAXI.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128]>
// VMINI.B/H/W/D                         Sched<[WriteVALU128, ReadVALU128]>
// VMAXI.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128]>
// VMINI.BU/HU/WU/DU                     Sched<[WriteVALU128, ReadVALU128]>
// XVMAXI.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256]>
// XVMINI.B/H/W/D                        Sched<[WriteVALU256, ReadVALU256]>
// XVMAXI.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256]>
// XVMINI.BU/HU/WU/DU                    Sched<[WriteVALU256, ReadVALU256]>
//===----------------------------------------------------------------------===//

def WriteVMUL128         : SchedWrite;   // 128-bit integer MUL
def WriteVMUL256         : SchedWrite;   // 256-bit integer MUL
def ReadVMUL128          : SchedRead;    // 128-bit integer MUL
def ReadVMUL256          : SchedRead;    // 256-bit integer MUL
//===----------------------------------------------------------------------===//
// VMUL.B/H/W/D                          Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// VMUH.B/H/W/D                          Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// VMUH.BU/HU/WU/DU                      Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// XVMUL.B/H/W/D                         Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
// XVMUH.B/H/W/D                         Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
// XVMUH.BU/HU/WU/DU                     Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>

// VMULWEV.H/W/D/Q.B/H/W/D               Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// VMULWEV.H/W/D/Q.BU/HU/WU/DU           Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// VMULWEV.H/W/D/Q.BU/HU/WU/DU.B/H/W/D   Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// XVMULWEV.H/W/D/Q.B/H/W/D              Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
// XVMULWEV.H/W/D/Q.BU/HU/WU/DU          Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
// XVMULWEV.H/W/D/Q.BU/HU/WU/DU.B/H/W/D  Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>

// VMULWOD.H/W/D/Q.B/H/W/D               Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// VMULWOD.H/W/D/Q.BU/HU/WU/DU           Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// VMULWOD.H/W/D/Q.BU/HU/WU/DU.B/H/W/D   Sched<[WriteVMUL128, ReadVMUL128, ReadVMUL128]>
// XVMULWOD.H/W/D/Q.B/H/W/D              Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
// XVMULWOD.H/W/D/Q.BU/HU/WU/DU          Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
// XVMULWOD.H/W/D/Q.BU/HU/WU/DU.B/H/W/D  Sched<[WriteVMUL256, ReadVMUL256, ReadVMUL256]>
//===----------------------------------------------------------------------===//

def WriteVMADD128        : SchedWrite;   // 128-bit integer MADD
def WriteVMADD256        : SchedWrite;   // 256-bit integer MADD
def ReadVMADD128         : SchedRead;    // 128-bit integer MADD
def ReadVMADD256         : SchedRead;    // 256-bit integer MADD
//===----------------------------------------------------------------------===//
// VMADD.B/H/W/D                         Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// VMSUB.B/H/W/D                         Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// XVMADD.B/H/W/D                        Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>
// XVMSUB.B/H/W/D                        Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>

// VMADDWEV.H/W/D.B/H/W                  Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// VMADDWEV.H/W/D.BU/HU/WU               Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// VMADDWEV.H/W/D.BU/HU/WU.B/H/W         Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// XVMADDWEV.H/W/D.B/H/W                 Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>
// XVMADDWEV.H/W/D.BU/HU/WU              Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>
// XVMADDWEV.H/W/D.BU/HU/WU.B/H/W        Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>

// VMADDWOD.H/W/D.B/H/W                  Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// VMADDWOD.H/W/D.BU/HU/WU               Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// VMADDWOD.H/W/D.BU/HU/WU.B/H/W         Sched<[WriteVMADD128, ReadVMADD128, ReadVMADD128]>
// XVMADDWOD.H/W/D.B/H/W                 Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>
// XVMADDWOD.H/W/D.BU/HU/WU              Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>
// XVMADDWOD.H/W/D.BU/HU/WU.B/H/W        Sched<[WriteVMADD256, ReadVMADD256, ReadVMADD256]>
//===----------------------------------------------------------------------===//

def WriteVMADDQ128       : SchedWrite;   // 128-bit integer MADDQ
def WriteVMADDQ256       : SchedWrite;   // 256-bit integer MADDQ
def ReadVMADDQ128        : SchedRead;    // 128-bit integer MADDQ
def ReadVMADDQ256        : SchedRead;    // 256-bit integer MADDQ
//===----------------------------------------------------------------------===//
// VMADDWEV.Q.D          Sched<[WriteVMADDQ128, ReadVMADDQ128, ReadVMADDQ128]>
// VMADDWEV.Q.DU         Sched<[WriteVMADDQ128, ReadVMADDQ128, ReadVMADDQ128]>
// VMADDWEV.Q.DU.D       Sched<[WriteVMADDQ128, ReadVMADDQ128, ReadVMADDQ128]>
// XVMADDWEV.Q.D         Sched<[WriteVMADDQ256, ReadVMADDQ256, ReadVMADDQ256]>
// XVMADDWEV.Q.DU        Sched<[WriteVMADDQ256, ReadVMADDQ256, ReadVMADDQ256]>
// XVMADDWEV.Q.DU.D      Sched<[WriteVMADDQ256, ReadVMADDQ256, ReadVMADDQ256]>

// VMADDWOD.Q.D          Sched<[WriteVMADDQ128, ReadVMADDQ128, ReadVMADDQ128]>
// VMADDWOD.Q.DU         Sched<[WriteVMADDQ128, ReadVMADDQ128, ReadVMADDQ128]>
// VMADDWOD.Q.DU.D       Sched<[WriteVMADDQ128, ReadVMADDQ128, ReadVMADDQ128]>
// XVMADDWOD.Q.D         Sched<[WriteVMADDQ256, ReadVMADDQ256, ReadVMADDQ256]>
// XVMADDWOD.Q.DU        Sched<[WriteVMADDQ256, ReadVMADDQ256, ReadVMADDQ256]>
// XVMADDWOD.Q.DU.D      Sched<[WriteVMADDQ256, ReadVMADDQ256, ReadVMADDQ256]>
//===----------------------------------------------------------------------===//

def WriteVDIV128B        : SchedWrite;   // 128-bit integer DIVB
def WriteVDIV256B        : SchedWrite;   // 256-bit integer DIVB
def ReadVDIV128B         : SchedRead;    // 128-bit integer DIVB
def ReadVDIV256B         : SchedRead;    // 256-bit integer DIVB
//===----------------------------------------------------------------------===//
// VDIV.B                Sched<[WriteVDIV128B, ReadVDIV128B, ReadVDIV128B]>
// VDIV.BU               Sched<[WriteVDIV128B, ReadVDIV128B, ReadVDIV128B]>
// VMOD.B                Sched<[WriteVDIV128B, ReadVDIV128B, ReadVDIV128B]>
// VMOD.BU               Sched<[WriteVDIV128B, ReadVDIV128B, ReadVDIV128B]>
// XVDIV.B               Sched<[WriteVDIV256B, ReadVDIV256B, ReadVDIV256B]>
// XVDIV.BU              Sched<[WriteVDIV256B, ReadVDIV256B, ReadVDIV256B]>
// XVMOD.B               Sched<[WriteVDIV256B, ReadVDIV256B, ReadVDIV256B]>
// XVMOD.BU              Sched<[WriteVDIV256B, ReadVDIV256B, ReadVDIV256B]>
//===----------------------------------------------------------------------===//

def WriteVDIV128H        : SchedWrite;   // 128-bit integer DIVH
def WriteVDIV256H        : SchedWrite;   // 256-bit integer DIVH
def ReadVDIV128H         : SchedRead;    // 128-bit integer DIVH
def ReadVDIV256H         : SchedRead;    // 256-bit integer DIVH
//===----------------------------------------------------------------------===//
// VDIV.H                Sched<[WriteVDIV128H, ReadVDIV128H, ReadVDIV128H]>
// VDIV.HU               Sched<[WriteVDIV128H, ReadVDIV128H, ReadVDIV128H]>
// VMOD.H                Sched<[WriteVDIV128H, ReadVDIV128H, ReadVDIV128H]>
// VMOD.HU               Sched<[WriteVDIV128H, ReadVDIV128H, ReadVDIV128H]>
// XVDIV.H               Sched<[WriteVDIV256H, ReadVDIV256H, ReadVDIV256H]>
// XVDIV.HU              Sched<[WriteVDIV256H, ReadVDIV256H, ReadVDIV256H]>
// XVMOD.H               Sched<[WriteVDIV256H, ReadVDIV256H, ReadVDIV256H]>
// XVMOD.HU              Sched<[WriteVDIV256H, ReadVDIV256H, ReadVDIV256H]>
//===----------------------------------------------------------------------===//

def WriteVDIV128W        : SchedWrite;   // 128-bit integer DIVW
def WriteVDIV256W        : SchedWrite;   // 256-bit integer DIVW
def ReadVDIV128W         : SchedRead;    // 128-bit integer DIVW
def ReadVDIV256W         : SchedRead;    // 256-bit integer DIVW
//===----------------------------------------------------------------------===//
// VDIV.W                Sched<[WriteVDIV128W, ReadVDIV128W, ReadVDIV128W]>
// VDIV.WU               Sched<[WriteVDIV128W, ReadVDIV128W, ReadVDIV128W]>
// VMOD.W                Sched<[WriteVDIV128W, ReadVDIV128W, ReadVDIV128W]>
// VMOD.WU               Sched<[WriteVDIV128W, ReadVDIV128W, ReadVDIV128W]>
// XVDIV.W               Sched<[WriteVDIV256W, ReadVDIV256W, ReadVDIV256W]>
// XVDIV.WU              Sched<[WriteVDIV256W, ReadVDIV256W, ReadVDIV256W]>
// XVMOD.W               Sched<[WriteVDIV256W, ReadVDIV256W, ReadVDIV256W]>
// XVMOD.WU              Sched<[WriteVDIV256W, ReadVDIV256W, ReadVDIV256W]>
//===----------------------------------------------------------------------===//

def WriteVDIV128D        : SchedWrite;   // 128-bit integer DIVD
def WriteVDIV256D        : SchedWrite;   // 256-bit integer DIVD
def ReadVDIV128D         : SchedRead;    // 128-bit integer DIVD
def ReadVDIV256D         : SchedRead;    // 256-bit integer DIVD
//===----------------------------------------------------------------------===//
// VDIV.D                Sched<[WriteVDIV128D, ReadVDIV128D, ReadVDIV128D]>
// VDIV.DU               Sched<[WriteVDIV128D, ReadVDIV128D, ReadVDIV128D]>
// VMOD.D                Sched<[WriteVDIV128D, ReadVDIV128D, ReadVDIV128D]>
// VMOD.DU               Sched<[WriteVDIV128D, ReadVDIV128D, ReadVDIV128D]>
// XVDIV.D               Sched<[WriteVDIV256D, ReadVDIV256D, ReadVDIV256D]>
// XVDIV.DU              Sched<[WriteVDIV256D, ReadVDIV256D, ReadVDIV256D]>
// XVMOD.D               Sched<[WriteVDIV256D, ReadVDIV256D, ReadVDIV256D]>
// XVMOD.DU              Sched<[WriteVDIV256D, ReadVDIV256D, ReadVDIV256D]>
//===----------------------------------------------------------------------===//

def WriteVSAT128         : SchedWrite;   // 128-bit integer SAT
def WriteVSAT256         : SchedWrite;   // 256-bit integer SAT
def ReadVSAT128          : SchedRead;    // 128-bit integer SAT
def ReadVSAT256          : SchedRead;    // 256-bit integer SAT
//===----------------------------------------------------------------------===//
// VSAT.B/H/W/D          Sched<[WriteVSAT128, ReadVSAT128]>
// VSAT.BU/HU/WU/DU      Sched<[WriteVSAT128, ReadVSAT128]>
// XVSAT.B/H/W/D         Sched<[WriteVSAT256, ReadVSAT256]>
// XVSAT.BU/HU/WU/DU     Sched<[WriteVSAT256, ReadVSAT256]>
//===----------------------------------------------------------------------===//

def WriteVEXT128         : SchedWrite;   // 128-bit integer EXT
def WriteVEXT256         : SchedWrite;   // 256-bit integer EXT
def ReadVEXT128          : SchedRead;    // 128-bit integer EXT
def ReadVEXT256          : SchedRead;    // 256-bit integer EXT
//===----------------------------------------------------------------------===//
// VEXTH.H/W/D/Q.B/H/W/D                 Sched<[WriteVEXT128, ReadVEXT128]>
// VEXTH.HU/WU/DU/QU.BU/HU/WU/DU         Sched<[WriteVEXT128, ReadVEXT128]>
// XVEXTH.H/W/D/Q.B/H/W/D                Sched<[WriteVEXT256, ReadVEXT256]>
// XVEXTH.HU/WU/DU/QU.BU/HU/WU/DU        Sched<[WriteVEXT256, ReadVEXT256]>

// XVEXTXV.H/W/D.B       Sched<[WriteVEXT256, ReadVEXT256]>
// XVEXTXV.W/D.H         Sched<[WriteVEXT256, ReadVEXT256]>
// XVEXTXV.D.W           Sched<[WriteVEXT256, ReadVEXT256]>
// XVEXTXV.HU/WU/DU.BU   Sched<[WriteVEXT256, ReadVEXT256]>
// XVEXTXV.WU/DU.HU      Sched<[WriteVEXT256, ReadVEXT256]>
// XVEXTXV.DU.WU         Sched<[WriteVEXT256, ReadVEXT256]>
//===----------------------------------------------------------------------===//

def WriteVSIGNCOV128     : SchedWrite;   // 128-bit integer SIGNCOV
def WriteVSIGNCOV256     : SchedWrite;   // 256-bit integer SIGNCOV
def ReadVSIGNCOV128      : SchedRead;    // 128-bit integer SIGNCOV
def ReadVSIGNCOV256      : SchedRead;    // 256-bit integer SIGNCOV
//===----------------------------------------------------------------------===//
// VSIGNCOV.B/H/W/D      Sched<[WriteVSIGNCOV128, ReadVSIGNCOV128, ReadVSIGNCOV128]>
// XVSIGNCOV.B/H/W/D     Sched<[WriteVSIGNCOV256, ReadVSIGNCOV256, ReadVSIGNCOV256]>
//===----------------------------------------------------------------------===//

def WriteVMSK128         : SchedWrite;   // 128-bit integer MSK
def WriteVMSK256         : SchedWrite;   // 256-bit integer MSK
def ReadVMSK128          : SchedRead;    // 128-bit integer MSK
def ReadVMSK256          : SchedRead;    // 256-bit integer MSK
//===----------------------------------------------------------------------===//
// VMSKLTZ.B/H/W/D       Sched<[WriteVMSK128, ReadVMSK128]>
// XVMSKLTZ.B/H/W/D      Sched<[WriteVMSK256, ReadVMSK256]>
// VMSKGEZ.B             Sched<[WriteVMSK128, ReadVMSK128]>
// VMSKNZ.B              Sched<[WriteVMSK128, ReadVMSK128]>
// XVMSKGEZ.B            Sched<[WriteVMSK256, ReadVMSK256]>
// XVMSKNZ.B             Sched<[WriteVMSK256, ReadVMSK256]>
//===----------------------------------------------------------------------===//

def WriteVLDI128         : SchedWrite;   // 128-bit integer LDI
def WriteVLDI256         : SchedWrite;   // 256-bit integer LDI
def ReadVLDI128          : SchedRead;    // 128-bit integer LDI
def ReadVLDI256          : SchedRead;    // 256-bit integer LDI
//===----------------------------------------------------------------------===//
// VLDI                  Sched<[WriteVLDI128]>
// XVLDI                 Sched<[WriteVLDI256]>
//===----------------------------------------------------------------------===//

/// Vector instruction - BIT ...
def WriteVBIT128         : SchedWrite;   // 128-bit integer BIT
def WriteVBIT256         : SchedWrite;   // 256-bit integer BIT
def ReadVBIT128          : SchedRead;    // 128-bit integer BIT
def ReadVBIT256          : SchedRead;    // 256-bit integer BIT
//===----------------------------------------------------------------------===//
// VAND.V                Sched<[WriteVBIT128, ReadVBIT128, ReadVBIT128]>
// VANDN.V               Sched<[WriteVBIT128, ReadVBIT128, ReadVBIT128]>
// VOR.V                 Sched<[WriteVBIT128, ReadVBIT128, ReadVBIT128]>
// VXOR.V                Sched<[WriteVBIT128, ReadVBIT128, ReadVBIT128]>
// VNOR.V                Sched<[WriteVBIT128, ReadVBIT128, ReadVBIT128]>
// VORN.V                Sched<[WriteVBIT128, ReadVBIT128, ReadVBIT128]>
// XVAND.V               Sched<[WriteVBIT256, ReadVBIT256, ReadVBIT256]>
// XVANDN.V              Sched<[WriteVBIT256, ReadVBIT256, ReadVBIT256]>
// XVOR.V                Sched<[WriteVBIT256, ReadVBIT256, ReadVBIT256]>
// XVXOR.V               Sched<[WriteVBIT256, ReadVBIT256, ReadVBIT256]>
// XVNOR.V               Sched<[WriteVBIT256, ReadVBIT256, ReadVBIT256]>
// XVORN.V               Sched<[WriteVBIT256, ReadVBIT256, ReadVBIT256]>

// VANDI.B               Sched<[WriteVBIT128, ReadVBIT128]>
// VORI.B                Sched<[WriteVBIT128, ReadVBIT128]>
// VXORI.B               Sched<[WriteVBIT128, ReadVBIT128]>
// VNORI.B               Sched<[WriteVBIT128, ReadVBIT128]>
// XVANDI.B              Sched<[WriteVBIT256, ReadVBIT256]>
// XVORI.B               Sched<[WriteVBIT256, ReadVBIT256]>
// XVXORI.B              Sched<[WriteVBIT256, ReadVBIT256]>
// XVNORI.B              Sched<[WriteVBIT256, ReadVBIT256]>
//===----------------------------------------------------------------------===//

/// Vector instruction - SHIFT ...
def WriteVSHIFT128       : SchedWrite;   // 128-bit integer SHIFT
def WriteVSHIFT256       : SchedWrite;   // 256-bit integer SHIFT
def ReadVSHIFT128        : SchedRead;    // 128-bit integer SHIFT
def ReadVSHIFT256        : SchedRead;    // 256-bit integer SHIFT
//===----------------------------------------------------------------------===//
// VSLL.B/H/W/D          Sched<[WriteVSHIFT128, ReadVSHIFT128, ReadVSHIFT128]>
// VSRL.B/H/W/D          Sched<[WriteVSHIFT128, ReadVSHIFT128, ReadVSHIFT128]>
// VSRA.B/H/W/D          Sched<[WriteVSHIFT128, ReadVSHIFT128, ReadVSHIFT128]>
// VROTR.B/H/W/D         Sched<[WriteVSHIFT128, ReadVSHIFT128, ReadVSHIFT128]>

// XVSLL.B/H/W/D         Sched<[WriteVSHIFT256, ReadVSHIFT256, ReadVSHIFT256]>
// XVSRL.B/H/W/D         Sched<[WriteVSHIFT256, ReadVSHIFT256, ReadVSHIFT256]>
// XVSRA.B/H/W/D         Sched<[WriteVSHIFT256, ReadVSHIFT256, ReadVSHIFT256]>
// XVROTR.B/H/W/D        Sched<[WriteVSHIFT256, ReadVSHIFT256, ReadVSHIFT256]>

// VSLLI.B/H/W/D         Sched<[WriteVSHIFT128, ReadVSHIFT128]>
// VSRLI.B/H/W/D         Sched<[WriteVSHIFT128, ReadVSHIFT128]>
// VSRAI.B/H/W/D         Sched<[WriteVSHIFT128, ReadVSHIFT128]>
// VROTRI.B/H/W/D        Sched<[WriteVSHIFT128, ReadVSHIFT128]>

// XVSLLI.B/H/W/D        Sched<[WriteVSHIFT256, ReadVSHIFT256]>
// XVSRLI.B/H/W/D        Sched<[WriteVSHIFT256, ReadVSHIFT256]>
// XVSRAI.B/H/W/D        Sched<[WriteVSHIFT256, ReadVSHIFT256]>
// XVROTRI.B/H/W/D       Sched<[WriteVSHIFT256, ReadVSHIFT256]>
//===----------------------------------------------------------------------===//

def WriteVSLLWIL128      : SchedWrite;   // 128-bit integer SLLWIL
def WriteVSLLWIL256      : SchedWrite;   // 256-bit integer SLLWIL
def ReadVSLLWIL128       : SchedRead;    // 128-bit integer SLLWIL
def ReadVSLLWIL256       : SchedRead;    // 256-bit integer SLLWIL
def WriteVEXTL128        : SchedWrite;   // 128-bit integer EXTL
def WriteVEXTL256        : SchedWrite;   // 256-bit integer EXTL
def ReadVEXTL128         : SchedRead;    // 128-bit integer EXTL
def ReadVEXTL256         : SchedRead;    // 256-bit integer EXTL
//===----------------------------------------------------------------------===//
// VSLLWIL.H/W/D.B/H/W              Sched<[WriteVSLLWIL128, ReadVSLLWIL128]>
// VEXTL.Q.D                        Sched<[WriteVEXTL128, ReadVEXTL128]>
// VSLLWIL.HU/WU/DU.BU/HU/WU        Sched<[WriteVSLLWIL128, ReadVSLLWIL128]>
// VEXTL.QU.DU                      Sched<[WriteVEXTL128, ReadVEXTL128]>
// XVSLLWIL.H/W/D.B/H/W             Sched<[WriteVSLLWIL256, ReadVSLLWIL256]>
// XVEXTL.Q.D                       Sched<[WriteVEXTL256, ReadVEXTL256]>
// XVSLLWIL.HU/WU/DU.BU/HU/WU       Sched<[WriteVSLLWIL256, ReadVSLLWIL256]>
// XVEXTL.QU.DU                     Sched<[WriteVEXTL256, ReadVEXTL256]>
//===----------------------------------------------------------------------===//

def WriteVSHIFTR128      : SchedWrite;   // 128-bit integer SRLR / SRAR
def WriteVSHIFTR256      : SchedWrite;   // 256-bit integer SRLR / SRAR
def ReadVSHIFTR128       : SchedRead;    // 128-bit integer SRLR / SRAR
def ReadVSHIFTR256       : SchedRead;    // 256-bit integer SRLR / SRAR
//===----------------------------------------------------------------------===//
// VSRLR.B/H/W/D      Sched<[WriteVSHIFTR128, ReadVSHIFTR128, ReadVSHIFTR128]>
// VSRAR.B/H/W/D      Sched<[WriteVSHIFTR128, ReadVSHIFTR128, ReadVSHIFTR128]>
// XVSRLR.B/H/W/D     Sched<[WriteVSHIFTR256, ReadVSHIFTR256, ReadVSHIFTR256]>
// XVSRAR.B/H/W/D     Sched<[WriteVSHIFTR256, ReadVSHIFTR256, ReadVSHIFTR256]>
// VSRLRI.B/H/W/D     Sched<[WriteVSHIFTR128, ReadVSHIFTR128]>
// VSRARI.B/H/W/D     Sched<[WriteVSHIFTR128, ReadVSHIFTR128]>
// XVSRLRI.B/H/W/D    Sched<[WriteVSHIFTR256, ReadVSHIFTR256]>
// XVSRARI.B/H/W/D    Sched<[WriteVSHIFTR256, ReadVSHIFTR256]>
//===----------------------------------------------------------------------===//

def WriteVSHIFTN128      : SchedWrite;   // 128-bit integer SRLN / SRAN
def WriteVSHIFTN256      : SchedWrite;   // 256-bit integer SRLN / SRAN
def ReadVSHIFTN128       : SchedRead;    // 128-bit integer SRLN / SRAN
def ReadVSHIFTN256       : SchedRead;    // 256-bit integer SRLN / SRAN
//===----------------------------------------------------------------------===//
// VSRLN.B/H/W.H/W/D   Sched<[WriteVSHIFTN128, ReadVSHIFTN128, ReadVSHIFTN128]>
// VSRAN.B/H/W.H/W/D   Sched<[WriteVSHIFTN128, ReadVSHIFTN128, ReadVSHIFTN128]>
// XVSRLN.B/H/W.H/W/D  Sched<[WriteVSHIFTN256, ReadVSHIFTN256, ReadVSHIFTN256]> 
// XVSRAN.B/H/W.H/W/D  Sched<[WriteVSHIFTN256, ReadVSHIFTN256, ReadVSHIFTN256]>
//===----------------------------------------------------------------------===//

def WriteVSHIFTNI128     : SchedWrite;   // 128-bit integer SRLNI / SRANI
def WriteVSHIFTNI256     : SchedWrite;   // 256-bit integer SRLNI / SRANI
def ReadVSHIFTNI128      : SchedRead;    // 128-bit integer SRLNI / SRANI
def ReadVSHIFTNI256      : SchedRead;    // 256-bit integer SRLNI / SRANI
//===----------------------------------------------------------------------===//
// VSRLNI.B/H/W.H/W/D    Sched<[WriteVSHIFTNI128, ReadVSHIFTNI128]>
// VSRANI.B/H/W.H/W/D    Sched<[WriteVSHIFTNI128, ReadVSHIFTNI128]>
// XVSRLNI.B/H/W.H/W/D   Sched<[WriteVSHIFTNI256, ReadVSHIFTNI256]>
// XVSRANI.B/H/W.H/W/D   Sched<[WriteVSHIFTNI256, ReadVSHIFTNI256]>
 //===----------------------------------------------------------------------===//
def WriteVSHIFTNI128Q    : SchedWrite;   // 128-bit integer SRLNI / SRANI
def WriteVSHIFTNI256Q    : SchedWrite;   // 256-bit integer SRLNI / SRANI
def ReadVSHIFTNI128Q     : SchedRead;    // 128-bit integer SRLNI / SRANI
def ReadVSHIFTNI256Q     : SchedRead;    // 256-bit integer SRLNI / SRANI
//===----------------------------------------------------------------------===//
// VSRLNI.D.Q            Sched<[WriteVSHIFTNI128Q, ReadVSHIFTNI128Q]>
// VSRANI.D.Q            Sched<[WriteVSHIFTNI128Q, ReadVSHIFTNI128Q]>
// XVSRLNI.D.Q           Sched<[WriteVSHIFTNI256Q, ReadVSHIFTNI256Q]>
// XVSRANI.D.Q           Sched<[WriteVSHIFTNI256Q, ReadVSHIFTNI256Q]>
//===----------------------------------------------------------------------===//

def WriteVSHIFTRN128     : SchedWrite;   // 128-bit integer SRLRN / SRARN
def WriteVSHIFTRN256     : SchedWrite;   // 256-bit integer SRLRN / SRARN
def ReadVSHIFTRN128      : SchedRead;    // 128-bit integer SRLRN / SRARN
def ReadVSHIFTRN256      : SchedRead;    // 256-bit integer SRLRN / SRARN
//===----------------------------------------------------------------------===//
// VSRLRN.B/H/W.H/W/D   Sched<[WriteVSHIFTRN128, ReadVSHIFTRN128, ReadVSHIFTRN128]>
// VSRARN.B/H/W.H/W/D   Sched<[WriteVSHIFTRN128, ReadVSHIFTRN128, ReadVSHIFTRN128]>
// XVSRLRN.B/H/W.H/W/D  Sched<[WriteVSHIFTRN256, ReadVSHIFTRN256, ReadVSHIFTRN256]>
// XVSRARN.B/H/W.H/W/D  Sched<[WriteVSHIFTRN256, ReadVSHIFTRN256, ReadVSHIFTRN256]>
//===----------------------------------------------------------------------===//

def WriteVSHIFTRNI128    : SchedWrite;   // 128-bit integer SRLRNI / SRARNI
def WriteVSHIFTRNI256    : SchedWrite;   // 256-bit integer SRLRNI / SRARNI
def ReadVSHIFTRNI128     : SchedRead;    // 128-bit integer SRLRNI / SRARNI
def ReadVSHIFTRNI256     : SchedRead;    // 256-bit integer SRLRNI / SRARNI
//===----------------------------------------------------------------------===//
// VSRLRNI.B/H/W.H/W/D   Sched<[WriteVSHIFTRNI128, ReadVSHIFTRNI128]>
// VSRARNI.B/H/W.H/W/D   Sched<[WriteVSHIFTRNI128, ReadVSHIFTRNI128]>
// XVSRLRNI.B/H/W.H/W/D  Sched<[WriteVSHIFTRNI256, ReadVSHIFTRNI256]>
// XVSRARNI.B/H/W.H/W/D  Sched<[WriteVSHIFTRNI256, ReadVSHIFTRNI256]>
 //===----------------------------------------------------------------------===//
def WriteVSHIFTRNI128Q   : SchedWrite;   // 128-bit integer SRLRNI / SRARNI
def WriteVSHIFTRNI256Q   : SchedWrite;   // 256-bit integer SRLRNI / SRARNI
def ReadVSHIFTRNI128Q    : SchedRead;    // 128-bit integer SRLRNI / SRARNI
def ReadVSHIFTRNI256Q    : SchedRead;    // 256-bit integer SRLRNI / SRARNI
//===----------------------------------------------------------------------===//
// VSRLRNI.D.Q           Sched<[WriteVSHIFTRNI128Q, ReadVSHIFTRNI128Q]>
// VSRARNI.D.Q           Sched<[WriteVSHIFTRNI128Q, ReadVSHIFTRNI128Q]>
// XVSRLRNI.D.Q          Sched<[WriteVSHIFTRNI256Q, ReadVSHIFTRNI256Q]>
// XVSRARNI.D.Q          Sched<[WriteVSHIFTRNI256Q, ReadVSHIFTRNI256Q]>
//===----------------------------------------------------------------------===//

def WriteVSSHIFTN128     : SchedWrite;   // 128-bit integer SSRLN / SSRAN
def WriteVSSHIFTN256     : SchedWrite;   // 256-bit integer SSRLN / SSRAN
def ReadVSSHIFTN128      : SchedRead;    // 128-bit integer SSRLN / SSRAN
def ReadVSSHIFTN256      : SchedRead;    // 256-bit integer SSRLN / SSRAN
//===----------------------------------------------------------------------===//
// VSSRLN.B/H/W.H/W/D      Sched<[WriteVSSHIFTN128, ReadVSSHIFTN128, ReadVSSHIFTN128]>
// VSSRAN.B/H/W.H/W/D      Sched<[WriteVSSHIFTN128, ReadVSSHIFTN128, ReadVSSHIFTN128]>
// XVSSRLN.B/H/W.H/W/D     Sched<[WriteVSSHIFTN256, ReadVSSHIFTN256, ReadVSSHIFTN256]>
// XVSSRAN.B/H/W.H/W/D     Sched<[WriteVSSHIFTN256, ReadVSSHIFTN256, ReadVSSHIFTN256]>
// VSSRLN.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTN128, ReadVSSHIFTN128, ReadVSSHIFTN128]>
// VSSRAN.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTN128, ReadVSSHIFTN128, ReadVSSHIFTN128]>
// XVSSRLN.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTN256, ReadVSSHIFTN256, ReadVSSHIFTN256]>
// XVSSRAN.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTN256, ReadVSSHIFTN256, ReadVSSHIFTN256]>
 //===----------------------------------------------------------------------===//

def WriteVSSHIFTNI128    : SchedWrite;   // 128-bit integer SSRLNI / SSRANI
def WriteVSSHIFTNI256    : SchedWrite;   // 256-bit integer SSRLNI / SSRANI
def ReadVSSHIFTNI128     : SchedRead;    // 128-bit integer SSRLNI / SSRANI
def ReadVSSHIFTNI256     : SchedRead;    // 256-bit integer SSRLNI / SSRANI
//===----------------------------------------------------------------------===//
// VSSRLNI.B/H/W.H/W/D      Sched<[WriteVSSHIFTNI128, ReadVSSHIFTNI128]>
// VSSRANI.B/H/W.H/W/D      Sched<[WriteVSSHIFTNI128, ReadVSSHIFTNI128]>
// XVSSRLNI.B/H/W.H/W/D     Sched<[WriteVSSHIFTNI256, ReadVSSHIFTNI256]>
// XVSSRANI.B/H/W.H/W/D     Sched<[WriteVSSHIFTNI256, ReadVSSHIFTNI256]>
// VSSRLNI.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTNI128, ReadVSSHIFTNI128]>
// VSSRANI.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTNI128, ReadVSSHIFTNI128]>
// XVSSRLNI.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTNI256, ReadVSSHIFTNI256]>
// XVSSRANI.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTNI256, ReadVSSHIFTNI256]>
 //===----------------------------------------------------------------------===//
def WriteVSSHIFTNI128Q   : SchedWrite;   // 128-bit integer SSRLNI / SSRANI
def WriteVSSHIFTNI256Q   : SchedWrite;   // 256-bit integer SSRLNI / SSRANI
def ReadVSSHIFTNI128Q    : SchedRead;    // 128-bit integer SSRLNI / SSRANI
def ReadVSSHIFTNI256Q    : SchedRead;    // 256-bit integer SSRLNI / SSRANI
//===----------------------------------------------------------------------===//
// VSSRLNI.D.Q           Sched<[WriteVSSHIFTNI128Q, ReadVSSHIFTNI128Q]>
// VSSRANI.D.Q           Sched<[WriteVSSHIFTNI128Q, ReadVSSHIFTNI128Q]>
// XVSSRLNI.D.Q          Sched<[WriteVSSHIFTNI256Q, ReadVSSHIFTNI256Q]>
// XVSSRANI.D.Q          Sched<[WriteVSSHIFTNI256Q, ReadVSSHIFTNI256Q]>
// VSSRLNI.DU.Q          Sched<[WriteVSSHIFTNI128Q, ReadVSSHIFTNI128Q]>
// VSSRANI.DU.Q          Sched<[WriteVSSHIFTNI128Q, ReadVSSHIFTNI128Q]>
// XVSSRLNI.DU.Q         Sched<[WriteVSSHIFTNI256Q, ReadVSSHIFTNI256Q]>
// XVSSRANI.DU.Q         Sched<[WriteVSSHIFTNI256Q, ReadVSSHIFTNI256Q]>
//===----------------------------------------------------------------------===//

def WriteVSSHIFTRN128    : SchedWrite;   // 128-bit integer SSRLRN / SSRARN
def WriteVSSHIFTRN256    : SchedWrite;   // 256-bit integer SSRLRN / SSRARN
def ReadVSSHIFTRN128     : SchedRead;    // 128-bit integer SSRLRN / SSRARN
def ReadVSSHIFTRN256     : SchedRead;    // 256-bit integer SSRLRN / SSRARN
//===----------------------------------------------------------------------===//
// VSSRLRN.B/H/W.H/W/D      Sched<[WriteVSSHIFTRN128, ReadVSSHIFTRN128, ReadVSSHIFTRN128]>
// VSSRARN.B/H/W.H/W/D      Sched<[WriteVSSHIFTRN128, ReadVSSHIFTRN128, ReadVSSHIFTRN128]>
// XVSSRLRN.B/H/W.H/W/D     Sched<[WriteVSSHIFTRN256, ReadVSSHIFTRN256, ReadVSSHIFTRN256]>
// XVSSRARN.B/H/W.H/W/D     Sched<[WriteVSSHIFTRN256, ReadVSSHIFTRN256, ReadVSSHIFTRN256]>
// VSSRLRN.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTRN128, ReadVSSHIFTRN128, ReadVSSHIFTRN128]>
// VSSRARN.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTRN128, ReadVSSHIFTRN128, ReadVSSHIFTRN128]>
// XVSSRLRN.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTRN256, ReadVSSHIFTRN256, ReadVSSHIFTRN256]>
// XVSSRARN.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTRN256, ReadVSSHIFTRN256, ReadVSSHIFTRN256]>
//===----------------------------------------------------------------------===//

def WriteVSSHIFTRNI128    : SchedWrite;   // 128-bit integer SSRLRNI / SSRARNI
def WriteVSSHIFTRNI256    : SchedWrite;   // 256-bit integer SSRLRNI / SSRARNI
def ReadVSSHIFTRNI128     : SchedRead;    // 128-bit integer SSRLRNI / SSRARNI
def ReadVSSHIFTRNI256     : SchedRead;    // 256-bit integer SSRLRNI / SSRARNI
//===----------------------------------------------------------------------===//
// VSSRLRNI.B/H/W.H/W/D      Sched<[WriteVSSHIFTRNI128, ReadVSSHIFTRNI128]>
// VSSRARNI.B/H/W.H/W/D      Sched<[WriteVSSHIFTRNI128, ReadVSSHIFTRNI128]>
// XVSSRLRNI.B/H/W.H/W/D     Sched<[WriteVSSHIFTRNI256, ReadVSSHIFTRNI256]>
// XVSSRARNI.B/H/W.H/W/D     Sched<[WriteVSSHIFTRNI256, ReadVSSHIFTRNI256]>
// VSSRLRNI.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTRNI128, ReadVSSHIFTRNI128]>
// VSSRARNI.BU/HU/WU.H/W/D   Sched<[WriteVSSHIFTRNI128, ReadVSSHIFTRNI128]>
// XVSSRLRNI.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTRNI256, ReadVSSHIFTRNI256]>
// XVSSRARNI.BU/HU/WU.H/W/D  Sched<[WriteVSSHIFTRNI256, ReadVSSHIFTRNI256]>
 //===----------------------------------------------------------------------===//
def WriteVSSHIFTRNI128Q   : SchedWrite;   // 128-bit integer SSRLRNI / SSRARNI
def WriteVSSHIFTRNI256Q   : SchedWrite;   // 256-bit integer SSRLRNI / SSRARNI
def ReadVSSHIFTRNI128Q    : SchedRead;    // 128-bit integer SSRLRNI / SSRARNI
def ReadVSSHIFTRNI256Q    : SchedRead;    // 256-bit integer SSRLRNI / SSRARNI
//===----------------------------------------------------------------------===//
// VSSRLRNI.D.Q           Sched<[WriteVSSHIFTRNI128Q, ReadVSSHIFTRNI128Q]>
// VSSRARNI.D.Q           Sched<[WriteVSSHIFTRNI128Q, ReadVSSHIFTRNI128Q]>
// XVSSRLRNI.D.Q          Sched<[WriteVSSHIFTRNI256Q, ReadVSSHIFTRNI256Q]>
// XVSSRARNI.D.Q          Sched<[WriteVSSHIFTRNI256Q, ReadVSSHIFTRNI256Q]>
// VSSRLRNI.DU.Q          Sched<[WriteVSSHIFTRNI128Q, ReadVSSHIFTRNI128Q]>
// VSSRARNI.DU.Q          Sched<[WriteVSSHIFTRNI128Q, ReadVSSHIFTRNI128Q]>
// XVSSRLRNI.DU.Q         Sched<[WriteVSSHIFTRNI256Q, ReadVSSHIFTRNI256Q]>
// XVSSRARNI.DU.Q         Sched<[WriteVSSHIFTRNI256Q, ReadVSSHIFTRNI256Q]>
//===----------------------------------------------------------------------===//

def WriteVCLO128          : SchedWrite;   // 128-bit integer CLO
def WriteVCLZ128          : SchedWrite;   // 128-bit integer CLZ
def ReadVCLO128           : SchedRead;    // 128-bit integer CLO
def ReadVCLZ128           : SchedRead;    // 128-bit integer CLZ
def WriteVCLO256          : SchedWrite;   // 128-bit integer CLO
def WriteVCLZ256          : SchedWrite;   // 128-bit integer CLZ
def ReadVCLO256           : SchedRead;    // 128-bit integer CLO
def ReadVCLZ256           : SchedRead;    // 128-bit integer CLZ
//===----------------------------------------------------------------------===//
// VCLO.B/H/W/D           Sched<[WriteVCLO128, ReadVCLO128]>
// VCLZ.B/H/W/D           Sched<[WriteVCLZ128, ReadVCLZ128]>
// XVCLO.B/H/W/D          Sched<[WriteVCLO256, ReadVCLO256]>
// XVCLZ.B/H/W/D          Sched<[WriteVCLZ256, ReadVCLZ256]>
//===----------------------------------------------------------------------===//

def WriteVPCNT128         : SchedWrite;   // 128-bit integer PCNT
def WriteVPCNT256         : SchedWrite;   // 256-bit integer PCNT
def ReadVPCNT128          : SchedRead;    // 128-bit integer PCNT
def ReadVPCNT256          : SchedRead;    // 128-bit integer PCNT
//===----------------------------------------------------------------------===//
// VPCNT.B/H/W/D          Sched<[WriteVPCNT128, ReadVPCNT128]>
// XVPCNT.B/H/W/D         Sched<[WriteVPCNT256, ReadVPCNT256]>
//===----------------------------------------------------------------------===//

def WriteVBITCLR128       : SchedWrite;   // 128-bit integer BITCLR
def WriteVBITCLR256       : SchedWrite;   // 256-bit integer BITCLR
def ReadVBITCLR128        : SchedRead;    // 128-bit integer BITCLR
def ReadVBITCLR256        : SchedRead;    // 256-bit integer BITCLR
//===----------------------------------------------------------------------===//
// VBITCLR.B/H/W/D     Sched<[WriteVBITCLR128, ReadVBITCLR128, ReadVBITCLR128]>
// XVBITCLR.B/H/W/D    Sched<[WriteVBITCLR256, ReadVBITCLR256, ReadVBITCLR256]>
// VBITCLRI.B/H/W/D    Sched<[WriteVBITCLR128, ReadVBITCLR128]>
// XVBITCLRI.B/H/W/D   Sched<[WriteVBITCLR256, ReadVBITCLR256]>
//===----------------------------------------------------------------------===//
def WriteVBITSET128       : SchedWrite;   // 128-bit integer BITSET
def WriteVBITSET256       : SchedWrite;   // 256-bit integer BITSET
def ReadVBITSET128        : SchedRead;    // 128-bit integer BITSET
def ReadVBITSET256        : SchedRead;    // 256-bit integer BITSET
//===----------------------------------------------------------------------===//
// VBITSET.B/H/W/D     Sched<[WriteVBITSET128, ReadVBITSET128, ReadVBITSET128]>
// XVBITSET.B/H/W/D    Sched<[WriteVBITSET256, ReadVBITSET256, ReadVBITSET256]>
// VBITSETI.B/H/W/D    Sched<[WriteVBITSET128, ReadVBITSET128]>
// XVBITSETI.B/H/W/D   Sched<[WriteVBITSET256, ReadVBITSET256]>
//===----------------------------------------------------------------------===//
def WriteVBITREV128       : SchedWrite;   // 128-bit integer BITREV
def WriteVBITREV256       : SchedWrite;   // 256-bit integer BITREV
def ReadVBITREV128        : SchedRead;    // 128-bit integer BITREV
def ReadVBITREV256        : SchedRead;    // 256-bit integer BITREV
//===----------------------------------------------------------------------===//
// VBITREV.B/H/W/D     Sched<[WriteVBITREV128, ReadVBITREV128, ReadVBITREV128]>
// XVBITREV.B/H/W/D    Sched<[WriteVBITREV256, ReadVBITREV256, ReadVBITREV256]>
// VBITREVI.B/H/W/D    Sched<[WriteVBITREV128, ReadVBITREV128]>
// XVBITREVI.B/H/W/D   Sched<[WriteVBITREV256, ReadVBITREV256]>
//===----------------------------------------------------------------------===//

def WriteVFRSTP128        : SchedWrite;   // 128-bit integer BITREV
def WriteVFRSTP256        : SchedWrite;   // 256-bit integer BITREV
def ReadVFRSTP128         : SchedRead;    // 128-bit integer BITREV
def ReadVFRSTP256         : SchedRead;    // 256-bit integer BITREV
//===----------------------------------------------------------------------===//
// VFRSTP.B/H/W/D      Sched<[WriteVFRSTP128, ReadVFRSTP128, ReadVFRSTP128]>
// XVFRSTP.B/H/W/D     Sched<[WriteVFRSTP256, ReadVFRSTP256, ReadVFRSTP256]>
// VFRSTPI.B/H/W/D     Sched<[WriteVFRSTP128, ReadVFRSTP128]>
// XVFRSTPI.B/H/W/D    Sched<[WriteVFRSTP256, ReadVFRSTP256]>
//===----------------------------------------------------------------------===//



/// Vector instruction - Floating-point 

def WriteVFALU128         : SchedWrite;   // 128-bit FADD FSUB FMUL
def WriteVFALU256         : SchedWrite;   // 256-bit FADD FSUB FMUL
def ReadVFALU128          : SchedRead;    // 128-bit FADD FSUB FMUL
def ReadVFALU256          : SchedRead;    // 256-bit FADD FSUB FMUL
//===----------------------------------------------------------------------===//
// VFADD.S/D       Sched<[WriteVFALU128, ReadVFALU128, ReadVFALU128]>
// VFSUB.S/D       Sched<[WriteVFALU128, ReadVFALU128, ReadVFALU128]>
// VFMUL.S/D       Sched<[WriteVFALU128, ReadVFALU128, ReadVFALU128]>
// XVFADD.S/D      Sched<[WriteVFALU256, ReadVFALU256, ReadVFALU256]>
// XVFSUB.S/D      Sched<[WriteVFALU256, ReadVFALU256, ReadVFALU256]>
// XVFMUL.S/D      Sched<[WriteVFALU256, ReadVFALU256, ReadVFALU256]>
//===----------------------------------------------------------------------===//

def WriteVFDIVS128        : SchedWrite;   // 128-bit FDIV.S
def WriteVFDIVS256        : SchedWrite;   // 256-bit FDIV.S
def ReadVFDIVS128         : SchedRead;    // 128-bit FDIV.S
def ReadVFDIVS256         : SchedRead;    // 256-bit FDIV.S
//===----------------------------------------------------------------------===//
// VFDIV.S         Sched<[WriteVFDIVS128, ReadVFDIVS128, ReadVFDIVS128]>
// XVFDIV.S        Sched<[WriteVFDIVS256, ReadVFDIVS256, ReadVFDIVS256]>
//===----------------------------------------------------------------------===//
def WriteVFDIVD128        : SchedWrite;   // 128-bit FDIV.D
def WriteVFDIVD256        : SchedWrite;   // 256-bit FDIV.D
def ReadVFDIVD128         : SchedRead;    // 128-bit FDIV.D
def ReadVFDIVD256         : SchedRead;    // 256-bit FDIV.D
//===----------------------------------------------------------------------===//
// VFDIV.D         Sched<[WriteVFDIVD128, ReadVFDIVD128, ReadVFDIVD128]>
// XVFDIV.D        Sched<[WriteVFDIVD256, ReadVFDIVD256, ReadVFDIVD256]>
//===----------------------------------------------------------------------===//

def WriteVFADD128         : SchedWrite;   // 128-bit FMADD / FMSUB / FNMADD / FNMSUB
def WriteVFADD256         : SchedWrite;   // 256-bit FMADD / FMSUB / FNMADD / FNMSUB
def ReadVFADD128          : SchedRead;    // 128-bit FMADD / FMSUB / FNMADD / FNMSUB
def ReadVFADD256          : SchedRead;    // 256-bit FMADD / FMSUB / FNMADD / FNMSUB
//===----------------------------------------------------------------------===//
// VFMADD.S/D     Sched<[WriteVFADD128, ReadVFADD128, ReadVFADD128, ReadVFADD128]>
// VFMSUB.S/D     Sched<[WriteVFADD128, ReadVFADD128, ReadVFADD128, ReadVFADD128]>
// VFNMADD.S/D    Sched<[WriteVFADD128, ReadVFADD128, ReadVFADD128, ReadVFADD128]>
// VFNMSUB.S/D    Sched<[WriteVFADD128, ReadVFADD128, ReadVFADD128, ReadVFADD128]>
// XVFMADD.S/D    Sched<[WriteVFADD256, ReadVFADD256, ReadVFADD256, ReadVFADD256]>
// XVFMSUB.S/D    Sched<[WriteVFADD256, ReadVFADD256, ReadVFADD256, ReadVFADD256]>
// XVFNMADD.S/D   Sched<[WriteVFADD256, ReadVFADD256, ReadVFADD256, ReadVFADD256]>
// XVFNMSUB.S/D   Sched<[WriteVFADD256, ReadVFADD256, ReadVFADD256, ReadVFADD256]>
//===----------------------------------------------------------------------===//

def WriteVFMAXMIN128      : SchedWrite;   // 128-bit FMAX / FMIN / FMAXA / FMINA
def WriteVFMAXMIN256      : SchedWrite;   // 128-bit FMAX / FMIN / FMAXA / FMINA
def ReadVFMAXMIN128       : SchedRead;    // 128-bit FMAX / FMIN / FMAXA / FMINA
def ReadVFMAXMIN256       : SchedRead;    // 128-bit FMAX / FMIN / FMAXA / FMINA
//===----------------------------------------------------------------------===//
// VFMAX.S/D      Sched<[WriteVFMAXMIN128, ReadVFMAXMIN128, ReadVFMAXMIN128]>
// VFMIN.S/D      Sched<[WriteVFMAXMIN128, ReadVFMAXMIN128, ReadVFMAXMIN128]>
// VFMAXA.S/D     Sched<[WriteVFMAXMIN128, ReadVFMAXMIN128, ReadVFMAXMIN128]>
// VFMINA.S/D     Sched<[WriteVFMAXMIN128, ReadVFMAXMIN128, ReadVFMAXMIN128]>
// XVFMAX.S/D     Sched<[WriteVFMAXMIN256, ReadVFMAXMIN256, ReadVFMAXMIN256]>
// XVFMIN.S/D     Sched<[WriteVFMAXMIN256, ReadVFMAXMIN256, ReadVFMAXMIN256]>
// XVFMAXA.S/D    Sched<[WriteVFMAXMIN256, ReadVFMAXMIN256, ReadVFMAXMIN256]>
// XVFMINA.S/D    Sched<[WriteVFMAXMIN256, ReadVFMAXMIN256, ReadVFMAXMIN256]>
//===----------------------------------------------------------------------===//

def WriteVFLOGB128        : SchedWrite;   // 128-bit FLOGB
def WriteVFLOGB256        : SchedWrite;   // 256-bit FLOGB
def ReadVFLOGB128         : SchedRead;    // 128-bit FLOGB
def ReadVFLOGB256         : SchedRead;    // 256-bit FLOGB
//===----------------------------------------------------------------------===//
// VFLOGB.S/D     Sched<[WriteVFLOGB128, ReadVFLOGB128]>
// XVFLOGB.S/D    Sched<[WriteVFLOGB256, ReadVFLOGB256]>
//===----------------------------------------------------------------------===//

def WriteVFCLASS128       : SchedWrite;   // 128-bit FCLASS
def WriteVFCLASS256       : SchedWrite;   // 256-bit FCLASS
def ReadVFCLASS128        : SchedRead;    // 128-bit FCLASS
def ReadVFCLASS256        : SchedRead;    // 256-bit FCLASS
//===----------------------------------------------------------------------===//
// VFCLASS.S/D    Sched<[WriteVFCLASS128, ReadVFCLASS128]>
// XVFCLASS.S/D   Sched<[WriteVFCLASS256, ReadVFCLASS256]>
//===----------------------------------------------------------------------===//

def WriteVFSQRTS128       : SchedWrite;   // 128-bit FSQRT.S
def WriteVFSQRTS256       : SchedWrite;   // 256-bit FSQRT.S
def ReadVFSQRTS128        : SchedRead;    // 128-bit FSQRT.S
def ReadVFSQRTS256        : SchedRead;    // 256-bit FSQRT.S
//===----------------------------------------------------------------------===//
// VFSQRT.S       Sched<[WriteVFSQRTS128, ReadVFSQRTS128]>
// XVFSQRT.S      Sched<[WriteVFSQRTS256, ReadVFSQRTS256]>
//===----------------------------------------------------------------------===//
def WriteVFSQRTD128       : SchedWrite;   // 128-bit FSQRT.D
def WriteVFSQRTD256       : SchedWrite;   // 256-bit FSQRT.D
def ReadVFSQRTD128        : SchedRead;    // 128-bit FSQRT.D
def ReadVFSQRTD256        : SchedRead;    // 256-bit FSQRT.D
//===----------------------------------------------------------------------===//
// VFSQRT.D       Sched<[WriteVFSQRTD128, ReadVFSQRTD128]>
// XVFSQRT.D      Sched<[WriteVFSQRTD256, ReadVFSQRTD256]>
//===----------------------------------------------------------------------===//

def WriteVFRECIPS128       : SchedWrite;   // 128-bit FRECIP.S
def WriteVFRECIPS256       : SchedWrite;   // 256-bit FRECIP.S
def ReadVFRECIPS128        : SchedRead;    // 128-bit FRECIP.S
def ReadVFRECIPS256        : SchedRead;    // 256-bit FRECIP.S
//===----------------------------------------------------------------------===//
// VFRECIP.S       Sched<[WriteVFRECIPS128, ReadVFRECIPS128]>
// XVFRECIP.S      Sched<[WriteVFRECIPS256, ReadVFRECIPS256]>
//===----------------------------------------------------------------------===//
def WriteVFRECIPD128       : SchedWrite;   // 128-bit FRECIP.D
def WriteVFRECIPD256       : SchedWrite;   // 256-bit FRECIP.D
def ReadVFRECIPD128        : SchedRead;    // 128-bit FRECIP.D
def ReadVFRECIPD256        : SchedRead;    // 256-bit FRECIP.D
//===----------------------------------------------------------------------===//
// VFRECIP.D       Sched<[WriteVFRECIPD128, ReadVFRECIPD128]>
// XVFRECIP.D      Sched<[WriteVFRECIPD256, ReadVFRECIPD256]>
//===----------------------------------------------------------------------===//

def WriteVFRSQRTS128       : SchedWrite;   // 128-bit FRSQRT.S
def WriteVFRSQRTS256       : SchedWrite;   // 256-bit FRSQRT.S
def ReadVFRSQRTS128        : SchedRead;    // 128-bit FRSQRT.S
def ReadVFRSQRTS256        : SchedRead;    // 256-bit FRSQRT.S
//===----------------------------------------------------------------------===//
// VFRSQRT.S       Sched<[WriteVFRSQRTS128, ReadVFRSQRTS128]>
// XVFRSQRT.S      Sched<[WriteVFRSQRTS256, ReadVFRSQRTS256]>
//===----------------------------------------------------------------------===//
def WriteVFRSQRTD128       : SchedWrite;   // 128-bit FRSQRT.D
def WriteVFRSQRTD256       : SchedWrite;   // 256-bit FRSQRT.D
def ReadVFRSQRTD128        : SchedRead;    // 128-bit FRSQRT.D
def ReadVFRSQRTD256        : SchedRead;    // 256-bit FRSQRT.D
//===----------------------------------------------------------------------===//
// VFRSQRT.D       Sched<[WriteVFRSQRTD128, ReadVFRSQRTD128]>
// XVFRSQRT.D      Sched<[WriteVFRSQRTD256, ReadVFRSQRTD256]>
//===----------------------------------------------------------------------===//

def WriteVFCVT128          : SchedWrite;   // 128-bit VFCVT
def WriteVFCVT256          : SchedWrite;   // 256-bit VFCVT
def ReadVFCVT128           : SchedRead;    // 128-bit VFCVT
def ReadVFCVT256           : SchedRead;    // 256-bit VFCVT
//===----------------------------------------------------------------------===//
// VFCVTL.S.H      Sched<[WriteVFCVT128, ReadVFCVT128]>
// VFCVTH.S.H      Sched<[WriteVFCVT128, ReadVFCVT128]>
// XVFCVTL.S.H     Sched<[WriteVFCVT256, ReadVFCVT256]>
// XVFCVTH.S.H     Sched<[WriteVFCVT256, ReadVFCVT256]>
// VFCVTL.D.S      Sched<[WriteVFCVT128, ReadVFCVT128]>
// VFCVTH.D.S      Sched<[WriteVFCVT128, ReadVFCVT128]>
// XVFCVTL.D.S     Sched<[WriteVFCVT256, ReadVFCVT256]>
// XVFCVTH.D.S     Sched<[WriteVFCVT256, ReadVFCVT256]>
// VFCVT.H.S       Sched<[WriteVFCVT128, ReadVFCVT128, ReadVFCVT128]>
// VFCVT.S.D       Sched<[WriteVFCVT128, ReadVFCVT128, ReadVFCVT128]>
// XVFCVT.H.S      Sched<[WriteVFCVT256, ReadVFCVT256, ReadVFCVT256]>
// XVFCVT.S.D      Sched<[WriteVFCVT256, ReadVFCVT256, ReadVFCVT256]>
//===----------------------------------------------------------------------===//

def WriteVFRINT128         : SchedWrite;   // 128-bit FRINT
def WriteVFRINT256         : SchedWrite;   // 256-bit FRINT
def ReadVFRINT128          : SchedRead;    // 128-bit FRINT
def ReadVFRINT256          : SchedRead;    // 256-bit FRINT
//===----------------------------------------------------------------------===//
// VFRINT.S                Sched<[WriteVFRINT128, ReadVFRINT128]>
// VFRINT.D                Sched<[WriteVFRINT128, ReadVFRINT128]>
// XVFRINT.S               Sched<[WriteVFRINT256, ReadVFRINT256]>
// XVFRINT.D               Sched<[WriteVFRINT256, ReadVFRINT256]>
// VFRINTRNE.S             Sched<[WriteVFRINT128, ReadVFRINT128]>
// VFRINTRNE.D             Sched<[WriteVFRINT128, ReadVFRINT128]>
// XVFRINTRNE.S            Sched<[WriteVFRINT256, ReadVFRINT256]>
// XVFRINTRNE.D            Sched<[WriteVFRINT256, ReadVFRINT256]>
// VFRINTRZ.S              Sched<[WriteVFRINT128, ReadVFRINT128]>
// VFRINTRZ.D              Sched<[WriteVFRINT128, ReadVFRINT128]>
// XVFRINTRZ.S             Sched<[WriteVFRINT256, ReadVFRINT256]>
// XVFRINTRZ.D             Sched<[WriteVFRINT256, ReadVFRINT256]>
// VFRINTRP.S              Sched<[WriteVFRINT128, ReadVFRINT128]>
// VFRINTRP.D              Sched<[WriteVFRINT128, ReadVFRINT128]>
// XVFRINTRP.S             Sched<[WriteVFRINT256, ReadVFRINT256]>
// XVFRINTRP.D             Sched<[WriteVFRINT256, ReadVFRINT256]>
// VFRINTRM.S              Sched<[WriteVFRINT128, ReadVFRINT128]>
// VFRINTRM.D              Sched<[WriteVFRINT128, ReadVFRINT128]>
// XVFRINTRM.S             Sched<[WriteVFRINT256, ReadVFRINT256]>
// XVFRINTRM.D             Sched<[WriteVFRINT256, ReadVFRINT256]>
//===----------------------------------------------------------------------===//

def WriteVFTINTS128        : SchedWrite;   // 128-bit FTINTS
def WriteVFTINTS256        : SchedWrite;   // 256-bit FTINTS
def ReadVFTINTS128         : SchedRead;    // 128-bit FTINTS
def ReadVFTINTS256         : SchedRead;    // 256-bit FTINTS
//===----------------------------------------------------------------------===//
// VFTINTRNE.W.S           Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRNE.L.D           Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRZ.W.S            Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRZ.L.D            Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRP.W.S            Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRP.L.D            Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRM.W.S            Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRM.L.D            Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINT.W.S              Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINT.L.D              Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRZ.WU.S           Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINTRZ.LU.D           Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINT.WU.S             Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// VFTINT.LU.D             Sched<[WriteVFTINTS128, ReadVFTINTS128]>
// XVFTINTRNE.W.S          Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRNE.L.D          Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRZ.W.S           Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRZ.L.D           Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRP.W.S           Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRP.L.D           Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRM.W.S           Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRM.L.D           Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINT.W.S             Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINT.L.D             Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRZ.WU.S          Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINTRZ.LU.D          Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINT.WU.S            Sched<[WriteVFTINTS256, ReadVFTINTS256]>
// XVFTINT.LU.D            Sched<[WriteVFTINTS256, ReadVFTINTS256]>
//===----------------------------------------------------------------------===//

def WriteVFTINTD128        : SchedWrite;   // 128-bit FTINTD
def WriteVFTINTD256        : SchedWrite;   // 256-bit FTINTD
def ReadVFTINTD128         : SchedRead;    // 128-bit FTINTD
def ReadVFTINTD256         : SchedRead;    // 256-bit FTINTD
//===----------------------------------------------------------------------===//
// VFTINTRNE.W.D           Sched<[WriteVFTINTD128, ReadVFTINTD128, ReadVFTINTD128]>
// VFTINTRZ.W.D            Sched<[WriteVFTINTD128, ReadVFTINTD128, ReadVFTINTD128]>
// VFTINTRP.W.D            Sched<[WriteVFTINTD128, ReadVFTINTD128, ReadVFTINTD128]>
// VFTINTRM.W.D            Sched<[WriteVFTINTD128, ReadVFTINTD128, ReadVFTINTD128]>
// VFTINT.W.D              Sched<[WriteVFTINTD128, ReadVFTINTD128, ReadVFTINTD128]>
// VFTINTRNEL.L.S          Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRNEH.L.S          Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRZL.L.S           Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRZH.L.S           Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRPL.L.S           Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRPH.L.S           Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRML.L.S           Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTRMH.L.S           Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTL.L.S             Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// VFTINTH.L.S             Sched<[WriteVFTINTD128, ReadVFTINTD128]>
// XVFTINTRNE.W.D          Sched<[WriteVFTINTD256, ReadVFTINTD256, ReadVFTINTD256]>
// XVFTINTRZ.W.D           Sched<[WriteVFTINTD256, ReadVFTINTD256, ReadVFTINTD256]>
// XVFTINTRP.W.D           Sched<[WriteVFTINTD256, ReadVFTINTD256, ReadVFTINTD256]>
// XVFTINTRM.W.D           Sched<[WriteVFTINTD256, ReadVFTINTD256, ReadVFTINTD256]>
// XVFTINT.W.D             Sched<[WriteVFTINTD256, ReadVFTINTD256, ReadVFTINTD256]>
// XVFTINTRNEL.L.S         Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRNEH.L.S         Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRZL.L.S          Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRZH.L.S          Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRPL.L.S          Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRPH.L.S          Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRML.L.S          Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTRMH.L.S          Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTL.L.S            Sched<[WriteVFTINTD256, ReadVFTINTD256]>
// XVFTINTH.L.S            Sched<[WriteVFTINTD256, ReadVFTINTD256]>
//===----------------------------------------------------------------------===//

def WriteVFFINT128         : SchedWrite;   // 128-bit FFINT
def WriteVFFINT256         : SchedWrite;   // 256-bit FFINT
def ReadVFFINT128          : SchedRead;    // 128-bit FFINT
def ReadVFFINT256          : SchedRead;    // 256-bit FFINT
//===----------------------------------------------------------------------===//
// VFFINT.S.W              Sched<[WriteVFFINT128, ReadVFFINT128]>
// VFFINT.D.L              Sched<[WriteVFFINT128, ReadVFFINT128]>
// VFFINT.S.WU             Sched<[WriteVFFINT128, ReadVFFINT128]>
// VFFINT.D.LU             Sched<[WriteVFFINT128, ReadVFFINT128]>
// XVFFINT.S.W             Sched<[WriteVFFINT256, ReadVFFINT256]>
// XVFFINT.D.L             Sched<[WriteVFFINT256, ReadVFFINT256]>
// XVFFINT.S.WU            Sched<[WriteVFFINT256, ReadVFFINT256]>
// XVFFINT.D.LU            Sched<[WriteVFFINT256, ReadVFFINT256]>
//===----------------------------------------------------------------------===//
def WriteVFFINTD128        : SchedWrite;   // 128-bit FFINTD
def WriteVFFINTD256        : SchedWrite;   // 256-bit FFINTD
def ReadVFFINTD128         : SchedRead;    // 128-bit FFINTD
def ReadVFFINTD256         : SchedRead;    // 256-bit FFINTD
//===----------------------------------------------------------------------===//
// VFFINTL.D.W             Sched<[WriteVFFINTD128, ReadVFFINTD128]>
// VFFINTH.D.W             Sched<[WriteVFFINTD128, ReadVFFINTD128]>
// VFFINT.S.L              Sched<[WriteVFFINTD128, ReadVFFINTD128]>
// XVFFINTL.D.W            Sched<[WriteVFFINTD256, ReadVFFINTD256]>
// XVFFINTH.D.W            Sched<[WriteVFFINTD256, ReadVFFINTD256]>
// XVFFINT.S.L             Sched<[WriteVFFINTD256, ReadVFFINTD256]>
//===----------------------------------------------------------------------===//

def WriteVSEQ128           : SchedWrite;   // 128-bit SEQ
def WriteVSEQ256           : SchedWrite;   // 256-bit SEQ
def ReadVSEQ128            : SchedRead;    // 128-bit SEQ
def ReadVSEQ256            : SchedRead;    // 256-bit SEQ
//===----------------------------------------------------------------------===//
// VSEQ.B/H/W/D            Sched<[WriteVSEQ128, ReadVSEQ128, ReadVSEQ128]>
// VSEQI.B/H/W/D           Sched<[WriteVSEQ128, ReadVSEQ128]>
// XVSEQ.B/H/W/D           Sched<[WriteVSEQ256, ReadVSEQ256, ReadVSEQ256]>
// XVSEQI.B/H/W/D          Sched<[WriteVSEQ256, ReadVSEQ256]>
//===----------------------------------------------------------------------===//

def WriteVSEL128           : SchedWrite;   // 128-bit SEL
def WriteVSEL256           : SchedWrite;   // 256-bit SEL
def ReadVSEL128            : SchedRead;    // 128-bit SEL
def ReadVSEL256            : SchedRead;    // 256-bit SEL
//===----------------------------------------------------------------------===//
// VSEL.B/H/W/D            Sched<[WriteVSEL128, ReadVSEL128, ReadVSEL128]>
// VSELI.B/H/W/D           Sched<[WriteVSEL128, ReadVSEL128]>
// VSEL.BU/HU/WU/DU        Sched<[WriteVSEL128, ReadVSEL128, ReadVSEL128]>
// VSELI.BU/HU/WU/DU       Sched<[WriteVSEL128, ReadVSEL128]>
// XVSEL.B/H/W/D           Sched<[WriteVSEL256, ReadVSEL256, ReadVSEL256]>
// XVSELI.B/H/W/D          Sched<[WriteVSEL256, ReadVSEL256]>
// XVSEL.BU/HU/WU/DU       Sched<[WriteVSEL256, ReadVSEL256, ReadVSEL256]>
// XVSELI.BU/HU/WU/DU      Sched<[WriteVSEL256, ReadVSEL256]>
//===----------------------------------------------------------------------===//

def WriteVSLT128           : SchedWrite;   // 128-bit SLT
def WriteVSLT256           : SchedWrite;   // 256-bit SLT
def ReadVSLT128            : SchedRead;    // 128-bit SLT
def ReadVSLT256            : SchedRead;    // 256-bit SLT
//===----------------------------------------------------------------------===//
// VSLT.B/H/W/D            Sched<[WriteVSLT128, ReadVSLT128, ReadVSLT128]>
// VSLTI.B/H/W/D           Sched<[WriteVSLT128, ReadVSLT128]>
// VSLT.BU/HU/WU/DU        Sched<[WriteVSLT128, ReadVSLT128, ReadVSLT128]>
// VSLTI.BU/HU/WU/DU       Sched<[WriteVSLT128, ReadVSLT128]>
// XVSLT.B/H/W/D           Sched<[WriteVSLT256, ReadVSLT256, ReadVSLT256]>
// XVSLTI.B/H/W/D          Sched<[WriteVSLT256, ReadVSLT256]>
// XVSLT.BU/HU/WU/DU       Sched<[WriteVSLT256, ReadVSLT256, ReadVSLT256]>
// XVSLTI.BU/HU/WU/DU      Sched<[WriteVSLT256, ReadVSLT256]>
//===----------------------------------------------------------------------===//

def WriteVFCMP128          : SchedWrite;   // 128-bit FCMP
def WriteVFCMP256          : SchedWrite;   // 256-bit FCMP
def ReadVFCMP128           : SchedRead;    // 128-bit FCMP
def ReadVFCMP256           : SchedRead;    // 256-bit FCMP
//===----------------------------------------------------------------------===//
// VFCMP.COND.S/D          Sched<[WriteVFCMP128, ReadVFCMP128, ReadVFCMP128]>
// XVFCMP.COND.S/D         Sched<[WriteVFCMP256, ReadVFCMP256, ReadVFCMP256]>
//===----------------------------------------------------------------------===//

def WriteVBITSELV128       : SchedWrite;   // 128-bit BITSELV
def WriteVBITSELV256       : SchedWrite;   // 256-bit BITSELV
def ReadVBITSELV128        : SchedRead;    // 128-bit BITSELV
def ReadVBITSELV256        : SchedRead;    // 256-bit BITSELV
//===----------------------------------------------------------------------===//
// VBITSEL.V   Sched<[WriteVBITSELV128,ReadVBITSELV128,ReadVBITSELV128,ReadVBITSELV128]>
// XVBITSEL.V  Sched<[WriteVBITSELV256,ReadVBITSELV256,ReadVBITSELV256,ReadVBITSELV256]>
//===----------------------------------------------------------------------===//

def WriteVBITSELB128       : SchedWrite;   // 128-bit BITSELB
def WriteVBITSELB256       : SchedWrite;   // 256-bit BITSELB
def ReadVBITSELB128        : SchedRead;    // 128-bit BITSELB
def ReadVBITSELB256        : SchedRead;    // 256-bit BITSELB
//===----------------------------------------------------------------------===//
// VBITSELI.B              Sched<[WriteVBITSELB128,ReadVBITSELB128]>
// XVBITSELI.B             Sched<[WriteVBITSELB256,ReadVBITSELB256]>
//===----------------------------------------------------------------------===//

def WriteVSETZ128          : SchedWrite;   // 128-bit VSETZ
def WriteVSETZ256          : SchedWrite;   // 256-bit VSETZ
def ReadVSETZ128           : SchedRead;    // 128-bit VSETZ
def ReadVSETZ256           : SchedRead;    // 256-bit VSETZ
//===----------------------------------------------------------------------===//
// VSETEQZ.V               Sched<[WriteVSETZ128, ReadVSETZ128]>
// VSETNEZ.V               Sched<[WriteVSETZ128, ReadVSETZ128]>
// VSETANYEQZ.B/H/W/D      Sched<[WriteVSETZ128, ReadVSETZ128]>
// VSETALLNEZ.B/H/W/D      Sched<[WriteVSETZ128, ReadVSETZ128]>
// XVSETEQZ.V              Sched<[WriteVSETZ256, ReadVSETZ256]>
// XVSETNEZ.V              Sched<[WriteVSETZ256, ReadVSETZ256]>
// XVSETANYEQZ.B/H/W/D     Sched<[WriteVSETZ256, ReadVSETZ256]>
// XVSETALLNEZ.B/H/W/D     Sched<[WriteVSETZ256, ReadVSETZ256]>
//===----------------------------------------------------------------------===//

def WriteVINSGR2VR128      : SchedWrite;   // 128-bit VINSGR2VR
def WriteVINSGR2VR256      : SchedWrite;   // 256-bit VINSGR2VR
def ReadVINSGR2VR128       : SchedRead;    // 128-bit VINSGR2VR
def ReadVINSGR2VR256       : SchedRead;    // 256-bit VINSGR2VR
//===----------------------------------------------------------------------===//
// VINSGR2VR.B/H/W/D       Sched<[WriteVINSGR2VR128, ReadVINSGR2VR128]>
// XVINSGR2VR.W/D          Sched<[WriteVINSGR2VR256, ReadVINSGR2VR256]>
//===----------------------------------------------------------------------===//

def WriteVPICKVE2GR128     : SchedWrite;   // 128-bit VPICKVE2GR
def WriteVPICKVE2GR256     : SchedWrite;   // 256-bit VPICKVE2GR
def ReadVPICKVE2GR128      : SchedRead;    // 128-bit VPICKVE2GR
def ReadVPICKVE2GR256      : SchedRead;    // 256-bit VPICKVE2GR
//===----------------------------------------------------------------------===//
// VINSGR2VR.B/H/W/D       Sched<[WriteVPICKVE2GR128, ReadVPICKVE2GR128]>
// XVINSGR2VR.W/D          Sched<[WriteVPICKVE2GR256, ReadVPICKVE2GR256]>
// VINSGR2VR.BU/HU/WU/DU   Sched<[WriteVPICKVE2GR128, ReadVPICKVE2GR128]>
// XVINSGR2VR.WU/DU        Sched<[WriteVPICKVE2GR256, ReadVPICKVE2GR256]>
//===----------------------------------------------------------------------===//

def WriteVREPLVE128        : SchedWrite;   // 128-bit VREPLVE
def WriteVREPLVE256        : SchedWrite;   // 256-bit VREPLVE
def ReadVREPLVE128         : SchedRead;    // 128-bit VREPLVE
def ReadVREPLVE256         : SchedRead;    // 256-bit VREPLVE
//===----------------------------------------------------------------------===//
// VREPLVE.B/H/W/D         Sched<[WriteVREPLVE128, ReadVREPLVE128, ReadVREPLVE128]>
// XVREPLVE.B/H/W/D        Sched<[WriteVREPLVE256, ReadVREPLVE256, ReadVREPLVE256]>
//===----------------------------------------------------------------------===//

def WriteVREPLVEI128       : SchedWrite;   // 128-bit VREPLVEI
def WriteVREPLVEI256       : SchedWrite;   // 256-bit VREPLVEI
def ReadVREPLVEI128        : SchedRead;    // 128-bit VREPLVEI
def ReadVREPLVEI256        : SchedRead;    // 256-bit VREPLVEI
//===----------------------------------------------------------------------===//
// VREPLVEI.B/H/W/D        Sched<[WriteVREPLVEI128, ReadVREPLVEI128]>
// XVREPL128VEI.B/H/W/D    Sched<[WriteVREPLVEI256, ReadVREPLVEI256]>
// XVREPLVE0.B/H/W/D/Q     Sched<[WriteVREPLVEI256, ReadVREPLVEI256]>
//===----------------------------------------------------------------------===//

def WriteVINSVE0           : SchedWrite;   // 256-bit XVINSVE0
def ReadVINSVE0            : SchedRead;    // 256-bit XVINSVE0
//===----------------------------------------------------------------------===//
// XVINSVE0.W/D            Sched<[WriteVINSVE0, ReadVINSVE0]>
//===----------------------------------------------------------------------===//

def WriteVPICKVE           : SchedWrite;   // 256-bit VPICKVE
def ReadVPICKVE            : SchedRead;    // 256-bit VPICKVE
//===----------------------------------------------------------------------===//
// XVPICKVE.W/D            Sched<[WriteVPICKVE, ReadVPICKVE]>
//===----------------------------------------------------------------------===//

def WriteVBSLL128          : SchedWrite;   // 128-bit VBSLL
def WriteVBSLL256          : SchedWrite;   // 256-bit VBSLL
def ReadVBSLL128           : SchedRead;    // 128-bit VBSLL
def ReadVBSLL256           : SchedRead;    // 256-bit VBSLL
//===----------------------------------------------------------------------===//
// VBSLL.V                 Sched<[WriteVBSLL128, ReadVBSLL128]>
// XVBSLL.V                Sched<[WriteVBSLL256, ReadVBSLL256]>
//===----------------------------------------------------------------------===//

def WriteVPACK128          : SchedWrite;   // 128-bit VPACK
def WriteVPACK256          : SchedWrite;   // 256-bit VPACK
def ReadVPACK128           : SchedRead;    // 128-bit VPACK
def ReadVPACK256           : SchedRead;    // 256-bit VPACK
//===----------------------------------------------------------------------===//
// VPACKEV.B/H/W/D         Sched<[WriteVPACK128, ReadVPACK128, ReadVPACK128]>
// VPACKOD.B/H/W/D         Sched<[WriteVPACK128, ReadVPACK128, ReadVPACK128]>
// XVPACKEV.B/H/W/D        Sched<[WriteVPACK256, ReadVPACK256, ReadVPACK256]>
// XVPACKOD.B/H/W/D        Sched<[WriteVPACK256, ReadVPACK256, ReadVPACK256]>
//===----------------------------------------------------------------------===//

def WriteVPICK128          : SchedWrite;   // 128-bit VPICK
def WriteVPICK256          : SchedWrite;   // 256-bit VPICK
def ReadVPICK128           : SchedRead;    // 128-bit VPICK
def ReadVPICK256           : SchedRead;    // 256-bit VPICK
//===----------------------------------------------------------------------===//
// VPICKEV.B/H/W/D         Sched<[WriteVPICK128, ReadVPICK128, ReadVPICK128]>
// VPICKOD.B/H/W/D         Sched<[WriteVPICK128, ReadVPICK128, ReadVPICK128]>
// XVPICKEV.B/H/W/D        Sched<[WriteVPICK256, ReadVPICK256, ReadVPICK256]>
// XVPICKOD.B/H/W/D        Sched<[WriteVPICK256, ReadVPICK256, ReadVPICK256]>
//===----------------------------------------------------------------------===//

def WriteVILV128           : SchedWrite;   // 128-bit VILV
def WriteVILV256           : SchedWrite;   // 256-bit VILV
def ReadVILV128            : SchedRead;    // 128-bit VILV
def ReadVILV256            : SchedRead;    // 256-bit VILV
//===----------------------------------------------------------------------===//
// VILVL.B/H/W/D           Sched<[WriteVILV128, ReadVILV128, ReadVILV128]>
// VILVH.B/H/W/D           Sched<[WriteVILV128, ReadVILV128, ReadVILV128]>
// XVILVL.B/H/W/D          Sched<[WriteVILV256, ReadVILV256, ReadVILV256]>
// XVILVH.B/H/W/D          Sched<[WriteVILV256, ReadVILV256, ReadVILV256]>
//===----------------------------------------------------------------------===//

def WriteSHUF128           : SchedWrite;   // 128-bit SHUF
def WriteSHUF256           : SchedWrite;   // 256-bit SHUF
def ReadSHUF128            : SchedRead;    // 128-bit SHUF
def ReadSHUF256            : SchedRead;    // 256-bit SHUF
//===----------------------------------------------------------------------===//
// VSHUF.B           Sched<[WriteSHUF128, ReadSHUF128, ReadSHUF128, ReadSHUF128]> 
// XVSHUF.B          Sched<[WriteSHUF256, ReadSHUF256, ReadSHUF256, ReadSHUF256]> 
// VSHUF.H/W/D       Sched<[WriteSHUF128, ReadSHUF128, ReadSHUF128]> 
// XVSHUF.H/W/D      Sched<[WriteSHUF256, ReadSHUF256, ReadSHUF256]> 
//===----------------------------------------------------------------------===//

def WriteSHUFI128          : SchedWrite;   // 128-bit SHUFI
def WriteSHUFI256          : SchedWrite;   // 256-bit SHUFI
def ReadSHUFI128           : SchedRead;    // 128-bit SHUFI
def ReadSHUFI256           : SchedRead;    // 256-bit SHUFI
//===----------------------------------------------------------------------===//
// VSHUF4I.B/H/W           Sched<[WriteSHUFI128, ReadSHUFI128]>
// XVSHUF4I.B/H/W          Sched<[WriteSHUFI256, ReadSHUFI256]>
//===----------------------------------------------------------------------===//
def WriteSHUFID128         : SchedWrite;   // 128-bit SHUFID
def WriteSHUFID256         : SchedWrite;   // 256-bit SHUFID
def ReadSHUFID128          : SchedRead;    // 128-bit SHUFID
def ReadSHUFID256          : SchedRead;    // 256-bit SHUFID
//===----------------------------------------------------------------------===//
// VSHUF4I.D               Sched<[WriteSHUFID128, ReadSHUFID128]>
// XVSHUF4I.D              Sched<[WriteSHUFID256, ReadSHUFID256]>
//===----------------------------------------------------------------------===//

def WritePERM256           : SchedWrite;   // 256-bit PERM
def ReadPERM256            : SchedRead;    // 256-bit PERM
//===----------------------------------------------------------------------===//
// XVPERM.W                Sched<[WritePERM256, ReadPERM256, ReadPERM256]>
//===----------------------------------------------------------------------===//

def WritePERMIW128         : SchedWrite;   // 128-bit PERMI
def WritePERMIW256         : SchedWrite;   // 256-bit PERMI
def ReadPERMIW128          : SchedRead;    // 128-bit PERMI
def ReadPERMIW256          : SchedRead;    // 256-bit PERMI
//===----------------------------------------------------------------------===//
// VPERMI.W                Sched<[WritePERMIW128, ReadPERMIW128]>
// XVPERMI.W               Sched<[WritePERMIW256, ReadPERMIW256]>
//===----------------------------------------------------------------------===//

def WritePERMID256         : SchedWrite;   // 256-bit PERMID
def ReadPERMID256          : SchedRead;    // 256-bit PERMID
//===----------------------------------------------------------------------===//
// XVPERMI.D               Sched<[WritePERMID256, ReadPERMID256]>
//===----------------------------------------------------------------------===//

def WritePERMIQ256         : SchedWrite;   // 256-bit PERMIQ
def ReadPERMIQ256          : SchedRead;    // 256-bit PERMIQ
//===----------------------------------------------------------------------===//
// XVPERMI.Q               Sched<[WritePERMIQ256, ReadPERMIQ256]>
//===----------------------------------------------------------------------===//

def WriteVEXTRINS128       : SchedWrite;   // 128-bit VEXTRINS
def WriteVEXTRINS256       : SchedWrite;   // 256-bit VEXTRINS
def ReadVEXTRINS128        : SchedRead;    // 128-bit VEXTRINS
def ReadVEXTRINS256        : SchedRead;    // 256-bit VEXTRINS
//===----------------------------------------------------------------------===//
// VEXTRINS.B/H/W/D        Sched<[WriteVEXTRINS128, ReadVEXTRINS128]>
// XVEXTRINS.B/H/W/D       Sched<[WriteVEXTRINS256, ReadVEXTRINS256]>
//===----------------------------------------------------------------------===//

def WriteVLD128            : SchedWrite;   // 128-bit VLD
def WriteVLD256            : SchedWrite;   // 256-bit VLD
def ReadVLD128             : SchedRead;    // 128-bit VLD
def ReadVLD256             : SchedRead;    // 256-bit VLD
//===----------------------------------------------------------------------===//
// VLD                     Sched<[WriteVLD128, ReadVLD128]>
// XVLD                    Sched<[WriteVLD256, ReadVLD256]>
//===----------------------------------------------------------------------===//

def WriteVLDST128          : SchedWrite;   // 128-bit VLDSTX
def WriteVLDST256          : SchedWrite;   // 256-bit VLDSTX
def ReadVLDST128           : SchedRead;    // 128-bit VLDSTX
def ReadVLDST256           : SchedRead;    // 256-bit VLDSTX
//===----------------------------------------------------------------------===//
// VST                     Sched<[WriteVLDST128, ReadVLDST128]>
// VLDX                    Sched<[WriteVLDST128, ReadVLDST128, ReadVLDST128]>
// VSTX                    Sched<[WriteVLDST128, ReadVLDST128, ReadVLDST128]>
// XVST                    Sched<[WriteVLDST256, ReadVLDST256]>
// XVLDX                   Sched<[WriteVLDST256, ReadVLDST256, ReadVLDST256]>
// XVSTX                   Sched<[WriteVLDST256, ReadVLDST256, ReadVLDST256]>
//===----------------------------------------------------------------------===//

def WriteVLDREPL128        : SchedWrite;   // 128-bit VLDREPL
def WriteVLDREPL256        : SchedWrite;   // 256-bit VLDREPL
def ReadVLDREPL128         : SchedRead;    // 128-bit VLDREPL
def ReadVLDREPL256         : SchedRead;    // 256-bit VLDREPL
//===----------------------------------------------------------------------===//
// VLDREPL.B/H/W/D         Sched<[WriteVLDREPL128, ReadVLDREPL128]>
// XVLDREPL.B/H/W/D        Sched<[WriteVLDREPL256, ReadVLDREPL256]>
//===----------------------------------------------------------------------===//

def WriteVSTELM128         : SchedWrite;   // 128-bit VSTELM
def WriteVSTELM256         : SchedWrite;   // 256-bit VSTELM
def ReadVSTELM128          : SchedRead;    // 128-bit VSTELM
def ReadVSTELM256          : SchedRead;    // 256-bit VSTELM
//===----------------------------------------------------------------------===//
// VSTELM.B/H/W/D          Sched<[WriteVSTELM128, ReadVSTELM128]>
// XVSTELM.B/H/W/D         Sched<[WriteVSTELM256, ReadVSTELM256]>
//===----------------------------------------------------------------------===//

