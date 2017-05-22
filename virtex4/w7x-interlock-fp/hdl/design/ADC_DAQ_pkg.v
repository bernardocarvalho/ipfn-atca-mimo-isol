//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IPFN - IST 
// Engineer: B. Carvalho
// 
// Create Date:    13:47:38 26/05/2014 
// 
// Create Date:    17:08:20 01/14/2009 
// Design Name: 
// Module Name:    ADC_DAQ_pkg 
// Project Name: 	 ATCA-IOC DAQ & CONTROL FIRMWARE
// Target Devices: 
// Tool versions: 
// Description:  General definitions for other modules
//			
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
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
//parameter DSP_DATA_WIDTH = 32;

//parameter STATUS_REVID_a = {BAR1,1'b0,8'h00};
//parameter COMMAND_a = {BAR1,1'b0,8'h01};


//Register Address
parameter STATUS_REVID_a = 8'd0;
parameter COMMAND_a = 8'd1;
parameter ACQFREQ_a = 8'd2;
//parameter DMA_REG_a = 8'd3;  //NOT USED
parameter DMA_CURR_BUFF_a = 8'd4; //addr 0x10
parameter HW_COUNTER_a = 8'd5; 
//parameter TRIG_DLY_a = 8'd6; //Trigger Delay
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
parameter DMA_THRES_BYTES_a = 8'd25; // "Almost empty Flag" thres. Register


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
//parameter CHOP_FREQ_a = 8'd43;
parameter INTEGR_DECIM_a= 8'd42;

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
parameter CHOP_ON          = 5'd10; // State of Chop, if equals 1 chop is ON if 0 it is OFF
parameter CHOP_DEFAULT     = 5'd11; // Value of Chop case CHOP_STATE is 0
parameter CHOP_RECONSTRUCT = 5'd12; // State of Chop Recontruction, if equals 1 chop is ON if 0 it is OFF
//parameter OFFSET_CALC = 5'd13; // 
parameter INT_CALC			= 5'd14; // Output Integral Values
parameter DAC_SHFT_BITS		= 5'd15; // DAC MUX command (4 bits)

parameter STREAME = 5'd19;  // Streaming enable (Hugo)
//parameter ACQS = 5'd20; // Aquisitio Source: 0- shared ATCA clocks, 1-internal clocks
//parameter ACQT = 5'd21; 
//parameter ACQK = 5'd22; 
parameter ACQE = 5'd23; 
parameter STRG = 5'd24; // soft Trigger
//parameter TRGS = 5'd25; // Trigger Source: 0- shared on ATCA, 1-internal (soft/hard)
parameter DMAE = 5'd27;
//parameter ACQiE = 5'd31;
parameter DMAiE = 5'd30;


//parameter SYNCTOAQDLY= 7'd5; // delay in ddr_clk ticks between ADC sampling and write ops to account for FIRs and logic
