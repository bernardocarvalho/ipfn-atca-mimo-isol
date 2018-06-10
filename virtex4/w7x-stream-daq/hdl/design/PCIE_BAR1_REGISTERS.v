/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: BBC
//
// Project Name:   ATCA-IOC FIRMWARE
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    PCIE_BAR1_REGISTERS
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
// SVN keywords
// $Date: 2015-09-11 13:15:50 +0100 (Fri, 11 Sep 2015) $
// $Revision: 7651 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/PCIE_BAR1_REGISTERS.v $
// Revision:
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module PCIE_BAR1_REGISTERS (
	input  trn_clk,
	input pio_reset_n,
	//  Read Port
	input [10:0] rd_addr, 

	output  [31:0] rd_data, 

	//  Write Port
	input [10:0] wr_addr,
	input [31:0] wr_data,
	input wr_en,
	output wr_busy,
	// dma
								//	output [31:0] mem_init_addr, // Initial address of DDR do read
	output [31:2] dma_host_addr, // HW Address to Host Dma buffer TODO bits 1:0 not used?
	output [31:0] command,
	output [31:7] dma_size, 		// // number of bytes reqeusted in each DMA, bits 6-0 not used?
	output [15:0] dma_flag_words,	// number of 32 bit words in fifo to raise "DMA Ready" Flag
	input  [3:0]  dma_curr_buf,

	input  [31:0] time_counter,
	input  [31:0] status,

	output [15:0] REG_OFFSET,
	output [31:0] REG_DATA,
	output reg_wrt_en,	

	output [15:0] INTEGR_DECIM,

   output [15:0] DAC_1_data, 
   output [15:0] DAC_2_data, 
   output [15:0] DAC_3_data, 
   output [15:0] DAC_4_data, 
   output [15:0] DAC_5_data, 
   output [15:0] DAC_6_data, 
   output [15:0] DAC_7_data, 
   output [15:0] DAC_8_data, 
	output [31:0] CHOP_MAX_COUNT,
	output [31:0] CHOP_CHANGE_COUNT
	
//	output [31:0] CHOP_DATA_ON_OFF,
//	output [31:0] CHOP_DATA_Constante,
);

`include "ADC_DAQ_pkg.v"

reg wr_busy_r = 0;
assign 	wr_busy = wr_busy_r;

reg [31:0] rd_data_r;
assign rd_data = {rd_data_r[7:0], rd_data_r[15:8], rd_data_r[23:16], rd_data_r[31:24]}; // change endianess rd_data_r; 

reg [31:0] COMMAND_r = 0;
reg [31:0] ACQFREQ_r = 0;

//reg [1:0] DMA_CURR_BUFF_r = 0; // Read only
reg [31:2] DMA_BUFF_0_r = 0;  // todo: write only
reg [31:2] DMA_BUFF_1_r = 0;
reg [31:2] DMA_BUFF_2_r = 0;
reg [31:2] DMA_BUFF_3_r = 0;
reg [31:2] DMA_BUFF_4_r = 0;
reg [31:2] DMA_BUFF_5_r = 0;
reg [31:2] DMA_BUFF_6_r = 0;
reg [31:2] DMA_BUFF_7_r = 0;
reg [31:2] DMA_BUFF_8_r = 0;
reg [31:2] DMA_BUFF_9_r = 0;
reg [31:2] DMA_BUFF_10_r = 0;
reg [31:2] DMA_BUFF_11_r = 0;
reg [31:2] DMA_BUFF_12_r = 0;
reg [31:2] DMA_BUFF_13_r = 0;
reg [31:2] DMA_BUFF_14_r = 0;
reg [31:2] DMA_BUFF_15_r = 0;

reg [31:7] N_BYTES_r        = 25'd0;
reg [15:0] dma_word_thres_r = 16'b1000_0000_0000_0000; // Max 64k 32 words  prog_empty_thresh = d32768 

assign dma_size = N_BYTES_r;

assign dma_flag_words = dma_word_thres_r;

reg [15:0] REG_OFFSET_r = 32'd0;
reg [31:0] REG_DATA_r = 32'd0;
reg        reg_wrt_en_r = 1'b0;
reg [15:0] INTEGR_DECIM_r = 16'd200;

assign REG_OFFSET   = REG_OFFSET_r;
assign REG_DATA     = REG_DATA_r;
assign reg_wrt_en   = reg_wrt_en_r;
assign INTEGR_DECIM   = INTEGR_DECIM_r;

reg [15:0] DAC_1_data_r = 16'h8000;
reg [15:0] DAC_2_data_r = 16'h8000;
reg [15:0] DAC_3_data_r = 16'h8000;
reg [15:0] DAC_4_data_r = 16'hC000;
reg [15:0] DAC_5_data_r = 16'h0000;
reg [15:0] DAC_6_data_r = 16'h1FFF;
reg [15:0] DAC_7_data_r = 16'h3FFF;
reg [15:0] DAC_8_data_r = 16'h7FFF;
assign   DAC_1_data = DAC_1_data_r;
assign   DAC_2_data = DAC_2_data_r;
assign   DAC_3_data = DAC_3_data_r;
assign   DAC_4_data = DAC_4_data_r;
assign   DAC_5_data = DAC_5_data_r;
assign   DAC_6_data = DAC_6_data_r;
assign   DAC_7_data = DAC_7_data_r;
assign   DAC_8_data = DAC_8_data_r;

 reg [31:0] chop_max_count_r    = 32'd1024;  // Chop FREQ ~ 1kHz 
 reg [31:0] chop_change_count_r = 32'd512;	// // Chop duty cycle 50% 

//assign OFFSET_DATA_ch1 = OFFSET_DATA_1_r;

 assign CHOP_MAX_COUNT    = chop_max_count_r;
 assign CHOP_CHANGE_COUNT = chop_change_count_r;

reg [31:2] dma_addr_r;
assign dma_host_addr = dma_addr_r;// address is send "as is"  endianess
//assign mem_init_addr = MEM_INIT_ADDR_r;// address is send "as is" 

assign command = COMMAND_r; 
//assign trig_delay = TRIG_DLY_r; 


//wire [31:0] wr_data_e;
wire [31:0] wr_data_e = {wr_data[07:00], wr_data[15:08], wr_data[23:16], wr_data[31:24]}; // change endianess  

// PIO WRITE Process
always @(posedge trn_clk or negedge pio_reset_n)
		if (!pio_reset_n) 
			begin
				wr_busy_r <= 0;
				COMMAND_r <= 0;
				ACQFREQ_r <= 0;
				DMA_BUFF_0_r <= 0;
				N_BYTES_r <= 0;
				REG_OFFSET_r <= 0;
				REG_DATA_r <= 0;
				reg_wrt_en_r <= 0;
				INTEGR_DECIM_r <= 16'd200; // 10 kSPS decimation
			end 
		else if (wr_en == 1'b1 ) 
			begin
				wr_busy_r <= 1'b1;
				if (wr_addr[10:8] == BAR1_10_8 ) //begin
					case (wr_addr[7:0])
						COMMAND_a   	 : COMMAND_r  <= wr_data_e;
						ACQFREQ_a   	 : ACQFREQ_r  <= wr_data_e;
						DMA_BUFF_0_a   	 : DMA_BUFF_0_r  <= wr_data_e[31:2]; 
						DMA_BUFF_1_a   	 : DMA_BUFF_1_r  <= wr_data_e[31:2]; 
						DMA_BUFF_2_a   	 : DMA_BUFF_2_r  <= wr_data_e[31:2];
						DMA_BUFF_3_a   	 : DMA_BUFF_3_r  <= wr_data_e[31:2];
						DMA_BUFF_4_a   	 : DMA_BUFF_4_r  <= wr_data_e[31:2];
						DMA_BUFF_5_a   	 : DMA_BUFF_5_r  <= wr_data_e[31:2];
						DMA_BUFF_6_a   	 : DMA_BUFF_6_r  <= wr_data_e[31:2];
						DMA_BUFF_7_a   	 : DMA_BUFF_7_r  <= wr_data_e[31:2];
						DMA_BUFF_8_a   	 : DMA_BUFF_8_r  <= wr_data_e[31:2];
						DMA_BUFF_9_a   	 : DMA_BUFF_9_r  <= wr_data_e[31:2];
						DMA_BUFF_10_a   	 : DMA_BUFF_10_r  <= wr_data_e[31:2];
						DMA_BUFF_11_a   	 : DMA_BUFF_11_r  <= wr_data_e[31:2];
						DMA_BUFF_12_a   	 : DMA_BUFF_12_r  <= wr_data_e[31:2];
						DMA_BUFF_13_a   	 : DMA_BUFF_13_r  <= wr_data_e[31:2];
						DMA_BUFF_14_a   	 : DMA_BUFF_14_r  <= wr_data_e[31:2];
						DMA_BUFF_15_a   	 : DMA_BUFF_15_r  <= wr_data_e[31:2];
						N_BYTES_a   	 	 : N_BYTES_r  	   <= wr_data_e[31:7];
						DMA_THRES_BYTES_a 	 : dma_word_thres_r   <= wr_data_e[18:3]; // Nbytes-> N words
						
						REG_OFFSET_a	    : REG_OFFSET_r <= wr_data_e[15:0];
						REG_DATA_a	       : begin
														REG_DATA_r  <= wr_data_e; 
														reg_wrt_en_r <= 1'b1;   // set write reg flag
													end
						INTEGR_DECIM_a	    : INTEGR_DECIM_r <= wr_data_e[15:0];
											
						DAC_1_a	          : DAC_1_data_r <= wr_data_e[15:0];
						DAC_2_a	          : DAC_2_data_r <= wr_data_e[15:0];
						DAC_3_a	          : DAC_3_data_r <= wr_data_e[15:0];
						DAC_4_a	          : DAC_4_data_r <= wr_data_e[15:0];
						DAC_5_a	          : DAC_5_data_r <= wr_data_e[15:0];
						DAC_6_a	          : DAC_6_data_r <= wr_data_e[15:0];
						DAC_7_a	          : DAC_7_data_r <= wr_data_e[15:0];
						DAC_8_a	          : DAC_8_data_r <= wr_data_e[15:0];

						
						CHOP_MAX_COUNT_a	    : chop_max_count_r    <= wr_data_e;
						CHOP_CHANGE_COUNT_a	 : chop_change_count_r <= wr_data_e;

//						TRIG_DLY_a			 : TRIG_DLY_r    <= wr_data_e;
						default : ;	// Do nothing
					endcase
				end
			else 
				begin
					wr_busy_r <= 1'b0;
					reg_wrt_en_r <= 1'b0;   // write reg flag reset
				end 
//      end

// PIO  READ Process (combinatorial)
//	
   always @(rd_addr, status, COMMAND_r, ACQFREQ_r,  dma_curr_buf, 
				DMA_BUFF_0_r, DMA_BUFF_1_r, time_counter, N_BYTES_r, dma_word_thres_r, REG_OFFSET_r, REG_DATA_r, INTEGR_DECIM_r, 
				chop_max_count_r, chop_change_count_r)
			if (rd_addr[10:9] == BAR0 )  begin
					rd_data_r  <=  32'h55000000;  
				end 
			else 
				if (rd_addr[10:8] == BAR1_10_8 ) begin
				  case (rd_addr[7:0])
					STATUS_REVID_a : rd_data_r  <=  status ; 
					COMMAND_a	   : rd_data_r  <=  COMMAND_r;
					ACQFREQ_a		: rd_data_r  <=  ACQFREQ_r;
					DMA_CURR_BUFF_a: rd_data_r  <=  {28'h0, dma_curr_buf}; 
					HW_COUNTER_a	: rd_data_r     		<=  time_counter;
					N_BYTES_a  	 	     : rd_data_r     <=  N_BYTES_r;
					DMA_THRES_BYTES_a    : rd_data_r     <=  {13'b0, dma_word_thres_r, 3'b0};

					REG_OFFSET_a 	: rd_data_r     		<=  {16'h0,REG_OFFSET_r};
					REG_DATA_a   	: rd_data_r     		<=  REG_DATA_r;
					INTEGR_DECIM_a 	: rd_data_r     		<=  {16'h0,INTEGR_DECIM_r};
					
					CHOP_MAX_COUNT_a 		: rd_data_r  <=  chop_max_count_r;
					CHOP_CHANGE_COUNT_a  : rd_data_r  <=  chop_change_count_r;

//					TRIG_DLY_a		: rd_data_r     <= TRIG_DLY_r;
					default :	 rd_data_r  <=  {16'h0001,5'b0, rd_addr} ; //32'h00000055;
				endcase
			end else 
					rd_data_r  <= {21'h0, rd_addr};


   always @(dma_curr_buf, DMA_BUFF_0_r, DMA_BUFF_1_r, DMA_BUFF_2_r, DMA_BUFF_3_r, DMA_BUFF_4_r, DMA_BUFF_5_r, DMA_BUFF_6_r,
	 DMA_BUFF_7_r, DMA_BUFF_8_r, DMA_BUFF_9_r,
	 DMA_BUFF_10_r, DMA_BUFF_11_r, DMA_BUFF_12_r, DMA_BUFF_13_r, DMA_BUFF_14_r, DMA_BUFF_15_r)
      case (dma_curr_buf)
         4'b0000 : dma_addr_r  <=  DMA_BUFF_0_r; 
         4'b0001 : dma_addr_r  <=  DMA_BUFF_1_r; 
         4'b0010 : dma_addr_r  <=  DMA_BUFF_2_r; 
         4'b0011 : dma_addr_r  <=  DMA_BUFF_3_r; 
			4'b0100 : dma_addr_r  <=  DMA_BUFF_4_r;
			4'b0101 : dma_addr_r  <=  DMA_BUFF_5_r;
			4'b0110 : dma_addr_r  <=  DMA_BUFF_6_r;
			4'b0111 : dma_addr_r  <=  DMA_BUFF_7_r;
			4'b1000 : dma_addr_r  <=  DMA_BUFF_8_r;
			4'b1001 : dma_addr_r  <=  DMA_BUFF_9_r;
			4'b1010 : dma_addr_r  <=  DMA_BUFF_10_r;
			4'b1011 : dma_addr_r  <=  DMA_BUFF_11_r;
			4'b1100 : dma_addr_r  <=  DMA_BUFF_12_r;
			4'b1101 : dma_addr_r  <=  DMA_BUFF_13_r;
			4'b1110 : dma_addr_r  <=  DMA_BUFF_14_r;
			4'b1111 : dma_addr_r  <=  DMA_BUFF_15_r;
			default : dma_addr_r  <= DMA_BUFF_0_r; 
      endcase
	
endmodule
