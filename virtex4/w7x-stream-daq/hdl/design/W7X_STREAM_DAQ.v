///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: AJNB  & BBC
//
// Project Name:   ATCA DAQ Streaming FW, 16bit, 32 Channels, chopped ( or non-) chopped modules.  
// Design Name:    W7X_STREAM_DAQ
// Module Name:    W7X_STREAM_DAQ
// Target Devices: XC4VFX60-11FF1152 
//
//Description: 
//  		This firmware  makes the aquisition on N_ADC_CHANNELS channels at 16 bit resolution
// 		
// 		The timing circuit is compatible with IPP uTDC timing system (see "figure" on comments below
//			The 8 DACs on the RTM are also connected and can be writen using dedicated PCIe 32 bit registers
// 		Device ID is 0x0020
// Tested with Linux Linux  fpsc-slc6-rt.local 3.10.0-229.rt56.149.el6rt.x86_64 
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
	       
// Copied from W7X_INTLCK_FP
//  	 
// SVN keywords
// $Date: 2015-10-13 10:05:41 +0100 (Tue, 13 Oct 2015) $
// $Revision: 7780 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/W7X_STREAM_DAQ.v $
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module W7X_STREAM_DAQ (
	input [32:1] ADC_CLK_P,
	input [32:1] ADC_CLK_N,
	input [32:1] ADC_DATA_P,
	input [32:1] ADC_DATA_N,

	output ADCs_RESET, // Active low
	output ADCs_POWER_DOWN,
	output ADCs_START_CONV_P,
	output ADCs_START_CONV_N,

	output DAC_CLK_P,
	output DAC_CLK_N,
	output [8:1] DAC_DATA_P,
	output [8:1] DAC_DATA_N,
	output [8:1] DAC_RESET,
	output [8:1] DAC_ENABLE,

	input SYSACE_CLOCK,

	//input CLK_250_P,   Not used..
	//input CLK_250_N,
	//input CLK_100_SSC_P, // not used
	//input CLK_100_SSC_N,

	output AD9511_REF_P,
	output AD9511_REF_N,

	input [1:1] AD9511_OUT_N,
	input [1:1] AD9511_OUT_P,

	// AD9511 control and status signals
	input AD9511_STATUS,
	//input AD9511_SDO,
	output AD9511_FUNCTION,
	output AD9511_CSB, 
	output AD9511_SCLK,
	output AD9511_SDIO,

	input [2:1]  RS485_RX, // 1: ext acq trigger_n, 2: ext aqc clock
	output [8:1] RS485_TX, // 				7: Chopper phase signal, 8: adc clock signal
	output [8:1] RS485_TX_ENABLE,

	input ATCA_RX_1A, // ATCA Shared clock input
	//input ATCA_RX_2A, 
	input ATCA_RX_1B, // ATCA Shared trigger input (Active Low)
	//input ATCA_RX_2B, //  Not Used
	input ATCA_RX_3A, // ATCA PCIe reset input active on 0

	output ATCA_TX_1A,
	output ATCA_TX_2A, // Do not use
	output ATCA_TX_3A, // Do not use
	output ATCA_TX_1B, // ATCA CTTS trigger_n driver
	output ATCA_TX_2B,
	output ATCA_TX_1A_ENABLE,
	output ATCA_TX_2A_ENABLE,
	output ATCA_TX_3A_ENABLE,
	output ATCA_TX_1B_ENABLE,
	output ATCA_TX_2B_ENABLE,

	//input RS232_RXD,
	//input RS232_RTS,
	output RS232_TXD,
	output RS232_CTS,
	// Miscellaneous status signals
	//input SYS_RESET,
	//input SFP_LOS,
	//input PCIe_CLOCK_LOS,
	input [10:7] IPMC_GPIO,
	output [6:5] IPMC_GPIO_LEDS, // 2 Leds ON Front Panel
	input RTM_PRESENT,

	// Miscellaneous control signals
	output PCIe_PLL_RESET,	
	output SYSACE_MPCE,

	output [3:0] PCIe_TX_P,
	output [3:0] PCIe_TX_N,
	input [3:0] PCIe_RX_P,
	input [3:0] PCIe_RX_N,
	input PCIe_CLK_P,
	input PCIe_CLK_N 

);

`include "ADC_DAQ_pkg.v"

/* Main ************************************************************************************************************************************/
// Declaration of wires

// synthesis attribute CLOCK_SIGNAL of ADCs_wordSync_n_i is "YES";
	wire ADCs_wordSync_n_i;
	wire PCIe_trn_clk;

	(* KEEP="TRUE" *)wire [N_ADC_CHANNELS:1] ADC_data;
	(* KEEP="TRUE" *)wire [N_ADC_CHANNELS:1] ADC_clock;

/* ADC data, clock BUFFERS */
	
   genvar r;
   generate
		for (r=1; r <= N_ADC_CHANNELS; r=r+1) 
      begin: ADC_BUFs
			IBUFDS #(
			.CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE"
			.DIFF_TERM("TRUE"), // Differential Termination
			.IOSTANDARD("LVDS_25") // Specify the input I/O standard
			) BUF29 (
				.O(ADC_clock[r]), // Buffer output
				.I(ADC_CLK_P[r]), // Diff_p buffer input (connect directly to top-level port)
				.IB(ADC_CLK_N[r]) // Diff_n buffer input (connect directly to top-level port)
			);

			IBUFDS #(
			.CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE"
			.DIFF_TERM("TRUE"), // Differential Termination
			.IOSTANDARD("LVDS_25") // Specify the input I/O standard
			) BUF4 (
				.O(ADC_data[r]), // Buffer output
				.I(ADC_DATA_P[r]), // Diff_p buffer input (connect directly to top-level port)
				.IB(ADC_DATA_N[r]) // Diff_n buffer input (connect directly to top-level port)
			);
			
      end
   endgenerate

	OBUFDS 
	#(
	.CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE" 
	.IOSTANDARD("LVPECL_25") // Specify the output I/O standard
	) // CLOCKS NO BANK 2 - sem DCI
	 BUF67 (
		.O(DAC_CLK_P), // Diff_p output (connect directly to top-level port)
		.OB(DAC_CLK_N), // Diff_n output (connect directly to top-level port)
		.I(PCIe_trn_clk)// Buffer input
	);

	wire [N_DAC_CHANNELS:1] DAC_s_data;
   generate
      for (r=1; r <= N_DAC_CHANNELS ; r=r+1)  
      begin: DAC_BUFs
			OBUFDS #(
			.CAPACITANCE("NORMAL"), // "LOW", "NORMAL", "DONT_CARE" was dont care - not supported by LVDS_25 O bufffers
			.IOSTANDARD("LVDS_25") // Specify the output I/O standard
			)
			 BUF68 (
				.O(DAC_DATA_P[r]), // Diff_p output (connect directly to top-level port)
				.OB(DAC_DATA_N[r]), // Diff_n output (connect directly to top-level port)
				.I(DAC_s_data[r]) // Buffer input
			);
						
      end
   endgenerate

//	wire [3:0] AD9511_output;
//   generate
//      for (r=0; r < 4; r=r+1) 
//      begin: AD9511_BUFs
//			IBUFGDS #(
//			.CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE"
//			.DIFF_TERM("FALSE"), // Differential Termination
//			.IOSTANDARD("LVPECL_25") // Specifies the I/O standard for this buffer
//			) BUF81 (
//			.O(AD9511_output[r]), // Clock buffer output
//			.I(AD9511_OUT_P[r]), // Diff_p clock buffer input
//			.IB(AD9511_OUT_N[r]) // Diff_n clock buffer input
//			);
//      end
//   endgenerate

	wire  AD9511_output1; // Only output 1 is needed
		IBUFGDS #(
		.CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE"
		.DIFF_TERM("FALSE"), // Differential Termination
		.IOSTANDARD("LVDS_25") // Specifies the I/O standard for this buffer
		) BUF81 (
			.O(AD9511_output1), // Clock buffer output
			.I(AD9511_OUT_P[1]), // Diff_p clock buffer input
			.IB(AD9511_OUT_N[1]) // Diff_n clock buffer input
		);

	wire ATCA_reset_n ;
	IBUF BUF90 (
		.O(ATCA_reset_n), 
		.I(ATCA_RX_3A) //
	);  
	wire ATCA_reset_i = ~ATCA_reset_n ;
	

/* Global clocks ********************************************************************************************************/

/* ATCA IPP DAQ Clock Configuration


 AD9511 PLL       AD9511_OUT[1] ---------------> AD9511_output1 (100 Mhz)  -> | Clock Divider | --> ADC Clock, clk_2mhz_utdc 
                  AD9511_REF_* <----------------< AD9511_ref <----------------------|
                                                                                    |
 ATCA Backplane:                                                                    |
                                                                                    |
		|---------->ATCA_RX_1A ---> (shared signal) -> (BUFG)-> ATCA_shared_clk ----->|
 		|---------->ATCA_RX_1B ---> (shared signal) -> (BUFG)-> ATCA_trigger_n ----->|
 		|  			ATCA_RX_2 
		|           ATCA_TX_3 
      |
		|<--------  ATCA_TX_1A <---------------|                      ( master only)
		|<--------  ATCA_TX_1B <---------------|----< ORed_trigger_n  ( master only)
                                             |
                                             |
                                             | 
 RTM ->(RS485)--> RS485_RX_2 --->(BUFG)->----|           RS485_RX_2_buf (10 Mhz)
             |--> RS485_RX_1 --------------------->  |detect H-2-L| --->           	(Ext trigger, Activ Low)

			<--------RS485_TX[7]-----------------< adc_chop_i    ( adc chop phase)
			<--------RS485_TX[8]-----------------< clk_2mhz_utdc (adc clock)
		            RTM_PRESENT -----------------------------------------> Board is Master when signal is active (low)
*/	

//	wire clk_250;
//	IBUFGDS_LVPECL_25
//	 BUF250 (
//		.O(clk_250), // Clock buffer output
//		.I(CLK_250_P), // Diff_p clock buffer input
//		.IB(CLK_250_N) // Diff_n clock buffer input
//	);
//	
////	wire  ddr_clk;
//   reg clk2Synt;

/*
   reg [6:0] cnt_250;
   always @(posedge clk_250 or posedge ATCA_reset_i)
      if (ATCA_reset_i)
         cnt_250 <= 0;
      else begin
         cnt_250[0] <= ~cnt_250[0];
         if (cnt_250[0])
            cnt_250[6:1] <= cnt_250[6:1] + 1;
         if (cnt_250 == 62)
				clk2Synt <= 1'b1;
         if (cnt_250 == 124)
				begin
					clk2Synt <= 1'b0;
					cnt_250 <= 0;
				end
      end
*/

	IBUFG
	#(.IOSTANDARD("LVCMOS33"))
	 BUF84 (
		.O(ATCA_shared_clk), 
		.I(ATCA_RX_1A) // Shared 10 MHz Clock  from ATCA
	);
	
	wire RS485_RX_1_buf;
	IBUFG 
		#(.IOSTANDARD("LVCMOS33"))
	 BUF76 (
		.O(RS485_RX_1_buf), // 
		.I(RS485_RX[1]) // 
	);	

	wire RS485_RX_2_buf;
	IBUFG 
		#(.IOSTANDARD("LVCMOS33"))
	 BUF87 (
		.O(RS485_RX_2_buf), 
		.I(RS485_RX[2]) // 10MHz input on RTM
	);

	wire AD9511_ref =  ATCA_shared_clk;
	OBUFDS 
	#(
	.CAPACITANCE("NORMAL"), 
	.IOSTANDARD("LVDS_25") // Specify the output I/O standard
	)
	 BUF66 (
		.O(AD9511_REF_P), // Diff_p output (connect directly to top-level port)
		.OB(AD9511_REF_N), // Diff_n output (connect directly to top-level port)
		.I(AD9511_ref) 
	);
	
	defparam PCIe_CLK_MGT.SYNCLK1OUTEN = "ENABLE";
	defparam PCIe_CLK_MGT.SYNCLK2OUTEN = "DISABLE";
	wire PCIe_clock;
	GT11CLK PCIe_CLK_MGT (   
		.SYNCLK1OUT(PCIe_clock),
		.SYNCLK2OUT(),
		.MGTCLKP(PCIe_CLK_P),
		.MGTCLKN(PCIe_CLK_N)
	);

	wire SYSACE_clock_buf;
	IBUFG 
	#(.IOSTANDARD("LVCMOS33"))
	 BUF86 (
		.O(SYSACE_clock_buf), 
		.I(SYSACE_CLOCK) // Clock buffer input (connect directly to top-level port)
	);

	/* ADC channels timing signals */
	wire ADCs_start_conv_out;
	OBUFDS #(
	.CAPACITANCE("NORMAL"), // "LOW", "NORMAL", "DONT_CARE" was dont care - not supported by LVDS_25 O bufffers
	.IOSTANDARD("LVDS_25") // Specify the output I/O standard
	) 
	BUF65 (
		.O(ADCs_START_CONV_P), // Diff_p output (connect directly to top-level port)
		.OB(ADCs_START_CONV_N), // Diff_n output (connect directly to top-level port)
		.I(ADCs_start_conv_out) // Buffer input
	);

	assign SYSACE_MPCE = 1;

	assign PCIe_PLL_RESET = 0;

	assign RS232_TXD = 1;
	assign RS232_CTS = 1;
	
	wire [PCIE_DATA_WIDTH-1:0] commandREG;

	// ************************************   Streaming synchronization *************************
	reg stream_on_r = 1'b0;
	
	// **************************************RS485 Outputs **************************************
	assign RS485_TX_ENABLE[6:1] = 6'h0;
	assign RS485_TX_ENABLE[7] = commandREG[STREAME];
	assign RS485_TX_ENABLE[8] = commandREG[STREAME]; //1'b1;

	assign RS485_TX[6:1] = 6'hF;
	
	wire adc_chop_i, clk_2mhz_utdc;
	assign RS485_TX[7] = (stream_on_r)? adc_chop_i:1'b0; 
	assign RS485_TX[8] = (stream_on_r)? clk_2mhz_utdc:1'b0; 
	
	
/**********************************************************************************
		ATCA Slot Numbering on 14 slot Crates
		Physical 	| 1  | 2  | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
		Logical 	 	| 13 | 11 | 9 | 7 | 5 | 3 | 1 | 2 | 4 | 6  |  8 | 10 | 12 | 14 |
***********************************************************************************/	
	wire [3:0] slotID = IPMC_GPIO[10:7];

	wire master = ~RTM_PRESENT;  // Master is always board with RTM

	reg [1:0] software_trig_dly;
	reg [1:0] RS485_RX_1_delay;
	reg soft_trigger_n;
	
	reg hard_trigger_n;
	always @ (negedge ADCs_wordSync_n_i)
		begin
		 software_trig_dly <= {software_trig_dly[0], commandREG[STRG]}; 
		 soft_trigger_n   <= software_trig_dly[1] | ~commandREG[STRG] ; // at rising edge commandREG[STRG]
		 RS485_RX_1_delay <= {RS485_RX_1_delay[0],RS485_RX_1_buf};
		 hard_trigger_n   <=  (~RS485_RX_1_delay[1]) | RS485_RX_1_buf ; // falling edge  RS485_RX[1]
		end 

	wire ATCA_trigger_n;
 	IBUFG
	#(.IOSTANDARD("LVCMOS33"))
	 BUF85 (
		.O(ATCA_trigger_n), // 
		.I(ATCA_RX_1B) // 
	);

	/*Both triggers are ORed*/
	wire ored_trigger_n = soft_trigger_n & hard_trigger_n;
	
	wire  local_trigger_n = (master)? ATCA_trigger_n : (ATCA_trigger_n & soft_trigger_n ); // if slave, trigger on own soft trigger

	//wire ATCA_trigger_n = trigger_n; // bypass ATCA backplane

	//wire  trigger_actv_n = (ATCA_trigger_n & soft_trigger_n ); // always trigger on own soft trigger

	reg  acq_r = 0; //  used on RT_FIFO must be before stream en??

	localparam s1=3'b001;
	localparam s2=3'b010;
	localparam s3=3'b100;
	(* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="3'b001" *) 
	reg [2:0] regs_state = s1;
	always @(negedge ADCs_wordSync_n_i or negedge commandREG[ACQE])
			if (!commandREG[ACQE])
				begin
					regs_state <= s1;
					stream_on_r <= 1'b0;
					acq_r <= 1'b0;
				end
			else
				begin
					(* PARALLEL_CASE *) case (regs_state)
					s1: 				// idle / reset: reached after a reset or ACQE = 0 IOCTL
						begin
							acq_r <= 1'b1;
							if (commandREG[STREAME])
								regs_state <= s2;
						end
					s2:					// waiting on hard/soft trigger (trigger_n / STREAME IOCTL) or un-arm (ACQE disable IOCTL)
//						begin				// trigger event
						if (!local_trigger_n)
							regs_state <= s3;
//						end
					s3:					// streaming
//						begin
						stream_on_r <= 1'b1;
//						end
					default:
						begin
							regs_state <= s1;
							stream_on_r <= 1'b0;
						end
				endcase
			end


	assign AD9511_FUNCTION = 1;//ATCA_RX_2B;

	AD9511 AD9511_CONFIG (
		.reset(1'b0),
		.AD9511_SCLK(AD9511_SCLK),
		.AD9511_CSB(AD9511_CSB), 
		.AD9511_SDIO(AD9511_SDIO)
	);
 
	reg [31:0] time_counter_r;
	reg dcdc_reset_n = 1'b0;
	always @ (negedge ADCs_wordSync_n_i or posedge ATCA_reset_i)   //or negedge stream_en_dly[1])
	 if(ATCA_reset_i)
		begin
			time_counter_r <= 0;
			dcdc_reset_n <= 1'b0;
		end
	 else 
		begin
			time_counter_r <= time_counter_r + 1;
			/*de-sync DC-DC converters at startup ON Several boards*/
			if (time_counter_r[15:12] == slotID) 
				dcdc_reset_n <= 1'b1;
		end

	/**** ADC  Modules multiple Instatiation ******/
	wire [(ADC_DATA_WIDTH-1):0] c_data[N_ADC_CHANNELS:1]; // array of N_ADC_CHANNELS vectors
	wire [N_ADC_CHANNELS:1] ADC_clock_c; // corrected clock array  

   assign ADC_clock_c[12:1] =  ADC_clock[12:1];
   assign ADC_clock_c[13]   = ~ADC_clock[13]; // clocks 13 and 24 must be inverted!
   assign ADC_clock_c[23:14]=  ADC_clock[23:14];

   assign ADC_clock_c[24]   = ~ADC_clock[24]; // clocks 13 and 24 must be inverted!
   assign ADC_clock_c[32:25]=  ADC_clock[32:25];

   generate
		for (r=1; r <= N_ADC_CHANNELS; r=r+1) 
      begin: ADC_CHANs
			ADC_CHAN_SR CHANNELs (
				.ADC_word_sync_n(ADCs_wordSync_n_i), 
				.ADC_clock(ADC_clock_c[r]), 
				.ADC_serial_data(ADC_data[r]),
				.channel_data(c_data[r])
			);
      end
   endgenerate
	
	/**** DAC  Modules multiple Instatiation ******/
	wire [DAC_DATA_WIDTH-1:0] DAC_data_i[N_DAC_CHANNELS:1]; // array of N_DAC_CHANNELS vectors

	/* DAC 1 */
	DAC_2Mhz DAC_1(
		.reset(ATCA_reset_i),
		.data_i(time_counter_r[22:7]),
		.data_clock_n(ADCs_wordSync_n_i),
		.serial_clock_i(PCIe_trn_clk),
		.serial_data(DAC_s_data[1]),
		.word_sync(DAC_ENABLE[1]),
		.DAC_reset(DAC_RESET[1])
	);

	/* DAC 2 */
//	DAC_2Mhz DAC_2(
//		.reset(ATCA_reset_i),
//		.data_i(DAC_data_i[2]),
//		.data_clock_n(ADCs_wordSync_n_i),
//		.serial_clock_i(PCIe_trn_clk),
//		.serial_data(DAC_s_data[2]),
//		.word_sync(DAC_ENABLE[2]),
//		.DAC_reset(DAC_RESET[2])
//	);
//		DAC DAC_2 (
//			.reset(ATCA_reset_i),
//			.DAC_data(DAC_data_i[1]),
//			.DAC_clock(PCIe_trn_clk),
//			.DAC_serial_data(DAC_s_data[2]),
//			.DAC_word_sync(DAC_ENABLE[2]),
//			.DAC_reset(DAC_RESET[2])		
//		);


	/* DAC 3 */
//	DAC_2Mhz DAC_3(
//		.reset(ATCA_reset_i),
//		.data_i(DAC_data_i[1]),
//		.data_clock_n(ADCs_wordSync_n_i),
//		.serial_clock_i(PCIe_trn_clk),
//		.serial_data(DAC_s_data[3]),
//		.word_sync(DAC_ENABLE[3]),
//		.DAC_reset(DAC_RESET[3])
//	);

	/* DACs 2 to 8*/
  generate
      for (r=2; r <= N_DAC_CHANNELS; r=r+1) 
      begin: DAC_CHANs
			DAC RTM_CHANNEL2_8 (
				.reset(ATCA_reset_i),
				.DAC_data(DAC_data_i[r]),
				.DAC_clock(PCIe_trn_clk),
				.DAC_serial_data(DAC_s_data[r]),
				.DAC_word_sync(DAC_ENABLE[r]),
				.DAC_reset(DAC_RESET[r])		
			);
		end
   endgenerate

	wire [10:0] PCIe_rd_addr, PCIe_wr_addr;
	wire [31:0] PCIe_rd_data, PCIe_wr_data;

	wire PCIe_wr_en, PCIe_wr_busy, PCIe_pio_reset_n, PCIe_start_int ;
	wire PCIe_dma_rd_en, PCIe_dma_start,  cfg_interrupt_msienable; 
	//dmac_i,
	wire [31:0] PCIe_dma_data;

	wire dma_data_ready_i;

/*PCIe STATUS Word Register fields*/
//	wire [31:0] statusdREG =
//			{4'h0,								                          3'h0, ~ATCA_trigger_n,   		
//			 1'b0, AD9511_STATUS, master, cfg_interrupt_msienable,               slotID, 
//			 commandREG[STREAME], PCIe_dma_rd_en, PCIe_dma_start, dma_data_ready_i,	  2'b0, ~soft_trigger_n,  acq_r,   		
//			 FW_VERSION}; 

	wire ddr_init_done 	=  1'b1;
	wire mux_fifo_ready 	=  1'b1;
	wire acqc_i 	=  1'b0;
	wire dmac_i 	=  1'b0;
	
	wire [31:0] statusREG ={acqc_i, dmac_i, 2'b00,    					  											2'b00, RS485_RX_1_buf, AD9511_STATUS,   
		1'b0, master,  cfg_interrupt_msienable, ddr_init_done,																							slotID, 
		commandREG[STREAME], PCIe_dma_rd_en, PCIe_dma_start, dma_data_ready_i,	 ~ATCA_trigger_n, ~ored_trigger_n, acq_r, mux_fifo_ready,   
																																									FW_VERSION};	
	wire irq_dma_i; // pulse flag

//DEBUG LEDS 1: OFF 0:ON
	assign IPMC_GPIO_LEDS[5] = (stream_on_r)? time_counter_r[18] : time_counter_r[20];  
	assign IPMC_GPIO_LEDS[6] = RS485_RX_1_buf;

// ATCA output signals  (only for master board)
	assign ATCA_TX_1A = RS485_RX_2_buf;//internal_clk_2MHz;  // Master: clock out
	assign ATCA_TX_1B = ored_trigger_n; //RS485_RX[1]; 		// trigger
	assign ATCA_TX_2A = 1'b1; //DMA_sync;
	assign ATCA_TX_2B = 1'b1;//RT_clock; 
	assign ATCA_TX_3A = 1'b1;

	assign ATCA_TX_1A_ENABLE = (master) ? 1'b1 : 1'b0; 
	assign ATCA_TX_1B_ENABLE = (master) ? 1'b1 : 1'b0;
	assign ATCA_TX_2A_ENABLE = 1'b0; //;
	assign ATCA_TX_2B_ENABLE = 1'b0; 
	assign ATCA_TX_3A_ENABLE = 0; // Never enable when ATCA PCIe controller present

	assign ADCs_RESET = dcdc_reset_n;
//	assign ADCs_POWER_DOWN = ATCA_reset_i;  
	assign ADCs_POWER_DOWN = adc_chop_i ; 

	assign PCIe_start_int = irq_dma_i;

	/**** Modules Instatiation ******/

	wire [PCIE_DATA_WIDTH-1:2] PCIe_dma_addr;
	/******************** PCIe BLACK BOX ********************/
	PCIe_ENDPOINT PCIe_EndP (
		 .sys_clk(PCIe_clock), 
		 .sys_reset_n(ATCA_reset_n), 
		 .pci_exp_rxn(PCIe_RX_N), 
		 .pci_exp_rxp(PCIe_RX_P), 
		 .pci_exp_txn(PCIe_TX_N), 
		 .pci_exp_txp(PCIe_TX_P), 
		 .rd_addr(PCIe_rd_addr), 
		 .rd_data(PCIe_rd_data), 
		 .wr_addr(PCIe_wr_addr), 
		 .wr_data(PCIe_wr_data), 
		 .wr_en(PCIe_wr_en), 
		 .wr_busy(PCIe_wr_busy), 
		 .dma_data(PCIe_dma_data), 
		 .dma_addr(PCIe_dma_addr),
		 .dma_start(PCIe_dma_start), 
		 .dma_rd_en(PCIe_dma_rd_en),	 
		 .start_int_i(PCIe_start_int),
		 .cfg_interrupt_msienable(cfg_interrupt_msienable), // 0 - legacy; 1 - MSI
		 .trn_clk_o(PCIe_trn_clk),	 
		 .pio_reset_n(PCIe_pio_reset_n) // O
	);

	wire [PCIE_DATA_WIDTH-1:0] chop_max_count_i;
	wire [PCIE_DATA_WIDTH-1:0] chop_change_count_i;
	wire adc_chop_dly_i; 

/*Generate Chopper signal for ADC module*/ 
	CHOP_GEN CHOP_GEN_inst (
		 .clk(ADCs_wordSync_n_i), 
//		 .reset_n(commandREG[STREAME]),  TODO : sync chop...
		 .chop_en(commandREG[CHOP_ON]), 
		 .chop_default(commandREG[CHOP_DEFAULT]), 
		 .max_count(chop_max_count_i), 
		 .change_count(chop_change_count_i), 
		 .chop_o(adc_chop_i),
		 .chop_dly_o(adc_chop_dly_i)
		 );

	SYSTEM_CLOCKS SYSTEM_CLOCKS_inst (
		.PLL_clk_100MHz(AD9511_output1),
		.ADCs_word_sync(ADCs_wordSync_n_i), // clk data out
		.ADCs_start_conv_out(ADCs_start_conv_out),
		.clk_2mhz_utdc(clk_2mhz_utdc)
	);

	AD9511_CLOCKS AD9511_CLOCKS_inst (
		.clock_33MHz(SYSACE_clock_buf),
		.internal_clk_4MHz125(AD9511_SCLK)
	);

	wire [3:0] dma_curr_buf;
	wire [31:7] dma_size_i;
	wire [15:0] dma_words_thres_i;

	wire [15:0] reg_off_i;
	wire [31:0] reg_data_i;
	wire  reg_wrt_en_i;
	wire [31:2] PCIe_dma_init_addr;
	wire [15:0] int_decimate_i;
	
	PCIE_BAR1_REGISTERS inst_REGS (
		 .trn_clk(PCIe_trn_clk),  
		 .pio_reset_n(PCIe_pio_reset_n),
		 .rd_addr(PCIe_rd_addr), 
		 .rd_data(PCIe_rd_data), 
		 .wr_addr(PCIe_wr_addr), 
		 .wr_data(PCIe_wr_data), 
		 .wr_en(PCIe_wr_en), 
		 .wr_busy(PCIe_wr_busy), 
		 .dma_host_addr(PCIe_dma_init_addr), // o 30 bits
		 .command(commandREG),
		 .dma_curr_buf(dma_curr_buf),
		 .dma_size(dma_size_i),
		 .time_counter(time_counter_r),
		 .status(statusREG),
		 .REG_OFFSET(reg_off_i),
		 .REG_DATA(reg_data_i),
		 .reg_wrt_en(reg_wrt_en_i),
		 .INTEGR_DECIM(int_decimate_i),
		 .DAC_1_data(DAC_data_i[1]),
		 .DAC_2_data(DAC_data_i[2]),
		 .DAC_3_data(DAC_data_i[3]),
		 .DAC_4_data(DAC_data_i[4]),
		 .DAC_5_data(DAC_data_i[5]),
		 .DAC_6_data(DAC_data_i[6]),
		 .DAC_7_data(DAC_data_i[7]),
		 .DAC_8_data(DAC_data_i[8]),

		 .CHOP_MAX_COUNT(chop_max_count_i),
		 .CHOP_CHANGE_COUNT(chop_change_count_i)
		);

	DMA_SM inst_DMA_SM (
		 .trn_clk(PCIe_trn_clk), 
		 .dma_ready(dma_data_ready_i), // I 
		 .dma_init_addr(PCIe_dma_init_addr), // I
		 .dma_addr(PCIe_dma_addr),	  //  O 
		 .dma_rd_en(PCIe_dma_rd_en), // I 
		 .dma_start_o(PCIe_dma_start),//  O
		 //.dmac_o(), //  O dmac_i
		 .irq_dma_o(irq_dma_i),	//  O 
		 .stream_on(stream_on_r) ,  // I
		 .dma_curr_buf(dma_curr_buf),
		 .dma_size(dma_size_i)
		 );

	PCIe_packet_gen RT_pkgen (
		 .trn_clk(PCIe_trn_clk),
		 .pio_reset_n(PCIe_pio_reset_n),		 
		 .ff_clk(AD9511_output1), //100 MHz
		 .int_decimate(int_decimate_i),
		 .dma_ready(dma_data_ready_i),
//		 .command(commandREG),
		 .stream_on(stream_on_r),
		 .PCIe_dma_rd_en(PCIe_dma_rd_en),
		 .dma_data_out(PCIe_dma_data),
		 .wordSync_n(ADCs_wordSync_n_i),
		 .trigger_n(local_trigger_n), // resets counters. Signal sync with ADCs_wordSync_n_i
		 .acq_on(acq_r),
		 .time_counter(time_counter_r),
		 .adc_chop_dly(adc_chop_dly_i),
		 
		 .data_in_ch1(c_data[1]), 
		 .data_in_ch2(c_data[2]), 
		 .data_in_ch3(c_data[3]), 
		 .data_in_ch4(c_data[4]), 
		 .data_in_ch5(c_data[5]), 
		 .data_in_ch6(c_data[6]), 
		 .data_in_ch7(c_data[7]), 
		 .data_in_ch8(c_data[8]), 
		 .data_in_ch9(c_data[9]), 
		 .data_in_ch10(c_data[10]), 
		 .data_in_ch11(c_data[11]), 
		 .data_in_ch12(c_data[12]), 
		 .data_in_ch13(c_data[13]), 
		 .data_in_ch14(c_data[14]), 
		 .data_in_ch15(c_data[15]), 
		 .data_in_ch16(c_data[16]),
		 .data_in_ch17(c_data[17]), 
		 .data_in_ch18(c_data[18]), 
		 .data_in_ch19(c_data[19]), 
		 .data_in_ch20(c_data[20]), 
		 .data_in_ch21(c_data[21]), 
		 .data_in_ch22(c_data[22]), 
		 .data_in_ch23(c_data[23]), 
		 .data_in_ch24(c_data[24]), 
		 .data_in_ch25(c_data[25]), 
		 .data_in_ch26(c_data[26]),
		 .data_in_ch27(c_data[27]), 
		 .data_in_ch28(c_data[28]), 
		 .data_in_ch29(c_data[29]), 
		 .data_in_ch30(c_data[30]), 
		 .data_in_ch31(c_data[31]), 
		 .data_in_ch32(c_data[32]), 

		 .reg_offset(reg_off_i),
		 .reg_data(reg_data_i),
		 .reg_wrt_en(reg_wrt_en_i)
	 );

endmodule

