////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: FpDacOut.v
// /___/   /\     Timestamp: Mon Apr 13 12:24:22 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpDacOut.ngc E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpDacOut.v 
// Device	: 4vfx60ff1152-11
// Input file	: E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpDacOut.ngc
// Output file	: E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpDacOut.v
// # of Modules	: 1
// Design Name	: FpDacOut
// Xilinx        : E:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module FpDacOut (
  clk, result, a
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [15 : 0] result;
  input [31 : 0] a;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire NLW_blk00000011_O_UNCONNECTED;
  wire NLW_blk00000018_O_UNCONNECTED;
  wire NLW_blk00000039_O_UNCONNECTED;
  wire [15 : 0] \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT ;
  assign
    result[15] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [15],
    result[14] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [14],
    result[13] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [13],
    result[12] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [12],
    result[11] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [11],
    result[10] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [10],
    result[9] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [9],
    result[8] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [8],
    result[7] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [7],
    result[6] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [6],
    result[5] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [5],
    result[4] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [4],
    result[3] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [3],
    result[2] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [2],
    result[1] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [1],
    result[0] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [0];
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000002)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .D(sig000000f7),
    .Q(sig0000004b)
  );
  MUXF5   blk00000004 (
    .I0(sig0000004e),
    .I1(sig0000004d),
    .S(a[24]),
    .O(sig0000004c)
  );
  MUXF6   blk00000005 (
    .I0(sig00000048),
    .I1(sig00000049),
    .S(sig0000004b),
    .O(sig00000059)
  );
  MUXF6   blk00000006 (
    .I0(sig0000004a),
    .I1(sig0000004a),
    .S(sig0000004b),
    .O(sig0000005a)
  );
  MUXF7   blk00000007 (
    .I0(sig00000059),
    .I1(sig0000005a),
    .S(sig00000001),
    .O(sig000000f8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000002),
    .Q(sig0000004a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000062),
    .Q(sig00000049)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .CE(sig00000002),
    .D(sig00000061),
    .Q(sig00000048)
  );
  MUXCY   blk0000000b (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000043),
    .O(sig0000005b)
  );
  MUXCY   blk0000000c (
    .CI(sig0000005b),
    .DI(sig00000001),
    .S(sig00000044),
    .O(sig0000005c)
  );
  MUXCY   blk0000000d (
    .CI(sig0000005c),
    .DI(sig00000001),
    .S(sig00000045),
    .O(sig0000005d)
  );
  MUXCY   blk0000000e (
    .CI(sig0000005d),
    .DI(sig00000001),
    .S(sig00000046),
    .O(sig0000005e)
  );
  MUXCY   blk0000000f (
    .CI(sig0000005e),
    .DI(sig00000001),
    .S(sig00000047),
    .O(sig0000005f)
  );
  MUXCY   blk00000010 (
    .CI(sig0000005f),
    .DI(sig00000001),
    .S(sig00000001),
    .O(sig00000060)
  );
  MUXCY   blk00000011 (
    .CI(sig0000006d),
    .DI(sig00000001),
    .S(sig00000073),
    .O(NLW_blk00000011_O_UNCONNECTED)
  );
  MUXCY   blk00000012 (
    .CI(sig0000006c),
    .DI(sig00000001),
    .S(sig00000072),
    .O(sig0000006d)
  );
  MUXCY   blk00000013 (
    .CI(sig0000006b),
    .DI(sig00000001),
    .S(sig00000071),
    .O(sig0000006c)
  );
  MUXCY   blk00000014 (
    .CI(sig0000006a),
    .DI(sig00000001),
    .S(sig00000070),
    .O(sig0000006b)
  );
  MUXCY   blk00000015 (
    .CI(sig00000069),
    .DI(sig00000001),
    .S(sig0000006f),
    .O(sig0000006a)
  );
  MUXCY   blk00000016 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig0000006e),
    .O(sig00000069)
  );
  MUXCY   blk00000017 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000e6),
    .O(sig00000092)
  );
  XORCY   blk00000018 (
    .CI(sig00000002),
    .LI(sig000000e6),
    .O(NLW_blk00000018_O_UNCONNECTED)
  );
  MUXCY   blk00000019 (
    .CI(sig00000092),
    .DI(sig00000001),
    .S(sig000000d4),
    .O(sig00000093)
  );
  XORCY   blk0000001a (
    .CI(sig00000092),
    .LI(sig000000d4),
    .O(sig000000ee)
  );
  MUXCY   blk0000001b (
    .CI(sig00000093),
    .DI(sig00000001),
    .S(sig000000da),
    .O(sig00000094)
  );
  XORCY   blk0000001c (
    .CI(sig00000093),
    .LI(sig000000da),
    .O(sig000000ef)
  );
  MUXCY   blk0000001d (
    .CI(sig00000094),
    .DI(sig00000001),
    .S(sig000000db),
    .O(sig00000095)
  );
  XORCY   blk0000001e (
    .CI(sig00000094),
    .LI(sig000000db),
    .O(sig000000f0)
  );
  MUXCY   blk0000001f (
    .CI(sig00000095),
    .DI(sig00000001),
    .S(sig000000dc),
    .O(sig00000096)
  );
  XORCY   blk00000020 (
    .CI(sig00000095),
    .LI(sig000000dc),
    .O(sig000000f1)
  );
  MUXCY   blk00000021 (
    .CI(sig00000096),
    .DI(sig00000001),
    .S(sig000000dd),
    .O(sig00000097)
  );
  XORCY   blk00000022 (
    .CI(sig00000096),
    .LI(sig000000dd),
    .O(sig000000f2)
  );
  MUXCY   blk00000023 (
    .CI(sig00000097),
    .DI(sig00000001),
    .S(sig000000de),
    .O(sig00000098)
  );
  XORCY   blk00000024 (
    .CI(sig00000097),
    .LI(sig000000de),
    .O(sig000000f3)
  );
  MUXCY   blk00000025 (
    .CI(sig00000098),
    .DI(sig00000001),
    .S(sig000000df),
    .O(sig00000099)
  );
  XORCY   blk00000026 (
    .CI(sig00000098),
    .LI(sig000000df),
    .O(sig000000f4)
  );
  MUXCY   blk00000027 (
    .CI(sig00000099),
    .DI(sig00000001),
    .S(sig000000e0),
    .O(sig0000009a)
  );
  XORCY   blk00000028 (
    .CI(sig00000099),
    .LI(sig000000e0),
    .O(sig000000f5)
  );
  MUXCY   blk00000029 (
    .CI(sig0000009a),
    .DI(sig00000001),
    .S(sig000000e1),
    .O(sig0000008a)
  );
  XORCY   blk0000002a (
    .CI(sig0000009a),
    .LI(sig000000e1),
    .O(sig000000f6)
  );
  MUXCY   blk0000002b (
    .CI(sig0000008a),
    .DI(sig00000001),
    .S(sig000000e2),
    .O(sig0000008b)
  );
  XORCY   blk0000002c (
    .CI(sig0000008a),
    .LI(sig000000e2),
    .O(sig000000e7)
  );
  MUXCY   blk0000002d (
    .CI(sig0000008b),
    .DI(sig00000001),
    .S(sig000000d5),
    .O(sig0000008c)
  );
  XORCY   blk0000002e (
    .CI(sig0000008b),
    .LI(sig000000d5),
    .O(sig000000e8)
  );
  MUXCY   blk0000002f (
    .CI(sig0000008c),
    .DI(sig00000001),
    .S(sig000000d6),
    .O(sig0000008d)
  );
  XORCY   blk00000030 (
    .CI(sig0000008c),
    .LI(sig000000d6),
    .O(sig000000e9)
  );
  MUXCY   blk00000031 (
    .CI(sig0000008d),
    .DI(sig00000001),
    .S(sig000000d7),
    .O(sig0000008e)
  );
  XORCY   blk00000032 (
    .CI(sig0000008d),
    .LI(sig000000d7),
    .O(sig000000ea)
  );
  MUXCY   blk00000033 (
    .CI(sig0000008e),
    .DI(sig00000001),
    .S(sig000000d8),
    .O(sig0000008f)
  );
  XORCY   blk00000034 (
    .CI(sig0000008e),
    .LI(sig000000d8),
    .O(sig000000eb)
  );
  MUXCY   blk00000035 (
    .CI(sig0000008f),
    .DI(sig00000001),
    .S(sig000000d9),
    .O(sig00000090)
  );
  XORCY   blk00000036 (
    .CI(sig0000008f),
    .LI(sig000000d9),
    .O(sig000000ec)
  );
  MUXCY   blk00000037 (
    .CI(sig00000090),
    .DI(sig00000001),
    .S(sig00000089),
    .O(sig00000091)
  );
  XORCY   blk00000038 (
    .CI(sig00000090),
    .LI(sig00000089),
    .O(sig000000ed)
  );
  XORCY   blk00000039 (
    .CI(sig00000091),
    .LI(sig00000001),
    .O(NLW_blk00000039_O_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000009c),
    .Q(sig00000027)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000009d),
    .Q(sig00000028)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ac),
    .Q(sig0000002f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ad),
    .Q(sig00000030)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000ae),
    .Q(sig00000031)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000af),
    .Q(sig00000032)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b0),
    .Q(sig00000033)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b2),
    .Q(sig00000034)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b3),
    .Q(sig00000035)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000b4),
    .Q(sig00000036)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(clk),
    .CE(sig00000002),
    .D(sig0000009e),
    .Q(sig00000029)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a2),
    .Q(sig0000002a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000046 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a3),
    .Q(sig0000002b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000047 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a7),
    .Q(sig0000002c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000048 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000a8),
    .Q(sig0000002d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(clk),
    .CE(sig00000002),
    .D(sig000000aa),
    .Q(sig0000002e)
  );
  MUXCY   blk0000004a (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000067),
    .O(sig00000066)
  );
  MUXCY   blk0000004b (
    .CI(sig00000066),
    .DI(sig00000001),
    .S(sig00000068),
    .O(sig000000c3)
  );
  MUXCY   blk0000004c (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000064),
    .O(sig00000063)
  );
  MUXCY   blk0000004d (
    .CI(sig00000063),
    .DI(sig00000001),
    .S(sig00000065),
    .O(sig000000c2)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004e (
    .C(clk),
    .D(a[31]),
    .Q(sig0000009b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(clk),
    .D(sig000000e5),
    .Q(sig00000078)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk00000050 (
    .I0(a[13]),
    .I1(a[9]),
    .I2(a[11]),
    .O(sig000000ca)
  );
  MUXCY   blk00000051 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000ca),
    .O(sig000000c5)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000052 (
    .I0(a[12]),
    .I1(a[16]),
    .I2(a[8]),
    .I3(a[14]),
    .O(sig000000cb)
  );
  MUXCY   blk00000053 (
    .CI(sig000000c5),
    .DI(sig00000001),
    .S(sig000000cb),
    .O(sig000000c6)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000054 (
    .I0(a[15]),
    .I1(a[19]),
    .I2(a[10]),
    .I3(a[17]),
    .O(sig000000cc)
  );
  MUXCY   blk00000055 (
    .CI(sig000000c6),
    .DI(sig00000001),
    .S(sig000000cc),
    .O(sig000000c7)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000056 (
    .I0(a[18]),
    .I1(a[3]),
    .I2(a[21]),
    .I3(a[20]),
    .O(sig000000cd)
  );
  MUXCY   blk00000057 (
    .CI(sig000000c7),
    .DI(sig00000001),
    .S(sig000000cd),
    .O(sig000000c8)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000058 (
    .I0(a[2]),
    .I1(a[6]),
    .I2(a[7]),
    .I3(a[4]),
    .O(sig000000ce)
  );
  MUXCY   blk00000059 (
    .CI(sig000000c8),
    .DI(sig00000001),
    .S(sig000000ce),
    .O(sig000000c9)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000005a (
    .I0(a[5]),
    .I1(a[0]),
    .I2(a[22]),
    .I3(a[1]),
    .O(sig000000cf)
  );
  MUXCY   blk0000005b (
    .CI(sig000000c9),
    .DI(sig00000001),
    .S(sig000000cf),
    .O(sig000000c4)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk0000005c (
    .I0(a[22]),
    .I1(a[21]),
    .I2(a[20]),
    .O(sig00000073)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000005d (
    .I0(a[17]),
    .I1(a[16]),
    .I2(a[19]),
    .I3(a[18]),
    .O(sig00000072)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000005e (
    .I0(a[13]),
    .I1(a[12]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig00000071)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000005f (
    .I0(a[9]),
    .I1(a[8]),
    .I2(a[11]),
    .I3(a[10]),
    .O(sig00000070)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000060 (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig0000006f)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000061 (
    .I0(a[1]),
    .I1(a[0]),
    .I2(a[3]),
    .I3(a[2]),
    .O(sig0000006e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000062 (
    .I0(a[17]),
    .I1(a[16]),
    .I2(a[19]),
    .I3(a[18]),
    .O(sig00000047)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000063 (
    .I0(a[28]),
    .I1(a[27]),
    .I2(a[30]),
    .I3(a[29]),
    .O(sig00000068)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk00000064 (
    .I0(a[28]),
    .I1(a[27]),
    .I2(a[30]),
    .I3(a[29]),
    .O(sig00000065)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000065 (
    .I0(a[13]),
    .I1(a[12]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig00000046)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000066 (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[23]),
    .O(sig00000067)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk00000067 (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[23]),
    .O(sig00000064)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000068 (
    .I0(a[9]),
    .I1(a[8]),
    .I2(a[11]),
    .I3(a[10]),
    .O(sig00000045)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk00000069 (
    .I0(a[12]),
    .I1(a[23]),
    .O(sig00000013)
  );
  LUT4 #(
    .INIT ( 16'hFFBA ))
  blk0000006a (
    .I0(a[12]),
    .I1(a[23]),
    .I2(a[14]),
    .I3(a[13]),
    .O(sig0000001a)
  );
  LUT4 #(
    .INIT ( 16'h082A ))
  blk0000006b (
    .I0(sig0000005d),
    .I1(a[24]),
    .I2(sig0000001a),
    .I3(sig00000013),
    .O(sig00000056)
  );
  LUT4 #(
    .INIT ( 16'hFA22 ))
  blk0000006c (
    .I0(a[4]),
    .I1(a[23]),
    .I2(a[5]),
    .I3(a[24]),
    .O(sig0000001c)
  );
  LUT4 #(
    .INIT ( 16'hFB22 ))
  blk0000006d (
    .I0(a[4]),
    .I1(a[23]),
    .I2(a[5]),
    .I3(a[24]),
    .O(sig0000001d)
  );
  LUT4 #(
    .INIT ( 16'h082A ))
  blk0000006e (
    .I0(sig0000005b),
    .I1(a[6]),
    .I2(sig0000001d),
    .I3(sig0000001c),
    .O(sig00000058)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000006f (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig00000044)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000070 (
    .I0(a[1]),
    .I1(a[0]),
    .I2(a[3]),
    .I3(a[2]),
    .O(sig00000043)
  );
  LUT4 #(
    .INIT ( 16'hB2A2 ))
  blk00000071 (
    .I0(a[8]),
    .I1(a[23]),
    .I2(a[24]),
    .I3(a[10]),
    .O(sig0000001f)
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  blk00000072 (
    .I0(a[8]),
    .I1(a[23]),
    .I2(a[24]),
    .O(sig00000022)
  );
  LUT4 #(
    .INIT ( 16'h082A ))
  blk00000073 (
    .I0(sig0000005c),
    .I1(a[9]),
    .I2(sig00000022),
    .I3(sig0000001f),
    .O(sig00000057)
  );
  LUT4 #(
    .INIT ( 16'hFA8A ))
  blk00000074 (
    .I0(sig000000c2),
    .I1(a[31]),
    .I2(sig000000c4),
    .I3(sig000000c3),
    .O(sig000000e3)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000075 (
    .I0(a[25]),
    .I1(a[24]),
    .O(sig000000d0)
  );
  LUT4 #(
    .INIT ( 16'h2A2F ))
  blk00000076 (
    .I0(sig000000d3),
    .I1(sig000000d2),
    .I2(sig00000076),
    .I3(sig000000e3),
    .O(sig000000e5)
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  blk00000077 (
    .I0(sig000000d1),
    .I1(sig000000d0),
    .I2(a[22]),
    .I3(a[18]),
    .O(sig00000037)
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  blk00000078 (
    .I0(sig000000d1),
    .I1(sig000000d0),
    .I2(a[21]),
    .I3(a[17]),
    .O(sig00000042)
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  blk00000079 (
    .I0(sig000000d1),
    .I1(sig000000d0),
    .I2(a[20]),
    .I3(a[16]),
    .O(sig00000041)
  );
  LUT4 #(
    .INIT ( 16'h5E54 ))
  blk0000007a (
    .I0(sig000000d0),
    .I1(a[15]),
    .I2(sig000000d1),
    .I3(a[19]),
    .O(sig00000040)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk0000007b (
    .I0(a[23]),
    .I1(sig0000003a),
    .I2(sig00000039),
    .O(sig000000a6)
  );
  MUXF5   blk0000007c (
    .I0(sig000000a6),
    .I1(sig000000a5),
    .S(a[24]),
    .O(sig000000a3)
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  blk0000007d (
    .I0(sig000000c3),
    .I1(sig000000c2),
    .I2(sig000000c4),
    .O(sig000000d3)
  );
  LUT3 #(
    .INIT ( 8'h4F ))
  blk0000007e (
    .I0(a[29]),
    .I1(sig00000075),
    .I2(a[30]),
    .O(sig00000076)
  );
  LUT4 #(
    .INIT ( 16'h1101 ))
  blk0000007f (
    .I0(a[27]),
    .I1(a[28]),
    .I2(a[26]),
    .I3(sig00000074),
    .O(sig00000075)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000080 (
    .I0(a[24]),
    .I1(sig00000042),
    .I2(sig00000038),
    .O(sig000000bf)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000081 (
    .I0(a[24]),
    .I1(sig00000037),
    .I2(sig00000039),
    .O(sig000000a1)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000082 (
    .I0(a[23]),
    .I1(sig000000a1),
    .I2(sig000000bf),
    .O(sig000000b4)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000083 (
    .I0(a[24]),
    .I1(sig0000003f),
    .I2(sig00000041),
    .O(sig000000bc)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000084 (
    .I0(a[24]),
    .I1(sig0000003e),
    .I2(sig00000040),
    .O(sig000000bb)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000085 (
    .I0(a[23]),
    .I1(sig000000bc),
    .I2(sig000000bb),
    .O(sig000000af)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000086 (
    .I0(a[24]),
    .I1(sig0000003d),
    .I2(sig0000003f),
    .O(sig000000b5)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000087 (
    .I0(a[23]),
    .I1(sig000000bb),
    .I2(sig000000b5),
    .O(sig000000ae)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk00000088 (
    .I0(a[23]),
    .I1(sig000000b5),
    .I2(sig000000b1),
    .O(sig000000ad)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000089 (
    .I0(sig0000009b),
    .I1(sig0000002e),
    .O(sig000000d9)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008a (
    .I0(sig0000009b),
    .I1(sig0000002d),
    .O(sig000000d8)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008b (
    .I0(sig0000009b),
    .I1(sig0000002c),
    .O(sig000000d7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008c (
    .I0(sig0000009b),
    .I1(sig0000002b),
    .O(sig000000d6)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk0000008d (
    .I0(a[24]),
    .I1(sig0000003c),
    .I2(sig0000003d),
    .O(sig000000a4)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk0000008e (
    .I0(a[23]),
    .I1(sig000000a4),
    .I2(sig000000ab),
    .O(sig0000009d)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk0000008f (
    .I0(a[24]),
    .I1(sig0000003c),
    .O(sig000000b6)
  );
  LUT4 #(
    .INIT ( 16'hFAD8 ))
  blk00000090 (
    .I0(a[23]),
    .I1(sig000000b6),
    .I2(sig000000ab),
    .I3(sig000000b8),
    .O(sig0000009c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000091 (
    .I0(sig0000009b),
    .I1(sig0000002a),
    .O(sig000000d5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000092 (
    .I0(sig0000009b),
    .I1(sig00000029),
    .O(sig000000e2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000093 (
    .I0(sig0000009b),
    .I1(sig00000036),
    .O(sig000000e1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000094 (
    .I0(sig0000009b),
    .I1(sig00000035),
    .O(sig000000e0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000095 (
    .I0(sig0000009b),
    .I1(sig00000034),
    .O(sig000000df)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000096 (
    .I0(sig0000009b),
    .I1(sig00000033),
    .O(sig000000de)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000097 (
    .I0(sig0000009b),
    .I1(sig00000032),
    .O(sig000000dd)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000098 (
    .I0(sig0000009b),
    .I1(sig00000031),
    .O(sig000000dc)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000099 (
    .I0(sig0000009b),
    .I1(sig00000030),
    .O(sig000000db)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009a (
    .I0(sig0000009b),
    .I1(sig0000002f),
    .O(sig000000da)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009b (
    .I0(sig0000009b),
    .I1(sig00000028),
    .O(sig000000d4)
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  blk0000009c (
    .I0(a[25]),
    .I1(a[24]),
    .O(sig00000074)
  );
  LUT4 #(
    .INIT ( 16'h785A ))
  blk0000009d (
    .I0(sig00000027),
    .I1(sig00000028),
    .I2(sig0000009b),
    .I3(sig000000f8),
    .O(sig000000e6)
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk0000009e (
    .C(clk),
    .D(sig000000e4),
    .S(sig000000e3),
    .Q(sig00000077)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000009f (
    .I0(sig0000009b),
    .O(sig00000089)
  );
  FDR   blk000000a0 (
    .C(clk),
    .D(sig00000085),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [6])
  );
  FDR   blk000000a1 (
    .C(clk),
    .D(sig00000084),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [5])
  );
  FDR   blk000000a2 (
    .C(clk),
    .D(sig00000083),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [4])
  );
  FDR   blk000000a3 (
    .C(clk),
    .D(sig00000082),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [3])
  );
  FDR   blk000000a4 (
    .C(clk),
    .D(sig00000081),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [2])
  );
  FDR   blk000000a5 (
    .C(clk),
    .D(sig00000080),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [1])
  );
  FDR   blk000000a6 (
    .C(clk),
    .D(sig00000079),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [0])
  );
  FDR   blk000000a7 (
    .C(clk),
    .D(sig00000086),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [7])
  );
  FDR   blk000000a8 (
    .C(clk),
    .D(sig00000087),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [8])
  );
  FDR   blk000000a9 (
    .C(clk),
    .D(sig00000088),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [9])
  );
  FDR   blk000000aa (
    .C(clk),
    .D(sig0000007a),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [10])
  );
  FDR   blk000000ab (
    .C(clk),
    .D(sig0000007b),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [11])
  );
  FD   blk000000ac (
    .C(clk),
    .D(sig0000007f),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [15])
  );
  FDR   blk000000ad (
    .C(clk),
    .D(sig0000007c),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [12])
  );
  FDR   blk000000ae (
    .C(clk),
    .D(sig0000007d),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [13])
  );
  FDR   blk000000af (
    .C(clk),
    .D(sig0000007e),
    .R(sig00000077),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [14])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk000000b0 (
    .I0(sig00000078),
    .I1(sig00000077),
    .O(sig00000019)
  );
  LUT3 #(
    .INIT ( 8'h31 ))
  blk000000b1 (
    .I0(sig0000009b),
    .I1(sig00000077),
    .I2(sig00000078),
    .O(sig0000001b)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b2 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f4),
    .I3(sig000000ed),
    .O(sig00000085)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b3 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f3),
    .I3(sig000000ed),
    .O(sig00000084)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b4 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f2),
    .I3(sig000000ed),
    .O(sig00000083)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b5 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f1),
    .I3(sig000000ed),
    .O(sig00000082)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b6 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f0),
    .I3(sig000000ed),
    .O(sig00000081)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b7 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000ef),
    .I3(sig000000ed),
    .O(sig00000080)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b8 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000ee),
    .I3(sig000000ed),
    .O(sig00000079)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000b9 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f5),
    .I3(sig000000ed),
    .O(sig00000086)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000ba (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000f6),
    .I3(sig000000ed),
    .O(sig00000087)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000bb (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000e7),
    .I3(sig000000ed),
    .O(sig00000088)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000bc (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000e8),
    .I3(sig000000ed),
    .O(sig0000007a)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000bd (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000e9),
    .I3(sig000000ed),
    .O(sig0000007b)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000be (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000ea),
    .I3(sig000000ed),
    .O(sig0000007c)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000bf (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000eb),
    .I3(sig000000ed),
    .O(sig0000007d)
  );
  LUT4 #(
    .INIT ( 16'hFCFA ))
  blk000000c0 (
    .I0(sig00000019),
    .I1(sig0000001b),
    .I2(sig000000ec),
    .I3(sig000000ed),
    .O(sig0000007e)
  );
  LUT4 #(
    .INIT ( 16'h9888 ))
  blk000000c1 (
    .I0(sig00000078),
    .I1(sig00000077),
    .I2(sig0000009b),
    .I3(sig000000ed),
    .O(sig0000007f)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000c2 (
    .I0(a[28]),
    .I1(a[29]),
    .I2(a[30]),
    .O(sig0000001e)
  );
  LUT4 #(
    .INIT ( 16'h1101 ))
  blk000000c3 (
    .I0(a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[23]),
    .O(sig0000004d)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000c4 (
    .I0(a[23]),
    .I1(sig000000b1),
    .I2(sig000000a4),
    .O(sig000000ac)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  blk000000c5 (
    .I0(a[0]),
    .I1(a[23]),
    .O(sig0000004e)
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  blk000000c6 (
    .I0(sig0000005e),
    .I1(sig000000d0),
    .I2(sig000000d1),
    .I3(sig00000020),
    .O(sig00000053)
  );
  LUT4 #(
    .INIT ( 16'h1101 ))
  blk000000c7 (
    .I0(sig000000d1),
    .I1(sig000000d0),
    .I2(a[23]),
    .I3(a[22]),
    .O(sig000000a5)
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  blk000000c8 (
    .I0(a[24]),
    .I1(a[25]),
    .I2(sig000000b7),
    .I3(sig00000021),
    .O(sig000000b8)
  );
  LUT4 #(
    .INIT ( 16'hAA95 ))
  blk000000c9 (
    .I0(a[27]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[26]),
    .O(sig000000f7)
  );
  LUT4 #(
    .INIT ( 16'hF999 ))
  blk000000ca (
    .I0(a[26]),
    .I1(sig00000074),
    .I2(sig0000004f),
    .I3(sig0000005f),
    .O(sig00000052)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000cb (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[11]),
    .I3(a[15]),
    .O(sig00000014)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000cc (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[10]),
    .I3(a[14]),
    .O(sig00000015)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000cd (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[18]),
    .I3(a[22]),
    .O(sig00000016)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000ce (
    .I0(a[26]),
    .I1(sig00000074),
    .I2(sig00000016),
    .I3(sig00000015),
    .O(sig0000003c)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000cf (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[9]),
    .I3(a[13]),
    .O(sig00000017)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000d0 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[17]),
    .I3(a[21]),
    .O(sig00000018)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000d1 (
    .I0(a[26]),
    .I1(sig00000074),
    .I2(a[16]),
    .I3(a[8]),
    .O(sig000000b7)
  );
  LUT4 #(
    .INIT ( 16'hFBEB ))
  blk000000d2 (
    .I0(sig00000023),
    .I1(sig00000075),
    .I2(a[29]),
    .I3(a[30]),
    .O(sig000000d2)
  );
  LUT4 #(
    .INIT ( 16'h7818 ))
  blk000000d3 (
    .I0(a[24]),
    .I1(a[25]),
    .I2(a[26]),
    .I3(a[19]),
    .O(sig00000038)
  );
  LUT4 #(
    .INIT ( 16'hEBAA ))
  blk000000d4 (
    .I0(sig00000053),
    .I1(a[24]),
    .I2(a[25]),
    .I3(sig00000052),
    .O(sig00000024)
  );
  LUT4 #(
    .INIT ( 16'hEBAA ))
  blk000000d5 (
    .I0(sig00000024),
    .I1(sig00000074),
    .I2(a[26]),
    .I3(sig00000060),
    .O(sig00000062)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000d6 (
    .I0(a[26]),
    .I1(sig00000074),
    .I2(a[20]),
    .I3(a[12]),
    .O(sig00000021)
  );
  LUT4 #(
    .INIT ( 16'h2F09 ))
  blk000000d7 (
    .I0(sig00000075),
    .I1(a[29]),
    .I2(a[30]),
    .I3(sig00000023),
    .O(sig00000025)
  );
  LUT4 #(
    .INIT ( 16'hFF10 ))
  blk000000d8 (
    .I0(sig00000076),
    .I1(sig000000d3),
    .I2(a[31]),
    .I3(sig00000025),
    .O(sig000000e4)
  );
  LUT4 #(
    .INIT ( 16'h7F7E ))
  blk000000d9 (
    .I0(a[27]),
    .I1(a[28]),
    .I2(sig00000026),
    .I3(sig0000001e),
    .O(sig00000023)
  );
  LUT3 #(
    .INIT ( 8'h95 ))
  blk000000da (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig000000d1)
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  blk000000db (
    .I0(a[23]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[26]),
    .O(sig000000aa)
  );
  LUT4 #(
    .INIT ( 16'h0880 ))
  blk000000dc (
    .I0(a[20]),
    .I1(a[26]),
    .I2(a[25]),
    .I3(a[24]),
    .O(sig00000039)
  );
  LUT4 #(
    .INIT ( 16'h0880 ))
  blk000000dd (
    .I0(a[22]),
    .I1(a[26]),
    .I2(a[25]),
    .I3(a[24]),
    .O(sig0000003b)
  );
  LUT4 #(
    .INIT ( 16'h0880 ))
  blk000000de (
    .I0(a[21]),
    .I1(a[26]),
    .I2(a[25]),
    .I3(a[24]),
    .O(sig0000003a)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk000000df (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig00000026)
  );
  MUXF5   blk000000e0 (
    .I0(sig00000003),
    .I1(sig00000004),
    .S(a[23]),
    .O(sig000000b2)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000e1 (
    .I0(a[24]),
    .I1(sig00000041),
    .I2(sig00000037),
    .O(sig00000003)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000e2 (
    .I0(a[24]),
    .I1(sig00000040),
    .I2(sig00000042),
    .O(sig00000004)
  );
  MUXF5   blk000000e3 (
    .I0(sig00000005),
    .I1(sig00000006),
    .S(a[23]),
    .O(sig000000a2)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000e4 (
    .I0(a[24]),
    .I1(sig00000039),
    .I2(sig0000003b),
    .O(sig00000005)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000e5 (
    .I0(a[24]),
    .I1(sig00000038),
    .I2(sig0000003a),
    .O(sig00000006)
  );
  MUXF5   blk000000e6 (
    .I0(sig00000007),
    .I1(sig00000008),
    .S(sig000000d1),
    .O(sig00000061)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000e7 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(sig00000057),
    .I3(sig00000056),
    .O(sig00000007)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000e8 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(sig0000004c),
    .I3(sig00000058),
    .O(sig00000008)
  );
  MUXF5   blk000000e9 (
    .I0(sig00000009),
    .I1(sig0000000a),
    .S(sig000000d1),
    .O(sig0000003f)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000ea (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[14]),
    .I3(a[18]),
    .O(sig00000009)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk000000eb (
    .I0(a[22]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig0000000a)
  );
  MUXF5   blk000000ec (
    .I0(sig0000000b),
    .I1(sig0000000c),
    .S(sig000000d1),
    .O(sig0000003e)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000ed (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[13]),
    .I3(a[17]),
    .O(sig0000000b)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk000000ee (
    .I0(a[21]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig0000000c)
  );
  MUXF5   blk000000ef (
    .I0(sig0000000d),
    .I1(sig0000000e),
    .S(sig000000d1),
    .O(sig0000003d)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000f0 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[12]),
    .I3(a[16]),
    .O(sig0000000d)
  );
  LUT3 #(
    .INIT ( 8'h28 ))
  blk000000f1 (
    .I0(a[20]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig0000000e)
  );
  MUXF5   blk000000f2 (
    .I0(sig0000000f),
    .I1(sig00000010),
    .S(a[24]),
    .O(sig000000ab)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000f3 (
    .I0(a[26]),
    .I1(sig00000018),
    .I2(sig00000017),
    .O(sig0000000f)
  );
  LUT4 #(
    .INIT ( 16'hEDE8 ))
  blk000000f4 (
    .I0(a[26]),
    .I1(sig00000014),
    .I2(a[25]),
    .I3(a[19]),
    .O(sig00000010)
  );
  MUXF5   blk000000f5 (
    .I0(sig00000011),
    .I1(sig00000012),
    .S(a[23]),
    .O(sig000000a7)
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  blk000000f6 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[22]),
    .I3(a[26]),
    .O(sig00000011)
  );
  LUT4 #(
    .INIT ( 16'h2820 ))
  blk000000f7 (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[21]),
    .O(sig00000012)
  );
  LUT4 #(
    .INIT ( 16'hE4FF ))
  blk000000f8 (
    .I0(a[24]),
    .I1(sig00000041),
    .I2(sig00000037),
    .I3(a[23]),
    .O(sig000000c0)
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  blk000000f9 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000041),
    .I3(sig00000037),
    .O(sig000000c1)
  );
  MUXF5   blk000000fa (
    .I0(sig000000c1),
    .I1(sig000000c0),
    .S(sig000000bf),
    .O(sig000000b3)
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  blk000000fb (
    .I0(a[24]),
    .I1(sig00000042),
    .I2(sig00000040),
    .I3(a[23]),
    .O(sig000000bd)
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  blk000000fc (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000042),
    .I3(sig00000040),
    .O(sig000000be)
  );
  MUXF5   blk000000fd (
    .I0(sig000000be),
    .I1(sig000000bd),
    .S(sig000000bc),
    .O(sig000000b0)
  );
  LUT4 #(
    .INIT ( 16'hFE54 ))
  blk000000fe (
    .I0(a[24]),
    .I1(a[19]),
    .I2(sig000000d0),
    .I3(sig0000003e),
    .O(sig000000b9)
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  blk000000ff (
    .I0(a[24]),
    .I1(sig00000014),
    .I2(sig0000003e),
    .O(sig000000ba)
  );
  MUXF5   blk00000100 (
    .I0(sig000000ba),
    .I1(sig000000b9),
    .S(sig000000d1),
    .O(sig000000b1)
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  blk00000101 (
    .I0(a[24]),
    .I1(sig0000003a),
    .I2(sig00000038),
    .I3(a[23]),
    .O(sig0000009f)
  );
  LUT4 #(
    .INIT ( 16'h5140 ))
  blk00000102 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003a),
    .I3(sig00000038),
    .O(sig000000a0)
  );
  MUXF5   blk00000103 (
    .I0(sig000000a0),
    .I1(sig0000009f),
    .S(sig000000a1),
    .O(sig0000009e)
  );
  LUT4 #(
    .INIT ( 16'h1101 ))
  blk00000104 (
    .I0(a[20]),
    .I1(a[21]),
    .I2(a[22]),
    .I3(a[23]),
    .O(sig00000050)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  blk00000105 (
    .I0(a[20]),
    .I1(a[23]),
    .O(sig00000051)
  );
  MUXF5   blk00000106 (
    .I0(sig00000051),
    .I1(sig00000050),
    .S(a[24]),
    .O(sig0000004f)
  );
  LUT4 #(
    .INIT ( 16'h1101 ))
  blk00000107 (
    .I0(a[16]),
    .I1(a[17]),
    .I2(a[18]),
    .I3(a[23]),
    .O(sig00000054)
  );
  LUT2 #(
    .INIT ( 4'hD ))
  blk00000108 (
    .I0(a[16]),
    .I1(a[23]),
    .O(sig00000055)
  );
  MUXF5   blk00000109 (
    .I0(sig00000055),
    .I1(sig00000054),
    .S(a[24]),
    .O(sig00000020)
  );
  LUT4 #(
    .INIT ( 16'h0C04 ))
  blk0000010a (
    .I0(a[23]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[22]),
    .O(sig000000a9)
  );
  MUXF5   blk0000010b (
    .I0(sig00000001),
    .I1(sig000000a9),
    .S(a[26]),
    .O(sig000000a8)
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
