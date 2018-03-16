//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: BBC
//
// Project Name:   W7X_INTLCK_FP
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    DAC interface
// Target Devices: DAC XC4VFXxxx (Virtex 4)
// Designed for the DAC circuit LTC1668 16bit, straight binary digital coding
// Revision: 
// Description: 
//
//  	
// SVN keywords
// $Date: 2015-06-11 19:02:21 +0100 (Thu, 11 Jun 2015) $
// $Revision: 7422 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/DAC_2Mhz.v $

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module DAC_2Mhz (
	input reset,
	input [15:0] data_i, // changed at posedge wordSync_n
	input data_clock_n,

	input serial_clock_i,
	output serial_data,
	output word_sync,  
	//output reg DAC_serial_data,
	//output reg DAC_word_sync,  
	output DAC_reset                                                                    				                                                             				
);
`include "ADC_DAQ_pkg.v"

	assign DAC_reset = reset;

	reg serial_data_r;
	assign serial_data = serial_data_r;

	reg word_sync_r = 1'b1;
	assign word_sync = word_sync_r;


//	/*http://fullchipdesign.com/clockdomaincrossing.htm*/
	
	wire [DAC_DATA_WIDTH-1:0] DAC_data_reg;
	wire  ff_empty_i;
	wire ff_wr_clk_i = ~ data_clock_n;

	reg  ff_rd_en_i = 0 ;
	reg [4:0] counter = 0;
//	reg [DAC_DATA_WIDTH-1:0] DAC_data_reg = 0;
//	reg [DAC_DATA_WIDTH-1:0] DAC_data_meta;
	always @ (posedge serial_clock_i or posedge reset)
	if (reset)
		counter <= 0;
	else
		begin
			counter <= counter + 1;
			case(counter)
				5'd0: begin
						 word_sync_r <= 1;
						 serial_data_r <= DAC_data_reg[15];
						end 
	//			5'd0: serial_data_r <= DAC_data_reg[15];
				5'd1: serial_data_r <= DAC_data_reg[14];
				5'd2: serial_data_r <= DAC_data_reg[13];
				5'd3 : serial_data_r <= DAC_data_reg[12];
				5'd4 : serial_data_r <= DAC_data_reg[11];
				5'd5 : serial_data_r <= DAC_data_reg[10];
				 14 : serial_data_r <= DAC_data_reg[1];
				 13 : serial_data_r <= DAC_data_reg[2];
				 12 : serial_data_r <= DAC_data_reg[3];
				 11 : serial_data_r <= DAC_data_reg[4];
				 10 : serial_data_r <= DAC_data_reg[5];
				  9 : serial_data_r <= DAC_data_reg[6];
				  8 : serial_data_r <= DAC_data_reg[7];
				  7 : serial_data_r <= DAC_data_reg[8];
				  6 : serial_data_r <= DAC_data_reg[9];

			  5'd15: serial_data_r <= DAC_data_reg[0];
			  5'd16: begin
							serial_data_r <= 0;
							if(ff_empty_i == 1'b0)
								ff_rd_en_i <= 1'b1; 
							//DAC_data_meta <= data_i; // latch data in
						end
			  5'd17: begin
							ff_rd_en_i <= 1'b0; 
							//DAC_data_reg <= DAC_data_meta;
							word_sync_r <= 1'b0;
							counter <= 0;
						end
			  default: word_sync_r <= 1'b1;
//			 begin  // 17 and... 
//							word_sync_r <= 0;
//							DAC_data_reg <= DAC_data_meta; 
//							counter <= 0; // reset counter
//						 end
			endcase
		end


   // FIFO16: BlockRAM Asynchronous FIFO configured for 1k deep x 18 wide 
   //         Virtex-4 
   // Xilinx HDL Language Template, version 14.7

  wire [17:0] unconnected;

   FIFO16 #(
      .ALMOST_FULL_OFFSET(12'h080),     // Sets almost full threshold
      .ALMOST_EMPTY_OFFSET(12'h080),    // Sets the almost empty threshold
      .DATA_WIDTH(18),                  // Sets data width to 4, 9, 18, or 36
      .FIRST_WORD_FALL_THROUGH("FALSE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
   ) FIFO16_1kx18_inst (
//      .ALMOSTEMPTY(ALMOSTEMPTY),       // 1-bit almost empty output flag
//      .ALMOSTFULL(ALMOSTFULL),         // 1-bit almost full output flag
      .DO({unconnected[15:0], DAC_data_reg}),    // 16-bit data output
//      .DOP({unconnected[17:16], DOP}), // 2-bit parity data output
      .EMPTY(ff_empty_i),         // 1-bit empty output flag
//      .FULL(FULL),           // 1-bit full output flag
//      .RDCOUNT(RDCOUNT),     // 12-bit read count output
//      .RDERR(RDERR),         // 1-bit read error output
//      .WRCOUNT(WRCOUNT),     // 12-bit write count output
//      .WRERR(WRERR),         // 1-bit write error
      .DI({16'h0000, data_i}),   // 16-bit data input (rest tied to ground)
      .DIP({2'b00, 2'b00}),    // 2-bit parity input (rest tied to ground)
      .RDCLK(serial_clock_i),         // 1-bit read clock input
      .RDEN(ff_rd_en_i),           // 1-bit read enable input
      .RST(reset),             // 1-bit reset input
      .WRCLK(ff_wr_clk_i),         // 1-bit write clock input
      .WREN(1'b1)            // 1-bit write enable input
   );   		
	

endmodule
