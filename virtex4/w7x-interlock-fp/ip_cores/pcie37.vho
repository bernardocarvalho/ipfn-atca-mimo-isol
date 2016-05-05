--------------------------------------------------------------------------------
--     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.            --
--                                                                            --
--     This file contains confidential and proprietary information            --
--     of Xilinx, Inc. and is protected under U.S. and                        --
--     international copyright and other intellectual property                --
--     laws.                                                                  --
--                                                                            --
--     DISCLAIMER                                                             --
--     This disclaimer is not a license and does not grant any                --
--     rights to the materials distributed herewith. Except as                --
--     otherwise provided in a valid license issued to you by                 --
--     Xilinx, and to the maximum extent permitted by applicable              --
--     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                --
--     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES            --
--     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING              --
--     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                 --
--     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and               --
--     (2) Xilinx shall not be liable (whether in contract or tort,           --
--     including negligence, or under any other theory of                     --
--     liability) for any loss or damage of any kind or nature                --
--     related to, arising under or in connection with these                  --
--     materials, including for any direct, or any indirect,                  --
--     special, incidental, or consequential loss or damage                   --
--     (including loss of data, profits, goodwill, or any type of             --
--     loss or damage suffered as a result of any action brought              --
--     by a third party) even if such damage or loss was                      --
--     reasonably foreseeable or Xilinx had been advised of the               --
--     possibility of the same.                                               --
--                                                                            --
--     CRITICAL APPLICATIONS                                                  --
--     Xilinx products are not designed or intended to be fail-               --
--     safe, or for use in any application requiring fail-safe                --
--     performance, such as life-support or safety devices or                 --
--     systems, Class III medical devices, nuclear facilities,                --
--     applications related to the deployment of airbags, or any              --
--     other applications that could lead to death, personal                  --
--     injury, or severe property or environmental damage                     --
--     (individually and collectively, "Critical                              --
--     Applications"). Customer assumes the sole risk and                     --
--     liability of any use of Xilinx products in Critical                    --
--     Applications, subject only to applicable laws and                      --
--     regulations governing limitations on product liability.                --
--                                                                            --
--     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS               --
--     PART OF THIS FILE AT ALL TIMES.                                        --
--------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component pcie37
	port (
	pci_exp_txp: out std_logic_vector(0 downto 0);
	pci_exp_txn: out std_logic_vector(0 downto 0);
	pci_exp_rxp: in std_logic_vector(0 downto 0);
	pci_exp_rxn: in std_logic_vector(0 downto 0);
	trn_clk: out std_logic;
	trn_reset_n: out std_logic;
	trn_lnk_up_n: out std_logic;
	trn_td: in std_logic_vector(31 downto 0);
	trn_tsof_n: in std_logic;
	trn_teof_n: in std_logic;
	trn_tsrc_rdy_n: in std_logic;
	trn_tdst_rdy_n: out std_logic;
	trn_tdst_dsc_n: out std_logic;
	trn_tsrc_dsc_n: in std_logic;
	trn_terrfwd_n: in std_logic;
	trn_tbuf_av: out std_logic_vector(4 downto 0);
	trn_rd: out std_logic_vector(31 downto 0);
	trn_rsof_n: out std_logic;
	trn_reof_n: out std_logic;
	trn_rsrc_rdy_n: out std_logic;
	trn_rsrc_dsc_n: out std_logic;
	trn_rdst_rdy_n: in std_logic;
	trn_rerrfwd_n: out std_logic;
	trn_rnp_ok_n: in std_logic;
	trn_rbar_hit_n: out std_logic_vector(6 downto 0);
	trn_rfc_nph_av: out std_logic_vector(7 downto 0);
	trn_rfc_npd_av: out std_logic_vector(11 downto 0);
	trn_rfc_ph_av: out std_logic_vector(7 downto 0);
	trn_rfc_pd_av: out std_logic_vector(11 downto 0);
	trn_rfc_cplh_av: out std_logic_vector(7 downto 0);
	trn_rfc_cpld_av: out std_logic_vector(11 downto 0);
	cfg_do: out std_logic_vector(31 downto 0);
	cfg_rd_wr_done_n: out std_logic;
	cfg_di: in std_logic_vector(31 downto 0);
	cfg_byte_en_n: in std_logic_vector(3 downto 0);
	cfg_dwaddr: in std_logic_vector(9 downto 0);
	cfg_wr_en_n: in std_logic;
	cfg_rd_en_n: in std_logic;
	cfg_err_cor_n: in std_logic;
	cfg_err_ur_n: in std_logic;
	cfg_err_ecrc_n: in std_logic;
	cfg_err_cpl_timeout_n: in std_logic;
	cfg_err_cpl_abort_n: in std_logic;
	cfg_err_cpl_unexpect_n: in std_logic;
	cfg_err_posted_n: in std_logic;
	cfg_err_tlp_cpl_header: in std_logic_vector(47 downto 0);
	cfg_interrupt_n: in std_logic;
	cfg_interrupt_rdy_n: out std_logic;
	cfg_interrupt_assert_n: in std_logic;
	cfg_interrupt_di: in std_logic_vector(7 downto 0);
	cfg_interrupt_do: out std_logic_vector(7 downto 0);
	cfg_interrupt_mmenable: out std_logic_vector(2 downto 0);
	cfg_interrupt_msienable: out std_logic;
	cfg_turnoff_ok_n: in std_logic;
	cfg_to_turnoff_n: out std_logic;
	cfg_pm_wake_n: in std_logic;
	cfg_pcie_link_state_n: out std_logic_vector(2 downto 0);
	cfg_trn_pending_n: in std_logic;
	cfg_bus_number: out std_logic_vector(7 downto 0);
	cfg_device_number: out std_logic_vector(4 downto 0);
	cfg_function_number: out std_logic_vector(2 downto 0);
	cfg_dsn: in std_logic_vector(63 downto 0);
	cfg_status: out std_logic_vector(15 downto 0);
	cfg_command: out std_logic_vector(15 downto 0);
	cfg_dstatus: out std_logic_vector(15 downto 0);
	cfg_dcommand: out std_logic_vector(15 downto 0);
	cfg_lstatus: out std_logic_vector(15 downto 0);
	cfg_lcommand: out std_logic_vector(15 downto 0);
	fast_train_simulation_only: in std_logic;
	two_plm_auto_config: in std_logic_vector(1 downto 0);
	sys_clk: in std_logic;
	sys_reset_n: in std_logic);
end component;

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of pcie37: component is true;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : pcie37
		port map (
			pci_exp_txp => pci_exp_txp,
			pci_exp_txn => pci_exp_txn,
			pci_exp_rxp => pci_exp_rxp,
			pci_exp_rxn => pci_exp_rxn,
			trn_clk => trn_clk,
			trn_reset_n => trn_reset_n,
			trn_lnk_up_n => trn_lnk_up_n,
			trn_td => trn_td,
			trn_tsof_n => trn_tsof_n,
			trn_teof_n => trn_teof_n,
			trn_tsrc_rdy_n => trn_tsrc_rdy_n,
			trn_tdst_rdy_n => trn_tdst_rdy_n,
			trn_tdst_dsc_n => trn_tdst_dsc_n,
			trn_tsrc_dsc_n => trn_tsrc_dsc_n,
			trn_terrfwd_n => trn_terrfwd_n,
			trn_tbuf_av => trn_tbuf_av,
			trn_rd => trn_rd,
			trn_rsof_n => trn_rsof_n,
			trn_reof_n => trn_reof_n,
			trn_rsrc_rdy_n => trn_rsrc_rdy_n,
			trn_rsrc_dsc_n => trn_rsrc_dsc_n,
			trn_rdst_rdy_n => trn_rdst_rdy_n,
			trn_rerrfwd_n => trn_rerrfwd_n,
			trn_rnp_ok_n => trn_rnp_ok_n,
			trn_rbar_hit_n => trn_rbar_hit_n,
			trn_rfc_nph_av => trn_rfc_nph_av,
			trn_rfc_npd_av => trn_rfc_npd_av,
			trn_rfc_ph_av => trn_rfc_ph_av,
			trn_rfc_pd_av => trn_rfc_pd_av,
			trn_rfc_cplh_av => trn_rfc_cplh_av,
			trn_rfc_cpld_av => trn_rfc_cpld_av,
			cfg_do => cfg_do,
			cfg_rd_wr_done_n => cfg_rd_wr_done_n,
			cfg_di => cfg_di,
			cfg_byte_en_n => cfg_byte_en_n,
			cfg_dwaddr => cfg_dwaddr,
			cfg_wr_en_n => cfg_wr_en_n,
			cfg_rd_en_n => cfg_rd_en_n,
			cfg_err_cor_n => cfg_err_cor_n,
			cfg_err_ur_n => cfg_err_ur_n,
			cfg_err_ecrc_n => cfg_err_ecrc_n,
			cfg_err_cpl_timeout_n => cfg_err_cpl_timeout_n,
			cfg_err_cpl_abort_n => cfg_err_cpl_abort_n,
			cfg_err_cpl_unexpect_n => cfg_err_cpl_unexpect_n,
			cfg_err_posted_n => cfg_err_posted_n,
			cfg_err_tlp_cpl_header => cfg_err_tlp_cpl_header,
			cfg_interrupt_n => cfg_interrupt_n,
			cfg_interrupt_rdy_n => cfg_interrupt_rdy_n,
			cfg_interrupt_assert_n => cfg_interrupt_assert_n,
			cfg_interrupt_di => cfg_interrupt_di,
			cfg_interrupt_do => cfg_interrupt_do,
			cfg_interrupt_mmenable => cfg_interrupt_mmenable,
			cfg_interrupt_msienable => cfg_interrupt_msienable,
			cfg_turnoff_ok_n => cfg_turnoff_ok_n,
			cfg_to_turnoff_n => cfg_to_turnoff_n,
			cfg_pm_wake_n => cfg_pm_wake_n,
			cfg_pcie_link_state_n => cfg_pcie_link_state_n,
			cfg_trn_pending_n => cfg_trn_pending_n,
			cfg_bus_number => cfg_bus_number,
			cfg_device_number => cfg_device_number,
			cfg_function_number => cfg_function_number,
			cfg_dsn => cfg_dsn,
			cfg_status => cfg_status,
			cfg_command => cfg_command,
			cfg_dstatus => cfg_dstatus,
			cfg_dcommand => cfg_dcommand,
			cfg_lstatus => cfg_lstatus,
			cfg_lcommand => cfg_lcommand,
			fast_train_simulation_only => fast_train_simulation_only,
			two_plm_auto_config => two_plm_auto_config,
			sys_clk => sys_clk,
			sys_reset_n => sys_reset_n);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

