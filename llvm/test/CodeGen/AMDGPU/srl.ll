; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -amdgpu-scalarize-global-loads=false  -mtriple=amdgcn -mcpu=verde < %s | FileCheck %s -check-prefixes=SI
; RUN: llc -mtriple=amdgcn -mcpu=tonga -mattr=-flat-for-global < %s | FileCheck %s -check-prefixes=VI
; RUN: llc -amdgpu-scalarize-global-loads=false  -mtriple=r600 -mcpu=redwood < %s | FileCheck %s -check-prefixes=EG

declare i32 @llvm.amdgcn.workitem.id.x() #0

define amdgpu_kernel void @lshr_i32(ptr addrspace(1) %out, ptr addrspace(1) %in) {
; SI-LABEL: lshr_i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    s_mov_b32 s10, s6
; SI-NEXT:    s_mov_b32 s11, s7
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_mov_b32 s8, s2
; SI-NEXT:    s_mov_b32 s9, s3
; SI-NEXT:    buffer_load_dwordx2 v[0:1], off, s[8:11], 0
; SI-NEXT:    s_mov_b32 s4, s0
; SI-NEXT:    s_mov_b32 s5, s1
; SI-NEXT:    s_waitcnt vmcnt(0)
; SI-NEXT:    v_lshr_b32_e32 v0, v0, v1
; SI-NEXT:    buffer_store_dword v0, off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: lshr_i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx2 s[4:5], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s3, 0xf000
; VI-NEXT:    s_mov_b32 s2, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_lshr_b32 s4, s4, s5
; VI-NEXT:    v_mov_b32_e32 v0, s4
; VI-NEXT:    buffer_store_dword v0, off, s[0:3], 0
; VI-NEXT:    s_endpgm
;
; EG-LABEL: lshr_i32:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 0, @8, KC0[CB0:0-32], KC1[]
; EG-NEXT:    TEX 0 @6
; EG-NEXT:    ALU 2, @9, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.X, T1.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    PAD
; EG-NEXT:    Fetch clause starting at 6:
; EG-NEXT:     VTX_READ_64 T0.XY, T0.X, 0, #1
; EG-NEXT:    ALU clause starting at 8:
; EG-NEXT:     MOV * T0.X, KC0[2].Z,
; EG-NEXT:    ALU clause starting at 9:
; EG-NEXT:     LSHR T0.X, T0.X, T0.Y,
; EG-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
  %b_ptr = getelementptr i32, ptr addrspace(1) %in, i32 1
  %a = load i32, ptr addrspace(1) %in
  %b = load i32, ptr addrspace(1) %b_ptr
  %result = lshr i32 %a, %b
  store i32 %result, ptr addrspace(1) %out
  ret void
}

define amdgpu_kernel void @lshr_v2i32(ptr addrspace(1) %out, ptr addrspace(1) %in) {
; SI-LABEL: lshr_v2i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    s_mov_b32 s10, s6
; SI-NEXT:    s_mov_b32 s11, s7
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_mov_b32 s8, s2
; SI-NEXT:    s_mov_b32 s9, s3
; SI-NEXT:    buffer_load_dwordx4 v[0:3], off, s[8:11], 0
; SI-NEXT:    s_mov_b32 s4, s0
; SI-NEXT:    s_mov_b32 s5, s1
; SI-NEXT:    s_waitcnt vmcnt(0)
; SI-NEXT:    v_lshr_b32_e32 v1, v1, v3
; SI-NEXT:    v_lshr_b32_e32 v0, v0, v2
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: lshr_v2i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx4 s[4:7], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s3, 0xf000
; VI-NEXT:    s_mov_b32 s2, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_lshr_b32 s5, s5, s7
; VI-NEXT:    s_lshr_b32 s4, s4, s6
; VI-NEXT:    v_mov_b32_e32 v0, s4
; VI-NEXT:    v_mov_b32_e32 v1, s5
; VI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; VI-NEXT:    s_endpgm
;
; EG-LABEL: lshr_v2i32:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 0, @8, KC0[CB0:0-32], KC1[]
; EG-NEXT:    TEX 0 @6
; EG-NEXT:    ALU 3, @9, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    PAD
; EG-NEXT:    Fetch clause starting at 6:
; EG-NEXT:     VTX_READ_128 T0.XYZW, T0.X, 0, #1
; EG-NEXT:    ALU clause starting at 8:
; EG-NEXT:     MOV * T0.X, KC0[2].Z,
; EG-NEXT:    ALU clause starting at 9:
; EG-NEXT:     LSHR * T0.Y, T0.Y, T0.W,
; EG-NEXT:     LSHR T0.X, T0.X, T0.Z,
; EG-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
  %b_ptr = getelementptr <2 x i32>, ptr addrspace(1) %in, i32 1
  %a = load <2 x i32>, ptr addrspace(1) %in
  %b = load <2 x i32>, ptr addrspace(1) %b_ptr
  %result = lshr <2 x i32> %a, %b
  store <2 x i32> %result, ptr addrspace(1) %out
  ret void
}

define amdgpu_kernel void @lshr_v4i32(ptr addrspace(1) %out, ptr addrspace(1) %in) {
; SI-LABEL: lshr_v4i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    s_mov_b32 s10, s6
; SI-NEXT:    s_mov_b32 s11, s7
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_mov_b32 s8, s2
; SI-NEXT:    s_mov_b32 s9, s3
; SI-NEXT:    buffer_load_dwordx4 v[0:3], off, s[8:11], 0
; SI-NEXT:    buffer_load_dwordx4 v[4:7], off, s[8:11], 0 offset:16
; SI-NEXT:    s_mov_b32 s4, s0
; SI-NEXT:    s_mov_b32 s5, s1
; SI-NEXT:    s_waitcnt vmcnt(0)
; SI-NEXT:    v_lshr_b32_e32 v3, v3, v7
; SI-NEXT:    v_lshr_b32_e32 v2, v2, v6
; SI-NEXT:    v_lshr_b32_e32 v1, v1, v5
; SI-NEXT:    v_lshr_b32_e32 v0, v0, v4
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: lshr_v4i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[8:11], s[4:5], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx8 s[0:7], s[10:11], 0x0
; VI-NEXT:    s_mov_b32 s11, 0xf000
; VI-NEXT:    s_mov_b32 s10, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_lshr_b32 s3, s3, s7
; VI-NEXT:    s_lshr_b32 s2, s2, s6
; VI-NEXT:    s_lshr_b32 s1, s1, s5
; VI-NEXT:    s_lshr_b32 s0, s0, s4
; VI-NEXT:    v_mov_b32_e32 v0, s0
; VI-NEXT:    v_mov_b32_e32 v1, s1
; VI-NEXT:    v_mov_b32_e32 v2, s2
; VI-NEXT:    v_mov_b32_e32 v3, s3
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[8:11], 0
; VI-NEXT:    s_endpgm
;
; EG-LABEL: lshr_v4i32:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 0, @10, KC0[CB0:0-32], KC1[]
; EG-NEXT:    TEX 1 @6
; EG-NEXT:    ALU 5, @11, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XYZW, T1.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    PAD
; EG-NEXT:    Fetch clause starting at 6:
; EG-NEXT:     VTX_READ_128 T1.XYZW, T0.X, 16, #1
; EG-NEXT:     VTX_READ_128 T0.XYZW, T0.X, 0, #1
; EG-NEXT:    ALU clause starting at 10:
; EG-NEXT:     MOV * T0.X, KC0[2].Z,
; EG-NEXT:    ALU clause starting at 11:
; EG-NEXT:     LSHR * T0.W, T0.W, T1.W,
; EG-NEXT:     LSHR * T0.Z, T0.Z, T1.Z,
; EG-NEXT:     LSHR * T0.Y, T0.Y, T1.Y,
; EG-NEXT:     LSHR T0.X, T0.X, T1.X,
; EG-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
  %b_ptr = getelementptr <4 x i32>, ptr addrspace(1) %in, i32 1
  %a = load <4 x i32>, ptr addrspace(1) %in
  %b = load <4 x i32>, ptr addrspace(1) %b_ptr
  %result = lshr <4 x i32> %a, %b
  store <4 x i32> %result, ptr addrspace(1) %out
  ret void
}

define amdgpu_kernel void @lshr_i64(ptr addrspace(1) %out, ptr addrspace(1) %in) {
; SI-LABEL: lshr_i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    s_mov_b32 s10, s6
; SI-NEXT:    s_mov_b32 s11, s7
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_mov_b32 s8, s2
; SI-NEXT:    s_mov_b32 s9, s3
; SI-NEXT:    buffer_load_dwordx4 v[0:3], off, s[8:11], 0
; SI-NEXT:    s_mov_b32 s4, s0
; SI-NEXT:    s_mov_b32 s5, s1
; SI-NEXT:    s_waitcnt vmcnt(0)
; SI-NEXT:    v_lshr_b64 v[0:1], v[0:1], v2
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: lshr_i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx4 s[4:7], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s3, 0xf000
; VI-NEXT:    s_mov_b32 s2, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_lshr_b64 s[4:5], s[4:5], s6
; VI-NEXT:    v_mov_b32_e32 v0, s4
; VI-NEXT:    v_mov_b32_e32 v1, s5
; VI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; VI-NEXT:    s_endpgm
;
; EG-LABEL: lshr_i64:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 0, @8, KC0[CB0:0-32], KC1[]
; EG-NEXT:    TEX 0 @6
; EG-NEXT:    ALU 9, @9, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    PAD
; EG-NEXT:    Fetch clause starting at 6:
; EG-NEXT:     VTX_READ_128 T0.XYZW, T0.X, 0, #1
; EG-NEXT:    ALU clause starting at 8:
; EG-NEXT:     MOV * T0.X, KC0[2].Z,
; EG-NEXT:    ALU clause starting at 9:
; EG-NEXT:     AND_INT * T0.W, T0.Z, literal.x,
; EG-NEXT:    31(4.344025e-44), 0(0.000000e+00)
; EG-NEXT:     LSHR T1.Z, T0.Y, PV.W,
; EG-NEXT:     BIT_ALIGN_INT T0.W, T0.Y, T0.X, T0.Z,
; EG-NEXT:     AND_INT * T1.W, T0.Z, literal.x,
; EG-NEXT:    32(4.484155e-44), 0(0.000000e+00)
; EG-NEXT:     CNDE_INT T0.X, PS, PV.W, PV.Z,
; EG-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
; EG-NEXT:     CNDE_INT * T0.Y, T1.W, T1.Z, 0.0,
  %b_ptr = getelementptr i64, ptr addrspace(1) %in, i64 1
  %a = load i64, ptr addrspace(1) %in
  %b = load i64, ptr addrspace(1) %b_ptr
  %result = lshr i64 %a, %b
  store i64 %result, ptr addrspace(1) %out
  ret void
}

define amdgpu_kernel void @lshr_v4i64(ptr addrspace(1) %out, ptr addrspace(1) %in) {
; SI-LABEL: lshr_v4i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    s_mov_b32 s6, -1
; SI-NEXT:    s_mov_b32 s10, s6
; SI-NEXT:    s_mov_b32 s11, s7
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_mov_b32 s8, s2
; SI-NEXT:    s_mov_b32 s9, s3
; SI-NEXT:    buffer_load_dwordx4 v[0:3], off, s[8:11], 0 offset:48
; SI-NEXT:    buffer_load_dwordx4 v[3:6], off, s[8:11], 0 offset:16
; SI-NEXT:    buffer_load_dwordx4 v[7:10], off, s[8:11], 0
; SI-NEXT:    buffer_load_dwordx4 v[11:14], off, s[8:11], 0 offset:32
; SI-NEXT:    s_mov_b32 s4, s0
; SI-NEXT:    s_mov_b32 s5, s1
; SI-NEXT:    s_waitcnt vmcnt(2)
; SI-NEXT:    v_lshr_b64 v[5:6], v[5:6], v2
; SI-NEXT:    v_lshr_b64 v[3:4], v[3:4], v0
; SI-NEXT:    s_waitcnt vmcnt(0)
; SI-NEXT:    v_lshr_b64 v[9:10], v[9:10], v13
; SI-NEXT:    v_lshr_b64 v[7:8], v[7:8], v11
; SI-NEXT:    buffer_store_dwordx4 v[3:6], off, s[4:7], 0 offset:16
; SI-NEXT:    buffer_store_dwordx4 v[7:10], off, s[4:7], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: lshr_v4i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[16:19], s[4:5], 0x24
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx16 s[0:15], s[18:19], 0x0
; VI-NEXT:    s_mov_b32 s19, 0xf000
; VI-NEXT:    s_mov_b32 s18, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_lshr_b64 s[6:7], s[6:7], s14
; VI-NEXT:    s_lshr_b64 s[4:5], s[4:5], s12
; VI-NEXT:    s_lshr_b64 s[2:3], s[2:3], s10
; VI-NEXT:    s_lshr_b64 s[0:1], s[0:1], s8
; VI-NEXT:    v_mov_b32_e32 v0, s4
; VI-NEXT:    v_mov_b32_e32 v1, s5
; VI-NEXT:    v_mov_b32_e32 v2, s6
; VI-NEXT:    v_mov_b32_e32 v3, s7
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[16:19], 0 offset:16
; VI-NEXT:    s_nop 0
; VI-NEXT:    v_mov_b32_e32 v0, s0
; VI-NEXT:    v_mov_b32_e32 v1, s1
; VI-NEXT:    v_mov_b32_e32 v2, s2
; VI-NEXT:    v_mov_b32_e32 v3, s3
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[16:19], 0
; VI-NEXT:    s_endpgm
;
; EG-LABEL: lshr_v4i64:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 0, @14, KC0[CB0:0-32], KC1[]
; EG-NEXT:    TEX 3 @6
; EG-NEXT:    ALU 34, @15, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T1.XYZW, T3.X, 0
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T2.XYZW, T0.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    Fetch clause starting at 6:
; EG-NEXT:     VTX_READ_128 T1.XYZW, T0.X, 32, #1
; EG-NEXT:     VTX_READ_128 T2.XYZW, T0.X, 16, #1
; EG-NEXT:     VTX_READ_128 T3.XYZW, T0.X, 48, #1
; EG-NEXT:     VTX_READ_128 T0.XYZW, T0.X, 0, #1
; EG-NEXT:    ALU clause starting at 14:
; EG-NEXT:     MOV * T0.X, KC0[2].Z,
; EG-NEXT:    ALU clause starting at 15:
; EG-NEXT:     AND_INT * T1.W, T1.Z, literal.x,
; EG-NEXT:    31(4.344025e-44), 0(0.000000e+00)
; EG-NEXT:     LSHR T4.Z, T0.W, PV.W,
; EG-NEXT:     AND_INT T1.W, T1.Z, literal.x,
; EG-NEXT:     AND_INT * T3.W, T3.Z, literal.y,
; EG-NEXT:    32(4.484155e-44), 31(4.344025e-44)
; EG-NEXT:     BIT_ALIGN_INT T4.X, T0.W, T0.Z, T1.Z,
; EG-NEXT:     LSHR T1.Y, T2.W, PS, BS:VEC_120/SCL_212
; EG-NEXT:     AND_INT * T0.Z, T3.Z, literal.x,
; EG-NEXT:    32(4.484155e-44), 0(0.000000e+00)
; EG-NEXT:     BIT_ALIGN_INT T0.W, T2.W, T2.Z, T3.Z,
; EG-NEXT:     AND_INT * T2.W, T3.X, literal.x,
; EG-NEXT:    31(4.344025e-44), 0(0.000000e+00)
; EG-NEXT:     AND_INT T5.X, T1.X, literal.x,
; EG-NEXT:     LSHR T3.Y, T2.Y, PS,
; EG-NEXT:     CNDE_INT T2.Z, T0.Z, PV.W, T1.Y,
; EG-NEXT:     BIT_ALIGN_INT T0.W, T2.Y, T2.X, T3.X,
; EG-NEXT:     AND_INT * T3.W, T3.X, literal.y,
; EG-NEXT:    31(4.344025e-44), 32(4.484155e-44)
; EG-NEXT:     CNDE_INT T2.X, PS, PV.W, PV.Y,
; EG-NEXT:     LSHR T4.Y, T0.Y, PV.X,
; EG-NEXT:     CNDE_INT T1.Z, T1.W, T4.X, T4.Z,
; EG-NEXT:     BIT_ALIGN_INT T0.W, T0.Y, T0.X, T1.X, BS:VEC_102/SCL_221
; EG-NEXT:     AND_INT * T4.W, T1.X, literal.x,
; EG-NEXT:    32(4.484155e-44), 0(0.000000e+00)
; EG-NEXT:     CNDE_INT T1.X, PS, PV.W, PV.Y,
; EG-NEXT:     ADD_INT T0.W, KC0[2].Y, literal.x,
; EG-NEXT:     CNDE_INT * T2.W, T0.Z, T1.Y, 0.0,
; EG-NEXT:    16(2.242078e-44), 0(0.000000e+00)
; EG-NEXT:     LSHR T0.X, PV.W, literal.x,
; EG-NEXT:     CNDE_INT T2.Y, T3.W, T3.Y, 0.0,
; EG-NEXT:     CNDE_INT T1.W, T1.W, T4.Z, 0.0, BS:VEC_120/SCL_212
; EG-NEXT:     LSHR * T3.X, KC0[2].Y, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
; EG-NEXT:     CNDE_INT * T1.Y, T4.W, T4.Y, 0.0,
  %b_ptr = getelementptr <4 x i64>, ptr addrspace(1) %in, i64 1
  %a = load <4 x i64>, ptr addrspace(1) %in
  %b = load <4 x i64>, ptr addrspace(1) %b_ptr
  %result = lshr <4 x i64> %a, %b
  store <4 x i64> %result, ptr addrspace(1) %out
  ret void
}

; Make sure load width gets reduced to i32 load.
define amdgpu_kernel void @s_lshr_32_i64(ptr addrspace(1) %out, [8 x i32], i64 %a) {
; SI-LABEL: s_lshr_32_i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dword s6, s[4:5], 0x14
; SI-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    v_mov_b32_e32 v1, 0
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_mov_b32_e32 v0, s6
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: s_lshr_32_i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dword s6, s[4:5], 0x50
; VI-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x24
; VI-NEXT:    s_mov_b32 s3, 0xf000
; VI-NEXT:    s_mov_b32 s2, -1
; VI-NEXT:    v_mov_b32_e32 v1, 0
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s6
; VI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; VI-NEXT:    s_endpgm
;
; EG-LABEL: s_lshr_32_i64:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 3, @4, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    PAD
; EG-NEXT:    ALU clause starting at 4:
; EG-NEXT:     MOV T0.X, KC0[5].X,
; EG-NEXT:     MOV T0.Y, 0.0,
; EG-NEXT:     LSHR * T1.X, KC0[2].Y, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
  %result = lshr i64 %a, 32
  store i64 %result, ptr addrspace(1) %out
  ret void
}

define amdgpu_kernel void @v_lshr_32_i64(ptr addrspace(1) %out, ptr addrspace(1) %in) {
; SI-LABEL: v_lshr_32_i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x9
; SI-NEXT:    s_mov_b32 s6, 0
; SI-NEXT:    s_mov_b32 s7, 0xf000
; SI-NEXT:    v_lshlrev_b32_e32 v0, 3, v0
; SI-NEXT:    v_mov_b32_e32 v1, 0
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_mov_b64 s[8:9], s[2:3]
; SI-NEXT:    s_mov_b64 s[10:11], s[6:7]
; SI-NEXT:    buffer_load_dword v2, v[0:1], s[8:11], 0 addr64 offset:4
; SI-NEXT:    s_mov_b64 s[4:5], s[0:1]
; SI-NEXT:    v_mov_b32_e32 v3, v1
; SI-NEXT:    s_waitcnt vmcnt(0)
; SI-NEXT:    buffer_store_dwordx2 v[2:3], v[0:1], s[4:7], 0 addr64
; SI-NEXT:    s_endpgm
;
; VI-LABEL: v_lshr_32_i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[4:5], 0x24
; VI-NEXT:    v_lshlrev_b32_e32 v2, 3, v0
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_mov_b32_e32 v0, s3
; VI-NEXT:    v_add_u32_e32 v1, vcc, s2, v2
; VI-NEXT:    v_addc_u32_e32 v3, vcc, 0, v0, vcc
; VI-NEXT:    v_add_u32_e32 v0, vcc, 4, v1
; VI-NEXT:    v_addc_u32_e32 v1, vcc, 0, v3, vcc
; VI-NEXT:    flat_load_dword v0, v[0:1]
; VI-NEXT:    v_mov_b32_e32 v3, s1
; VI-NEXT:    v_add_u32_e32 v2, vcc, s0, v2
; VI-NEXT:    v_mov_b32_e32 v1, 0
; VI-NEXT:    v_addc_u32_e32 v3, vcc, 0, v3, vcc
; VI-NEXT:    s_waitcnt vmcnt(0)
; VI-NEXT:    flat_store_dwordx2 v[2:3], v[0:1]
; VI-NEXT:    s_endpgm
;
; EG-LABEL: v_lshr_32_i64:
; EG:       ; %bb.0:
; EG-NEXT:    ALU 2, @8, KC0[CB0:0-32], KC1[]
; EG-NEXT:    TEX 0 @6
; EG-NEXT:    ALU 3, @11, KC0[CB0:0-32], KC1[]
; EG-NEXT:    MEM_RAT_CACHELESS STORE_RAW T0.XY, T1.X, 1
; EG-NEXT:    CF_END
; EG-NEXT:    PAD
; EG-NEXT:    Fetch clause starting at 6:
; EG-NEXT:     VTX_READ_32 T0.X, T0.X, 4, #1
; EG-NEXT:    ALU clause starting at 8:
; EG-NEXT:     LSHL * T0.W, T0.X, literal.x,
; EG-NEXT:    3(4.203895e-45), 0(0.000000e+00)
; EG-NEXT:     ADD_INT * T0.X, KC0[2].Z, PV.W,
; EG-NEXT:    ALU clause starting at 11:
; EG-NEXT:     MOV T0.Y, 0.0,
; EG-NEXT:     ADD_INT * T0.W, KC0[2].Y, T0.W,
; EG-NEXT:     LSHR * T1.X, PV.W, literal.x,
; EG-NEXT:    2(2.802597e-45), 0(0.000000e+00)
  %tid = call i32 @llvm.amdgcn.workitem.id.x() #0
  %gep.in = getelementptr i64, ptr addrspace(1) %in, i32 %tid
  %gep.out = getelementptr i64, ptr addrspace(1) %out, i32 %tid
  %a = load i64, ptr addrspace(1) %gep.in
  %result = lshr i64 %a, 32
  store i64 %result, ptr addrspace(1) %gep.out
  ret void
}

attributes #0 = { nounwind readnone }
