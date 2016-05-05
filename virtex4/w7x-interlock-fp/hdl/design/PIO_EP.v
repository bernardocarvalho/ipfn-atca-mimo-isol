/*
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: BBC
//
// Project Name:   COMPASS
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    PIO_EP
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//-- Description: Endpoint Programmed I/O module. 
//--
//
//-- SVN keywords
 $Date: 2016-02-03 18:53:24 +0000 (Wed, 03 Feb 2016) $
 $Revision: 8264 $
 $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/hdl/design/PIO_EP.v $
// Revision: Final 1
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/

//--------------------------------------------------------------------------------

`timescale 1ns/1ns


module PIO_EP (
					clk,                 
					rst_n,              

					// LocalLink Tx

					trn_td,
					trn_tsof_n,
					trn_teof_n,
					trn_tsrc_dsc_n,
					trn_tsrc_rdy_n,
					trn_tdst_dsc_n,
					trn_tdst_rdy_n,

					// LocalLink Rx

					trn_rd,
					trn_rsof_n,
					trn_reof_n,
					trn_rsrc_rdy_n,
					trn_rsrc_dsc_n,
					trn_rbar_hit_n,
					trn_rdst_rdy_n,

					// Turnoff access

					req_compl_o,
					compl_done_o,

					// Configuration access

					cfg_completer_id,
					cfg_bus_mstr_enable,
					rd_addr,
					rd_be,
					rd_data, 

					wr_addr, 
					wr_be, 
					wr_data, 
					wr_en,
					wr_busy,
					dma_addr,
					dma_data,
					dma_rd_en,
					dma_start
           );

    input              clk;
    input              rst_n;

    // LocalLink Tx
    
    output [31:0]     trn_td;
    output            trn_tsof_n;
    output            trn_teof_n;
    output            trn_tsrc_dsc_n;
    output            trn_tsrc_rdy_n;
    input             trn_tdst_dsc_n;
    input             trn_tdst_rdy_n;
    
    // LocalLink Rx
    
    input [31:0]      trn_rd;
    input             trn_rsof_n;
    input             trn_reof_n;
    input             trn_rsrc_rdy_n;
    input [6:0]       trn_rbar_hit_n;
    input             trn_rsrc_dsc_n;
    output            trn_rdst_rdy_n;
    
    output            req_compl_o;
    output            compl_done_o;
    
    input [15:0]      cfg_completer_id;
    input             cfg_bus_mstr_enable;

    output [10:0]       rd_addr;
    output [3:0]        rd_be;
//
//    output  [10:0]      rd_addr; 
	 
//    output  [3:0]       rd_be; 
    input  [31:0]      rd_data; 

    output  [10:0]      wr_addr; 
    output  [7:0]       wr_be; 
    output  [31:0]      wr_data; 
    output            wr_en;
    input             wr_busy;
	 input [31:2]      dma_addr;
	 input [31:0]      dma_data;
    input             dma_start;
    output            dma_rd_en;
    // Local wires
    
//    wire  [10:0]      rd_addr; 
//    wire  [3:0]       rd_be; 
//    wire  [31:0]      rd_data; 
//
//    wire  [10:0]      wr_addr; 
//    wire  [7:0]       wr_be; 
//    wire  [31:0]      wr_data; 
//    wire              wr_en;
//    wire              wr_busy;

    wire              req_compl;
    wire              req_compl_with_data;
    wire              compl_done;

    wire  [2:0]       req_tc;
    wire              req_td; 
    wire              req_ep; 
    wire  [1:0]       req_attr; 
    wire  [9:0]       req_len;
    wire  [15:0]      req_rid;
    wire  [7:0]       req_tag;
    wire  [7:0]       req_be_int;
    wire  [12:0]      req_addr_int; 

    assign rd_addr = req_addr_int[12:2];
    assign rd_be =   req_be_int[3:0];
//
//	assign req_be_o = req_be_int;
//	assign req_addr_o = req_addr_int;

    //
    // Local-Link Receive Controller
    // 

    PIO_32_RX_ENGINE EP_RX (

                   .clk(clk),                           // I
                   .rst_n(rst_n),                       // I

                   // LocalLink Rx
                   .trn_rd(trn_rd),                     // I [63/31:0]
                   .trn_rsof_n(trn_rsof_n),             // I
                   .trn_reof_n(trn_reof_n),             // I
                   .trn_rsrc_rdy_n(trn_rsrc_rdy_n),     // I
                   .trn_rsrc_dsc_n(trn_rsrc_dsc_n),     // I
                   .trn_rbar_hit_n(trn_rbar_hit_n),     // I [6:0]
                   .trn_rdst_rdy_n(trn_rdst_rdy_n),     // O

                   // Handshake with Tx engine 

                   .req_compl_o(req_compl),             // O
                   .req_compl_with_data_o(req_compl_with_data), // O // DRT
                   .compl_done_i(compl_done),           // I

                   .req_tc_o(req_tc),                   // O [2:0]
                   .req_td_o(req_td),                   // O
                   .req_ep_o(req_ep),                   // O
                   .req_attr_o(req_attr),               // O [1:0]
                   .req_len_o(req_len),                 // O [9:0]
                   .req_rid_o(req_rid),                 // O [15:0]
                   .req_tag_o(req_tag),                 // O [7:0]
                   .req_be_o(req_be_int),                   // O [7:0]
                   .req_addr_o(req_addr_int),               // O [12:0]

                   // Memory Write Port

                   .wr_addr_o(wr_addr),                 // O [10:0]
                   .wr_be_o(wr_be),                     // O [7:0]
                   .wr_data_o(wr_data),                 // O [31:0]
                   .wr_en_o(wr_en),                     // O
                   .wr_busy_i(wr_busy)                  // I
                   
                   );

    //
    // Local-Link Transmit Controller
    // 

    PIO_DMA_32_TX_ENGINE EP_TX (

                   .clk(clk),                         // I
                   .rst_n(rst_n),                     // I

                   // LocalLink Tx
                   .trn_td(trn_td),                   // O [63/31:0]
                   .trn_tsof_n(trn_tsof_n),           // O
                   .trn_teof_n(trn_teof_n),           // O
                   .trn_tsrc_dsc_n(trn_tsrc_dsc_n),   // O
                   .trn_tsrc_rdy_n(trn_tsrc_rdy_n),   // O
                   .trn_tdst_dsc_n(trn_tdst_dsc_n),   // I
                   .trn_tdst_rdy_n(trn_tdst_rdy_n),   // I


                   // Handshake with Rx engine 
                   .req_compl_i(req_compl),           // I
                   .req_compl_with_data_i(req_compl_with_data), // I //DRT   
                   .compl_done_o(compl_done),         // 0

                   .req_tc_i(req_tc),                 // I [2:0]
                   .req_td_i(req_td),                 // I
                   .req_ep_i(req_ep),                 // I
                   .req_attr_i(req_attr),             // I [1:0]
                   .req_len_i(req_len),               // I [9:0]
                   .req_rid_i(req_rid),               // I [15:0]
                   .req_tag_i(req_tag),               // I [7:0]
                   .req_be_i(req_be_int),                 // I [7:0]
                   .req_addr_i(req_addr_int),             // I [12:0]
                    

//                   .rd_addr_o(rd_addr),              // O [10:0]
//                   .rd_be_o(rd_be),                  // O [3:0]
                   // Read Port
                   .rd_data_i(rd_data),              // I [31:0]
                   // DMA access
                   .dma_data_i(dma_data),
                   .dma_addr_i(dma_addr),
						 .dma_start_i(dma_start), // todo
						.dma_rd_en_o(dma_rd_en),

                   .completer_id_i(cfg_completer_id),          // I [15:0]
                   .cfg_bus_mstr_enable_i(cfg_bus_mstr_enable) // I

                   );

  assign req_compl_o  = req_compl;
  assign compl_done_o = compl_done;

endmodule // PIO_EP
