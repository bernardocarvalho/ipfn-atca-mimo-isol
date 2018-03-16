////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: pcie_id20.v
// /___/   /\     Timestamp: Tue Jun 09 13:16:19 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog E:/temp/FPGA/IPP/W7X_STREAM_DAQ/ip_cores/tmp/_cg/pcie_id20.ngc E:/temp/FPGA/IPP/W7X_STREAM_DAQ/ip_cores/tmp/_cg/pcie_id20.v 
// Device	: 4vfx60ff1152-11
// Input file	: E:/temp/FPGA/IPP/W7X_STREAM_DAQ/ip_cores/tmp/_cg/pcie_id20.ngc
// Output file	: E:/temp/FPGA/IPP/W7X_STREAM_DAQ/ip_cores/tmp/_cg/pcie_id20.v
// # of Modules	: 1
// Design Name	: pcie_id20
// Xilinx        : E:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module pcie_id20 (
  cfg_pm_wake_n, cfg_err_cpl_abort_n, trn_tsrc_rdy_n, trn_terrfwd_n, cfg_turnoff_ok_n, cfg_to_turnoff_n, trn_tdst_rdy_n, trn_rsrc_dsc_n, trn_rnp_ok_n
, trn_tsrc_dsc_n, cfg_err_cpl_unexpect_n, cfg_err_cor_n, cfg_wr_en_n, trn_rsrc_rdy_n, trn_tdst_dsc_n, trn_reset_n, cfg_err_ur_n, cfg_interrupt_n, 
cfg_err_cpl_timeout_n, trn_clk, cfg_trn_pending_n, fast_train_simulation_only, cfg_interrupt_msienable, trn_lnk_up_n, trn_tsof_n, trn_reof_n, 
cfg_rd_wr_done_n, cfg_rd_en_n, sys_clk, trn_rdst_rdy_n, trn_rerrfwd_n, cfg_interrupt_rdy_n, cfg_interrupt_assert_n, trn_teof_n, trn_rsof_n, 
cfg_err_posted_n, sys_reset_n, cfg_err_ecrc_n, pci_exp_txn, cfg_interrupt_do, pci_exp_txp, trn_rbar_hit_n, cfg_dstatus, cfg_function_number, trn_rd, 
trn_rfc_cplh_av, trn_td, cfg_dsn, trn_rfc_cpld_av, cfg_interrupt_mmenable, cfg_dcommand, trn_rfc_ph_av, trn_rfc_npd_av, cfg_bus_number, cfg_di, 
cfg_dwaddr, cfg_byte_en_n, cfg_do, cfg_device_number, cfg_lstatus, cfg_err_tlp_cpl_header, two_plm_auto_config, cfg_command, cfg_pcie_link_state_n, 
trn_tbuf_av, pci_exp_rxn, pci_exp_rxp, cfg_lcommand, cfg_status, trn_rfc_nph_av, trn_rfc_pd_av, cfg_interrupt_di
)/* synthesis syn_black_box syn_noprune=1 */;
  input cfg_pm_wake_n;
  input cfg_err_cpl_abort_n;
  input trn_tsrc_rdy_n;
  input trn_terrfwd_n;
  input cfg_turnoff_ok_n;
  output cfg_to_turnoff_n;
  output trn_tdst_rdy_n;
  output trn_rsrc_dsc_n;
  input trn_rnp_ok_n;
  input trn_tsrc_dsc_n;
  input cfg_err_cpl_unexpect_n;
  input cfg_err_cor_n;
  input cfg_wr_en_n;
  output trn_rsrc_rdy_n;
  output trn_tdst_dsc_n;
  output trn_reset_n;
  input cfg_err_ur_n;
  input cfg_interrupt_n;
  input cfg_err_cpl_timeout_n;
  output trn_clk;
  input cfg_trn_pending_n;
  input fast_train_simulation_only;
  output cfg_interrupt_msienable;
  output trn_lnk_up_n;
  input trn_tsof_n;
  output trn_reof_n;
  output cfg_rd_wr_done_n;
  input cfg_rd_en_n;
  input sys_clk;
  input trn_rdst_rdy_n;
  output trn_rerrfwd_n;
  output cfg_interrupt_rdy_n;
  input cfg_interrupt_assert_n;
  input trn_teof_n;
  output trn_rsof_n;
  input cfg_err_posted_n;
  input sys_reset_n;
  input cfg_err_ecrc_n;
  output [3 : 0] pci_exp_txn;
  output [7 : 0] cfg_interrupt_do;
  output [3 : 0] pci_exp_txp;
  output [6 : 0] trn_rbar_hit_n;
  output [15 : 0] cfg_dstatus;
  output [2 : 0] cfg_function_number;
  output [31 : 0] trn_rd;
  output [7 : 0] trn_rfc_cplh_av;
  input [31 : 0] trn_td;
  input [63 : 0] cfg_dsn;
  output [11 : 0] trn_rfc_cpld_av;
  output [2 : 0] cfg_interrupt_mmenable;
  output [15 : 0] cfg_dcommand;
  output [7 : 0] trn_rfc_ph_av;
  output [11 : 0] trn_rfc_npd_av;
  output [7 : 0] cfg_bus_number;
  input [31 : 0] cfg_di;
  input [9 : 0] cfg_dwaddr;
  input [3 : 0] cfg_byte_en_n;
  output [31 : 0] cfg_do;
  output [4 : 0] cfg_device_number;
  output [15 : 0] cfg_lstatus;
  input [47 : 0] cfg_err_tlp_cpl_header;
  input [1 : 0] two_plm_auto_config;
  output [15 : 0] cfg_command;
  output [2 : 0] cfg_pcie_link_state_n;
  output [4 : 0] trn_tbuf_av;
  input [3 : 0] pci_exp_rxn;
  input [3 : 0] pci_exp_rxp;
  output [15 : 0] cfg_lcommand;
  output [15 : 0] cfg_status;
  output [7 : 0] trn_rfc_nph_av;
  output [11 : 0] trn_rfc_pd_av;
  input [7 : 0] cfg_interrupt_di;
  
  // synthesis translate_off
  
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [3 : 0] pci_exp_txp_2;
  wire [3 : 0] pci_exp_txn_3;
  wire [3 : 0] pci_exp_rxp_4;
  wire [3 : 0] pci_exp_rxn_5;
  wire [31 : 0] trn_td_6;
  wire [4 : 0] trn_tbuf_av_7;
  wire [31 : 0] trn_rd_8;
  wire [6 : 0] trn_rbar_hit_n_9;
  wire [7 : 0] trn_rfc_nph_av_10;
  wire [11 : 0] trn_rfc_npd_av_11;
  wire [7 : 0] trn_rfc_ph_av_12;
  wire [11 : 0] trn_rfc_pd_av_13;
  wire [7 : 0] trn_rfc_cplh_av_14;
  wire [11 : 0] trn_rfc_cpld_av_15;
  wire [31 : 0] cfg_do_16;
  wire [31 : 0] cfg_di_17;
  wire [3 : 0] cfg_byte_en_n_18;
  wire [9 : 0] cfg_dwaddr_19;
  wire [47 : 0] cfg_err_tlp_cpl_header_20;
  wire [7 : 0] cfg_interrupt_di_21;
  wire [7 : 0] cfg_interrupt_do_22;
  wire [2 : 0] cfg_interrupt_mmenable_23;
  wire [2 : 0] cfg_pcie_link_state_n_24;
  wire [7 : 0] cfg_bus_number_25;
  wire [4 : 0] cfg_device_number_26;
  wire [2 : 0] cfg_function_number_27;
  wire [63 : 0] cfg_dsn_28;
  wire [15 : 0] cfg_status_29;
  wire [15 : 0] cfg_command_30;
  wire [15 : 0] cfg_dstatus_31;
  wire [15 : 0] cfg_dcommand_32;
  wire [15 : 0] cfg_lstatus_33;
  wire [15 : 0] cfg_lcommand_34;
  wire [1 : 0] two_plm_auto_config_35;
  wire [0 : 0] \BU2/trn_rrem_n ;
  assign
    pci_exp_txn[3] = pci_exp_txn_3[3],
    pci_exp_txn[2] = pci_exp_txn_3[2],
    pci_exp_txn[1] = pci_exp_txn_3[1],
    pci_exp_txn[0] = pci_exp_txn_3[0],
    cfg_interrupt_do[7] = cfg_interrupt_do_22[7],
    cfg_interrupt_do[6] = cfg_interrupt_do_22[6],
    cfg_interrupt_do[5] = cfg_interrupt_do_22[5],
    cfg_interrupt_do[4] = cfg_interrupt_do_22[4],
    cfg_interrupt_do[3] = cfg_interrupt_do_22[3],
    cfg_interrupt_do[2] = cfg_interrupt_do_22[2],
    cfg_interrupt_do[1] = cfg_interrupt_do_22[1],
    cfg_interrupt_do[0] = cfg_interrupt_do_22[0],
    pci_exp_txp[3] = pci_exp_txp_2[3],
    pci_exp_txp[2] = pci_exp_txp_2[2],
    pci_exp_txp[1] = pci_exp_txp_2[1],
    pci_exp_txp[0] = pci_exp_txp_2[0],
    trn_rbar_hit_n[6] = trn_rbar_hit_n_9[6],
    trn_rbar_hit_n[5] = trn_rbar_hit_n_9[5],
    trn_rbar_hit_n[4] = trn_rbar_hit_n_9[4],
    trn_rbar_hit_n[3] = trn_rbar_hit_n_9[3],
    trn_rbar_hit_n[2] = trn_rbar_hit_n_9[2],
    trn_rbar_hit_n[1] = trn_rbar_hit_n_9[1],
    trn_rbar_hit_n[0] = trn_rbar_hit_n_9[0],
    cfg_dstatus[15] = cfg_dstatus_31[15],
    cfg_dstatus[14] = cfg_dstatus_31[14],
    cfg_dstatus[13] = cfg_dstatus_31[13],
    cfg_dstatus[12] = cfg_dstatus_31[12],
    cfg_dstatus[11] = cfg_dstatus_31[11],
    cfg_dstatus[10] = cfg_dstatus_31[10],
    cfg_dstatus[9] = cfg_dstatus_31[9],
    cfg_dstatus[8] = cfg_dstatus_31[8],
    cfg_dstatus[7] = cfg_dstatus_31[7],
    cfg_dstatus[6] = cfg_dstatus_31[6],
    cfg_dstatus[5] = cfg_dstatus_31[5],
    cfg_dstatus[4] = cfg_dstatus_31[4],
    cfg_dstatus[3] = cfg_dstatus_31[3],
    cfg_dstatus[2] = cfg_dstatus_31[2],
    cfg_dstatus[1] = cfg_dstatus_31[1],
    cfg_dstatus[0] = cfg_dstatus_31[0],
    cfg_function_number[2] = cfg_function_number_27[2],
    cfg_function_number[1] = cfg_function_number_27[1],
    cfg_function_number[0] = cfg_function_number_27[0],
    trn_rd[31] = trn_rd_8[31],
    trn_rd[30] = trn_rd_8[30],
    trn_rd[29] = trn_rd_8[29],
    trn_rd[28] = trn_rd_8[28],
    trn_rd[27] = trn_rd_8[27],
    trn_rd[26] = trn_rd_8[26],
    trn_rd[25] = trn_rd_8[25],
    trn_rd[24] = trn_rd_8[24],
    trn_rd[23] = trn_rd_8[23],
    trn_rd[22] = trn_rd_8[22],
    trn_rd[21] = trn_rd_8[21],
    trn_rd[20] = trn_rd_8[20],
    trn_rd[19] = trn_rd_8[19],
    trn_rd[18] = trn_rd_8[18],
    trn_rd[17] = trn_rd_8[17],
    trn_rd[16] = trn_rd_8[16],
    trn_rd[15] = trn_rd_8[15],
    trn_rd[14] = trn_rd_8[14],
    trn_rd[13] = trn_rd_8[13],
    trn_rd[12] = trn_rd_8[12],
    trn_rd[11] = trn_rd_8[11],
    trn_rd[10] = trn_rd_8[10],
    trn_rd[9] = trn_rd_8[9],
    trn_rd[8] = trn_rd_8[8],
    trn_rd[7] = trn_rd_8[7],
    trn_rd[6] = trn_rd_8[6],
    trn_rd[5] = trn_rd_8[5],
    trn_rd[4] = trn_rd_8[4],
    trn_rd[3] = trn_rd_8[3],
    trn_rd[2] = trn_rd_8[2],
    trn_rd[1] = trn_rd_8[1],
    trn_rd[0] = trn_rd_8[0],
    trn_rfc_cplh_av[7] = trn_rfc_cplh_av_14[7],
    trn_rfc_cplh_av[6] = trn_rfc_cplh_av_14[6],
    trn_rfc_cplh_av[5] = trn_rfc_cplh_av_14[5],
    trn_rfc_cplh_av[4] = trn_rfc_cplh_av_14[4],
    trn_rfc_cplh_av[3] = trn_rfc_cplh_av_14[3],
    trn_rfc_cplh_av[2] = trn_rfc_cplh_av_14[2],
    trn_rfc_cplh_av[1] = trn_rfc_cplh_av_14[1],
    trn_rfc_cplh_av[0] = trn_rfc_cplh_av_14[0],
    trn_td_6[31] = trn_td[31],
    trn_td_6[30] = trn_td[30],
    trn_td_6[29] = trn_td[29],
    trn_td_6[28] = trn_td[28],
    trn_td_6[27] = trn_td[27],
    trn_td_6[26] = trn_td[26],
    trn_td_6[25] = trn_td[25],
    trn_td_6[24] = trn_td[24],
    trn_td_6[23] = trn_td[23],
    trn_td_6[22] = trn_td[22],
    trn_td_6[21] = trn_td[21],
    trn_td_6[20] = trn_td[20],
    trn_td_6[19] = trn_td[19],
    trn_td_6[18] = trn_td[18],
    trn_td_6[17] = trn_td[17],
    trn_td_6[16] = trn_td[16],
    trn_td_6[15] = trn_td[15],
    trn_td_6[14] = trn_td[14],
    trn_td_6[13] = trn_td[13],
    trn_td_6[12] = trn_td[12],
    trn_td_6[11] = trn_td[11],
    trn_td_6[10] = trn_td[10],
    trn_td_6[9] = trn_td[9],
    trn_td_6[8] = trn_td[8],
    trn_td_6[7] = trn_td[7],
    trn_td_6[6] = trn_td[6],
    trn_td_6[5] = trn_td[5],
    trn_td_6[4] = trn_td[4],
    trn_td_6[3] = trn_td[3],
    trn_td_6[2] = trn_td[2],
    trn_td_6[1] = trn_td[1],
    trn_td_6[0] = trn_td[0],
    cfg_dsn_28[63] = cfg_dsn[63],
    cfg_dsn_28[62] = cfg_dsn[62],
    cfg_dsn_28[61] = cfg_dsn[61],
    cfg_dsn_28[60] = cfg_dsn[60],
    cfg_dsn_28[59] = cfg_dsn[59],
    cfg_dsn_28[58] = cfg_dsn[58],
    cfg_dsn_28[57] = cfg_dsn[57],
    cfg_dsn_28[56] = cfg_dsn[56],
    cfg_dsn_28[55] = cfg_dsn[55],
    cfg_dsn_28[54] = cfg_dsn[54],
    cfg_dsn_28[53] = cfg_dsn[53],
    cfg_dsn_28[52] = cfg_dsn[52],
    cfg_dsn_28[51] = cfg_dsn[51],
    cfg_dsn_28[50] = cfg_dsn[50],
    cfg_dsn_28[49] = cfg_dsn[49],
    cfg_dsn_28[48] = cfg_dsn[48],
    cfg_dsn_28[47] = cfg_dsn[47],
    cfg_dsn_28[46] = cfg_dsn[46],
    cfg_dsn_28[45] = cfg_dsn[45],
    cfg_dsn_28[44] = cfg_dsn[44],
    cfg_dsn_28[43] = cfg_dsn[43],
    cfg_dsn_28[42] = cfg_dsn[42],
    cfg_dsn_28[41] = cfg_dsn[41],
    cfg_dsn_28[40] = cfg_dsn[40],
    cfg_dsn_28[39] = cfg_dsn[39],
    cfg_dsn_28[38] = cfg_dsn[38],
    cfg_dsn_28[37] = cfg_dsn[37],
    cfg_dsn_28[36] = cfg_dsn[36],
    cfg_dsn_28[35] = cfg_dsn[35],
    cfg_dsn_28[34] = cfg_dsn[34],
    cfg_dsn_28[33] = cfg_dsn[33],
    cfg_dsn_28[32] = cfg_dsn[32],
    cfg_dsn_28[31] = cfg_dsn[31],
    cfg_dsn_28[30] = cfg_dsn[30],
    cfg_dsn_28[29] = cfg_dsn[29],
    cfg_dsn_28[28] = cfg_dsn[28],
    cfg_dsn_28[27] = cfg_dsn[27],
    cfg_dsn_28[26] = cfg_dsn[26],
    cfg_dsn_28[25] = cfg_dsn[25],
    cfg_dsn_28[24] = cfg_dsn[24],
    cfg_dsn_28[23] = cfg_dsn[23],
    cfg_dsn_28[22] = cfg_dsn[22],
    cfg_dsn_28[21] = cfg_dsn[21],
    cfg_dsn_28[20] = cfg_dsn[20],
    cfg_dsn_28[19] = cfg_dsn[19],
    cfg_dsn_28[18] = cfg_dsn[18],
    cfg_dsn_28[17] = cfg_dsn[17],
    cfg_dsn_28[16] = cfg_dsn[16],
    cfg_dsn_28[15] = cfg_dsn[15],
    cfg_dsn_28[14] = cfg_dsn[14],
    cfg_dsn_28[13] = cfg_dsn[13],
    cfg_dsn_28[12] = cfg_dsn[12],
    cfg_dsn_28[11] = cfg_dsn[11],
    cfg_dsn_28[10] = cfg_dsn[10],
    cfg_dsn_28[9] = cfg_dsn[9],
    cfg_dsn_28[8] = cfg_dsn[8],
    cfg_dsn_28[7] = cfg_dsn[7],
    cfg_dsn_28[6] = cfg_dsn[6],
    cfg_dsn_28[5] = cfg_dsn[5],
    cfg_dsn_28[4] = cfg_dsn[4],
    cfg_dsn_28[3] = cfg_dsn[3],
    cfg_dsn_28[2] = cfg_dsn[2],
    cfg_dsn_28[1] = cfg_dsn[1],
    cfg_dsn_28[0] = cfg_dsn[0],
    trn_rfc_cpld_av[11] = trn_rfc_cpld_av_15[11],
    trn_rfc_cpld_av[10] = trn_rfc_cpld_av_15[10],
    trn_rfc_cpld_av[9] = trn_rfc_cpld_av_15[9],
    trn_rfc_cpld_av[8] = trn_rfc_cpld_av_15[8],
    trn_rfc_cpld_av[7] = trn_rfc_cpld_av_15[7],
    trn_rfc_cpld_av[6] = trn_rfc_cpld_av_15[6],
    trn_rfc_cpld_av[5] = trn_rfc_cpld_av_15[5],
    trn_rfc_cpld_av[4] = trn_rfc_cpld_av_15[4],
    trn_rfc_cpld_av[3] = trn_rfc_cpld_av_15[3],
    trn_rfc_cpld_av[2] = trn_rfc_cpld_av_15[2],
    trn_rfc_cpld_av[1] = trn_rfc_cpld_av_15[1],
    trn_rfc_cpld_av[0] = trn_rfc_cpld_av_15[0],
    cfg_interrupt_mmenable[2] = cfg_interrupt_mmenable_23[2],
    cfg_interrupt_mmenable[1] = cfg_interrupt_mmenable_23[1],
    cfg_interrupt_mmenable[0] = cfg_interrupt_mmenable_23[0],
    cfg_dcommand[15] = cfg_dcommand_32[15],
    cfg_dcommand[14] = cfg_dcommand_32[14],
    cfg_dcommand[13] = cfg_dcommand_32[13],
    cfg_dcommand[12] = cfg_dcommand_32[12],
    cfg_dcommand[11] = cfg_dcommand_32[11],
    cfg_dcommand[10] = cfg_dcommand_32[10],
    cfg_dcommand[9] = cfg_dcommand_32[9],
    cfg_dcommand[8] = cfg_dcommand_32[8],
    cfg_dcommand[7] = cfg_dcommand_32[7],
    cfg_dcommand[6] = cfg_dcommand_32[6],
    cfg_dcommand[5] = cfg_dcommand_32[5],
    cfg_dcommand[4] = cfg_dcommand_32[4],
    cfg_dcommand[3] = cfg_dcommand_32[3],
    cfg_dcommand[2] = cfg_dcommand_32[2],
    cfg_dcommand[1] = cfg_dcommand_32[1],
    cfg_dcommand[0] = cfg_dcommand_32[0],
    trn_rfc_ph_av[7] = trn_rfc_ph_av_12[7],
    trn_rfc_ph_av[6] = trn_rfc_ph_av_12[6],
    trn_rfc_ph_av[5] = trn_rfc_ph_av_12[5],
    trn_rfc_ph_av[4] = trn_rfc_ph_av_12[4],
    trn_rfc_ph_av[3] = trn_rfc_ph_av_12[3],
    trn_rfc_ph_av[2] = trn_rfc_ph_av_12[2],
    trn_rfc_ph_av[1] = trn_rfc_ph_av_12[1],
    trn_rfc_ph_av[0] = trn_rfc_ph_av_12[0],
    trn_rfc_npd_av[11] = trn_rfc_npd_av_11[11],
    trn_rfc_npd_av[10] = trn_rfc_npd_av_11[10],
    trn_rfc_npd_av[9] = trn_rfc_npd_av_11[9],
    trn_rfc_npd_av[8] = trn_rfc_npd_av_11[8],
    trn_rfc_npd_av[7] = trn_rfc_npd_av_11[7],
    trn_rfc_npd_av[6] = trn_rfc_npd_av_11[6],
    trn_rfc_npd_av[5] = trn_rfc_npd_av_11[5],
    trn_rfc_npd_av[4] = trn_rfc_npd_av_11[4],
    trn_rfc_npd_av[3] = trn_rfc_npd_av_11[3],
    trn_rfc_npd_av[2] = trn_rfc_npd_av_11[2],
    trn_rfc_npd_av[1] = trn_rfc_npd_av_11[1],
    trn_rfc_npd_av[0] = trn_rfc_npd_av_11[0],
    cfg_bus_number[7] = cfg_bus_number_25[7],
    cfg_bus_number[6] = cfg_bus_number_25[6],
    cfg_bus_number[5] = cfg_bus_number_25[5],
    cfg_bus_number[4] = cfg_bus_number_25[4],
    cfg_bus_number[3] = cfg_bus_number_25[3],
    cfg_bus_number[2] = cfg_bus_number_25[2],
    cfg_bus_number[1] = cfg_bus_number_25[1],
    cfg_bus_number[0] = cfg_bus_number_25[0],
    cfg_di_17[31] = cfg_di[31],
    cfg_di_17[30] = cfg_di[30],
    cfg_di_17[29] = cfg_di[29],
    cfg_di_17[28] = cfg_di[28],
    cfg_di_17[27] = cfg_di[27],
    cfg_di_17[26] = cfg_di[26],
    cfg_di_17[25] = cfg_di[25],
    cfg_di_17[24] = cfg_di[24],
    cfg_di_17[23] = cfg_di[23],
    cfg_di_17[22] = cfg_di[22],
    cfg_di_17[21] = cfg_di[21],
    cfg_di_17[20] = cfg_di[20],
    cfg_di_17[19] = cfg_di[19],
    cfg_di_17[18] = cfg_di[18],
    cfg_di_17[17] = cfg_di[17],
    cfg_di_17[16] = cfg_di[16],
    cfg_di_17[15] = cfg_di[15],
    cfg_di_17[14] = cfg_di[14],
    cfg_di_17[13] = cfg_di[13],
    cfg_di_17[12] = cfg_di[12],
    cfg_di_17[11] = cfg_di[11],
    cfg_di_17[10] = cfg_di[10],
    cfg_di_17[9] = cfg_di[9],
    cfg_di_17[8] = cfg_di[8],
    cfg_di_17[7] = cfg_di[7],
    cfg_di_17[6] = cfg_di[6],
    cfg_di_17[5] = cfg_di[5],
    cfg_di_17[4] = cfg_di[4],
    cfg_di_17[3] = cfg_di[3],
    cfg_di_17[2] = cfg_di[2],
    cfg_di_17[1] = cfg_di[1],
    cfg_di_17[0] = cfg_di[0],
    cfg_dwaddr_19[9] = cfg_dwaddr[9],
    cfg_dwaddr_19[8] = cfg_dwaddr[8],
    cfg_dwaddr_19[7] = cfg_dwaddr[7],
    cfg_dwaddr_19[6] = cfg_dwaddr[6],
    cfg_dwaddr_19[5] = cfg_dwaddr[5],
    cfg_dwaddr_19[4] = cfg_dwaddr[4],
    cfg_dwaddr_19[3] = cfg_dwaddr[3],
    cfg_dwaddr_19[2] = cfg_dwaddr[2],
    cfg_dwaddr_19[1] = cfg_dwaddr[1],
    cfg_dwaddr_19[0] = cfg_dwaddr[0],
    cfg_byte_en_n_18[3] = cfg_byte_en_n[3],
    cfg_byte_en_n_18[2] = cfg_byte_en_n[2],
    cfg_byte_en_n_18[1] = cfg_byte_en_n[1],
    cfg_byte_en_n_18[0] = cfg_byte_en_n[0],
    cfg_do[31] = cfg_do_16[31],
    cfg_do[30] = cfg_do_16[30],
    cfg_do[29] = cfg_do_16[29],
    cfg_do[28] = cfg_do_16[28],
    cfg_do[27] = cfg_do_16[27],
    cfg_do[26] = cfg_do_16[26],
    cfg_do[25] = cfg_do_16[25],
    cfg_do[24] = cfg_do_16[24],
    cfg_do[23] = cfg_do_16[23],
    cfg_do[22] = cfg_do_16[22],
    cfg_do[21] = cfg_do_16[21],
    cfg_do[20] = cfg_do_16[20],
    cfg_do[19] = cfg_do_16[19],
    cfg_do[18] = cfg_do_16[18],
    cfg_do[17] = cfg_do_16[17],
    cfg_do[16] = cfg_do_16[16],
    cfg_do[15] = cfg_do_16[15],
    cfg_do[14] = cfg_do_16[14],
    cfg_do[13] = cfg_do_16[13],
    cfg_do[12] = cfg_do_16[12],
    cfg_do[11] = cfg_do_16[11],
    cfg_do[10] = cfg_do_16[10],
    cfg_do[9] = cfg_do_16[9],
    cfg_do[8] = cfg_do_16[8],
    cfg_do[7] = cfg_do_16[7],
    cfg_do[6] = cfg_do_16[6],
    cfg_do[5] = cfg_do_16[5],
    cfg_do[4] = cfg_do_16[4],
    cfg_do[3] = cfg_do_16[3],
    cfg_do[2] = cfg_do_16[2],
    cfg_do[1] = cfg_do_16[1],
    cfg_do[0] = cfg_do_16[0],
    cfg_device_number[4] = cfg_device_number_26[4],
    cfg_device_number[3] = cfg_device_number_26[3],
    cfg_device_number[2] = cfg_device_number_26[2],
    cfg_device_number[1] = cfg_device_number_26[1],
    cfg_device_number[0] = cfg_device_number_26[0],
    cfg_lstatus[15] = cfg_lstatus_33[15],
    cfg_lstatus[14] = cfg_lstatus_33[14],
    cfg_lstatus[13] = cfg_lstatus_33[13],
    cfg_lstatus[12] = cfg_lstatus_33[12],
    cfg_lstatus[11] = cfg_lstatus_33[11],
    cfg_lstatus[10] = cfg_lstatus_33[10],
    cfg_lstatus[9] = cfg_lstatus_33[9],
    cfg_lstatus[8] = cfg_lstatus_33[8],
    cfg_lstatus[7] = cfg_lstatus_33[7],
    cfg_lstatus[6] = cfg_lstatus_33[6],
    cfg_lstatus[5] = cfg_lstatus_33[5],
    cfg_lstatus[4] = cfg_lstatus_33[4],
    cfg_lstatus[3] = cfg_lstatus_33[3],
    cfg_lstatus[2] = cfg_lstatus_33[2],
    cfg_lstatus[1] = cfg_lstatus_33[1],
    cfg_lstatus[0] = cfg_lstatus_33[0],
    cfg_err_tlp_cpl_header_20[47] = cfg_err_tlp_cpl_header[47],
    cfg_err_tlp_cpl_header_20[46] = cfg_err_tlp_cpl_header[46],
    cfg_err_tlp_cpl_header_20[45] = cfg_err_tlp_cpl_header[45],
    cfg_err_tlp_cpl_header_20[44] = cfg_err_tlp_cpl_header[44],
    cfg_err_tlp_cpl_header_20[43] = cfg_err_tlp_cpl_header[43],
    cfg_err_tlp_cpl_header_20[42] = cfg_err_tlp_cpl_header[42],
    cfg_err_tlp_cpl_header_20[41] = cfg_err_tlp_cpl_header[41],
    cfg_err_tlp_cpl_header_20[40] = cfg_err_tlp_cpl_header[40],
    cfg_err_tlp_cpl_header_20[39] = cfg_err_tlp_cpl_header[39],
    cfg_err_tlp_cpl_header_20[38] = cfg_err_tlp_cpl_header[38],
    cfg_err_tlp_cpl_header_20[37] = cfg_err_tlp_cpl_header[37],
    cfg_err_tlp_cpl_header_20[36] = cfg_err_tlp_cpl_header[36],
    cfg_err_tlp_cpl_header_20[35] = cfg_err_tlp_cpl_header[35],
    cfg_err_tlp_cpl_header_20[34] = cfg_err_tlp_cpl_header[34],
    cfg_err_tlp_cpl_header_20[33] = cfg_err_tlp_cpl_header[33],
    cfg_err_tlp_cpl_header_20[32] = cfg_err_tlp_cpl_header[32],
    cfg_err_tlp_cpl_header_20[31] = cfg_err_tlp_cpl_header[31],
    cfg_err_tlp_cpl_header_20[30] = cfg_err_tlp_cpl_header[30],
    cfg_err_tlp_cpl_header_20[29] = cfg_err_tlp_cpl_header[29],
    cfg_err_tlp_cpl_header_20[28] = cfg_err_tlp_cpl_header[28],
    cfg_err_tlp_cpl_header_20[27] = cfg_err_tlp_cpl_header[27],
    cfg_err_tlp_cpl_header_20[26] = cfg_err_tlp_cpl_header[26],
    cfg_err_tlp_cpl_header_20[25] = cfg_err_tlp_cpl_header[25],
    cfg_err_tlp_cpl_header_20[24] = cfg_err_tlp_cpl_header[24],
    cfg_err_tlp_cpl_header_20[23] = cfg_err_tlp_cpl_header[23],
    cfg_err_tlp_cpl_header_20[22] = cfg_err_tlp_cpl_header[22],
    cfg_err_tlp_cpl_header_20[21] = cfg_err_tlp_cpl_header[21],
    cfg_err_tlp_cpl_header_20[20] = cfg_err_tlp_cpl_header[20],
    cfg_err_tlp_cpl_header_20[19] = cfg_err_tlp_cpl_header[19],
    cfg_err_tlp_cpl_header_20[18] = cfg_err_tlp_cpl_header[18],
    cfg_err_tlp_cpl_header_20[17] = cfg_err_tlp_cpl_header[17],
    cfg_err_tlp_cpl_header_20[16] = cfg_err_tlp_cpl_header[16],
    cfg_err_tlp_cpl_header_20[15] = cfg_err_tlp_cpl_header[15],
    cfg_err_tlp_cpl_header_20[14] = cfg_err_tlp_cpl_header[14],
    cfg_err_tlp_cpl_header_20[13] = cfg_err_tlp_cpl_header[13],
    cfg_err_tlp_cpl_header_20[12] = cfg_err_tlp_cpl_header[12],
    cfg_err_tlp_cpl_header_20[11] = cfg_err_tlp_cpl_header[11],
    cfg_err_tlp_cpl_header_20[10] = cfg_err_tlp_cpl_header[10],
    cfg_err_tlp_cpl_header_20[9] = cfg_err_tlp_cpl_header[9],
    cfg_err_tlp_cpl_header_20[8] = cfg_err_tlp_cpl_header[8],
    cfg_err_tlp_cpl_header_20[7] = cfg_err_tlp_cpl_header[7],
    cfg_err_tlp_cpl_header_20[6] = cfg_err_tlp_cpl_header[6],
    cfg_err_tlp_cpl_header_20[5] = cfg_err_tlp_cpl_header[5],
    cfg_err_tlp_cpl_header_20[4] = cfg_err_tlp_cpl_header[4],
    cfg_err_tlp_cpl_header_20[3] = cfg_err_tlp_cpl_header[3],
    cfg_err_tlp_cpl_header_20[2] = cfg_err_tlp_cpl_header[2],
    cfg_err_tlp_cpl_header_20[1] = cfg_err_tlp_cpl_header[1],
    cfg_err_tlp_cpl_header_20[0] = cfg_err_tlp_cpl_header[0],
    two_plm_auto_config_35[1] = two_plm_auto_config[1],
    two_plm_auto_config_35[0] = two_plm_auto_config[0],
    cfg_command[15] = cfg_command_30[15],
    cfg_command[14] = cfg_command_30[14],
    cfg_command[13] = cfg_command_30[13],
    cfg_command[12] = cfg_command_30[12],
    cfg_command[11] = cfg_command_30[11],
    cfg_command[10] = cfg_command_30[10],
    cfg_command[9] = cfg_command_30[9],
    cfg_command[8] = cfg_command_30[8],
    cfg_command[7] = cfg_command_30[7],
    cfg_command[6] = cfg_command_30[6],
    cfg_command[5] = cfg_command_30[5],
    cfg_command[4] = cfg_command_30[4],
    cfg_command[3] = cfg_command_30[3],
    cfg_command[2] = cfg_command_30[2],
    cfg_command[1] = cfg_command_30[1],
    cfg_command[0] = cfg_command_30[0],
    cfg_pcie_link_state_n[2] = cfg_pcie_link_state_n_24[2],
    cfg_pcie_link_state_n[1] = cfg_pcie_link_state_n_24[1],
    cfg_pcie_link_state_n[0] = cfg_pcie_link_state_n_24[0],
    trn_tbuf_av[4] = trn_tbuf_av_7[4],
    trn_tbuf_av[3] = trn_tbuf_av_7[3],
    trn_tbuf_av[2] = trn_tbuf_av_7[2],
    trn_tbuf_av[1] = trn_tbuf_av_7[1],
    trn_tbuf_av[0] = trn_tbuf_av_7[0],
    pci_exp_rxn_5[3] = pci_exp_rxn[3],
    pci_exp_rxn_5[2] = pci_exp_rxn[2],
    pci_exp_rxn_5[1] = pci_exp_rxn[1],
    pci_exp_rxn_5[0] = pci_exp_rxn[0],
    pci_exp_rxp_4[3] = pci_exp_rxp[3],
    pci_exp_rxp_4[2] = pci_exp_rxp[2],
    pci_exp_rxp_4[1] = pci_exp_rxp[1],
    pci_exp_rxp_4[0] = pci_exp_rxp[0],
    cfg_lcommand[15] = cfg_lcommand_34[15],
    cfg_lcommand[14] = cfg_lcommand_34[14],
    cfg_lcommand[13] = cfg_lcommand_34[13],
    cfg_lcommand[12] = cfg_lcommand_34[12],
    cfg_lcommand[11] = cfg_lcommand_34[11],
    cfg_lcommand[10] = cfg_lcommand_34[10],
    cfg_lcommand[9] = cfg_lcommand_34[9],
    cfg_lcommand[8] = cfg_lcommand_34[8],
    cfg_lcommand[7] = cfg_lcommand_34[7],
    cfg_lcommand[6] = cfg_lcommand_34[6],
    cfg_lcommand[5] = cfg_lcommand_34[5],
    cfg_lcommand[4] = cfg_lcommand_34[4],
    cfg_lcommand[3] = cfg_lcommand_34[3],
    cfg_lcommand[2] = cfg_lcommand_34[2],
    cfg_lcommand[1] = cfg_lcommand_34[1],
    cfg_lcommand[0] = cfg_lcommand_34[0],
    cfg_status[15] = cfg_status_29[15],
    cfg_status[14] = cfg_status_29[14],
    cfg_status[13] = cfg_status_29[13],
    cfg_status[12] = cfg_status_29[12],
    cfg_status[11] = cfg_status_29[11],
    cfg_status[10] = cfg_status_29[10],
    cfg_status[9] = cfg_status_29[9],
    cfg_status[8] = cfg_status_29[8],
    cfg_status[7] = cfg_status_29[7],
    cfg_status[6] = cfg_status_29[6],
    cfg_status[5] = cfg_status_29[5],
    cfg_status[4] = cfg_status_29[4],
    cfg_status[3] = cfg_status_29[3],
    cfg_status[2] = cfg_status_29[2],
    cfg_status[1] = cfg_status_29[1],
    cfg_status[0] = cfg_status_29[0],
    trn_rfc_nph_av[7] = trn_rfc_nph_av_10[7],
    trn_rfc_nph_av[6] = trn_rfc_nph_av_10[6],
    trn_rfc_nph_av[5] = trn_rfc_nph_av_10[5],
    trn_rfc_nph_av[4] = trn_rfc_nph_av_10[4],
    trn_rfc_nph_av[3] = trn_rfc_nph_av_10[3],
    trn_rfc_nph_av[2] = trn_rfc_nph_av_10[2],
    trn_rfc_nph_av[1] = trn_rfc_nph_av_10[1],
    trn_rfc_nph_av[0] = trn_rfc_nph_av_10[0],
    trn_rfc_pd_av[11] = trn_rfc_pd_av_13[11],
    trn_rfc_pd_av[10] = trn_rfc_pd_av_13[10],
    trn_rfc_pd_av[9] = trn_rfc_pd_av_13[9],
    trn_rfc_pd_av[8] = trn_rfc_pd_av_13[8],
    trn_rfc_pd_av[7] = trn_rfc_pd_av_13[7],
    trn_rfc_pd_av[6] = trn_rfc_pd_av_13[6],
    trn_rfc_pd_av[5] = trn_rfc_pd_av_13[5],
    trn_rfc_pd_av[4] = trn_rfc_pd_av_13[4],
    trn_rfc_pd_av[3] = trn_rfc_pd_av_13[3],
    trn_rfc_pd_av[2] = trn_rfc_pd_av_13[2],
    trn_rfc_pd_av[1] = trn_rfc_pd_av_13[1],
    trn_rfc_pd_av[0] = trn_rfc_pd_av_13[0],
    cfg_interrupt_di_21[7] = cfg_interrupt_di[7],
    cfg_interrupt_di_21[6] = cfg_interrupt_di[6],
    cfg_interrupt_di_21[5] = cfg_interrupt_di[5],
    cfg_interrupt_di_21[4] = cfg_interrupt_di[4],
    cfg_interrupt_di_21[3] = cfg_interrupt_di[3],
    cfg_interrupt_di_21[2] = cfg_interrupt_di[2],
    cfg_interrupt_di_21[1] = cfg_interrupt_di[1],
    cfg_interrupt_di_21[0] = cfg_interrupt_di[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  pci_exp_4_lane_32b_ep   \BU2/U0/interface_32bit.pcie_4_lane.pci_exp_4_lane_32b_ep0  (
    .trn_rsrc_rdy_n(trn_rsrc_rdy_n),
    .trn_terrfwd_n(trn_terrfwd_n),
    .cfg_err_cpl_abort_n(cfg_err_cpl_abort_n),
    .trn_rerrfwd_n(trn_rerrfwd_n),
    .cfg_err_cpl_unexpect_n(cfg_err_cpl_unexpect_n),
    .trn_rnp_ok_n(trn_rnp_ok_n),
    .cfg_to_turnoff_n(cfg_to_turnoff_n),
    .trn_tsrc_dsc_n(trn_tsrc_dsc_n),
    .cfg_rd_en_n(cfg_rd_en_n),
    .cfg_err_ecrc_n(cfg_err_ecrc_n),
    .trn_tdst_rdy_n(trn_tdst_rdy_n),
    .trn_rsof_n(trn_rsof_n),
    .cfg_rd_wr_done_n(cfg_rd_wr_done_n),
    .trn_teof_n(trn_teof_n),
    .trn_clk(trn_clk),
    .cfg_trn_pending_n(cfg_trn_pending_n),
    .trn_reset_n(trn_reset_n),
    .trn_rsrc_dsc_n(trn_rsrc_dsc_n),
    .cfg_err_cpl_timeout_n(cfg_err_cpl_timeout_n),
    .cfg_interrupt_msienable(cfg_interrupt_msienable),
    .trn_rdst_rdy_n(trn_rdst_rdy_n),
    .trn_tsrc_rdy_n(trn_tsrc_rdy_n),
    .cfg_err_ur_n(cfg_err_ur_n),
    .cfg_interrupt_n(cfg_interrupt_n),
    .trn_tsof_n(trn_tsof_n),
    .cfg_wr_en_n(cfg_wr_en_n),
    .cfg_pm_wake_n(cfg_pm_wake_n),
    .cfg_interrupt_rdy_n(cfg_interrupt_rdy_n),
    .cfg_turnoff_ok_n(cfg_turnoff_ok_n),
    .trn_tdst_dsc_n(trn_tdst_dsc_n),
    .cfg_err_posted_n(cfg_err_posted_n),
    .sys_reset_n(sys_reset_n),
    .trn_reof_n(trn_reof_n),
    .cfg_err_cor_n(cfg_err_cor_n),
    .sys_clk(sys_clk),
    .trn_lnk_up_n(trn_lnk_up_n),
    .cfg_interrupt_assert_n(cfg_interrupt_assert_n),
    .cfg_device_number({cfg_device_number_26[4], cfg_device_number_26[3], cfg_device_number_26[2], cfg_device_number_26[1], cfg_device_number_26[0]}),
    .cfg_dstatus({cfg_dstatus_31[15], cfg_dstatus_31[14], cfg_dstatus_31[13], cfg_dstatus_31[12], cfg_dstatus_31[11], cfg_dstatus_31[10], 
cfg_dstatus_31[9], cfg_dstatus_31[8], cfg_dstatus_31[7], cfg_dstatus_31[6], cfg_dstatus_31[5], cfg_dstatus_31[4], cfg_dstatus_31[3], cfg_dstatus_31[2]
, cfg_dstatus_31[1], cfg_dstatus_31[0]}),
    .cfg_lcommand({cfg_lcommand_34[15], cfg_lcommand_34[14], cfg_lcommand_34[13], cfg_lcommand_34[12], cfg_lcommand_34[11], cfg_lcommand_34[10], 
cfg_lcommand_34[9], cfg_lcommand_34[8], cfg_lcommand_34[7], cfg_lcommand_34[6], cfg_lcommand_34[5], cfg_lcommand_34[4], cfg_lcommand_34[3], 
cfg_lcommand_34[2], cfg_lcommand_34[1], cfg_lcommand_34[0]}),
    .pci_exp_txn({pci_exp_txn_3[3], pci_exp_txn_3[2], pci_exp_txn_3[1], pci_exp_txn_3[0]}),
    .pci_exp_txp({pci_exp_txp_2[3], pci_exp_txp_2[2], pci_exp_txp_2[1], pci_exp_txp_2[0]}),
    .cfg_status({cfg_status_29[15], cfg_status_29[14], cfg_status_29[13], cfg_status_29[12], cfg_status_29[11], cfg_status_29[10], cfg_status_29[9], 
cfg_status_29[8], cfg_status_29[7], cfg_status_29[6], cfg_status_29[5], cfg_status_29[4], cfg_status_29[3], cfg_status_29[2], cfg_status_29[1], 
cfg_status_29[0]}),
    .trn_rfc_cplh_av({trn_rfc_cplh_av_14[7], trn_rfc_cplh_av_14[6], trn_rfc_cplh_av_14[5], trn_rfc_cplh_av_14[4], trn_rfc_cplh_av_14[3], 
trn_rfc_cplh_av_14[2], trn_rfc_cplh_av_14[1], trn_rfc_cplh_av_14[0]}),
    .cfg_interrupt_do({cfg_interrupt_do_22[7], cfg_interrupt_do_22[6], cfg_interrupt_do_22[5], cfg_interrupt_do_22[4], cfg_interrupt_do_22[3], 
cfg_interrupt_do_22[2], cfg_interrupt_do_22[1], cfg_interrupt_do_22[0]}),
    .trn_rfc_nph_av({trn_rfc_nph_av_10[7], trn_rfc_nph_av_10[6], trn_rfc_nph_av_10[5], trn_rfc_nph_av_10[4], trn_rfc_nph_av_10[3], 
trn_rfc_nph_av_10[2], trn_rfc_nph_av_10[1], trn_rfc_nph_av_10[0]}),
    .cfg_interrupt_mmenable({cfg_interrupt_mmenable_23[2], cfg_interrupt_mmenable_23[1], cfg_interrupt_mmenable_23[0]}),
    .trn_rfc_ph_av({trn_rfc_ph_av_12[7], trn_rfc_ph_av_12[6], trn_rfc_ph_av_12[5], trn_rfc_ph_av_12[4], trn_rfc_ph_av_12[3], trn_rfc_ph_av_12[2], 
trn_rfc_ph_av_12[1], trn_rfc_ph_av_12[0]}),
    .cfg_bus_number({cfg_bus_number_25[7], cfg_bus_number_25[6], cfg_bus_number_25[5], cfg_bus_number_25[4], cfg_bus_number_25[3], 
cfg_bus_number_25[2], cfg_bus_number_25[1], cfg_bus_number_25[0]}),
    .trn_tbuf_av({trn_tbuf_av_7[4], trn_tbuf_av_7[3], trn_tbuf_av_7[2], trn_tbuf_av_7[1], trn_tbuf_av_7[0]}),
    .trn_rfc_cpld_av({trn_rfc_cpld_av_15[11], trn_rfc_cpld_av_15[10], trn_rfc_cpld_av_15[9], trn_rfc_cpld_av_15[8], trn_rfc_cpld_av_15[7], 
trn_rfc_cpld_av_15[6], trn_rfc_cpld_av_15[5], trn_rfc_cpld_av_15[4], trn_rfc_cpld_av_15[3], trn_rfc_cpld_av_15[2], trn_rfc_cpld_av_15[1], 
trn_rfc_cpld_av_15[0]}),
    .cfg_command({cfg_command_30[15], cfg_command_30[14], cfg_command_30[13], cfg_command_30[12], cfg_command_30[11], cfg_command_30[10], 
cfg_command_30[9], cfg_command_30[8], cfg_command_30[7], cfg_command_30[6], cfg_command_30[5], cfg_command_30[4], cfg_command_30[3], cfg_command_30[2]
, cfg_command_30[1], cfg_command_30[0]}),
    .cfg_lstatus({cfg_lstatus_33[15], cfg_lstatus_33[14], cfg_lstatus_33[13], cfg_lstatus_33[12], cfg_lstatus_33[11], cfg_lstatus_33[10], 
cfg_lstatus_33[9], cfg_lstatus_33[8], cfg_lstatus_33[7], cfg_lstatus_33[6], cfg_lstatus_33[5], cfg_lstatus_33[4], cfg_lstatus_33[3], cfg_lstatus_33[2]
, cfg_lstatus_33[1], cfg_lstatus_33[0]}),
    .trn_rbar_hit_n({trn_rbar_hit_n_9[6], trn_rbar_hit_n_9[5], trn_rbar_hit_n_9[4], trn_rbar_hit_n_9[3], trn_rbar_hit_n_9[2], trn_rbar_hit_n_9[1], 
trn_rbar_hit_n_9[0]}),
    .trn_rfc_npd_av({trn_rfc_npd_av_11[11], trn_rfc_npd_av_11[10], trn_rfc_npd_av_11[9], trn_rfc_npd_av_11[8], trn_rfc_npd_av_11[7], 
trn_rfc_npd_av_11[6], trn_rfc_npd_av_11[5], trn_rfc_npd_av_11[4], trn_rfc_npd_av_11[3], trn_rfc_npd_av_11[2], trn_rfc_npd_av_11[1], 
trn_rfc_npd_av_11[0]}),
    .cfg_dcommand({cfg_dcommand_32[15], cfg_dcommand_32[14], cfg_dcommand_32[13], cfg_dcommand_32[12], cfg_dcommand_32[11], cfg_dcommand_32[10], 
cfg_dcommand_32[9], cfg_dcommand_32[8], cfg_dcommand_32[7], cfg_dcommand_32[6], cfg_dcommand_32[5], cfg_dcommand_32[4], cfg_dcommand_32[3], 
cfg_dcommand_32[2], cfg_dcommand_32[1], cfg_dcommand_32[0]}),
    .cfg_pcie_link_state_n({cfg_pcie_link_state_n_24[2], cfg_pcie_link_state_n_24[1], cfg_pcie_link_state_n_24[0]}),
    .trn_rfc_pd_av({trn_rfc_pd_av_13[11], trn_rfc_pd_av_13[10], trn_rfc_pd_av_13[9], trn_rfc_pd_av_13[8], trn_rfc_pd_av_13[7], trn_rfc_pd_av_13[6], 
trn_rfc_pd_av_13[5], trn_rfc_pd_av_13[4], trn_rfc_pd_av_13[3], trn_rfc_pd_av_13[2], trn_rfc_pd_av_13[1], trn_rfc_pd_av_13[0]}),
    .cfg_function_number({cfg_function_number_27[2], cfg_function_number_27[1], cfg_function_number_27[0]}),
    .trn_rd({trn_rd_8[31], trn_rd_8[30], trn_rd_8[29], trn_rd_8[28], trn_rd_8[27], trn_rd_8[26], trn_rd_8[25], trn_rd_8[24], trn_rd_8[23], 
trn_rd_8[22], trn_rd_8[21], trn_rd_8[20], trn_rd_8[19], trn_rd_8[18], trn_rd_8[17], trn_rd_8[16], trn_rd_8[15], trn_rd_8[14], trn_rd_8[13], 
trn_rd_8[12], trn_rd_8[11], trn_rd_8[10], trn_rd_8[9], trn_rd_8[8], trn_rd_8[7], trn_rd_8[6], trn_rd_8[5], trn_rd_8[4], trn_rd_8[3], trn_rd_8[2], 
trn_rd_8[1], trn_rd_8[0]}),
    .cfg_do({cfg_do_16[31], cfg_do_16[30], cfg_do_16[29], cfg_do_16[28], cfg_do_16[27], cfg_do_16[26], cfg_do_16[25], cfg_do_16[24], cfg_do_16[23], 
cfg_do_16[22], cfg_do_16[21], cfg_do_16[20], cfg_do_16[19], cfg_do_16[18], cfg_do_16[17], cfg_do_16[16], cfg_do_16[15], cfg_do_16[14], cfg_do_16[13], 
cfg_do_16[12], cfg_do_16[11], cfg_do_16[10], cfg_do_16[9], cfg_do_16[8], cfg_do_16[7], cfg_do_16[6], cfg_do_16[5], cfg_do_16[4], cfg_do_16[3], 
cfg_do_16[2], cfg_do_16[1], cfg_do_16[0]}),
    .trn_td({trn_td_6[31], trn_td_6[30], trn_td_6[29], trn_td_6[28], trn_td_6[27], trn_td_6[26], trn_td_6[25], trn_td_6[24], trn_td_6[23], 
trn_td_6[22], trn_td_6[21], trn_td_6[20], trn_td_6[19], trn_td_6[18], trn_td_6[17], trn_td_6[16], trn_td_6[15], trn_td_6[14], trn_td_6[13], 
trn_td_6[12], trn_td_6[11], trn_td_6[10], trn_td_6[9], trn_td_6[8], trn_td_6[7], trn_td_6[6], trn_td_6[5], trn_td_6[4], trn_td_6[3], trn_td_6[2], 
trn_td_6[1], trn_td_6[0]}),
    .cfg_byte_en_n({cfg_byte_en_n_18[3], cfg_byte_en_n_18[2], cfg_byte_en_n_18[1], cfg_byte_en_n_18[0]}),
    .cfg_interrupt_di({cfg_interrupt_di_21[7], cfg_interrupt_di_21[6], cfg_interrupt_di_21[5], cfg_interrupt_di_21[4], cfg_interrupt_di_21[3], 
cfg_interrupt_di_21[2], cfg_interrupt_di_21[1], cfg_interrupt_di_21[0]}),
    .cfg_dsn({cfg_dsn_28[63], cfg_dsn_28[62], cfg_dsn_28[61], cfg_dsn_28[60], cfg_dsn_28[59], cfg_dsn_28[58], cfg_dsn_28[57], cfg_dsn_28[56], 
cfg_dsn_28[55], cfg_dsn_28[54], cfg_dsn_28[53], cfg_dsn_28[52], cfg_dsn_28[51], cfg_dsn_28[50], cfg_dsn_28[49], cfg_dsn_28[48], cfg_dsn_28[47], 
cfg_dsn_28[46], cfg_dsn_28[45], cfg_dsn_28[44], cfg_dsn_28[43], cfg_dsn_28[42], cfg_dsn_28[41], cfg_dsn_28[40], cfg_dsn_28[39], cfg_dsn_28[38], 
cfg_dsn_28[37], cfg_dsn_28[36], cfg_dsn_28[35], cfg_dsn_28[34], cfg_dsn_28[33], cfg_dsn_28[32], cfg_dsn_28[31], cfg_dsn_28[30], cfg_dsn_28[29], 
cfg_dsn_28[28], cfg_dsn_28[27], cfg_dsn_28[26], cfg_dsn_28[25], cfg_dsn_28[24], cfg_dsn_28[23], cfg_dsn_28[22], cfg_dsn_28[21], cfg_dsn_28[20], 
cfg_dsn_28[19], cfg_dsn_28[18], cfg_dsn_28[17], cfg_dsn_28[16], cfg_dsn_28[15], cfg_dsn_28[14], cfg_dsn_28[13], cfg_dsn_28[12], cfg_dsn_28[11], 
cfg_dsn_28[10], cfg_dsn_28[9], cfg_dsn_28[8], cfg_dsn_28[7], cfg_dsn_28[6], cfg_dsn_28[5], cfg_dsn_28[4], cfg_dsn_28[3], cfg_dsn_28[2], cfg_dsn_28[1]
, cfg_dsn_28[0]}),
    .cfg_err_tlp_cpl_header({cfg_err_tlp_cpl_header_20[47], cfg_err_tlp_cpl_header_20[46], cfg_err_tlp_cpl_header_20[45], 
cfg_err_tlp_cpl_header_20[44], cfg_err_tlp_cpl_header_20[43], cfg_err_tlp_cpl_header_20[42], cfg_err_tlp_cpl_header_20[41], 
cfg_err_tlp_cpl_header_20[40], cfg_err_tlp_cpl_header_20[39], cfg_err_tlp_cpl_header_20[38], cfg_err_tlp_cpl_header_20[37], 
cfg_err_tlp_cpl_header_20[36], cfg_err_tlp_cpl_header_20[35], cfg_err_tlp_cpl_header_20[34], cfg_err_tlp_cpl_header_20[33], 
cfg_err_tlp_cpl_header_20[32], cfg_err_tlp_cpl_header_20[31], cfg_err_tlp_cpl_header_20[30], cfg_err_tlp_cpl_header_20[29], 
cfg_err_tlp_cpl_header_20[28], cfg_err_tlp_cpl_header_20[27], cfg_err_tlp_cpl_header_20[26], cfg_err_tlp_cpl_header_20[25], 
cfg_err_tlp_cpl_header_20[24], cfg_err_tlp_cpl_header_20[23], cfg_err_tlp_cpl_header_20[22], cfg_err_tlp_cpl_header_20[21], 
cfg_err_tlp_cpl_header_20[20], cfg_err_tlp_cpl_header_20[19], cfg_err_tlp_cpl_header_20[18], cfg_err_tlp_cpl_header_20[17], 
cfg_err_tlp_cpl_header_20[16], cfg_err_tlp_cpl_header_20[15], cfg_err_tlp_cpl_header_20[14], cfg_err_tlp_cpl_header_20[13], 
cfg_err_tlp_cpl_header_20[12], cfg_err_tlp_cpl_header_20[11], cfg_err_tlp_cpl_header_20[10], cfg_err_tlp_cpl_header_20[9], 
cfg_err_tlp_cpl_header_20[8], cfg_err_tlp_cpl_header_20[7], cfg_err_tlp_cpl_header_20[6], cfg_err_tlp_cpl_header_20[5], cfg_err_tlp_cpl_header_20[4], 
cfg_err_tlp_cpl_header_20[3], cfg_err_tlp_cpl_header_20[2], cfg_err_tlp_cpl_header_20[1], cfg_err_tlp_cpl_header_20[0]}),
    .cfg_dwaddr({cfg_dwaddr_19[9], cfg_dwaddr_19[8], cfg_dwaddr_19[7], cfg_dwaddr_19[6], cfg_dwaddr_19[5], cfg_dwaddr_19[4], cfg_dwaddr_19[3], 
cfg_dwaddr_19[2], cfg_dwaddr_19[1], cfg_dwaddr_19[0]}),
    .pci_exp_rxn({pci_exp_rxn_5[3], pci_exp_rxn_5[2], pci_exp_rxn_5[1], pci_exp_rxn_5[0]}),
    .pci_exp_rxp({pci_exp_rxp_4[3], pci_exp_rxp_4[2], pci_exp_rxp_4[1], pci_exp_rxp_4[0]}),
    .cfg_cfg({\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], cfg_dsn_28[63], cfg_dsn_28[62], cfg_dsn_28[61], cfg_dsn_28[60], 
cfg_dsn_28[59], cfg_dsn_28[58], cfg_dsn_28[57], cfg_dsn_28[56], cfg_dsn_28[55], cfg_dsn_28[54], cfg_dsn_28[53], cfg_dsn_28[52], cfg_dsn_28[51], 
cfg_dsn_28[50], cfg_dsn_28[49], cfg_dsn_28[48], cfg_dsn_28[47], cfg_dsn_28[46], cfg_dsn_28[45], cfg_dsn_28[44], cfg_dsn_28[43], cfg_dsn_28[42], 
cfg_dsn_28[41], cfg_dsn_28[40], cfg_dsn_28[39], cfg_dsn_28[38], cfg_dsn_28[37], cfg_dsn_28[36], cfg_dsn_28[35], cfg_dsn_28[34], cfg_dsn_28[33], 
cfg_dsn_28[32], cfg_dsn_28[31], cfg_dsn_28[30], cfg_dsn_28[29], cfg_dsn_28[28], cfg_dsn_28[27], cfg_dsn_28[26], cfg_dsn_28[25], cfg_dsn_28[24], 
cfg_dsn_28[23], cfg_dsn_28[22], cfg_dsn_28[21], cfg_dsn_28[20], cfg_dsn_28[19], cfg_dsn_28[18], cfg_dsn_28[17], cfg_dsn_28[16], cfg_dsn_28[15], 
cfg_dsn_28[14], cfg_dsn_28[13], cfg_dsn_28[12], cfg_dsn_28[11], cfg_dsn_28[10], cfg_dsn_28[9], cfg_dsn_28[8], cfg_dsn_28[7], cfg_dsn_28[6], 
cfg_dsn_28[5], cfg_dsn_28[4], cfg_dsn_28[3], cfg_dsn_28[2], cfg_dsn_28[1], cfg_dsn_28[0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , 
\BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
fast_train_simulation_only, two_plm_auto_config_35[1], two_plm_auto_config_35[0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , 
\BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/N1 , 
\BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , 
\BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , 
\BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , 
\BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/N1 , 
\BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , 
\BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], 
\BU2/trn_rrem_n [0], \BU2/N1 , \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , 
\BU2/trn_rrem_n [0], \BU2/N1 , \BU2/N1 , \BU2/N1 , \BU2/trn_rrem_n [0]}),
    .cfg_di({cfg_di_17[31], cfg_di_17[30], cfg_di_17[29], cfg_di_17[28], cfg_di_17[27], cfg_di_17[26], cfg_di_17[25], cfg_di_17[24], cfg_di_17[23], 
cfg_di_17[22], cfg_di_17[21], cfg_di_17[20], cfg_di_17[19], cfg_di_17[18], cfg_di_17[17], cfg_di_17[16], cfg_di_17[15], cfg_di_17[14], cfg_di_17[13], 
cfg_di_17[12], cfg_di_17[11], cfg_di_17[10], cfg_di_17[9], cfg_di_17[8], cfg_di_17[7], cfg_di_17[6], cfg_di_17[5], cfg_di_17[4], cfg_di_17[3], 
cfg_di_17[2], cfg_di_17[1], cfg_di_17[0]})
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/trn_rrem_n [0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
