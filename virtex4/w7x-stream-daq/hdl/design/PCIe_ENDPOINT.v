`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IPFN
// Engineer: Ana Fernandes / B. Carvalho
// 
// Create Date: 21:52:50 07/02/2008 
// Design Name:  
// Module Name: PCIe_ENDPOINT 
// Target Devices: XC4VFX
// Tool versions: ISE10.1
// Description: INTERFACE PCIe logic Core - RX module - TX_DMA module and Turnoff module
//
//-- SVN keywords
// $Date: 2015-06-11 19:02:21 +0100 (Thu, 11 Jun 2015) $
// $Revision: 7422 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/PCIe_ENDPOINT.v $

// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PCIe_ENDPOINT(

	output 	[3:0]	  pci_exp_txp,
	output 	[3:0]	  pci_exp_txn,
	input  	[3:0]	  pci_exp_rxp,
	input  	[3:0]	  pci_exp_rxn,

	input         sys_reset_n,
	input         sys_clk,
//  --  Read Port

	output [10:0] rd_addr,
	output  [3:0] rd_be,   		
	input  [31:0] rd_data, 

	//  --  Write Port

	output [10:0] wr_addr,
	output [7:0]  wr_be,
	output [31:0] wr_data, 
	output 		  wr_en,
	input         wr_busy,
	input	 [31:2] dma_addr,
	input	 [31:0] dma_data,
	input         dma_start,
	output 		  dma_rd_en,
// Interrupts
	output   		cfg_interrupt_msienable, // 0 - legacy; 1 - MSI
	input         start_int_i, // pulse flag
// TRN interface
	output 		  trn_clk_o,
	output 		  pio_reset_n

);
//DEBUG 
/*output  		   ACQC, 
output 		   DMAC,  
output			start_interrupt,
output 			half_mem,
output         empty_dma_fifo, 
output         rd_en, 
output         DMAn, 
output         DMAE_r3, 
output         trig_cbuffer,
output         cfg_interrupt_n_out,
output 			cfg_interrupt_rdy_n_out,


output 			SERR_Enable,
output 			Recived_MASTER_ABORT,
output 			Recived_TARGET_ABORT,
output 			signaled_TARGET_ABORT,
output 			Interrupt_status, */

//);




//----- ENDPOINT CORE ------------------//			    
wire                      trn_reset_n_c;
wire                      trn_lnk_up_n_c;
wire                      trn_clk_c;

wire    [31:0]       	  trn_td_c;
wire                      trn_tsof_n_c;
wire                      trn_teof_n_c;
wire                      trn_tsrc_dsc_n_c;
wire                      trn_tsrc_rdy_n_c;

wire                      trn_tdst_rdy_n_c;
wire                      trn_tdst_dsc_n_c; 
wire                      trn_terrfwd_n_c;
wire    [31:0]            trn_rd_c;
wire                      trn_rsof_n_c;
wire                      trn_reof_n_c;
wire                      trn_rsrc_rdy_n_c;
wire                      trn_rsrc_dsc_n_c;
wire                      trn_rdst_rdy_n_c;
wire                      trn_rerrfwd_n_c;
wire                      trn_rnp_ok_n_c;
wire    [6:0]      		  trn_rbar_hit_n_c;
wire    [7:0]      		  trn_rfc_nph_av_c;
wire    [11:0]     		  trn_rfc_npd_av_c;
wire    [7:0]       		  trn_rfc_ph_av_c;
wire    [11:0]      		  trn_rfc_pd_av_c;
wire    [7:0]       		  trn_rfc_cplh_av_c;
wire    [11:0]      		  trn_rfc_cpld_av_c;
wire    [31:0]            cfg_do_c;
wire    [31:0]            cfg_di_c;
wire    [9:0]             cfg_dwaddr_c;
wire    [3:0]             cfg_byte_en_n_c;
wire                      cfg_wr_en_n_c;
wire                      cfg_rd_en_n_c;
wire                      cfg_rd_wr_done_n_c;
wire                      cfg_err_cor_n_c;
wire                      cfg_err_ur_n_c;
wire                      cfg_err_ecrc_n_c;
wire                      cfg_err_cpl_timeout_n_c;
wire                      cfg_err_cpl_abort_n_c;
wire                      cfg_err_cpl_unexpect_n_c;
wire                      cfg_err_posted_n_c;    
wire    [47:0]            cfg_err_tlp_cpl_header_c;
wire                      cfg_turnoff_ok_n_c;
wire                      cfg_to_turnoff_n_c;
wire                      cfg_trn_pending_n_c;
wire                      cfg_pm_wake_n_c;
wire    [2:0]        	  cfg_pcie_link_state_n_c;
wire    [63:0]            cfg_dsn_c;
wire    [7:0]       		  cfg_bus_number_c;
wire    [4:0]       		  cfg_device_number_c;
wire    [2:0]       		  cfg_function_number_c;
wire    [15:0]            cfg_status_c;
wire    [15:0]            cfg_command_c;
wire    [15:0]            cfg_dstatus_c;
wire    [15:0]            cfg_dcommand_c;
wire    [15:0]            cfg_lstatus_c;
wire    [15:0]            cfg_lcommand_c; 
wire    [7:0]             cfg_interrupt_do;
wire    [2:0]             cfg_interrupt_mmenable;


	assign trn_clk_o  = trn_clk_c;
 
		// Core input tie-offs
	assign trn_rnp_ok_n_c  = 1'b0;
	assign trn_terrfwd_n_c = 1'b1;
	assign cfg_err_cor_n_c = 1'b1;
	assign cfg_err_ur_n_c  = 1'b1;
	assign cfg_err_ecrc_n_c = 1'b1;
	assign cfg_err_cpl_timeout_n_c = 1'b1;
	assign cfg_err_cpl_abort_n_c = 1'b1;
	assign cfg_err_cpl_unexpect_n_c = 1'b1;
	assign cfg_err_posted_n_c = 1'b0;
//	assign cfg_interrupt_n_c = 1'b1;
	assign cfg_interrupt_assert_n_c = 1'b1; // Not used for MSI interrupts 
//	assign cfg_interrupt_di_c = 8'b0; // single MSI inter. - not used
	assign cfg_pm_wake_n_c = 1'b1;
	assign cfg_trn_pending_n_c = 1'b1;

	assign cfg_dwaddr_c = 0;
	assign cfg_err_tlp_cpl_header_c = 0;

	assign cfg_di_c = 0;
	assign cfg_byte_en_n_c = 4'hf;
	assign cfg_wr_en_n_c = 1;
	assign cfg_rd_en_n_c = 1;

	// PCI Express Device Serial Number = { 40'h<Extension Id.>, 24'h<Company Id> }
	assign cfg_dsn_c[31:0] =  {{8'h1},24'h000A35};  // EUI-64 1st DW
	assign cfg_dsn_c[63:32] = 32'h00000001;  // EUI-64 2nd DW 
	
	
//	assign SERR_Enable = cfg_command_c[8]; 
//	assign Recived_MASTER_ABORT = cfg_status_c[13]; 
//	assign Recived_TARGET_ABORT = cfg_status_c[12]; 
//	assign signaled_TARGET_ABORT = cfg_status_c[11]; 
//	assign Interrupt_status = cfg_status_c[3]; 

	
	//assign cfg_interrupt_n = 1'b1;
	assign cfg_interrupt_assert_n = 1'b1; // MSI inter. - not used ?
	
	
assign pio_reset_n = trn_reset_n_c & (~ trn_lnk_up_n_c);

//######################## MSI INTERRUPT MODE #########################//

reg cfg_interrupt_n_c = 1'b1;
wire cfg_interrupt_rdy_n_c;

always @(posedge trn_clk_c or negedge pio_reset_n)
	if (!pio_reset_n )
			cfg_interrupt_n_c  	<= 1'b1;				
 	else begin
			if (start_int_i && cfg_interrupt_rdy_n_c )
				cfg_interrupt_n_c  	<= 1'b0;				
			else if (!cfg_interrupt_rdy_n_c)
				cfg_interrupt_n_c  	<= 1'b1;	
	end

wire [4:0] trn_tbuf_av;
	
pcie_id20    ep (
// 
// PCI Express Fabric Interface
      .pci_exp_txp				(pci_exp_txp),              // O [7/3/0:0]
      .pci_exp_txn				(pci_exp_txn),              // O [7/3/0:0]
      .pci_exp_rxp				(pci_exp_rxp),              // O [7/3/0:0]
      .pci_exp_rxn				(pci_exp_rxn),              // O [7/3/0:0]
//
// System ( SYS ) Interface
//
		
		.sys_clk						(sys_clk),             // I
      .sys_reset_n				(sys_reset_n),             // I
//
//
// Transaction ( TRN ) Interface
//

      .trn_clk						(trn_clk_c),             // O
      .trn_reset_n				(trn_reset_n_c),         // O
      .trn_lnk_up_n				(trn_lnk_up_n_c),        // O
//Tx Local-Link
      .trn_td						(trn_td_c),              // I [31:0]
      .trn_tsof_n					(trn_tsof_n_c),          // I
      .trn_teof_n					(trn_teof_n_c),          // I
      .trn_tsrc_rdy_n			(trn_tsrc_rdy_n_c ),      // I
      .trn_tsrc_dsc_n			(trn_tsrc_dsc_n_c ),      // I
      .trn_tdst_rdy_n			(trn_tdst_rdy_n_c ),      // O
      .trn_tdst_dsc_n			(trn_tdst_dsc_n_c ),      // O
      .trn_terrfwd_n				(trn_terrfwd_n_c ),       // I
      .trn_tbuf_av				(trn_tbuf_av ),         // O [4:0]
//Rx Local-Link
      .trn_rd						(trn_rd_c ),              // O [31:0]
      .trn_rsof_n					(trn_rsof_n_c ),          // O
      .trn_reof_n					(trn_reof_n_c ),          // O
      .trn_rsrc_rdy_n			(trn_rsrc_rdy_n_c ),      // O
      .trn_rsrc_dsc_n			(trn_rsrc_dsc_n_c ),      // O
      .trn_rdst_rdy_n			(trn_rdst_rdy_n_c ),      // I
      .trn_rerrfwd_n				(trn_rerrfwd_n_c ),       // O
      .trn_rnp_ok_n				(trn_rnp_ok_n_c ),        // I
      .trn_rbar_hit_n			(trn_rbar_hit_n_c ),      // O [6:0]
      .trn_rfc_nph_av			(trn_rfc_nph_av_c ),      // O [11:0]
      .trn_rfc_npd_av			(trn_rfc_npd_av_c ),      // O [7:0]
      .trn_rfc_ph_av				(trn_rfc_ph_av_c ),       // O [11:0]
      .trn_rfc_pd_av				(trn_rfc_pd_av_c ),       // O [7:0]
      .trn_rfc_cplh_av			(trn_rfc_cplh_av_c ),     // O [11:0]
      .trn_rfc_cpld_av			(trn_rfc_cpld_av_c ),     // O [7:0]
//Host ( CFG ) Interface
      .cfg_do						(cfg_do_c ),              // O [31:0]
      .cfg_di						(cfg_di_c ),              // I [31:0]
      .cfg_dwaddr					(cfg_dwaddr_c ),          // I [9:0]
      .cfg_byte_en_n				(cfg_byte_en_n_c ),       // I [3:0]
      .cfg_wr_en_n				(cfg_wr_en_n_c ),         // I
      .cfg_rd_en_n				(cfg_rd_en_n_c ),         // I
      .cfg_rd_wr_done_n			(cfg_rd_wr_done_n_c ),    // O
      .cfg_err_cor_n				(cfg_err_cor_n_c ),       // I
      .cfg_err_ur_n				(cfg_err_ur_n_c ),        // I
      .cfg_err_ecrc_n			(cfg_err_ecrc_n_c ),      // I
      .cfg_err_cpl_timeout_n  (cfg_err_cpl_timeout_n_c ), // I
      .cfg_err_cpl_abort_n    (cfg_err_cpl_abort_n_c ),   // I
      .cfg_err_cpl_unexpect_n (cfg_err_cpl_unexpect_n_c ),// I
      .cfg_err_posted_n       (cfg_err_posted_n_c ),      // I
      .cfg_err_tlp_cpl_header (cfg_err_tlp_cpl_header_c ),// I [47:0]
      .cfg_interrupt_n        (cfg_interrupt_n_c),       // I
      .cfg_interrupt_rdy_n    (cfg_interrupt_rdy_n_c),   // O
		.cfg_turnoff_ok_n       (cfg_turnoff_ok_n_c ),      // I
		.cfg_to_turnoff_n       (cfg_to_turnoff_n_c ),      // O
		.cfg_trn_pending_n      (cfg_trn_pending_n_c ),     // I
      .cfg_pm_wake_n          (cfg_pm_wake_n_c ),         // I
      .cfg_pcie_link_state_n  (cfg_pcie_link_state_n_c ), // O [2:0]
      .cfg_dsn                (cfg_dsn_c ),     			 // I [63:0]                          
      .cfg_bus_number         (cfg_bus_number_c ),        // O [7:0]
      .cfg_device_number      (cfg_device_number_c ),     // O [4:0]
      .cfg_function_number    (cfg_function_number_c ),   // O [2:0]
      .cfg_status             (cfg_status_c ),            // O [15:0]
      .cfg_command            (cfg_command_c ),           // O [15:0]
      .cfg_dstatus            (cfg_dstatus_c ),           // O [15:0]
      .cfg_dcommand           (cfg_dcommand_c ),          // O [15:0]
      .cfg_lstatus            (cfg_lstatus_c ),           // O [15:0]
      .cfg_lcommand           (cfg_lcommand_c ),          // O [15:0]

		.cfg_interrupt_assert_n (cfg_interrupt_assert_n),
		.cfg_interrupt_di			(8'b0),  // single MSI inter. - not used
		.cfg_interrupt_do			(cfg_interrupt_do),
      .cfg_interrupt_mmenable	(cfg_interrupt_mmenable),
      .cfg_interrupt_msienable(cfg_interrupt_msienable), 
		
		.fast_train_simulation_only (1'b0),
		.two_plm_auto_config        (2'b00));
	
//------------------------------------//

    // Local wires
						 
wire  [15:0]  	   cfg_completer_id;
assign cfg_completer_id = {cfg_bus_number_c, cfg_device_number_c, cfg_function_number_c};
wire   cfg_bus_mstr_enable;
assign cfg_bus_mstr_enable = cfg_command_c[2];  						 
		

 wire          req_compl;
 wire          compl_done;
// wire          pio_reset_n = trn_reset_n & ~trn_lnk_up_n;




// Programmable I/O Module

    PIO_EP PIO_EP (

			.clk  ( trn_clk_c ),                           // I
			.rst_n ( pio_reset_n ),                      // I

			.trn_td ( trn_td_c ),                          // O [63/31:0]
			.trn_tsof_n ( trn_tsof_n_c ),                  // O
			.trn_teof_n ( trn_teof_n_c ),                  // O
			.trn_tsrc_rdy_n ( trn_tsrc_rdy_n_c ),          // O
			.trn_tsrc_dsc_n ( trn_tsrc_dsc_n_c ),          // O
			.trn_tdst_rdy_n ( trn_tdst_rdy_n_c ),          // I
			.trn_tdst_dsc_n ( trn_tdst_dsc_n_c ),          // I

			.trn_rd ( trn_rd_c ),                          // I [63/31:0]
			.trn_rsof_n ( trn_rsof_n_c ),                  // I
			.trn_reof_n ( trn_reof_n_c ),                  // I
			.trn_rsrc_rdy_n ( trn_rsrc_rdy_n_c ),          // I                        
			.trn_rsrc_dsc_n ( trn_rsrc_dsc_n_c ),          // I
			.trn_rbar_hit_n ( trn_rbar_hit_n_c ),          // I [6:0]                                                                                              
			.trn_rdst_rdy_n ( trn_rdst_rdy_n_c ),          // O

			.req_compl_o(req_compl),                     // O
			.compl_done_o(compl_done),                   // O

			.cfg_completer_id ( cfg_completer_id ),      // I [15:0]
			.cfg_bus_mstr_enable ( cfg_bus_mstr_enable ), // I
			.rd_addr(rd_addr), 
			.rd_be(rd_be), 
			.rd_data(rd_data), 
			.wr_addr(wr_addr), 
			.wr_be(wr_be), 
			.wr_data(wr_data), 
			.wr_en(wr_en), 
			.wr_busy(wr_busy),
			.dma_addr(dma_addr),
			.dma_data(dma_data),
			.dma_rd_en(dma_rd_en),

			.dma_start(dma_start)
		  );


    // 
    // Turn-Off controller
    //
    PIO_TO_CTRL PIO_TO  (

                        .clk( trn_clk_c ),                             // I
                        .rst_n( trn_reset_n_c ),                       // I

                        .req_compl_i( req_compl ),                   // I
                        .compl_done_i( compl_done ),                 // I

                        .cfg_to_turnoff_n( cfg_to_turnoff_n_c ),       // I
                        .cfg_turnoff_ok_n( cfg_turnoff_ok_n_c )        // O
     
                       );
	


endmodule
