`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:50:13 03/27/2017
// Design Name:   chop_gen
// Module Name:   E:/temp/FPGA/IPP/W7X_INTLCK_FP/hdl/tb/chop_gen_tb.v
// Project Name:  W7X_INTLCK_FP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: chop_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module chop_gen_tb;

	// Inputs
	reg clk;
	reg chop_en;
	reg chop_default;
	reg [31:0] change_count;
	reg [31:0] max_count;

	// Outputs
	wire chop_o;
	wire chop_dly_o;
	wire data_hold_o;

//ADCs_wordSync_n_i
	always begin
      clk = 1'b1;
      #450 clk = 1'b0;
      #50;
   end  

	// Instantiate the Unit Under Test (UUT)
	chop_gen uut (
		.clk(clk), 
		.chop_en(chop_en), 
		.chop_default(chop_default), 
		.change_count(change_count), 
		.max_count(max_count), 
		.chop_o(chop_o), 
		.chop_dly_o(chop_dly_o), 
		.data_hold_o(data_hold_o)
	);

	initial begin
		// Initialize Inputs
		//clk = 0;
		chop_en = 1'b1;
		chop_default = 0;
		change_count = 32'd1000;
		max_count = 32'd2000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

