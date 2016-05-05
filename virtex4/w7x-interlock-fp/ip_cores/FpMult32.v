////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: FpMult32.v
// /___/   /\     Timestamp: Thu Apr 09 17:20:50 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpMult32.ngc E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpMult32.v 
// Device	: 4vfx60ff1152-11
// Input file	: E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpMult32.ngc
// Output file	: E:/temp/FPGA/W7X_INTLCK_FP/ip_cores/tmp/_cg/FpMult32.v
// # of Modules	: 1
// Design Name	: FpMult32
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

module FpMult32 (
  clk, result, a, b
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [31 : 0] result;
  input [31 : 0] a;
  input [31 : 0] b;
  
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
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire sig00000169;
  wire sig0000016a;
  wire sig0000016b;
  wire sig0000016c;
  wire sig0000016d;
  wire sig0000016e;
  wire sig0000016f;
  wire sig00000170;
  wire sig00000171;
  wire sig00000172;
  wire sig00000173;
  wire sig00000174;
  wire sig00000175;
  wire sig00000176;
  wire sig00000177;
  wire sig00000178;
  wire sig00000179;
  wire sig0000017a;
  wire sig0000017b;
  wire sig0000017c;
  wire sig0000017d;
  wire sig0000017e;
  wire sig0000017f;
  wire sig00000180;
  wire sig00000181;
  wire sig00000182;
  wire sig00000183;
  wire sig00000184;
  wire sig00000185;
  wire sig00000186;
  wire sig00000187;
  wire sig00000188;
  wire sig00000189;
  wire sig0000018a;
  wire sig0000018b;
  wire sig0000018c;
  wire sig0000018d;
  wire sig0000018e;
  wire sig0000018f;
  wire sig00000190;
  wire sig00000191;
  wire sig00000192;
  wire sig00000193;
  wire sig00000194;
  wire sig00000195;
  wire sig00000196;
  wire sig00000197;
  wire sig00000198;
  wire sig00000199;
  wire sig0000019a;
  wire sig0000019b;
  wire sig0000019c;
  wire sig0000019d;
  wire sig0000019e;
  wire sig0000019f;
  wire sig000001a0;
  wire sig000001a1;
  wire sig000001a2;
  wire sig000001a3;
  wire sig000001a4;
  wire sig000001a5;
  wire sig000001a6;
  wire sig000001a7;
  wire sig000001a8;
  wire sig000001a9;
  wire sig000001aa;
  wire sig000001ab;
  wire sig000001ac;
  wire sig000001ad;
  wire sig000001ae;
  wire sig000001af;
  wire sig000001b0;
  wire sig000001b1;
  wire sig000001b2;
  wire sig000001b3;
  wire sig000001b4;
  wire sig000001b5;
  wire sig000001b6;
  wire sig000001b7;
  wire sig000001b8;
  wire sig000001b9;
  wire sig000001ba;
  wire sig000001bb;
  wire sig000001bc;
  wire sig000001bd;
  wire sig000001be;
  wire sig000001c2;
  wire sig000001c3;
  wire sig000001c4;
  wire sig000001c5;
  wire sig000001c6;
  wire sig000001c7;
  wire sig000001c8;
  wire sig000001c9;
  wire sig000001ca;
  wire sig000001cb;
  wire sig000001cc;
  wire sig000001cd;
  wire sig000001ce;
  wire sig000001cf;
  wire sig000001d0;
  wire sig000001d1;
  wire sig000001d2;
  wire sig000001d3;
  wire sig000001d4;
  wire sig000001d5;
  wire sig000001d6;
  wire sig000001d7;
  wire \U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op ;
  wire sig000001d8;
  wire sig000001d9;
  wire sig000001da;
  wire sig000001db;
  wire sig000001dc;
  wire sig000001dd;
  wire sig000001de;
  wire sig000001df;
  wire sig000001e0;
  wire sig000001e1;
  wire sig000001e2;
  wire sig000001e3;
  wire sig000001e4;
  wire sig000001e5;
  wire sig000001e6;
  wire sig000001e7;
  wire sig000001e8;
  wire sig000001e9;
  wire sig000001ea;
  wire sig000001eb;
  wire sig000001ec;
  wire sig000001ed;
  wire sig000001ee;
  wire sig000001ef;
  wire sig000001f0;
  wire sig000001f1;
  wire sig000001f2;
  wire sig000001f3;
  wire sig000001f4;
  wire sig000001f5;
  wire sig000001f6;
  wire sig000001f7;
  wire sig000001f8;
  wire sig000001f9;
  wire sig000001fa;
  wire sig000001fb;
  wire sig000001fc;
  wire sig000001fd;
  wire sig000001fe;
  wire sig000001ff;
  wire sig00000200;
  wire sig00000201;
  wire sig00000202;
  wire sig00000203;
  wire sig00000204;
  wire sig00000205;
  wire sig00000206;
  wire sig00000207;
  wire sig00000208;
  wire sig00000209;
  wire sig0000020a;
  wire sig0000020b;
  wire sig0000020c;
  wire sig0000020d;
  wire sig0000020e;
  wire sig0000020f;
  wire sig00000210;
  wire sig00000211;
  wire sig00000212;
  wire sig00000213;
  wire sig00000214;
  wire sig00000215;
  wire sig00000216;
  wire sig00000217;
  wire sig00000218;
  wire sig00000219;
  wire sig0000021a;
  wire sig0000021b;
  wire sig0000021c;
  wire sig0000021d;
  wire sig0000021e;
  wire sig0000021f;
  wire sig00000220;
  wire sig00000221;
  wire sig00000222;
  wire sig00000223;
  wire sig00000224;
  wire sig00000225;
  wire sig00000226;
  wire sig00000227;
  wire sig00000228;
  wire sig00000229;
  wire sig0000022a;
  wire sig0000022b;
  wire sig0000022c;
  wire sig0000022d;
  wire sig0000022e;
  wire sig0000022f;
  wire sig00000230;
  wire sig00000231;
  wire sig00000232;
  wire sig00000233;
  wire sig00000234;
  wire sig00000235;
  wire sig00000236;
  wire sig00000237;
  wire sig00000238;
  wire sig00000239;
  wire sig0000023a;
  wire sig0000023b;
  wire sig00000256;
  wire sig00000257;
  wire sig00000258;
  wire sig00000259;
  wire sig0000025a;
  wire \blk0000001a/sig0000027f ;
  wire \blk0000001a/sig0000027e ;
  wire \blk0000001a/sig0000027d ;
  wire \blk0000001a/sig0000027c ;
  wire \blk0000001a/sig0000027b ;
  wire \blk0000001a/sig0000027a ;
  wire \blk0000001a/sig00000279 ;
  wire \blk0000001a/sig00000278 ;
  wire \blk0000001a/sig00000277 ;
  wire \blk0000001a/sig00000276 ;
  wire \blk0000001a/sig00000275 ;
  wire \blk0000001a/sig00000274 ;
  wire \blk0000001a/sig00000273 ;
  wire \blk0000001a/sig00000272 ;
  wire \blk0000001a/sig00000271 ;
  wire \blk0000001a/sig00000270 ;
  wire \blk0000001a/sig0000026f ;
  wire \NLW_blk0000003c_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003c_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003c_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003c_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<17>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<16>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<15>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<14>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<13>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<12>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<11>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<10>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<9>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<8>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<7>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<6>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<5>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<4>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<3>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<2>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<1>_UNCONNECTED ;
  wire \NLW_blk0000003d_P<0>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003d_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003e_P<17>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<39>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<38>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<37>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<36>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<35>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<34>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<33>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<32>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<31>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<30>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<29>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<28>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<27>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<26>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<25>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<24>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<23>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<22>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<21>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<20>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<19>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<18>_UNCONNECTED ;
  wire \NLW_blk0000003f_P<17>_UNCONNECTED ;
  wire NLW_blk00000077_O_UNCONNECTED;
  wire [7 : 0] \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op ;
  wire [22 : 0] \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op ;
  assign
    result[31] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op ,
    result[30] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7],
    result[29] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6],
    result[28] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5],
    result[27] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4],
    result[26] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3],
    result[25] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2],
    result[24] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1],
    result[23] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0],
    result[22] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [22],
    result[21] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [21],
    result[20] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [20],
    result[19] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [19],
    result[18] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [18],
    result[17] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [17],
    result[16] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [16],
    result[15] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [15],
    result[14] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [14],
    result[13] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [13],
    result[12] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [12],
    result[11] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [11],
    result[10] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10],
    result[9] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9],
    result[8] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8],
    result[7] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7],
    result[6] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6],
    result[5] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5],
    result[4] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4],
    result[3] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3],
    result[2] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2],
    result[1] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1],
    result[0] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0];
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000003)
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .D(sig0000003d),
    .R(sig00000001),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op )
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .D(sig00000224),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .D(sig00000233),
    .R(sig0000025a),
    .S(sig00000259),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [22])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .D(sig00000223),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .D(sig00000232),
    .R(sig00000257),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [21])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .D(sig00000222),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .D(sig00000231),
    .R(sig00000257),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [20])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .D(sig00000220),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .D(sig00000221),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(clk),
    .D(sig0000021f),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .D(sig0000021e),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1])
  );
  FDRS #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .D(sig0000021d),
    .R(sig00000258),
    .S(sig00000256),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0])
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000000f (
    .I0(sig00000170),
    .I1(sig00000001),
    .I2(sig00000001),
    .I3(sig00000001),
    .O(sig000000d7)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000010 (
    .I0(sig0000016c),
    .I1(sig0000016d),
    .I2(sig0000016e),
    .I3(sig0000016f),
    .O(sig000000d6)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000011 (
    .I0(sig00000177),
    .I1(sig00000178),
    .I2(sig0000016a),
    .I3(sig0000016b),
    .O(sig000000d5)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000012 (
    .I0(sig00000173),
    .I1(sig00000174),
    .I2(sig00000175),
    .I3(sig00000176),
    .O(sig000000d4)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000013 (
    .I0(sig00000168),
    .I1(sig00000169),
    .I2(sig00000171),
    .I3(sig00000172),
    .O(sig000000d3)
  );
  MUXCY   blk00000014 (
    .CI(sig000000d1),
    .DI(sig00000001),
    .S(sig000000d7),
    .O(sig000000d2)
  );
  MUXCY   blk00000015 (
    .CI(sig000000d0),
    .DI(sig00000001),
    .S(sig000000d6),
    .O(sig000000d1)
  );
  MUXCY   blk00000016 (
    .CI(sig000000cf),
    .DI(sig00000001),
    .S(sig000000d5),
    .O(sig000000d0)
  );
  MUXCY   blk00000017 (
    .CI(sig000000ce),
    .DI(sig00000001),
    .S(sig000000d4),
    .O(sig000000cf)
  );
  MUXCY   blk00000018 (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig000000d3),
    .O(sig000000ce)
  );
  XORCY   blk00000019 (
    .CI(sig000000d2),
    .LI(sig00000001),
    .O(sig000001c2)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000037 (
    .I0(sig00000195),
    .I1(sig00000001),
    .I2(sig00000001),
    .I3(sig00000001),
    .O(sig000000cd)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000038 (
    .I0(sig0000018a),
    .I1(sig00000192),
    .I2(sig00000193),
    .I3(sig00000194),
    .O(sig000000cc)
  );
  MUXCY   blk00000039 (
    .CI(sig000000ca),
    .DI(sig00000001),
    .S(sig000000cd),
    .O(sig000000cb)
  );
  MUXCY   blk0000003a (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig000000cc),
    .O(sig000000ca)
  );
  XORCY   blk0000003b (
    .CI(sig000000cb),
    .LI(sig00000001),
    .O(sig000001c3)
  );
  DSP48 #(
    .AREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "CASCADE" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .LEGACY_MODE ( "MULT18X18S" ),
    .MREG ( 1 ),
    .OPMODEREG ( 0 ),
    .PREG ( 0 ),
    .SUBTRACTREG ( 1 ))
  blk0000003c (
    .CARRYIN(sig00000001),
    .CEA(sig00000001),
    .CEB(sig00000001),
    .CEC(sig00000001),
    .CECTRL(sig00000001),
    .CEP(sig00000001),
    .CEM(sig00000003),
    .CECARRYIN(sig00000001),
    .CECINSUB(sig00000003),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTC(sig00000001),
    .RSTCTRL(sig00000001),
    .RSTP(sig00000001),
    .RSTM(sig00000001),
    .RSTCARRYIN(sig00000001),
    .SUBTRACT(sig00000001),
    .A({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000003, a[22], a[21], a[20], a[19], a[18], a[17]}),
    .PCIN({sig00000131, sig00000130, sig0000012f, sig0000012e, sig0000012d, sig0000012c, sig0000012b, sig0000012a, sig00000128, sig00000127, 
sig00000126, sig00000125, sig00000124, sig00000123, sig00000122, sig00000121, sig00000120, sig0000011f, sig0000011d, sig0000011c, sig0000011b, 
sig0000011a, sig00000119, sig00000118, sig00000117, sig00000116, sig00000115, sig00000114, sig00000112, sig00000111, sig00000110, sig0000010f, 
sig0000010e, sig0000010d, sig0000010c, sig0000010b, sig0000010a, sig00000109, sig00000137, sig00000136, sig00000135, sig00000134, sig00000133, 
sig00000132, sig00000129, sig0000011e, sig00000113, sig00000108}),
    .B({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .C({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001}),
    .CARRYINSEL({sig00000001, sig00000001}),
    .OPMODE({sig00000003, sig00000001, sig00000003, sig00000001, sig00000003, sig00000001, sig00000003}),
    .BCIN({sig0000009c, sig0000009b, sig0000009a, sig00000099, sig00000098, sig00000097, sig00000096, sig00000095, sig000000a5, sig000000a4, 
sig000000a3, sig000000a2, sig000000a1, sig000000a0, sig0000009f, sig0000009e, sig0000009d, sig00000094}),
    .PCOUT({\NLW_blk0000003c_PCOUT<47>_UNCONNECTED , \NLW_blk0000003c_PCOUT<46>_UNCONNECTED , \NLW_blk0000003c_PCOUT<45>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<44>_UNCONNECTED , \NLW_blk0000003c_PCOUT<43>_UNCONNECTED , \NLW_blk0000003c_PCOUT<42>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<41>_UNCONNECTED , \NLW_blk0000003c_PCOUT<40>_UNCONNECTED , \NLW_blk0000003c_PCOUT<39>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<38>_UNCONNECTED , \NLW_blk0000003c_PCOUT<37>_UNCONNECTED , \NLW_blk0000003c_PCOUT<36>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<35>_UNCONNECTED , \NLW_blk0000003c_PCOUT<34>_UNCONNECTED , \NLW_blk0000003c_PCOUT<33>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<32>_UNCONNECTED , \NLW_blk0000003c_PCOUT<31>_UNCONNECTED , \NLW_blk0000003c_PCOUT<30>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<29>_UNCONNECTED , \NLW_blk0000003c_PCOUT<28>_UNCONNECTED , \NLW_blk0000003c_PCOUT<27>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<26>_UNCONNECTED , \NLW_blk0000003c_PCOUT<25>_UNCONNECTED , \NLW_blk0000003c_PCOUT<24>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<23>_UNCONNECTED , \NLW_blk0000003c_PCOUT<22>_UNCONNECTED , \NLW_blk0000003c_PCOUT<21>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<20>_UNCONNECTED , \NLW_blk0000003c_PCOUT<19>_UNCONNECTED , \NLW_blk0000003c_PCOUT<18>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<17>_UNCONNECTED , \NLW_blk0000003c_PCOUT<16>_UNCONNECTED , \NLW_blk0000003c_PCOUT<15>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<14>_UNCONNECTED , \NLW_blk0000003c_PCOUT<13>_UNCONNECTED , \NLW_blk0000003c_PCOUT<12>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<11>_UNCONNECTED , \NLW_blk0000003c_PCOUT<10>_UNCONNECTED , \NLW_blk0000003c_PCOUT<9>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<8>_UNCONNECTED , \NLW_blk0000003c_PCOUT<7>_UNCONNECTED , \NLW_blk0000003c_PCOUT<6>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<5>_UNCONNECTED , \NLW_blk0000003c_PCOUT<4>_UNCONNECTED , \NLW_blk0000003c_PCOUT<3>_UNCONNECTED , 
\NLW_blk0000003c_PCOUT<2>_UNCONNECTED , \NLW_blk0000003c_PCOUT<1>_UNCONNECTED , \NLW_blk0000003c_PCOUT<0>_UNCONNECTED }),
    .P({\NLW_blk0000003c_P<47>_UNCONNECTED , \NLW_blk0000003c_P<46>_UNCONNECTED , \NLW_blk0000003c_P<45>_UNCONNECTED , 
\NLW_blk0000003c_P<44>_UNCONNECTED , \NLW_blk0000003c_P<43>_UNCONNECTED , \NLW_blk0000003c_P<42>_UNCONNECTED , \NLW_blk0000003c_P<41>_UNCONNECTED , 
\NLW_blk0000003c_P<40>_UNCONNECTED , \NLW_blk0000003c_P<39>_UNCONNECTED , \NLW_blk0000003c_P<38>_UNCONNECTED , \NLW_blk0000003c_P<37>_UNCONNECTED , 
\NLW_blk0000003c_P<36>_UNCONNECTED , sig000001b7, sig000001b6, sig000001b5, sig000001b4, sig000001b3, sig000001b2, sig000001b0, sig000001af, 
sig000001ae, sig000001ad, sig000001ac, sig000001ab, sig000001aa, sig000001a9, sig000001a8, sig000001a7, sig000001a5, sig000001a4, sig000001a3, 
sig000001a2, sig000001a1, sig000001a0, sig0000019f, sig0000019e, sig0000019d, sig0000019c, sig000001be, sig000001bd, sig000001bc, sig000001bb, 
sig000001ba, sig000001b9, sig000001b8, sig000001b1, sig000001a6, sig0000019b}),
    .BCOUT({\NLW_blk0000003c_BCOUT<17>_UNCONNECTED , \NLW_blk0000003c_BCOUT<16>_UNCONNECTED , \NLW_blk0000003c_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<14>_UNCONNECTED , \NLW_blk0000003c_BCOUT<13>_UNCONNECTED , \NLW_blk0000003c_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<11>_UNCONNECTED , \NLW_blk0000003c_BCOUT<10>_UNCONNECTED , \NLW_blk0000003c_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<8>_UNCONNECTED , \NLW_blk0000003c_BCOUT<7>_UNCONNECTED , \NLW_blk0000003c_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<5>_UNCONNECTED , \NLW_blk0000003c_BCOUT<4>_UNCONNECTED , \NLW_blk0000003c_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003c_BCOUT<2>_UNCONNECTED , \NLW_blk0000003c_BCOUT<1>_UNCONNECTED , \NLW_blk0000003c_BCOUT<0>_UNCONNECTED })
  );
  DSP48 #(
    .AREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "CASCADE" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .LEGACY_MODE ( "MULT18X18" ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 0 ),
    .SUBTRACTREG ( 0 ))
  blk0000003d (
    .CARRYIN(sig00000001),
    .CEA(sig00000001),
    .CEB(sig00000001),
    .CEC(sig00000001),
    .CECTRL(sig00000001),
    .CEP(sig00000001),
    .CEM(sig00000001),
    .CECARRYIN(sig00000001),
    .CECINSUB(sig00000001),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTC(sig00000001),
    .RSTCTRL(sig00000001),
    .RSTP(sig00000001),
    .RSTM(sig00000001),
    .RSTCARRYIN(sig00000001),
    .SUBTRACT(sig00000001),
    .A({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000003, a[22], a[21], a[20], a[19], a[18], a[17]}),
    .PCIN({sig00000101, sig00000100, sig000000ff, sig000000fe, sig000000fd, sig000000fc, sig000000fb, sig000000fa, sig000000f8, sig000000f7, 
sig000000f6, sig000000f5, sig000000f4, sig000000f3, sig000000f2, sig000000f1, sig000000f0, sig000000ef, sig000000ed, sig000000ec, sig000000eb, 
sig000000ea, sig000000e9, sig000000e8, sig000000e7, sig000000e6, sig000000e5, sig000000e4, sig000000e2, sig000000e1, sig000000e0, sig000000df, 
sig000000de, sig000000dd, sig000000dc, sig000000db, sig000000da, sig000000d9, sig00000107, sig00000106, sig00000105, sig00000104, sig00000103, 
sig00000102, sig000000f9, sig000000ee, sig000000e3, sig000000d8}),
    .B({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .C({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001}),
    .CARRYINSEL({sig00000001, sig00000001}),
    .OPMODE({sig00000003, sig00000001, sig00000003, sig00000001, sig00000003, sig00000001, sig00000003}),
    .BCIN({sig0000008a, sig00000089, sig00000088, sig00000087, sig00000086, sig00000085, sig00000084, sig00000083, sig00000093, sig00000092, 
sig00000091, sig00000090, sig0000008f, sig0000008e, sig0000008d, sig0000008c, sig0000008b, sig00000082}),
    .PCOUT({sig00000161, sig00000160, sig0000015f, sig0000015e, sig0000015d, sig0000015c, sig0000015b, sig0000015a, sig00000158, sig00000157, 
sig00000156, sig00000155, sig00000154, sig00000153, sig00000152, sig00000151, sig00000150, sig0000014f, sig0000014d, sig0000014c, sig0000014b, 
sig0000014a, sig00000149, sig00000148, sig00000147, sig00000146, sig00000145, sig00000144, sig00000142, sig00000141, sig00000140, sig0000013f, 
sig0000013e, sig0000013d, sig0000013c, sig0000013b, sig0000013a, sig00000139, sig00000167, sig00000166, sig00000165, sig00000164, sig00000163, 
sig00000162, sig00000159, sig0000014e, sig00000143, sig00000138}),
    .P({\NLW_blk0000003d_P<47>_UNCONNECTED , \NLW_blk0000003d_P<46>_UNCONNECTED , \NLW_blk0000003d_P<45>_UNCONNECTED , 
\NLW_blk0000003d_P<44>_UNCONNECTED , \NLW_blk0000003d_P<43>_UNCONNECTED , \NLW_blk0000003d_P<42>_UNCONNECTED , \NLW_blk0000003d_P<41>_UNCONNECTED , 
\NLW_blk0000003d_P<40>_UNCONNECTED , \NLW_blk0000003d_P<39>_UNCONNECTED , \NLW_blk0000003d_P<38>_UNCONNECTED , \NLW_blk0000003d_P<37>_UNCONNECTED , 
\NLW_blk0000003d_P<36>_UNCONNECTED , \NLW_blk0000003d_P<35>_UNCONNECTED , \NLW_blk0000003d_P<34>_UNCONNECTED , \NLW_blk0000003d_P<33>_UNCONNECTED , 
\NLW_blk0000003d_P<32>_UNCONNECTED , \NLW_blk0000003d_P<31>_UNCONNECTED , \NLW_blk0000003d_P<30>_UNCONNECTED , \NLW_blk0000003d_P<29>_UNCONNECTED , 
\NLW_blk0000003d_P<28>_UNCONNECTED , \NLW_blk0000003d_P<27>_UNCONNECTED , \NLW_blk0000003d_P<26>_UNCONNECTED , \NLW_blk0000003d_P<25>_UNCONNECTED , 
\NLW_blk0000003d_P<24>_UNCONNECTED , \NLW_blk0000003d_P<23>_UNCONNECTED , \NLW_blk0000003d_P<22>_UNCONNECTED , \NLW_blk0000003d_P<21>_UNCONNECTED , 
\NLW_blk0000003d_P<20>_UNCONNECTED , \NLW_blk0000003d_P<19>_UNCONNECTED , \NLW_blk0000003d_P<18>_UNCONNECTED , \NLW_blk0000003d_P<17>_UNCONNECTED , 
\NLW_blk0000003d_P<16>_UNCONNECTED , \NLW_blk0000003d_P<15>_UNCONNECTED , \NLW_blk0000003d_P<14>_UNCONNECTED , \NLW_blk0000003d_P<13>_UNCONNECTED , 
\NLW_blk0000003d_P<12>_UNCONNECTED , \NLW_blk0000003d_P<11>_UNCONNECTED , \NLW_blk0000003d_P<10>_UNCONNECTED , \NLW_blk0000003d_P<9>_UNCONNECTED , 
\NLW_blk0000003d_P<8>_UNCONNECTED , \NLW_blk0000003d_P<7>_UNCONNECTED , \NLW_blk0000003d_P<6>_UNCONNECTED , \NLW_blk0000003d_P<5>_UNCONNECTED , 
\NLW_blk0000003d_P<4>_UNCONNECTED , \NLW_blk0000003d_P<3>_UNCONNECTED , \NLW_blk0000003d_P<2>_UNCONNECTED , \NLW_blk0000003d_P<1>_UNCONNECTED , 
\NLW_blk0000003d_P<0>_UNCONNECTED }),
    .BCOUT({\NLW_blk0000003d_BCOUT<17>_UNCONNECTED , \NLW_blk0000003d_BCOUT<16>_UNCONNECTED , \NLW_blk0000003d_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<14>_UNCONNECTED , \NLW_blk0000003d_BCOUT<13>_UNCONNECTED , \NLW_blk0000003d_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<11>_UNCONNECTED , \NLW_blk0000003d_BCOUT<10>_UNCONNECTED , \NLW_blk0000003d_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<8>_UNCONNECTED , \NLW_blk0000003d_BCOUT<7>_UNCONNECTED , \NLW_blk0000003d_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<5>_UNCONNECTED , \NLW_blk0000003d_BCOUT<4>_UNCONNECTED , \NLW_blk0000003d_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003d_BCOUT<2>_UNCONNECTED , \NLW_blk0000003d_BCOUT<1>_UNCONNECTED , \NLW_blk0000003d_BCOUT<0>_UNCONNECTED })
  );
  DSP48 #(
    .AREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .LEGACY_MODE ( "MULT18X18" ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 1 ),
    .SUBTRACTREG ( 0 ))
  blk0000003e (
    .CARRYIN(sig00000001),
    .CEA(sig00000001),
    .CEB(sig00000001),
    .CEC(sig00000001),
    .CECTRL(sig00000001),
    .CEP(sig00000003),
    .CEM(sig00000001),
    .CECARRYIN(sig00000001),
    .CECINSUB(sig00000001),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTC(sig00000001),
    .RSTCTRL(sig00000001),
    .RSTP(sig00000001),
    .RSTM(sig00000001),
    .RSTCARRYIN(sig00000001),
    .SUBTRACT(sig00000001),
    .A({sig00000001, a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .PCIN({sig00000161, sig00000160, sig0000015f, sig0000015e, sig0000015d, sig0000015c, sig0000015b, sig0000015a, sig00000158, sig00000157, 
sig00000156, sig00000155, sig00000154, sig00000153, sig00000152, sig00000151, sig00000150, sig0000014f, sig0000014d, sig0000014c, sig0000014b, 
sig0000014a, sig00000149, sig00000148, sig00000147, sig00000146, sig00000145, sig00000144, sig00000142, sig00000141, sig00000140, sig0000013f, 
sig0000013e, sig0000013d, sig0000013c, sig0000013b, sig0000013a, sig00000139, sig00000167, sig00000166, sig00000165, sig00000164, sig00000163, 
sig00000162, sig00000159, sig0000014e, sig00000143, sig00000138}),
    .B({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000003, b[22], b[21], b[20], b[19], b[18], b[17]}),
    .C({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001}),
    .CARRYINSEL({sig00000001, sig00000001}),
    .OPMODE({sig00000001, sig00000001, sig00000003, sig00000001, sig00000003, sig00000001, sig00000003}),
    .BCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .PCOUT({sig00000131, sig00000130, sig0000012f, sig0000012e, sig0000012d, sig0000012c, sig0000012b, sig0000012a, sig00000128, sig00000127, 
sig00000126, sig00000125, sig00000124, sig00000123, sig00000122, sig00000121, sig00000120, sig0000011f, sig0000011d, sig0000011c, sig0000011b, 
sig0000011a, sig00000119, sig00000118, sig00000117, sig00000116, sig00000115, sig00000114, sig00000112, sig00000111, sig00000110, sig0000010f, 
sig0000010e, sig0000010d, sig0000010c, sig0000010b, sig0000010a, sig00000109, sig00000137, sig00000136, sig00000135, sig00000134, sig00000133, 
sig00000132, sig00000129, sig0000011e, sig00000113, sig00000108}),
    .P({\NLW_blk0000003e_P<47>_UNCONNECTED , \NLW_blk0000003e_P<46>_UNCONNECTED , \NLW_blk0000003e_P<45>_UNCONNECTED , 
\NLW_blk0000003e_P<44>_UNCONNECTED , \NLW_blk0000003e_P<43>_UNCONNECTED , \NLW_blk0000003e_P<42>_UNCONNECTED , \NLW_blk0000003e_P<41>_UNCONNECTED , 
\NLW_blk0000003e_P<40>_UNCONNECTED , \NLW_blk0000003e_P<39>_UNCONNECTED , \NLW_blk0000003e_P<38>_UNCONNECTED , \NLW_blk0000003e_P<37>_UNCONNECTED , 
\NLW_blk0000003e_P<36>_UNCONNECTED , \NLW_blk0000003e_P<35>_UNCONNECTED , \NLW_blk0000003e_P<34>_UNCONNECTED , \NLW_blk0000003e_P<33>_UNCONNECTED , 
\NLW_blk0000003e_P<32>_UNCONNECTED , \NLW_blk0000003e_P<31>_UNCONNECTED , \NLW_blk0000003e_P<30>_UNCONNECTED , \NLW_blk0000003e_P<29>_UNCONNECTED , 
\NLW_blk0000003e_P<28>_UNCONNECTED , \NLW_blk0000003e_P<27>_UNCONNECTED , \NLW_blk0000003e_P<26>_UNCONNECTED , \NLW_blk0000003e_P<25>_UNCONNECTED , 
\NLW_blk0000003e_P<24>_UNCONNECTED , \NLW_blk0000003e_P<23>_UNCONNECTED , \NLW_blk0000003e_P<22>_UNCONNECTED , \NLW_blk0000003e_P<21>_UNCONNECTED , 
\NLW_blk0000003e_P<20>_UNCONNECTED , \NLW_blk0000003e_P<19>_UNCONNECTED , \NLW_blk0000003e_P<18>_UNCONNECTED , \NLW_blk0000003e_P<17>_UNCONNECTED , 
sig00000191, sig00000190, sig0000018f, sig0000018e, sig0000018d, sig0000018c, sig0000018b, sig0000019a, sig00000199, sig00000198, sig00000197, 
sig00000196, sig00000195, sig00000194, sig00000193, sig00000192, sig0000018a}),
    .BCOUT({sig0000009c, sig0000009b, sig0000009a, sig00000099, sig00000098, sig00000097, sig00000096, sig00000095, sig000000a5, sig000000a4, 
sig000000a3, sig000000a2, sig000000a1, sig000000a0, sig0000009f, sig0000009e, sig0000009d, sig00000094})
  );
  DSP48 #(
    .AREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .LEGACY_MODE ( "MULT18X18" ),
    .MREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 0 ),
    .SUBTRACTREG ( 0 ))
  blk0000003f (
    .CARRYIN(sig00000001),
    .CEA(sig00000001),
    .CEB(sig00000001),
    .CEC(sig00000001),
    .CECTRL(sig00000001),
    .CEP(sig00000001),
    .CEM(sig00000001),
    .CECARRYIN(sig00000001),
    .CECINSUB(sig00000001),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTC(sig00000001),
    .RSTCTRL(sig00000001),
    .RSTP(sig00000001),
    .RSTM(sig00000001),
    .RSTCARRYIN(sig00000001),
    .SUBTRACT(sig00000001),
    .A({sig00000001, a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .PCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .B({sig00000001, b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .C({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001}),
    .CARRYINSEL({sig00000001, sig00000001}),
    .OPMODE({sig00000001, sig00000003, sig00000003, sig00000001, sig00000003, sig00000001, sig00000003}),
    .BCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .PCOUT({sig00000101, sig00000100, sig000000ff, sig000000fe, sig000000fd, sig000000fc, sig000000fb, sig000000fa, sig000000f8, sig000000f7, 
sig000000f6, sig000000f5, sig000000f4, sig000000f3, sig000000f2, sig000000f1, sig000000f0, sig000000ef, sig000000ed, sig000000ec, sig000000eb, 
sig000000ea, sig000000e9, sig000000e8, sig000000e7, sig000000e6, sig000000e5, sig000000e4, sig000000e2, sig000000e1, sig000000e0, sig000000df, 
sig000000de, sig000000dd, sig000000dc, sig000000db, sig000000da, sig000000d9, sig00000107, sig00000106, sig00000105, sig00000104, sig00000103, 
sig00000102, sig000000f9, sig000000ee, sig000000e3, sig000000d8}),
    .P({\NLW_blk0000003f_P<47>_UNCONNECTED , \NLW_blk0000003f_P<46>_UNCONNECTED , \NLW_blk0000003f_P<45>_UNCONNECTED , 
\NLW_blk0000003f_P<44>_UNCONNECTED , \NLW_blk0000003f_P<43>_UNCONNECTED , \NLW_blk0000003f_P<42>_UNCONNECTED , \NLW_blk0000003f_P<41>_UNCONNECTED , 
\NLW_blk0000003f_P<40>_UNCONNECTED , \NLW_blk0000003f_P<39>_UNCONNECTED , \NLW_blk0000003f_P<38>_UNCONNECTED , \NLW_blk0000003f_P<37>_UNCONNECTED , 
\NLW_blk0000003f_P<36>_UNCONNECTED , \NLW_blk0000003f_P<35>_UNCONNECTED , \NLW_blk0000003f_P<34>_UNCONNECTED , \NLW_blk0000003f_P<33>_UNCONNECTED , 
\NLW_blk0000003f_P<32>_UNCONNECTED , \NLW_blk0000003f_P<31>_UNCONNECTED , \NLW_blk0000003f_P<30>_UNCONNECTED , \NLW_blk0000003f_P<29>_UNCONNECTED , 
\NLW_blk0000003f_P<28>_UNCONNECTED , \NLW_blk0000003f_P<27>_UNCONNECTED , \NLW_blk0000003f_P<26>_UNCONNECTED , \NLW_blk0000003f_P<25>_UNCONNECTED , 
\NLW_blk0000003f_P<24>_UNCONNECTED , \NLW_blk0000003f_P<23>_UNCONNECTED , \NLW_blk0000003f_P<22>_UNCONNECTED , \NLW_blk0000003f_P<21>_UNCONNECTED , 
\NLW_blk0000003f_P<20>_UNCONNECTED , \NLW_blk0000003f_P<19>_UNCONNECTED , \NLW_blk0000003f_P<18>_UNCONNECTED , \NLW_blk0000003f_P<17>_UNCONNECTED , 
sig00000180, sig0000017f, sig0000017e, sig0000017d, sig0000017c, sig0000017b, sig0000017a, sig00000189, sig00000188, sig00000187, sig00000186, 
sig00000185, sig00000184, sig00000183, sig00000182, sig00000181, sig00000179}),
    .BCOUT({sig0000008a, sig00000089, sig00000088, sig00000087, sig00000086, sig00000085, sig00000084, sig00000083, sig00000093, sig00000092, 
sig00000091, sig00000090, sig0000008f, sig0000008e, sig0000008d, sig0000008c, sig0000008b, sig00000082})
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .D(sig00000180),
    .Q(sig00000170)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .D(sig0000017f),
    .Q(sig0000016f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .D(sig0000017e),
    .Q(sig0000016e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .D(sig0000017d),
    .Q(sig0000016d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(clk),
    .D(sig0000017c),
    .Q(sig0000016c)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(clk),
    .D(sig0000017b),
    .Q(sig0000016b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000046 (
    .C(clk),
    .D(sig0000017a),
    .Q(sig0000016a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000047 (
    .C(clk),
    .D(sig00000189),
    .Q(sig00000178)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000048 (
    .C(clk),
    .D(sig00000188),
    .Q(sig00000177)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(clk),
    .D(sig00000187),
    .Q(sig00000176)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004a (
    .C(clk),
    .D(sig00000186),
    .Q(sig00000175)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004b (
    .C(clk),
    .D(sig00000185),
    .Q(sig00000174)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004c (
    .C(clk),
    .D(sig00000184),
    .Q(sig00000173)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004d (
    .C(clk),
    .D(sig00000183),
    .Q(sig00000172)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004e (
    .C(clk),
    .D(sig00000182),
    .Q(sig00000171)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(clk),
    .D(sig00000181),
    .Q(sig00000169)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(clk),
    .D(sig00000179),
    .Q(sig00000168)
  );
  MUXCY   blk00000051 (
    .CI(sig00000203),
    .DI(sig00000001),
    .S(sig000001d8),
    .O(sig000001df)
  );
  XORCY   blk00000052 (
    .CI(sig00000203),
    .LI(sig000001d8),
    .O(sig0000021d)
  );
  MUXCY   blk00000053 (
    .CI(sig000001df),
    .DI(sig00000001),
    .S(sig000001d9),
    .O(sig000001e0)
  );
  XORCY   blk00000054 (
    .CI(sig000001df),
    .LI(sig000001d9),
    .O(sig0000021e)
  );
  MUXCY   blk00000055 (
    .CI(sig000001e0),
    .DI(sig00000001),
    .S(sig000001da),
    .O(sig000001e1)
  );
  XORCY   blk00000056 (
    .CI(sig000001e0),
    .LI(sig000001da),
    .O(sig0000021f)
  );
  MUXCY   blk00000057 (
    .CI(sig000001e1),
    .DI(sig00000001),
    .S(sig000001db),
    .O(sig000001e2)
  );
  XORCY   blk00000058 (
    .CI(sig000001e1),
    .LI(sig000001db),
    .O(sig00000220)
  );
  MUXCY   blk00000059 (
    .CI(sig000001e2),
    .DI(sig00000001),
    .S(sig000001dc),
    .O(sig000001e3)
  );
  XORCY   blk0000005a (
    .CI(sig000001e2),
    .LI(sig000001dc),
    .O(sig00000221)
  );
  MUXCY   blk0000005b (
    .CI(sig000001e3),
    .DI(sig00000001),
    .S(sig000001dd),
    .O(sig000001e4)
  );
  XORCY   blk0000005c (
    .CI(sig000001e3),
    .LI(sig000001dd),
    .O(sig00000222)
  );
  MUXCY   blk0000005d (
    .CI(sig000001e4),
    .DI(sig00000001),
    .S(sig000001de),
    .O(sig000001e5)
  );
  XORCY   blk0000005e (
    .CI(sig000001e4),
    .LI(sig000001de),
    .O(sig00000223)
  );
  XORCY   blk0000005f (
    .CI(sig000001e5),
    .LI(sig00000202),
    .O(sig00000224)
  );
  MUXCY   blk00000060 (
    .CI(sig00000204),
    .DI(sig00000001),
    .S(sig00000210),
    .O(sig000001f3)
  );
  XORCY   blk00000061 (
    .CI(sig00000204),
    .LI(sig00000210),
    .O(sig00000228)
  );
  MUXCY   blk00000062 (
    .CI(sig000001f3),
    .DI(sig00000001),
    .S(sig00000212),
    .O(sig000001f4)
  );
  XORCY   blk00000063 (
    .CI(sig000001f3),
    .LI(sig00000212),
    .O(sig00000229)
  );
  MUXCY   blk00000064 (
    .CI(sig000001f4),
    .DI(sig00000001),
    .S(sig00000213),
    .O(sig000001f5)
  );
  XORCY   blk00000065 (
    .CI(sig000001f4),
    .LI(sig00000213),
    .O(sig0000022a)
  );
  MUXCY   blk00000066 (
    .CI(sig000001f5),
    .DI(sig00000001),
    .S(sig00000214),
    .O(sig000001f6)
  );
  XORCY   blk00000067 (
    .CI(sig000001f5),
    .LI(sig00000214),
    .O(sig0000022b)
  );
  MUXCY   blk00000068 (
    .CI(sig000001f6),
    .DI(sig00000001),
    .S(sig00000215),
    .O(sig000001f7)
  );
  XORCY   blk00000069 (
    .CI(sig000001f6),
    .LI(sig00000215),
    .O(sig0000022c)
  );
  MUXCY   blk0000006a (
    .CI(sig000001f7),
    .DI(sig00000001),
    .S(sig00000216),
    .O(sig000001f8)
  );
  XORCY   blk0000006b (
    .CI(sig000001f7),
    .LI(sig00000216),
    .O(sig0000022d)
  );
  MUXCY   blk0000006c (
    .CI(sig000001f8),
    .DI(sig00000001),
    .S(sig00000217),
    .O(sig000001f9)
  );
  XORCY   blk0000006d (
    .CI(sig000001f8),
    .LI(sig00000217),
    .O(sig0000022e)
  );
  MUXCY   blk0000006e (
    .CI(sig000001f9),
    .DI(sig00000001),
    .S(sig00000218),
    .O(sig000001fa)
  );
  XORCY   blk0000006f (
    .CI(sig000001f9),
    .LI(sig00000218),
    .O(sig0000022f)
  );
  MUXCY   blk00000070 (
    .CI(sig000001fa),
    .DI(sig00000001),
    .S(sig00000219),
    .O(sig000001fb)
  );
  XORCY   blk00000071 (
    .CI(sig000001fa),
    .LI(sig00000219),
    .O(sig00000231)
  );
  MUXCY   blk00000072 (
    .CI(sig000001fb),
    .DI(sig00000001),
    .S(sig0000021a),
    .O(sig000001f1)
  );
  XORCY   blk00000073 (
    .CI(sig000001fb),
    .LI(sig0000021a),
    .O(sig00000232)
  );
  MUXCY   blk00000074 (
    .CI(sig000001f1),
    .DI(sig00000001),
    .S(sig00000211),
    .O(sig000001f2)
  );
  XORCY   blk00000075 (
    .CI(sig000001f1),
    .LI(sig00000211),
    .O(sig00000233)
  );
  MUXCY   blk00000076 (
    .CI(sig000001f2),
    .DI(sig00000003),
    .S(sig0000021c),
    .O(sig00000203)
  );
  XORCY   blk00000077 (
    .CI(sig000001f2),
    .LI(sig0000021c),
    .O(NLW_blk00000077_O_UNCONNECTED)
  );
  MUXCY   blk00000078 (
    .CI(sig0000021b),
    .DI(sig00000001),
    .S(sig000001ff),
    .O(sig000001e8)
  );
  XORCY   blk00000079 (
    .CI(sig0000021b),
    .LI(sig000001ff),
    .O(sig00000225)
  );
  MUXCY   blk0000007a (
    .CI(sig000001e8),
    .DI(sig00000001),
    .S(sig00000207),
    .O(sig000001e9)
  );
  XORCY   blk0000007b (
    .CI(sig000001e8),
    .LI(sig00000207),
    .O(sig00000230)
  );
  MUXCY   blk0000007c (
    .CI(sig000001e9),
    .DI(sig00000001),
    .S(sig00000208),
    .O(sig000001ea)
  );
  XORCY   blk0000007d (
    .CI(sig000001e9),
    .LI(sig00000208),
    .O(sig00000234)
  );
  MUXCY   blk0000007e (
    .CI(sig000001ea),
    .DI(sig00000001),
    .S(sig00000209),
    .O(sig000001eb)
  );
  XORCY   blk0000007f (
    .CI(sig000001ea),
    .LI(sig00000209),
    .O(sig00000235)
  );
  MUXCY   blk00000080 (
    .CI(sig000001eb),
    .DI(sig00000001),
    .S(sig0000020a),
    .O(sig000001ec)
  );
  XORCY   blk00000081 (
    .CI(sig000001eb),
    .LI(sig0000020a),
    .O(sig00000236)
  );
  MUXCY   blk00000082 (
    .CI(sig000001ec),
    .DI(sig00000001),
    .S(sig0000020b),
    .O(sig000001ed)
  );
  XORCY   blk00000083 (
    .CI(sig000001ec),
    .LI(sig0000020b),
    .O(sig00000237)
  );
  MUXCY   blk00000084 (
    .CI(sig000001ed),
    .DI(sig00000001),
    .S(sig0000020c),
    .O(sig000001ee)
  );
  XORCY   blk00000085 (
    .CI(sig000001ed),
    .LI(sig0000020c),
    .O(sig00000238)
  );
  MUXCY   blk00000086 (
    .CI(sig000001ee),
    .DI(sig00000001),
    .S(sig0000020d),
    .O(sig000001ef)
  );
  XORCY   blk00000087 (
    .CI(sig000001ee),
    .LI(sig0000020d),
    .O(sig00000239)
  );
  MUXCY   blk00000088 (
    .CI(sig000001ef),
    .DI(sig00000001),
    .S(sig0000020e),
    .O(sig000001f0)
  );
  XORCY   blk00000089 (
    .CI(sig000001ef),
    .LI(sig0000020e),
    .O(sig0000023a)
  );
  MUXCY   blk0000008a (
    .CI(sig000001f0),
    .DI(sig00000001),
    .S(sig0000020f),
    .O(sig000001e6)
  );
  XORCY   blk0000008b (
    .CI(sig000001f0),
    .LI(sig0000020f),
    .O(sig0000023b)
  );
  MUXCY   blk0000008c (
    .CI(sig000001e6),
    .DI(sig00000001),
    .S(sig00000205),
    .O(sig000001e7)
  );
  XORCY   blk0000008d (
    .CI(sig000001e6),
    .LI(sig00000205),
    .O(sig00000226)
  );
  MUXCY   blk0000008e (
    .CI(sig000001e7),
    .DI(sig00000001),
    .S(sig00000206),
    .O(sig00000204)
  );
  XORCY   blk0000008f (
    .CI(sig000001e7),
    .LI(sig00000206),
    .O(sig00000227)
  );
  MUXCY   blk00000090 (
    .CI(sig000001fd),
    .DI(sig00000001),
    .S(sig00000200),
    .O(sig0000021b)
  );
  MUXCY   blk00000091 (
    .CI(sig000001fc),
    .DI(sig00000003),
    .S(sig00000201),
    .O(sig000001fd)
  );
  MUXCY   blk00000092 (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig000001fe),
    .O(sig000001fc)
  );
  MUXCY   blk00000093 (
    .CI(sig00000027),
    .DI(sig00000001),
    .S(sig0000002d),
    .O(sig00000052)
  );
  MUXCY   blk00000094 (
    .CI(sig00000026),
    .DI(sig00000001),
    .S(sig0000002c),
    .O(sig00000027)
  );
  MUXCY   blk00000095 (
    .CI(sig00000025),
    .DI(sig00000001),
    .S(sig0000002b),
    .O(sig00000026)
  );
  MUXCY   blk00000096 (
    .CI(sig00000024),
    .DI(sig00000001),
    .S(sig0000002a),
    .O(sig00000025)
  );
  MUXCY   blk00000097 (
    .CI(sig00000023),
    .DI(sig00000001),
    .S(sig00000029),
    .O(sig00000024)
  );
  MUXCY   blk00000098 (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig00000028),
    .O(sig00000023)
  );
  MUXCY   blk00000099 (
    .CI(sig00000016),
    .DI(sig00000001),
    .S(sig0000001c),
    .O(sig00000047)
  );
  MUXCY   blk0000009a (
    .CI(sig00000015),
    .DI(sig00000001),
    .S(sig0000001b),
    .O(sig00000016)
  );
  MUXCY   blk0000009b (
    .CI(sig00000014),
    .DI(sig00000001),
    .S(sig0000001a),
    .O(sig00000015)
  );
  MUXCY   blk0000009c (
    .CI(sig00000013),
    .DI(sig00000001),
    .S(sig00000019),
    .O(sig00000014)
  );
  MUXCY   blk0000009d (
    .CI(sig00000012),
    .DI(sig00000001),
    .S(sig00000018),
    .O(sig00000013)
  );
  MUXCY   blk0000009e (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig00000017),
    .O(sig00000012)
  );
  MUXCY   blk0000009f (
    .CI(sig00000003),
    .DI(b[23]),
    .S(sig00000048),
    .O(sig0000002e)
  );
  XORCY   blk000000a0 (
    .CI(sig00000003),
    .LI(sig00000048),
    .O(sig00000053)
  );
  MUXCY   blk000000a1 (
    .CI(sig0000002e),
    .DI(b[24]),
    .S(sig00000049),
    .O(sig0000002f)
  );
  XORCY   blk000000a2 (
    .CI(sig0000002e),
    .LI(sig00000049),
    .O(sig00000054)
  );
  MUXCY   blk000000a3 (
    .CI(sig0000002f),
    .DI(b[25]),
    .S(sig0000004a),
    .O(sig00000030)
  );
  XORCY   blk000000a4 (
    .CI(sig0000002f),
    .LI(sig0000004a),
    .O(sig00000055)
  );
  MUXCY   blk000000a5 (
    .CI(sig00000030),
    .DI(b[26]),
    .S(sig0000004b),
    .O(sig00000031)
  );
  XORCY   blk000000a6 (
    .CI(sig00000030),
    .LI(sig0000004b),
    .O(sig00000056)
  );
  MUXCY   blk000000a7 (
    .CI(sig00000031),
    .DI(b[27]),
    .S(sig0000004c),
    .O(sig00000032)
  );
  XORCY   blk000000a8 (
    .CI(sig00000031),
    .LI(sig0000004c),
    .O(sig00000057)
  );
  MUXCY   blk000000a9 (
    .CI(sig00000032),
    .DI(b[28]),
    .S(sig0000004d),
    .O(sig00000033)
  );
  XORCY   blk000000aa (
    .CI(sig00000032),
    .LI(sig0000004d),
    .O(sig00000058)
  );
  MUXCY   blk000000ab (
    .CI(sig00000033),
    .DI(b[29]),
    .S(sig0000004e),
    .O(sig00000034)
  );
  XORCY   blk000000ac (
    .CI(sig00000033),
    .LI(sig0000004e),
    .O(sig00000059)
  );
  MUXCY   blk000000ad (
    .CI(sig00000034),
    .DI(b[30]),
    .S(sig0000004f),
    .O(sig0000005b)
  );
  XORCY   blk000000ae (
    .CI(sig00000034),
    .LI(sig0000004f),
    .O(sig0000005a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000af (
    .C(clk),
    .D(sig00000053),
    .Q(sig00000035)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b0 (
    .C(clk),
    .D(sig00000054),
    .Q(sig00000036)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b1 (
    .C(clk),
    .D(sig00000055),
    .Q(sig00000037)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b2 (
    .C(clk),
    .D(sig00000056),
    .Q(sig00000038)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b3 (
    .C(clk),
    .D(sig00000057),
    .Q(sig00000039)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b4 (
    .C(clk),
    .D(sig00000058),
    .Q(sig0000003a)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b5 (
    .C(clk),
    .D(sig00000059),
    .Q(sig0000003b)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000b6 (
    .C(clk),
    .D(sig0000005a),
    .Q(sig0000003c)
  );
  MUXCY   blk000000b7 (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig00000010),
    .O(sig0000000f)
  );
  MUXCY   blk000000b8 (
    .CI(sig0000000f),
    .DI(sig00000001),
    .S(sig00000011),
    .O(sig00000046)
  );
  MUXCY   blk000000b9 (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig0000000d),
    .O(sig0000000c)
  );
  MUXCY   blk000000ba (
    .CI(sig0000000c),
    .DI(sig00000001),
    .S(sig0000000e),
    .O(sig00000045)
  );
  MUXCY   blk000000bb (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig00000021),
    .O(sig00000020)
  );
  MUXCY   blk000000bc (
    .CI(sig00000020),
    .DI(sig00000001),
    .S(sig00000022),
    .O(sig00000051)
  );
  MUXCY   blk000000bd (
    .CI(sig00000003),
    .DI(sig00000001),
    .S(sig0000001e),
    .O(sig0000001d)
  );
  MUXCY   blk000000be (
    .CI(sig0000001d),
    .DI(sig00000001),
    .S(sig0000001f),
    .O(sig00000050)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000bf (
    .C(clk),
    .D(sig0000005c),
    .Q(sig0000003f)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c0 (
    .C(clk),
    .D(sig0000005d),
    .Q(sig00000042)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000c1 (
    .C(clk),
    .CE(sig00000003),
    .D(sig00000063),
    .Q(sig0000003d)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk000000c2 (
    .C(clk),
    .D(sig00000066),
    .Q(sig00000044)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000c3 (
    .I0(b[22]),
    .I1(b[21]),
    .I2(b[20]),
    .O(sig0000002d)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk000000c4 (
    .I0(a[22]),
    .I1(a[21]),
    .I2(a[20]),
    .O(sig0000001c)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000c5 (
    .I0(a[28]),
    .I1(a[27]),
    .I2(a[30]),
    .I3(a[29]),
    .O(sig0000000e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000c6 (
    .I0(b[17]),
    .I1(b[16]),
    .I2(b[19]),
    .I3(b[18]),
    .O(sig0000002c)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000c7 (
    .I0(a[17]),
    .I1(a[16]),
    .I2(a[19]),
    .I3(a[18]),
    .O(sig0000001b)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000c8 (
    .I0(a[24]),
    .I1(a[23]),
    .I2(a[26]),
    .I3(a[25]),
    .O(sig0000000d)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000c9 (
    .I0(b[13]),
    .I1(b[12]),
    .I2(b[15]),
    .I3(b[14]),
    .O(sig0000002b)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ca (
    .I0(a[13]),
    .I1(a[12]),
    .I2(a[15]),
    .I3(a[14]),
    .O(sig0000001a)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000cb (
    .I0(b[9]),
    .I1(b[8]),
    .I2(b[11]),
    .I3(b[10]),
    .O(sig0000002a)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000cc (
    .I0(a[9]),
    .I1(a[8]),
    .I2(a[11]),
    .I3(a[10]),
    .O(sig00000019)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000cd (
    .I0(b[5]),
    .I1(b[4]),
    .I2(b[7]),
    .I3(b[6]),
    .O(sig00000029)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ce (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[7]),
    .I3(a[6]),
    .O(sig00000018)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000cf (
    .I0(b[1]),
    .I1(b[0]),
    .I2(b[3]),
    .I3(b[2]),
    .O(sig00000028)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000d0 (
    .I0(a[1]),
    .I1(a[0]),
    .I2(a[3]),
    .I3(a[2]),
    .O(sig00000017)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d1 (
    .I0(b[30]),
    .I1(a[30]),
    .O(sig0000004f)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000d2 (
    .I0(b[28]),
    .I1(b[27]),
    .I2(b[30]),
    .I3(b[29]),
    .O(sig00000022)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000d3 (
    .I0(b[28]),
    .I1(b[27]),
    .I2(b[30]),
    .I3(b[29]),
    .O(sig0000001f)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000d4 (
    .I0(a[28]),
    .I1(a[27]),
    .I2(a[30]),
    .I3(a[29]),
    .O(sig00000011)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000d5 (
    .I0(b[29]),
    .I1(a[29]),
    .O(sig0000004e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000d6 (
    .I0(b[24]),
    .I1(b[23]),
    .I2(b[26]),
    .I3(b[25]),
    .O(sig00000021)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000d7 (
    .I0(b[24]),
    .I1(b[23]),
    .I2(b[26]),
    .I3(b[25]),
    .O(sig0000001e)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000d8 (
    .I0(a[24]),
    .I1(a[23]),
    .I2(a[26]),
    .I3(a[25]),
    .O(sig00000010)
  );
  LUT4 #(
    .INIT ( 16'hA2A7 ))
  blk000000d9 (
    .I0(sig00000045),
    .I1(sig00000047),
    .I2(sig00000051),
    .I3(sig00000046),
    .O(sig00000002)
  );
  LUT4 #(
    .INIT ( 16'hFF8C ))
  blk000000da (
    .I0(sig00000051),
    .I1(sig00000045),
    .I2(sig00000047),
    .I3(sig00000046),
    .O(sig00000004)
  );
  LUT4 #(
    .INIT ( 16'h085D ))
  blk000000db (
    .I0(sig00000050),
    .I1(sig00000052),
    .I2(sig00000004),
    .I3(sig00000002),
    .O(sig00000066)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000dc (
    .I0(b[28]),
    .I1(a[28]),
    .O(sig0000004d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000dd (
    .I0(b[27]),
    .I1(a[27]),
    .O(sig0000004c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000de (
    .I0(b[26]),
    .I1(a[26]),
    .O(sig0000004b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000df (
    .I0(b[25]),
    .I1(a[25]),
    .O(sig0000004a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e0 (
    .I0(b[24]),
    .I1(a[24]),
    .O(sig00000049)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000e1 (
    .I0(b[23]),
    .I1(a[23]),
    .O(sig00000048)
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  blk000000e2 (
    .I0(sig0000005a),
    .I1(sig0000005b),
    .I2(sig00000053),
    .I3(sig0000003e),
    .O(sig0000005c)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e3 (
    .I0(sig00000057),
    .I1(sig00000056),
    .I2(sig00000055),
    .I3(sig00000054),
    .O(sig00000007)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e4 (
    .I0(sig0000005b),
    .I1(sig00000059),
    .I2(sig00000058),
    .I3(sig00000007),
    .O(sig0000003e)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk000000e5 (
    .I0(sig0000019e),
    .I1(sig0000019d),
    .I2(sig0000019f),
    .O(sig00000211)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000e6 (
    .I0(sig0000019c),
    .I1(sig0000019d),
    .I2(sig0000019f),
    .O(sig0000021a)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000e7 (
    .I0(sig000001be),
    .I1(sig0000019c),
    .I2(sig0000019f),
    .O(sig00000219)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000e8 (
    .I0(sig000001bd),
    .I1(sig000001be),
    .I2(sig0000019f),
    .O(sig00000218)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000e9 (
    .I0(sig000001bc),
    .I1(sig000001bd),
    .I2(sig0000019f),
    .O(sig00000217)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000ea (
    .I0(sig000001bb),
    .I1(sig000001bc),
    .I2(sig0000019f),
    .O(sig00000216)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000eb (
    .I0(sig000001ba),
    .I1(sig000001bb),
    .I2(sig0000019f),
    .O(sig00000215)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000ec (
    .I0(sig000001b9),
    .I1(sig000001ba),
    .I2(sig0000019f),
    .O(sig00000214)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000ed (
    .I0(sig000001b8),
    .I1(sig000001b9),
    .I2(sig0000019f),
    .O(sig00000213)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000ee (
    .I0(sig000001b1),
    .I1(sig000001b8),
    .I2(sig0000019f),
    .O(sig00000212)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000ef (
    .I0(sig000001a6),
    .I1(sig000001b1),
    .I2(sig0000019f),
    .O(sig00000210)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f0 (
    .I0(sig0000019b),
    .I1(sig000001a6),
    .I2(sig0000019f),
    .O(sig00000206)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f1 (
    .I0(sig00000191),
    .I1(sig0000019b),
    .I2(sig0000019f),
    .O(sig00000205)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f2 (
    .I0(sig00000190),
    .I1(sig00000191),
    .I2(sig0000019f),
    .O(sig0000020f)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f3 (
    .I0(sig0000018f),
    .I1(sig00000190),
    .I2(sig0000019f),
    .O(sig0000020e)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f4 (
    .I0(sig0000018e),
    .I1(sig0000018f),
    .I2(sig0000019f),
    .O(sig0000020d)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f5 (
    .I0(sig0000018d),
    .I1(sig0000018e),
    .I2(sig0000019f),
    .O(sig0000020c)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f6 (
    .I0(sig0000018c),
    .I1(sig0000018d),
    .I2(sig0000019f),
    .O(sig0000020b)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f7 (
    .I0(sig0000018b),
    .I1(sig0000018c),
    .I2(sig0000019f),
    .O(sig0000020a)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f8 (
    .I0(sig0000019a),
    .I1(sig0000018b),
    .I2(sig0000019f),
    .O(sig00000209)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000f9 (
    .I0(sig00000199),
    .I1(sig0000019a),
    .I2(sig0000019f),
    .O(sig00000208)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk000000fa (
    .I0(sig00000198),
    .I1(sig00000199),
    .I2(sig0000019f),
    .O(sig00000207)
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  blk000000fb (
    .I0(sig00000197),
    .I1(sig00000196),
    .I2(sig0000019f),
    .O(sig00000200)
  );
  LUT4 #(
    .INIT ( 16'h40C0 ))
  blk000000fc (
    .I0(sig00000196),
    .I1(sig000001c2),
    .I2(sig000001c3),
    .I3(sig0000019f),
    .O(sig00000201)
  );
  LUT4 #(
    .INIT ( 16'hFF10 ))
  blk000000fd (
    .I0(sig00000040),
    .I1(sig00000044),
    .I2(sig0000003f),
    .I3(sig00000043),
    .O(sig00000008)
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  blk000000fe (
    .I0(sig00000040),
    .I1(sig00000044),
    .I2(sig00000043),
    .O(sig00000009)
  );
  LUT4 #(
    .INIT ( 16'hD8F0 ))
  blk000000ff (
    .I0(sig00000041),
    .I1(sig00000009),
    .I2(sig00000008),
    .I3(sig0000019f),
    .O(sig00000256)
  );
  LUT3 #(
    .INIT ( 8'hEF ))
  blk00000100 (
    .I0(sig00000043),
    .I1(sig00000044),
    .I2(sig00000042),
    .O(sig00000067)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk00000101 (
    .I0(sig00000197),
    .I1(sig00000198),
    .I2(sig0000019f),
    .O(sig000001fe)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk00000102 (
    .I0(sig0000025a),
    .I1(sig00000256),
    .O(sig00000257)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk00000103 (
    .I0(sig0000025a),
    .I1(sig00000256),
    .O(sig00000259)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000104 (
    .I0(sig00000043),
    .I1(sig00000042),
    .I2(sig00000040),
    .I3(sig0000003f),
    .O(sig0000000a)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  blk00000105 (
    .I0(sig00000043),
    .I1(sig00000040),
    .I2(sig0000003f),
    .I3(sig00000041),
    .O(sig0000000b)
  );
  LUT4 #(
    .INIT ( 16'hFAEE ))
  blk00000106 (
    .I0(sig00000044),
    .I1(sig0000000a),
    .I2(sig0000000b),
    .I3(sig0000019f),
    .O(sig0000025a)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000107 (
    .C(clk),
    .D(sig0000005e),
    .R(sig0000005b),
    .Q(sig00000040)
  );
  FDR #(
    .INIT ( 1'b0 ))
  blk00000108 (
    .C(clk),
    .D(sig0000005f),
    .R(sig00000053),
    .Q(sig00000041)
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk00000109 (
    .I0(sig0000003e),
    .I1(sig0000005a),
    .O(sig0000005f)
  );
  FDS #(
    .INIT ( 1'b0 ))
  blk0000010a (
    .C(clk),
    .D(sig00000045),
    .S(sig00000050),
    .Q(sig00000043)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010b (
    .I0(sig00000035),
    .O(sig000001d8)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010c (
    .I0(sig00000036),
    .O(sig000001d9)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010d (
    .I0(sig00000037),
    .O(sig000001da)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010e (
    .I0(sig00000038),
    .O(sig000001db)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000010f (
    .I0(sig00000039),
    .O(sig000001dc)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000110 (
    .I0(sig0000003a),
    .O(sig000001dd)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk00000111 (
    .I0(sig0000003b),
    .O(sig000001de)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  blk00000112 (
    .I0(sig00000197),
    .I1(sig00000198),
    .I2(sig0000019f),
    .O(sig000001ff)
  );
  LUT4 #(
    .INIT ( 16'h00E0 ))
  blk00000113 (
    .I0(sig00000067),
    .I1(sig00000005),
    .I2(sig0000025a),
    .I3(sig00000256),
    .O(sig00000258)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000114 (
    .I0(sig0000003f),
    .I1(sig00000040),
    .I2(sig0000019f),
    .O(sig00000005)
  );
  LUT4 #(
    .INIT ( 16'h1131 ))
  blk00000115 (
    .I0(sig00000050),
    .I1(sig00000006),
    .I2(sig00000052),
    .I3(sig00000046),
    .O(sig00000063)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000116 (
    .C(clk),
    .D(sig000001c4),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000117 (
    .C(clk),
    .D(sig000001cf),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000118 (
    .C(clk),
    .D(sig000001d0),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000119 (
    .C(clk),
    .D(sig000001d1),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011a (
    .C(clk),
    .D(sig000001d2),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011b (
    .C(clk),
    .D(sig000001d3),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011c (
    .C(clk),
    .D(sig000001d4),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011d (
    .C(clk),
    .D(sig000001d5),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011e (
    .C(clk),
    .D(sig000001d6),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000011f (
    .C(clk),
    .D(sig000001d7),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000120 (
    .C(clk),
    .D(sig000001c5),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000121 (
    .C(clk),
    .D(sig000001c6),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000122 (
    .C(clk),
    .D(sig000001c7),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000123 (
    .C(clk),
    .D(sig000001c8),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000124 (
    .C(clk),
    .D(sig000001c9),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000125 (
    .C(clk),
    .D(sig000001ca),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000126 (
    .C(clk),
    .D(sig000001cb),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000127 (
    .C(clk),
    .D(sig000001cc),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000128 (
    .C(clk),
    .D(sig000001cd),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000129 (
    .C(clk),
    .D(sig000001ce),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [19])
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000012a (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000225),
    .O(sig000001c4)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000012b (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000230),
    .O(sig000001cf)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000012c (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000234),
    .O(sig000001d0)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000012d (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000235),
    .O(sig000001d1)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000012e (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000236),
    .O(sig000001d2)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000012f (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000237),
    .O(sig000001d3)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000130 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000238),
    .O(sig000001d4)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000131 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000239),
    .O(sig000001d5)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000132 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000023a),
    .O(sig000001d6)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000133 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000023b),
    .O(sig000001d7)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000134 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000226),
    .O(sig000001c5)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000135 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000022f),
    .O(sig000001ce)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000136 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000022e),
    .O(sig000001cd)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000137 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000022d),
    .O(sig000001cc)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000138 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000022c),
    .O(sig000001cb)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk00000139 (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000022b),
    .O(sig000001ca)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000013a (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig0000022a),
    .O(sig000001c9)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000013b (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000229),
    .O(sig000001c8)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000013c (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000228),
    .O(sig000001c7)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  blk0000013d (
    .I0(sig00000256),
    .I1(sig0000025a),
    .I2(sig00000227),
    .O(sig000001c6)
  );
  INV   blk0000013e (
    .I(sig0000003c),
    .O(sig00000202)
  );
  INV   blk0000013f (
    .I(sig0000019f),
    .O(sig0000021c)
  );
  INV   blk00000140 (
    .I(sig0000005a),
    .O(sig0000005e)
  );
  LUT4 #(
    .INIT ( 16'h0010 ))
  blk00000141 (
    .I0(sig00000053),
    .I1(sig00000059),
    .I2(sig0000005a),
    .I3(sig00000058),
    .O(sig00000061)
  );
  MUXF5   blk00000142 (
    .I0(sig00000061),
    .I1(sig00000001),
    .S(sig0000005b),
    .O(sig00000060)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk00000143 (
    .I0(sig00000057),
    .I1(sig00000056),
    .I2(sig00000055),
    .I3(sig00000054),
    .O(sig00000062)
  );
  MUXF5   blk00000144 (
    .I0(sig00000001),
    .I1(sig00000062),
    .S(sig00000060),
    .O(sig0000005d)
  );
  LUT3 #(
    .INIT ( 8'hF9 ))
  blk00000145 (
    .I0(a[31]),
    .I1(b[31]),
    .I2(sig00000045),
    .O(sig00000064)
  );
  LUT4 #(
    .INIT ( 16'h99F9 ))
  blk00000146 (
    .I0(b[31]),
    .I1(a[31]),
    .I2(sig00000045),
    .I3(sig00000047),
    .O(sig00000065)
  );
  MUXF5   blk00000147 (
    .I0(sig00000065),
    .I1(sig00000064),
    .S(sig00000051),
    .O(sig00000006)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000002b  (
    .C(clk),
    .D(sig00000180),
    .Q(\blk0000001a/sig00000276 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000002a  (
    .C(clk),
    .D(sig0000017f),
    .Q(\blk0000001a/sig00000275 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000029  (
    .C(clk),
    .D(sig0000017e),
    .Q(\blk0000001a/sig00000274 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000028  (
    .C(clk),
    .D(sig0000017d),
    .Q(\blk0000001a/sig00000273 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000027  (
    .C(clk),
    .D(sig0000017c),
    .Q(\blk0000001a/sig00000272 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000026  (
    .C(clk),
    .D(sig0000017b),
    .Q(\blk0000001a/sig00000271 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000025  (
    .C(clk),
    .D(sig0000017a),
    .Q(\blk0000001a/sig00000270 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000024  (
    .C(clk),
    .D(sig00000189),
    .Q(\blk0000001a/sig0000027f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000023  (
    .C(clk),
    .D(sig00000188),
    .Q(\blk0000001a/sig0000027e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000022  (
    .C(clk),
    .D(sig00000187),
    .Q(\blk0000001a/sig0000027d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000021  (
    .C(clk),
    .D(sig00000186),
    .Q(\blk0000001a/sig0000027c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk00000020  (
    .C(clk),
    .D(sig00000185),
    .Q(\blk0000001a/sig0000027b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000001f  (
    .C(clk),
    .D(sig00000184),
    .Q(\blk0000001a/sig0000027a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000001e  (
    .C(clk),
    .D(sig00000183),
    .Q(\blk0000001a/sig00000279 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000001d  (
    .C(clk),
    .D(sig00000182),
    .Q(\blk0000001a/sig00000278 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000001c  (
    .C(clk),
    .D(sig00000181),
    .Q(\blk0000001a/sig00000277 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000001a/blk0000001b  (
    .C(clk),
    .D(sig00000179),
    .Q(\blk0000001a/sig0000026f )
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
