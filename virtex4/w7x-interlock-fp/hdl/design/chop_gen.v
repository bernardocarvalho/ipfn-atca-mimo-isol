`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer:  BBC
// 
// Create Date:    16:02:38 05/20/2014 
// Design Name: 
// Module Name:    chop_gen
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// SVN keywords:
// $Date: 2016-02-03 18:53:24 +0000 (Wed, 03 Feb 2016) $
// $Revision: 8264 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/hdl/design/chop_gen.v $
//
//////////////////////////////////////////////////////////////////////////////////
module chop_gen(
    input clk,
    //input reset_n,
    input chop_en,
    input chop_default,
    input [31:0] change_count,
    input [31:0] max_count,
    output chop_o,
    output chop_dly_o,
	 output data_hold_o
    );
	parameter CHOP_DLAY = 3;

	reg chop_r;
	assign chop_o = chop_r;

	reg hold_r=0;
	reg [CHOP_DLAY:1] hold_dly = 0;
	assign data_hold_o = hold_dly[CHOP_DLAY];// hold_r;
	
	reg [CHOP_DLAY:1] chop_dly = 0;
	assign chop_dly_o = chop_dly[CHOP_DLAY];
	
	
	//wire adchp_dly=; 
	always @ (negedge clk)
		begin
			chop_dly <= {chop_dly[(CHOP_DLAY-1):1], chop_r};
			hold_dly <= {hold_dly[(CHOP_DLAY-1):1], hold_r};
		end	
		
	localparam HOLD_SAMPLES = 3;
	reg [31:0] chop_counter_r = 0; 
   always @(negedge clk or negedge chop_en)
		if(!chop_en) 
			begin
				chop_counter_r <= 0;
				chop_r <= chop_default;
				hold_r <= 0;
			end
		else
			begin 
				chop_counter_r <= chop_counter_r + 1;
				if ( chop_counter_r == (HOLD_SAMPLES-1) )
						hold_r <= 1'b0;						
				if ( chop_counter_r == (change_count-1) )
					begin				
						chop_r <= !chop_default;
						hold_r <= 1'b1;						
					end	
				if ( chop_counter_r == (change_count + HOLD_SAMPLES-1) )
						hold_r <= 1'b0;						
				if ( chop_counter_r == (max_count-1) )
					begin 
						chop_counter_r <= 32'b0;
						chop_r <= chop_default;			
						hold_r <= 1'b1;						
					end
			end
		
endmodule //chop_gen