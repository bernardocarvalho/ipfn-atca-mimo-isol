//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IPFN - IST 
// Engineer: B. Carvalho
// 
// Create Date:    13:47:38 26/05/2014 
// 
// Design Name: 
// Module Name:    ADC_DAQ_pkg 
// Project Name:   W7X_INTLCK_FP
// Target Devices: 
// Tool versions: 
// Description:  General definitions for other modules
//
// Copyright 2015 - 2018 IPFN-Instituto Superior Tecnico, Portugal
// Creation Date  2015-06-10
//
// Licensed under the EUPL, Version 1.2 or - as soon they
// will be approved by the European Commission - subsequent
// versions of the EUPL (the "Licence");
// You may not use this work except in compliance with the
// Licence.
// You may obtain a copy of the Licence at:
//
// https://joinup.ec.europa.eu/software/page/eupl
//
// Unless required by applicable law or agreed to in
// writing, software distributed under the Licence is
// distributed on an "AS IS" basis,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied.
// See the Licence for the specific language governing
// permissions and limitations under the Licence.
//
//
//////////////////////////////////////////////////////////////////////////////////
parameter FW_VERSION = 8'hB1;

parameter MEM32_bar =  2'b01; // BAR 0
parameter BAR0 =  MEM32_bar;
parameter BAR1 =  2'b00;
parameter BAR1_10_8 =  3'b000;

parameter N_ADC_CHANNELS  = 6;
parameter N_ADC_UCF_CHANNELS  = 16;
parameter N_INT_CHANNELS  = 6;
parameter N_DSP_CHANNELS  = 6;
parameter N_DAC_CHANNELS  = 8;

parameter PCIE_DATA_WIDTH = 32;
parameter ADC_DATA_WIDTH = 18;
parameter DAC_DATA_WIDTH = 16;

//parameter COMMAND_a = {BAR1,1'b0,8'h01};

//Register Address
parameter STATUS_REVID_a = 8'd0;
parameter COMMAND_a = 8'd1;
parameter ACQFREQ_a = 8'd2;
//parameter DMA_REG_a = 8'd3;  
parameter DMA_CURR_BUFF_a = 8'd4; //addr 0x10
parameter HW_COUNTER_a = 8'd5; 

// reserved
parameter DMA_BUFF_0_a = 8'd8;    // addr 0x20
parameter DMA_BUFF_1_a = 8'd9;
parameter DMA_BUFF_2_a = 8'd10;
parameter DMA_BUFF_3_a = 8'd11;
parameter DMA_BUFF_4_a = 8'd12;
parameter DMA_BUFF_5_a = 8'd13;
parameter DMA_BUFF_6_a = 8'd14;
parameter DMA_BUFF_7_a = 8'd15;
parameter DMA_BUFF_8_a = 8'd16;
parameter DMA_BUFF_9_a = 8'd17;
parameter DMA_BUFF_10_a = 8'd18;
parameter DMA_BUFF_11_a = 8'd19;
parameter DMA_BUFF_12_a = 8'd20;
parameter DMA_BUFF_13_a = 8'd21;
parameter DMA_BUFF_14_a = 8'd22;
parameter DMA_BUFF_15_a = 8'd23;
parameter N_BYTES_a     = 8'd24;
//parameter DMA_THRES_BYTES_a = 8'd25; // "Almost empty Flag" thres. Register

//Read write register addresses for DACs
parameter DAC_1_a = 8'd30;
parameter DAC_2_a = 8'd31;
parameter DAC_3_a = 8'd32;
parameter DAC_4_a = 8'd33;
parameter DAC_5_a = 8'd34;
parameter DAC_6_a = 8'd35;
parameter DAC_7_a = 8'd36;
parameter DAC_8_a = 8'd37;

parameter CHOP_MAX_COUNT_a    = 8'd40;
parameter CHOP_CHANGE_COUNT_a = 8'd41;

parameter HOLD_SAMPLES = 3; // Ignore 3 samples in Integral calculation for spike removal

//parameter INTEGR_DECIM_a= 8'd42;

parameter REG_OFFSET_a  = 8'd50;
parameter REG_DATA_a    = 8'd51;

//parameter MEM_INIT_ADDR_a = 8'd25;

parameter BAR0_reg_a = {MEM32_bar,1'b0,8'h00};

// 1 DW = 4 bytes
//parameter DMA_DW_SIZE = 6'h20; // num of DW per TLP
parameter DMA_TLP_SIZE = 6'd32; // num of DW per TLP (128 B)
//parameter DMA_TLP_SIZE = 11'd1024; // (1024 * 32DW = 131072 : 128k) num packets per dma (between interrupts)
//parameter DMA_TLP_BURST = 6'd32; // (32 * 32DW = 4k) num packets per " burst " of dma,  not used
// num packets per dma ( 32 * 32DW = 4096 = Linux page) NOTE: must change ddr2_ff_out's prog_empty also
// Command registers bit fields
// 5-bit selector
//parameter RSTDCM           = 5'd0; // Reset DCMs
parameter ENDIAN_DMA_BIT	= 5'd8; //Endianness of DMA data words	(0:little , 1: Big Endian)
parameter CHOP_ON_BIT          = 5'd10; // State of Chop, if equals 1 chop is ON if 0 it is OFF
parameter CHOP_DEFAULT_BIT     = 5'd11; // Value of Chop case CHOP_STATE is 0
parameter CHOP_RECONSTRUCT_BIT = 5'd12; // State of Chop Recontruction, if equals 1 chop is ON if 0 it is OFF
//parameter OFFSET_CALC = 5'd13; // 
//parameter INT_CALC			= 5'd14; // Output Integral Values
//parameter DAC_SHFT_BITS		= 5'd15; // DAC MUX command (4 bits)

parameter STREAME_BIT = 5'd19 ; // Streaming enable 
//parameter ACQS = 5'd20; // Aquisitio Source: 0- shared ATCA clocks, 1-internal clocks

parameter ACQE_BIT = 5'd23; 
parameter STRG_BIT = 5'd24; // soft Trigger
