`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IPFN - IST 
// Engineer: B. Carvalho
// 
// Create Date:    13:47:38 26/05/2014 
// Design Name: 
// Module Name:    PCIe_packet_gen 
// Project Name:   ATCA-IOC DAQ & CONTROL FIRMWARE
// Target Devices: 
// Tool versions: ISE 14.7
// Description: 
//   ADC res = 22 V/ 2**17 =  0.00016784
//	     INTEGRAL = 2^47 LSB * SAMPLE_PER = 70368744 LSB *sec = 11810 V*sec
//	     INTEGRAL32 = 2^31 LSB * SAMPLE_PER = 1073 LSB *sec = .18 V*sec
// Dependencies: 
//				RT_FIFO.xco
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// SVN keywords
// $Date: 2015-12-03 15:04:59 +0000 (Thu, 03 Dec 2015) $
// $Revision: 8025 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/PCIe_packet_gen.v $
//
//
///////////////////////////////////////////////////////////////////////////////////

module PCIe_packet_gen(
	 input trn_clk,
	 input pio_reset_n,
	 input ff_clk,
	 input [31:0] time_counter,
//	 input [31:0] command,
	 input PCIe_dma_rd_en,

	 input [15:0] int_decimate,
	 output dma_ready,
	 output [31:0] dma_data_out,
//	 output [15:0] dac_out,

	 input stream_on,
	 input wordSync_n,
	 input acq_on,
	 input trigger_n,
 
 	 input adc_chop_dly,
	 
	 input [17:0]  data_in_ch1, data_in_ch2,  data_in_ch3, data_in_ch4, data_in_ch5, data_in_ch6, data_in_ch7, data_in_ch8,
	 input [17:0]  data_in_ch9, data_in_ch10, data_in_ch11, data_in_ch12, data_in_ch13, data_in_ch14, data_in_ch15, data_in_ch16,

	 input [17:0]  data_in_ch17, data_in_ch18, data_in_ch19, data_in_ch20, data_in_ch21, data_in_ch22, data_in_ch23, data_in_ch24,
	 input [17:0]  data_in_ch25, data_in_ch26, data_in_ch27, data_in_ch28, data_in_ch29, data_in_ch30, data_in_ch31, data_in_ch32,
	  
	 input [15:0] reg_offset,
	 input [31:0] reg_data,
	 input 		  reg_wrt_en	
//	 output [31:0] dsp_out
	);

`include "ADC_DAQ_pkg.v"


parameter FIFO_WIDTH = 32;    
//parameter FLOAT_WIDTH = 32;    
//parameter INTEGER_WIDTH = 48 ;    
//parameter FRACTIONAL_WIDTH = 16 ;      
//parameter INTEGRAL_WIDTH = INTEGER_WIDTH + FRACTIONAL_WIDTH;    
//parameter WO_EXTEND_BITS = INTEGRAL_WIDTH - 32 ;    

/*********** Function Declarations ***************/
 
function [FIFO_WIDTH-1:0] fifo_word32_f; 
    input [ADC_DATA_WIDTH-1:0] adc_msb, adc_lsb;
		fifo_word32_f =  {adc_msb[ADC_DATA_WIDTH-1:2], adc_lsb[ADC_DATA_WIDTH-1:2]}; //16 msb only
  endfunction


function  [FIFO_WIDTH-1:0] fifo_adcword32_f;
    input [ADC_DATA_WIDTH-1:0] adc_data;
		fifo_adcword32_f =  {{14{adc_data[ADC_DATA_WIDTH-1]}}, adc_data}; 
  endfunction
  
  
/*********** End Function Declarations ***************/ 	

	reg [ADC_DATA_WIDTH-1:0] adc_off_r[0:(N_ADC_CHANNELS-1)]; // array of  18-bit registers 

	integer r;
		
	/* OFFSET  regs WRITE Process */
	wire [4:0] off_idx = reg_offset[4:0];
	always @(posedge trn_clk or negedge pio_reset_n)
		if (!pio_reset_n) 
			begin
				for (r=0; r < N_ADC_CHANNELS; r=r+1) 
					adc_off_r[r] <= 0;
			end 
		else 
			if (reg_wrt_en == 1'b1 ) 
				if (reg_offset[15:5] == 11'd0 ) 
					adc_off_r[off_idx] <= reg_data[ADC_DATA_WIDTH-1:0];
			
	/*	*/	
	reg [32:0] clk2M_cnt = 1;
	always @ (negedge wordSync_n )
		if (!trigger_n)
				clk2M_cnt <= 1;
		else
				clk2M_cnt <= clk2M_cnt + 1;										
		
	localparam NDLY = 2;
	reg [NDLY:1] wordSync_dly;
	always @ (posedge ff_clk)
			wordSync_dly <= {wordSync_dly[(NDLY-1):1] , wordSync_n};

	wire new_sample = wordSync_dly[NDLY] & (~wordSync_dly[NDLY-1]); // 20 ns delay on falling edge 2mhz wordSync_n
	reg fifo_wr_en_r; 	
 	
	reg [7:0]  ff_clk_cnt = 0;

	// *******************  FIFO input logic (mux et al)  ********************* 
	always @ (posedge ff_clk or negedge stream_on)
	begin
		if (~stream_on)
			begin
				fifo_wr_en_r <= 0;
				ff_clk_cnt <= 0;
			end																								
		else
			if (new_sample) // delay on falling edge 2mhz wordSync_n
				begin
					ff_clk_cnt <= 8'h00;
					fifo_wr_en_r <= 1'b1;
				end
			else	begin
				ff_clk_cnt <= ff_clk_cnt + 1;										
				if (ff_clk_cnt == 8'h0F) 
						fifo_wr_en_r <= 1'b0;
			end
	end
		
	wire [3:0] mux_adc = ff_clk_cnt[3:0];
	reg [FIFO_WIDTH-1:0] data32_fifo_in = 0;			
	always @ (mux_adc, data_in_ch1, data_in_ch2, data_in_ch3, data_in_ch4, data_in_ch5, data_in_ch6, data_in_ch7, data_in_ch8,
				data_in_ch9, data_in_ch10, data_in_ch11, data_in_ch12, data_in_ch13, data_in_ch14, data_in_ch15, data_in_ch16,
				data_in_ch17, data_in_ch18, data_in_ch19, data_in_ch20, data_in_ch21, data_in_ch22, data_in_ch23, data_in_ch24,
				data_in_ch25, data_in_ch25, data_in_ch27, data_in_ch28, data_in_ch29, data_in_ch30, data_in_ch31, data_in_ch32)
		case (mux_adc)
		//fifo_word32_f(adc_msb, adc_lsb);
				4'd0: data32_fifo_in  = fifo_word32_f(data_in_ch2, data_in_ch1);
				4'd1: data32_fifo_in  = fifo_word32_f(data_in_ch4, data_in_ch3);
				4'd2: data32_fifo_in  = {data_in_ch6[17:2],data_in_ch5[17:2]};
				4'd3: data32_fifo_in  = {data_in_ch8[17:2],data_in_ch7[17:2]};
				4'd4: data32_fifo_in  = {data_in_ch10[17:2],data_in_ch9[17:2]};
				4'd5: data32_fifo_in   = {data_in_ch12[17:2],data_in_ch11[17:2]};
				4'd6: data32_fifo_in   = {data_in_ch14[17:2],data_in_ch13[17:2]};
				4'd7: data32_fifo_in   = {data_in_ch16[17:2],data_in_ch15[17:2]};
				4'd8: data32_fifo_in   = {data_in_ch18[17:2],data_in_ch17[17:2]};
				4'd9: data32_fifo_in   = {data_in_ch20[17:2],data_in_ch19[17:2]};
				4'd10: data32_fifo_in  = {data_in_ch22[17:2],data_in_ch21[17:2]};
				4'd11: data32_fifo_in  = {data_in_ch24[17:2],data_in_ch23[17:2]};
				4'd12: data32_fifo_in  = {data_in_ch26[17:2],data_in_ch25[17:2]};
				4'd13: data32_fifo_in  = {data_in_ch28[17:2],data_in_ch27[17:2]};
				4'd14: data32_fifo_in  = {data_in_ch30[17:2],data_in_ch29[17:2]};
//				4'd15: data32_fifo_in  = {data_in_ch32[17:2],data_in_ch31[17:2]};
				4'd15: data32_fifo_in  = {data_in_ch32[17:3], adc_chop_dly,data_in_ch31[17:2]}; // 15'd0
			endcase
			
	wire [FIFO_WIDTH-1:0] fifo_endian_in = {data32_fifo_in[7:0], data32_fifo_in[15:8], data32_fifo_in[23:16], data32_fifo_in[31:24]};

/*
FIFO 
32 bits in, 32 bits out
Depth :65536 words = 256 kBytes = 4096 samples
	  513			2kB
*/

	wire fifo_empty_i;
//	wire fifo_prgfull_i;
	RT_FIFO rt_fifo(
		.rst(~acq_on), //input  RESET is edge sensitive not level sensitive.
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

endmodule
