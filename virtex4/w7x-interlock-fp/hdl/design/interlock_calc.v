`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: AJNB  & BBC
//
// Project Name:   W7-X ATCA DAQ
// Design Name:    ATCA-GPIO-DAQ Streaming and Processing FW 16 Channels 32Bit
// Module Name:    interlock_calc
// Target Devices: XC4VFX60-11FF1152 
//
//Description: 
//
// Create Date:    17:53:42 03/23/2015 
// Design Name: 
// Module Name:    interlock_calc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Additional Comments: 
//  	
// SVN keywords
// $Date: 2016-02-03 18:53:24 +0000 (Wed, 03 Feb 2016) $
// $Revision: 8264 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/hdl/design/interlock_calc.v $
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

module interlock_calc(
	 input trn_clk,
	 input pio_reset_n,
	 input ff_clk,
	 input stream_on,

 	 input [17:0]  data_in_ch1, data_in_ch2,  data_in_ch3, data_in_ch4, data_in_ch5, data_in_ch6,

	 input [15:0] reg_offset,
	 input [31:0] reg_data,
	 input 		  reg_wrt_en,
	 
    output rtn_out
    );

	reg [17:0] coeff_r[0:7]; // array of  18-bit registers 


	/* OFFSET  regs WRITE Process */
	wire [2:0] off_idx = reg_offset[2:0];
	always @(posedge trn_clk or negedge pio_reset_n)
		if (!pio_reset_n) 
			begin
				for (r=0; r < 7; r=r+1) 
					coeff_r[r] <= 0;
			end 
		else 
			if (reg_wrt_en == 1'b1 ) 
				if (reg_offset[15:5] == 11'd2 ) 
					coeff_r[off_idx] <= reg_data[17:0];
//				else	
//					int_off_r[off_idx] <= reg_data;


	reg [47:0] ACC = 0;
	always @ (posedge ff_clk or negedge stream_on)
	begin
		if (~stream_on)
			begin
				ACC <= 0;
			end																								
		else
			if (calc_term) //
				begin
				end
			else	begin
				ff_clk_cnt <= ff_clk_cnt + 1;										
				if (ff_clk_cnt == 8'h0F) 
						write_adc_en_r <= 1'b0;
//				else if (ff_clk_cnt == 8'h1F) 
//						write_int_en_r <= 1'b0;
			end
	end


endmodule
