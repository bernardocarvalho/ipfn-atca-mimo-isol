`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer:  BBC
//
// Project Name:   W7X_STREAM_DAQ
// Design Name:    ATCA-GPIO-DAQ Streaming and Processing FW 16 Channels.  W7X INTERLOCK 
// Module Name:    CHOP_GEN
// Target Devices: Virtex 4 
// Tool versions: ISE 14.7
//
//Description: 
// Create Date:    16:02:38 05/20/2014 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Copyright 2015 - 2015 IPFN-Instituto Superior Tecnico, Portugal
// Creation Date  2015-06-10
//
// Licensed under the EUPL, Version 1.1 or - as soon they
// will be approved by the European Commission - subsequent
// versions of the EUPL (the "Licence");

 // You may not use this work except in compliance with the
// Licence.
// You may obtain a copy of the Licence at:
//
// http://ec.europa.eu/idabc/eupl
//
// Unless required by applicable law or agreed to in
// writing, software distributed under the Licence is
// distributed on an "AS IS" basis,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied.
// See the Licence for the specific language governing
// permissions and limitations under the Licence.

// SVN keywords:
// $Date: 2015-09-11 13:20:17 +0100 (Fri, 11 Sep 2015) $
// $Revision: 7652 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/CHOP_GEN.v $
//
//////////////////////////////////////////////////////////////////////////////////
module CHOP_GEN(
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
		
endmodule //CHOP_GEN
