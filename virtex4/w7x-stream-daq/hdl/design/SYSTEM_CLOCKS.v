//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer:  BBC
//
// Project Name:   W7X ATCA DAQ
// Design Name:    ATCA W7X_STREAM_DAQ FIRMWARE
// Module Name:    SYSTEM_CLOCKS
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
//Description: 
//
// Copyright 2015 - 2015 IPFN-Instituto Superior Tecnico, Portugal
// Creation Date  2015-09-10
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
//
// SVN keywords
// $Date: 2015-09-11 13:15:50 +0100 (Fri, 11 Sep 2015) $
// $Revision: 7651 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/SYSTEM_CLOCKS.v $
//
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module SYSTEM_CLOCKS (
	input PLL_clk_100MHz,
//	output internal_clk_4MHz125,
	output ADCs_word_sync,
	output ADCs_start_conv_out, // delay 50ns
	output clk_2mhz_utdc  // sync with ADCs_word_sync but duty cycle = 50% 
);

///////////////////////////////////////////////////////////    PLL -> 2mhz generator //////////////////////////////////////////
reg [5:0] counter = 6'd0;

reg start_conv_n= 1'b1;
reg clk_out_r= 1'b1;

reg word_sync_n= 1'b1;

always @ (posedge PLL_clk_100MHz )
//	if (counter == 6'd49)// - divide by 50
//		begin
//			counter <= 0; 
//			start_conv_n <= 1'b1;
////			clk_out_r <= 0; 
//		 end	
//	else
		begin
			counter <= counter + 1;

			if(counter == 6'd17)
				clk_out_r <= 1'b0;
			else if(counter == 6'd33)
				word_sync_n <= 1'b0;
			else if(counter == 6'd38)
				word_sync_n <= 1'b1;
			else if(counter == 6'd43)
				begin
					start_conv_n <= 1'b0;
					clk_out_r <= 1'b1; 
				end
			else if(counter == 6'd49) // - divide by 50 -> 2MSMS
				begin
					start_conv_n <= 1'b1;
					counter <= 0; 
				end
		  end	

	assign clk_2mhz_utdc  = clk_out_r;
	assign ADCs_word_sync = word_sync_n;
	assign ADCs_start_conv_out = start_conv_n; // delay 50ns

//	reg [2:0] start_conv_dly = 3'b111;
//	reg clk_2MHz_dly1=1'b1;
//	reg clk_2MHz_dly2=1'b1;
//
//	always @ (posedge PLL_clk_100MHz)
//	begin
//		 clk_2MHz_dly1 <= ATCA_2MHz_clock;
//		 clk_2MHz_dly2 <= clk_2MHz_dly1;
//		 start_conv_dly[2:1] <= start_conv_dly[1:0];
//		 start_conv_dly[0]   <= clk_2MHz_dly2 | ~clk_2MHz_dly1; // detect rising transition with a low pulse
//	end  
//
//	//wire signal_to_sync;
//	//wire dcmout;
//	
//	//BUFG dcminput (
//	//	.O(signal_to_sync),
//	//	.I(start_conv_dly[0])
//	//);
//
//	//BUFG globalsyncclk (
//	//	.O(ADCs_start_conv), // Clock buffer output
//	//	.I(dcmout) // Clock buffer input (connect directly to top-level port)
//	//);
//	
//	//DCM_BASE adcsyncclk (
//	//	.CLKIN(signal_to_sync),
//	//	.CLKFB(ADCs_start_conv),
//	//	.CLK0(dcmout),
//	//	.RST(1'b0)
//	//	);
//	assign ADCs_word_sync		=start_conv_dly[0];
//	assign ADCs_start_conv_out = start_conv_dly[2]; // delay 50ns

endmodule

