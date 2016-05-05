//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: AJNB & BBC
//
// Project Name:   JET PLASMA VS CONTROLLER
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    ADC_CHAN_SR
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
//-- SVN keywords
// $Date: 2016-02-03 18:53:24 +0000 (Wed, 03 Feb 2016) $
// $Revision: 8264 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/hdl/design/ADC_CHAN_sr.v $
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ADC_CHAN_SR (
	input ADC_word_sync_n,                    
	input ADC_clock,
	input ADC_serial_data, 
	//input chop_phase,
//	input Chop_reconstructed,
	output [17:0] channel_data
);


// ADC deserialzer
//Verilog-2001 attribute  method:
(* KEEP="TRUE" *)reg [8:0] ADC_data_pos;	
(* KEEP="TRUE" *)reg [8:0] ADC_data_neg;	
(* KEEP="TRUE" *)reg [17:0] word_reg; // 18 bits

always @ (posedge ADC_clock)
	ADC_data_pos <= {ADC_data_pos[7:0], ADC_serial_data};
always @ (negedge ADC_clock)
	ADC_data_neg <= {ADC_data_neg[7:0], ADC_serial_data};


/////////////////////////////////////////////////////////////////////////////////

	always @ (negedge ADC_word_sync_n)
	begin

//		if (Chop_reconstructed == 0)
//	begin
		word_reg <= {ADC_data_pos[8], ADC_data_neg[8],
							ADC_data_pos[7], ADC_data_neg[7],
							ADC_data_pos[6], ADC_data_neg[6],
							ADC_data_pos[5], ADC_data_neg[5],
							ADC_data_pos[4], ADC_data_neg[4],
							ADC_data_pos[3], ADC_data_neg[3],
							ADC_data_pos[2], ADC_data_neg[2],
							ADC_data_pos[1], ADC_data_neg[1],
							ADC_data_pos[0], ADC_data_neg[0]};
//	end
//
//	else
//	begin
//
//		if (adc_chop_r == 0)
//		begin
//			word_reg <= {ADC_data_pos[8], ADC_data_neg[8],
//								ADC_data_pos[7], ADC_data_neg[7],
//								ADC_data_pos[6], ADC_data_neg[6],
//								ADC_data_pos[5], ADC_data_neg[5],
//								ADC_data_pos[4], ADC_data_neg[4],
//								ADC_data_pos[3], ADC_data_neg[3],
//								ADC_data_pos[2], ADC_data_neg[2],
//								ADC_data_pos[1], ADC_data_neg[1],
//								ADC_data_pos[0], ADC_data_neg[0]};
//		end
//	
//		else
//		begin
//			word_reg <= {ADC_data_pos[8], ADC_data_neg[8],
//									ADC_data_pos[7], ADC_data_neg[7],
//									ADC_data_pos[6], ADC_data_neg[6],
//									ADC_data_pos[5], ADC_data_neg[5],
//									ADC_data_pos[4], ADC_data_neg[4],
//									ADC_data_pos[3], ADC_data_neg[3],
//									ADC_data_pos[2], ADC_data_neg[2],
//									ADC_data_pos[1], ADC_data_neg[1],
//									ADC_data_pos[0], ADC_data_neg[0]}*(-1);
//		end
//	end

	end
////////////////////////////////////////////////////////////////////////////////////


	assign channel_data =  word_reg ;
//	assign channel_data = (chop_phase) ? word_reg : (- word_reg);

	//assign channel_data = word_reg; // 18 bits


endmodule
