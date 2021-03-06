`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IPFN - IST 
// Engineer: B. Carvalho
// 
// Design Name: 
// Module Name:    PCIe_packet_gen 
// Project Name:   ATCA-IOC DAQ & CONTROL FIRMWARE
// Target Devices: 
// Tool versions: ISE 14.7
// Description: 
//   ADC res = 22 V/ 2**17 =  0.00016784
//	     INTEGRAL = 2^47 LSB * SAMPLE_PER = 70368744 LSB *sec = 11810 V*sec
//	     INTEGRAL32 = 2^31 LSB * SAMPLE_PER = 1073 LSB *sec = .18 V*sec
//
// Dependencies: 
//				RT_FIFO.xco
//				FpMult32.xco
//				FpAdd32.xco
//				FpSubtract32.xco
//				FP48.xco
//
// Additional Comments: 
//
// Copyright 2015 - 2017 IPFN-Instituto Superior Tecnico, Portugal
// Creation Date   13:47:38 26/05/2014 
// Revision Date:  2018-06-18
//
// Licensed under the EUPL, Version 1.2 or - as soon they
// will be approved by the European Commission - subsequent
// versions of the EUPL (the "Licence");
//
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
///////////////////////////////////////////////////////////////////////////////////
module PCIe_packet_gen(
	 input trn_clk,
	 input pio_reset_n,
	 input ff_clk,
//	 input [31:0] time_counter,
	 input [31:0] command,
	 input PCIe_dma_rd_en,
	 output dma_ready,
	 output [31:0] dma_data_out,
	 output [15:0] dac_out,
	 output interlock_out,

	 input stream_on,
	 input wordSync_n,
	 input acq_on,
	 input trigger_n,

	 input adc_chop_dly,
	 input int_data_hold,
	 // 
	 input [17:0]  data_in_ch1, data_in_ch2,  data_in_ch3, data_in_ch4, data_in_ch5, data_in_ch6, 
  
	 input [15:0] reg_offset,
	 input [31:0] reg_data,
	 input 		  reg_wrt_en,
	 output [31:0] dsp_out
	);

`include "ADC_DAQ_pkg.v"


parameter FIFO_WIDTH = 32;    
parameter FLOAT_WIDTH = 32;
parameter FLOAT_SIGN_BIT = 31;    
parameter INTEGER_WIDTH = 48;    
parameter FRACTIONAL_WIDTH = 16;      
parameter INTEGRAL_WIDTH = INTEGER_WIDTH + FRACTIONAL_WIDTH;    
parameter WO_EXTEND_BITS = INTEGRAL_WIDTH - 32 ;    
parameter REC_EXTEND_BITS = INTEGER_WIDTH - ADC_DATA_WIDTH;   //30

/*********** Function Declarations ***************/
// EO correction and chop phase reconstruction  	
function signed [ADC_DATA_WIDTH-1:0] adc_chop_rec_f;
	 input [ADC_DATA_WIDTH-1:0] adc_data;
    input [ADC_DATA_WIDTH-1:0] off_data;
	 input  chop_phase;	 
	 input  chop_rec;	
		if(chop_rec==1'b1)
			adc_chop_rec_f =  chop_phase ? ($signed(off_data) - $signed(adc_data)) : ($signed(adc_data) - $signed(off_data)); // 1 - neg , 0- pos (no change)
		else
			adc_chop_rec_f = $signed(adc_data) - $signed(off_data); 
  endfunction

// Sign extension 18->32 bits   	
function  [FIFO_WIDTH-1:0] fifo_adcword32_f;
    input [ADC_DATA_WIDTH-1:0] adc_data;
		fifo_adcword32_f =  {{14{adc_data[ADC_DATA_WIDTH-1]}}, adc_data}; 
  endfunction

// Detection of Integral Overflow ( if 4 MSB bits of the integer integral calculation are reached)
function  integral_overflow_f;
    input [INTEGRAL_WIDTH-1:0] int_val;	 
		integral_overflow_f = int_val[INTEGRAL_WIDTH-1] ^ (int_val[INTEGRAL_WIDTH-2] | int_val[INTEGRAL_WIDTH-3]| int_val[INTEGRAL_WIDTH-4]);
endfunction

// Integer (Full 48.16 resolution calculatio and WO compensation
function signed [INTEGRAL_WIDTH-1:0] integral_calc_f;  // integer 32 + 16 fractional bits
    input signed [INTEGRAL_WIDTH-1:0] int_val;
    input signed [ADC_DATA_WIDTH-1:0] adc_rec;
    input signed [PCIE_DATA_WIDTH-1:0] int_off;

    reg signed [INTEGRAL_WIDTH-1:0] int_add;
	 begin 
		int_add = int_val + $signed({{REC_EXTEND_BITS{adc_rec[ADC_DATA_WIDTH-1]}}, adc_rec, {FRACTIONAL_WIDTH{1'b0}}});  // Integral Accumulation
		integral_calc_f = int_add - $signed({{WO_EXTEND_BITS{int_off[PCIE_DATA_WIDTH-1]}}, int_off}); // WO correction
	 end
  endfunction  

// Format change for DAC chips
function signed [DAC_DATA_WIDTH-1:0] dac_offset_binary_f;
   input [DAC_DATA_WIDTH-1:0] dac_data, off_data;
   dac_offset_binary_f = $signed(dac_data) + $signed(off_data); 
  endfunction
  
/*********** End Function Declarations ***************/ 	

	reg [ADC_DATA_WIDTH-1:0] adc_off_r[0:(N_ADC_CHANNELS-1)];  // array of  18-bit registers 
	reg [PCIE_DATA_WIDTH-1:0] int_off_r[0:(N_INT_CHANNELS-1)]; // array  32-bit registers 16 int + 16 fractional
	reg [PCIE_DATA_WIDTH-1:0] coeff_r[0:(N_ADC_CHANNELS)];     // array of  6 + 1  

	integer r;
		
	/* OFFSET memory regs PCIe PIO WRITE Process */
	wire [4:0] off_idx = reg_offset[4:0];
	always @(posedge trn_clk or negedge pio_reset_n)
		if (!pio_reset_n) 
			begin
				for (r=0; r < N_ADC_CHANNELS; r=r+1) 
					adc_off_r[r] <= 0;
				for (r=0; r < (N_ADC_CHANNELS+1); r=r+1) 
					coeff_r[r] <= 0;
				for (r=0; r < N_INT_CHANNELS; r=r+1) 
					int_off_r[r] <= 0;
			end 
		else 
			if (reg_wrt_en == 1'b1 ) 
				if (reg_offset[15:5] == 11'd0 ) 
					adc_off_r[off_idx] <= reg_data[ADC_DATA_WIDTH-1:0];
				else if (reg_offset[15:5] == 11'd1 ) 	
					int_off_r[off_idx] <= reg_data;
				else if (reg_offset[15:5] == 11'd2 ) 
					coeff_r[off_idx] <= reg_data;

			
	/*	2Mhz counter after trigger*/	
	reg [31:0] clk2M_cnt = 1;
	always @ (negedge wordSync_n )
		if (!trigger_n)
				clk2M_cnt <= 1;
		else
				clk2M_cnt <= clk2M_cnt + 1;										
		
	localparam NDLY = 2; // 2 sample delay after wordSync_n signal for acquisition of ADC sampled data
	reg [NDLY:1] wordSync_dly;
	always @ (posedge ff_clk)
			wordSync_dly <= {wordSync_dly[(NDLY-1):1] , wordSync_n};

/*Integrator Logic*/
	reg signed [INTEGRAL_WIDTH-1:0] adc_int[0:(N_INT_CHANNELS-1)]; // array of N_INT_CHANNELS 48-bit registers

	wire signed  [ADC_DATA_WIDTH-1:0] adc_rec[0:(N_INT_CHANNELS-1)]; // array of 32 17-bit vectors Phase reconstruted data samples
	reg  signed  [ADC_DATA_WIDTH-1:0] last_adc_rec[0:(N_INT_CHANNELS-1)];
	
	reg [N_INT_CHANNELS-1:0] int_ovrflw; 

	wire new_sample = wordSync_dly[NDLY] & (~wordSync_dly[NDLY-1]); // 20 ns delay on falling edge 2mhz wordSync_n
	reg fifo_wr_en_r; //, write_int_en_r;	
	reg [7:0]  ff_clk_cnt = 0;

	wire   [FLOAT_WIDTH-1:0] resultDsp; 
	wire   [FLOAT_WIDTH-1:0] absIntegralF; 
	
	/*Interlock signal is (invert of) sign bit of result value*/
	reg  interlock_r; 
	assign interlock_out = interlock_r; // interlock must be a synchronous signal to avoid spikes
	
	// *******************  FIFO input logic (mux et al)  ********************* 
	always @ (posedge ff_clk or negedge stream_on)
	begin
		if (~stream_on)
			begin
				fifo_wr_en_r <= 0;
				//write_int_en_r <= 0;
				ff_clk_cnt <= 0;

				for (r=0; r < N_INT_CHANNELS; r=r+1) begin
					adc_int[r] <= 0;
					last_adc_rec[r] <= 0;
				end
			end																								
		else
			if (new_sample) // delay on falling edge 2mhz wordSync_n
				begin
					ff_clk_cnt <= 8'h00;
					fifo_wr_en_r <= 1'b1;
				
				end
			else	begin
				ff_clk_cnt <= ff_clk_cnt + 1;										
				if (ff_clk_cnt == 8'd1) 
					for (r=0; r < N_INT_CHANNELS; r=r+1) 
						begin
							if(int_data_hold)
								adc_int[r] <= integral_calc_f(adc_int[r], last_adc_rec[r], int_off_r[r]);
							else begin
								adc_int[r] <= integral_calc_f(adc_int[r], adc_rec[r], int_off_r[r]);
								last_adc_rec[r] <= adc_rec[r];
							end	
							int_ovrflw[r] <= integral_overflow_f(adc_int[r]);
						end
				else if (ff_clk_cnt == 8'h0A)
						interlock_r <= !resultDsp[FLOAT_SIGN_BIT];	 // Interlock is ON if final DSP result is POSITIVE
				else if (ff_clk_cnt == 8'h0F) 
						fifo_wr_en_r <= 1'b0;
			end
	end

// Combinatorial MUX
	wire signed  [ADC_DATA_WIDTH-1:0] data_in_ch[0:(N_ADC_CHANNELS-1)]; // array of 32 17-bit vectors
	assign  data_in_ch[0] = data_in_ch1;
	assign  data_in_ch[1] = data_in_ch2;
	assign  data_in_ch[2] = data_in_ch3;
	assign  data_in_ch[3] = data_in_ch4;
	assign  data_in_ch[4] = data_in_ch5;
	assign  data_in_ch[5] = data_in_ch6;
	
	genvar i;
	generate
		for (i=0; i < N_INT_CHANNELS; i=i+1) 
		begin: mmm
			assign  adc_rec[i] = adc_chop_rec_f(data_in_ch[i], adc_off_r[i], adc_chop_dly, command[CHOP_RECONSTRUCT_BIT]);
		end	
   endgenerate
	  
/*Integrator Logic*/ // TODO Change to delay on wordsysn_n

	wire   [FLOAT_WIDTH-1:0] data_fp32[0:(N_DSP_CHANNELS-1)]; 
	wire [(FLOAT_WIDTH-1):0] dspMult_term[0:(N_DSP_CHANNELS-1)];			
	wire   [FLOAT_WIDTH-1:0] dataDspAddL0[0:2]; 
	wire   [FLOAT_WIDTH-1:0] dataDspAddL1, dataDspAddL2 ; 
   wire [DAC_DATA_WIDTH-1:0] dac_2compl_i;

   wire [5:0] FpAdd32_ovrflw;
	
	/*Integral Mux. 128 byte packet*/ 
	wire [3:0] mux_adc = ff_clk_cnt[3:0];
	reg [FIFO_WIDTH-1:0] data32_fifo_in = 0;			
	always @ (mux_adc, clk2M_cnt, adc_chop_dly, ff_clk_cnt, dspMult_term[0], resultDsp, data_fp32[0], interlock_r, dataDspAddL2, int_ovrflw, FpAdd32_ovrflw)
	
		case (mux_adc)
				4'd0: data32_fifo_in  = fifo_adcword32_f(data_in_ch[0]); 
				4'd1: data32_fifo_in  = fifo_adcword32_f(data_in_ch[1]);
				4'd2: data32_fifo_in  = fifo_adcword32_f(data_in_ch[2]);
				4'd3: data32_fifo_in  = fifo_adcword32_f(data_in_ch[3]);
				4'd4: data32_fifo_in  = fifo_adcword32_f(data_in_ch[4]);
				4'd5: data32_fifo_in  = fifo_adcword32_f(data_in_ch[5]);
				4'd6: data32_fifo_in  = data_fp32[0]; // Integral FP 
				4'd7: data32_fifo_in  = data_fp32[1]; 
				4'd8: data32_fifo_in  = data_fp32[2]; 
				4'd9: data32_fifo_in  = data_fp32[3];
				4'd10: data32_fifo_in = data_fp32[4]; //{16'd0, dac_2compl_i};//fifo_intword32_f(adc_int[0], 3'b010); //adc_int[0][18 +: FIFO_WIDTH];
				4'd11: data32_fifo_in = data_fp32[5]; 
				4'd12: data32_fifo_in = dataDspAddL2;// Integral Matrix Term 		dspMult_term[0]; 
				4'd13: data32_fifo_in = resultDsp; 
				//									1 					6				6             18		1
				4'd14: data32_fifo_in = {interlock_r, int_ovrflw, FpAdd32_ovrflw, 18'd0,adc_chop_dly};//ff_clk_cnt here should be always 0x0E
				4'd15: data32_fifo_in = clk2M_cnt[FIFO_WIDTH-1:0];
			endcase
 
	/* Litle or BIG ENDIAN change option*/
	wire [FIFO_WIDTH-1:0] fifo_endian_in ;
	assign fifo_endian_in = (command[ENDIAN_DMA_BIT])?  data32_fifo_in : // Big Endian data
		{data32_fifo_in[7:0], data32_fifo_in[15:8], data32_fifo_in[23:16], data32_fifo_in[31:24]};

/*
FIFO 
32 bits in, 32 bits out
Depth :65536 words = 256 kBytes = 4096 samples
	  513			2kB
*/
	wire fifo_empty_i;
//	wire fifo_prgfull_i;
	RT_FIFO rt_fifo(
		.rst(~acq_on),//stream_on		//input  RESET is edge sensitive not level sensitive.
		.wr_clk(ff_clk),								
		.rd_clk(trn_clk),								
		.din(fifo_endian_in), 
		.wr_en(fifo_wr_en_r),										
		.rd_en(PCIe_dma_rd_en),						
		.dout(dma_data_out),											//output  31:0
		.full(),															//output 
		.empty(),														//output 
//		.prog_empty_thresh({2'd0,dma_empty_thresh}),  // input [15 : 0] prog_empty_thresh = MAXd32768 = 2048 samples
		.prog_empty(fifo_empty_i)					//output
	);

	assign dma_ready = ~fifo_empty_i;

// initial term calculation
	generate
		for (i=0; i < N_DSP_CHANNELS; i=i+1) 
		begin: FPCalcs
// 2 clk latency
		FP48 inst_FP48point16_to_float (
		  .a(adc_int[i]), // input [63 : 0] a
		  .clk(ff_clk), // input clk
		  .result(data_fp32[i]) // output [31 : 0] result
		);
// 2 clk latency
		FpMult32 inst_FpMult32 (
		  .a(data_fp32[i]), // input [31 : 0] a
		  .b(coeff_r[i]), // input [31 : 0] b
		  .clk(ff_clk), // input clk
		  .result(dspMult_term[i]) // output [31 : 0] result
		);
		end	
   endgenerate

// First Level Summer
	FpAdd32 inst_FpAdd32_a0 (
	  .a(dspMult_term[0]), 
	  .b(dspMult_term[1]), 
//	  .underflow(underflow), // output underflow
     .overflow(FpAdd32_ovrflw[0]), // output overflow
	  .result(dataDspAddL0[0]) 
	);
	FpAdd32 inst_FpAdd32_b0 (
	  .a(dspMult_term[2]), 
	  .b(dspMult_term[3]), 
     .overflow(FpAdd32_ovrflw[1]), 
	  .result(dataDspAddL0[1]) 
	);
	FpAdd32 inst_FpAdd32_c0 (
	  .a(dspMult_term[4]), // input [31 : 0] a
	  .b(dspMult_term[5]), // input [31 : 0] b
     .overflow(FpAdd32_ovrflw[2]), 
	  .result(dataDspAddL0[2])  
	);
// Second Level Summer
	FpAdd32 inst_FpAdd32_a1 (
	  .a(dataDspAddL0[0]),  
	  .b(dataDspAddL0[1]),  
     .overflow(FpAdd32_ovrflw[3]), 
	  .result(dataDspAddL1) 
	);
	//  	
	FpAdd32 inst_FpAdd32_b1 (
	  .a(dataDspAddL0[2]), 
	  .b(dataDspAddL1), //coeff_r[6]
     .overflow(FpAdd32_ovrflw[4]), 
	  .result(dataDspAddL2) 
	);
	
	/* Absolute value for a float 32:
			bits.stephan-brumme.com/absFloat.html
	*/
	assign absIntegralF = {1'b0, dataDspAddL2[FLOAT_WIDTH - 2:0]};  

	// Final Summer,  Offset term Coef
	FpSubtract32 interlock_FpSub32_a2 (
	  .a(absIntegralF), 
	  .b(coeff_r[6]), 
     .overflow(FpAdd32_ovrflw[5]), 
	  .result(resultDsp) 
	);

	assign dsp_out=resultDsp; 
  /* DAC data MUX*/

	/*Conversion float to int16*/
	FpDacOut inst_FpDacOut (
	  .a(resultDsp), // input [31 : 0] a
	  .clk(ff_clk), 
	  .result(dac_2compl_i) // output [15 : 0] result
	);

	/* DAC chip is Offset Binary, so here is conversion from 2-complement*/   
	wire [DAC_DATA_WIDTH-1:0] dac_out_i;
	assign dac_out_i = dac_offset_binary_f(dac_2compl_i, 16'h8000);

	assign dac_out = dac_out_i;
						
endmodule
