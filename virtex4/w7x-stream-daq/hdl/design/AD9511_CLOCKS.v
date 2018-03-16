//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: AJNB & BBC
//
// Project Name:   JET PLASMA VS CONTROLLER
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    SYSTEM_CLOCKS
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
//-- SVN keywords
// $Date: 2015-06-11 19:02:21 +0100 (Thu, 11 Jun 2015) $
// $Revision: 7422 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/AD9511_CLOCKS.v $
//
// Revision:  0.2
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module AD9511_CLOCKS (
	input clock_33MHz,
	output internal_clk_4MHz125
);

// Programming clock for AD9511
PMCD #(
		.EN_REL("FALSE"), // TRUE/FALSE to allow synchronous deassertion of RST ????????????
		.RST_DEASSERT_CLK("CLKA") // Reset syncronization to which clock: CLKA, CLKB, CLKC or CLKD
	) AD9511_CLK (
		.CLKA1D8(internal_clk_4MHz125), // Output CLKA divided by 8
		.CLKA(clock_33MHz), // Input CLKA
		.REL(1'b1), // PCMD release input
		.RST(1'b0) // Active high reset input
	);


endmodule

