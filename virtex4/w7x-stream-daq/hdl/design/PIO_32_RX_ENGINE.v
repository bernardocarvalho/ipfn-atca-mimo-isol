


// DISCLAIMER OF LIABILITY
//
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you
// a license to use this text/file solely for design, simulation,
// implementation and creation of design files limited
// to Xilinx devices or technologies. Use with non-Xilinx
// devices or technologies is expressly prohibited and
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information
// "as is" solely for use in developing programs and
// solutions for Xilinx devices. By providing this design,
// code, or information as one possible implementation of
// this feature, application or standard, Xilinx is making no
// representation that this implementation is free from any
// claims of infringement. You are responsible for
// obtaining any rights you may require for your implementation.
// Xilinx expressly disclaims any warranty whatsoever with
// respect to the adequacy of the implementation, including
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied
// warranties of merchantability or fitness for a particular
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications are
// expressly prohibited.
//
//
// Copyright (c) 2001, 2002, 2003, 2004, 2005, 2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part
// of this text at all times.

`timescale 1ns/1ns

`define TCQ 1

`define PIO_32_RX_MEM_RD32_FMT_TYPE 7'b00_00000
`define PIO_32_RX_MEM_WR32_FMT_TYPE 7'b10_00000
`define PIO_32_RX_MEM_RD64_FMT_TYPE 7'b01_00000
`define PIO_32_RX_MEM_WR64_FMT_TYPE 7'b11_00000
`define PIO_32_RX_IO_RD32_FMT_TYPE  7'b00_00010
`define PIO_32_RX_IO_WR32_FMT_TYPE  7'b10_00010

`define PIO_32_RX_RST_STATE         16'b0000000000000000
`define PIO_32_RX_MEM_RD32_DW1      16'b0000000000000001
`define PIO_32_RX_MEM_RD32_DW2      16'b0000000000000010
`define PIO_32_RX_MEM_WR32_DW1      16'b0000000000000100
`define PIO_32_RX_MEM_WR32_DW2      16'b0000000000001000
`define PIO_32_RX_MEM_WR32_DW3      16'b0000000000010000
`define PIO_32_RX_MEM_RD64_DW1      16'b0000000000100000
`define PIO_32_RX_MEM_RD64_DW2      16'b0000000001000000
`define PIO_32_RX_MEM_RD64_DW3      16'b0000000010000000
`define PIO_32_RX_MEM_WR64_DW1      16'b0000000100000000
`define PIO_32_RX_MEM_WR64_DW2      16'b0000001000000000
`define PIO_32_RX_MEM_WR64_DW3      16'b0000010000000000
`define PIO_32_RX_MEM_WR64_DW4      16'b0000100000000000
`define PIO_32_RX_WAIT_STATE        16'b0001000000000000
`define PIO_32_RX_IO_WR_DW1         16'b0010000000000000
`define PIO_32_RX_IO_WR_DW2         16'b0100000000000000
`define PIO_32_RX_IO_WR_DW3         16'b1000000000000000



module PIO_32_RX_ENGINE (
                        clk,
                        rst_n,

                        /*
                         * Receive local link interface from PCIe core
                         */

                        trn_rd,
                        trn_rsof_n,
                        trn_reof_n,
                        trn_rsrc_rdy_n,
                        trn_rsrc_dsc_n,
                        trn_rbar_hit_n,
                        trn_rdst_rdy_n,

                        /*
                         * Memory Read data handshake with Completion
                         * transmit unit. Transmit unit reponds to
                         * req_compl assertion and responds with compl_done
                         * assertion when a Completion w/ data is transmitted.
                         */

                        req_compl_o,
                        req_compl_with_data_o, // asserted indicates to generate a completion WITH data
                                               // otherwise a completion WITHOUT data will be generated -DRT
                        compl_done_i,

                        req_tc_o,                  // Memory Read TC
                        req_td_o,                  // Memory Read TD
                        req_ep_o,                  // Memory Read EP
                        req_attr_o,                // Memory Read Attribute
                        req_len_o,                 // Memory Read Length (1DW)
                        req_rid_o,                 // Memory Read Requestor ID
                        req_tag_o,                 // Memory Read Tag
                        req_be_o,                  // Memory Read Byte Enables
                        req_addr_o,                // Memory Read Address

                         /* 
                         * Memory interface used to save 1 DW data received
                         * on Memory Write 32 TLP. Data extracted from
                         * inbound TLP is presented to the Endpoint memory
                         * unit. Endpoint memory unit reacts to wr_en_o
                         * assertion and asserts wr_busy_i when it is
                         * processing written information.
                         */

                        wr_addr_o,                 // Memory Write Address
                        wr_be_o,                   // Memory Write Byte Enable
                        wr_data_o,                 // Memory Write Data
                        wr_en_o,                   // Memory Write Enable
                        wr_busy_i                  // Memory Write Busy

                       );

    input              clk;
    input              rst_n;

    input [31:0]       trn_rd;
    input              trn_rsof_n;
    input              trn_reof_n;
    input              trn_rsrc_rdy_n;
    input              trn_rsrc_dsc_n;
    input [6:0]        trn_rbar_hit_n;
    output             trn_rdst_rdy_n;
 
    output             req_compl_o;
    output             req_compl_with_data_o;
    input              compl_done_i;

    output reg [2:0]       req_tc_o;
    output reg             req_td_o;
    output reg             req_ep_o;
    output reg [1:0]       req_attr_o;
    output reg [9:0]       req_len_o;
    output reg [15:0]      req_rid_o;
    output reg [7:0]       req_tag_o;
    output reg [7:0]       req_be_o;
    output reg [12:0]      req_addr_o;

    output reg [10:0]      wr_addr_o;
    output reg  [7:0]       wr_be_o;
    output reg [31:0]      wr_data_o;
    output reg             wr_en_o;
    input              wr_busy_i;

    // Local Registers

    reg                trn_rdst_rdy_n;

    reg                req_compl_o;
    reg                req_compl_with_data_o;

//    reg [2:0]          req_tc_o;
//    reg                req_td_o;
//    reg                req_ep_o;
//    reg [1:0]          req_attr_o;
//    reg [9:0]          req_len_o;
//    reg [15:0]         req_rid_o;
//    reg [7:0]          req_tag_o;
//    reg [7:0]          req_be_o;
//    reg [12:0]         req_addr_o;

//    reg [10:0]         wr_addr_o;
//    reg [7:0]          wr_be_o;
//    reg [31:0]         wr_data_o;
//    reg                wr_en_o;

    reg [15:0]          state; //DRT
    reg [7:0]          tlp_type;
    
    wire               io_bar_hit_n;
    wire               mem32_bar_hit_n;
    wire               mem64_bar_hit_n;
    wire               erom_bar_hit_n;

    reg [1:0]          region_select;
   


    always @ ( posedge clk or negedge rst_n ) begin

        if (!rst_n ) begin

          trn_rdst_rdy_n <= 1'b0; // #`TCQ delay not used in syntesis

          req_compl_o    <=   1'b0;
          req_compl_with_data_o  <=   1'b1;

          req_tc_o       <=   2'b0;
          req_td_o       <=   1'b0;
          req_ep_o       <=   1'b0;
          req_attr_o     <=   2'b0;
          req_len_o      <=   10'b0;
          req_rid_o      <=   16'b0;
          req_tag_o      <=   8'b0;
          req_be_o       <=   8'b0;
          req_addr_o     <=   13'b0;

          wr_be_o        <=   8'b0;
          wr_addr_o      <=   11'b0;
          wr_data_o      <=   31'b0;
          wr_en_o        <=   1'b0;
          
          state          <=   `PIO_32_RX_RST_STATE;
          tlp_type       <=   7'b0;

        end else begin

          wr_en_o        <=   1'b0;
          req_compl_o    <=   1'b0;
          req_compl_with_data_o <=   1'b1;

          case (state)

            `PIO_32_RX_RST_STATE : begin 

              trn_rdst_rdy_n <=   1'b0;

              if ((!trn_rsof_n) && 
                  (!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                case (trn_rd[30:24]) 

                  `PIO_32_RX_MEM_RD32_FMT_TYPE : begin

                    tlp_type     <=   trn_rd[30:24];
                    req_len_o    <=   trn_rd[09:00]; 

                    if (trn_rd[09:00] == 10'b1) begin

                      req_tc_o     <=   trn_rd[22:20];  
                      req_td_o     <=   trn_rd[15];
                      req_ep_o     <=   trn_rd[14]; 
                      req_attr_o   <=   trn_rd[13:12]; 
                      req_len_o    <=   trn_rd[11:00]; 
                      state        <=   `PIO_32_RX_MEM_RD32_DW1; 

                    end else begin

                      state        <=   `PIO_32_RX_RST_STATE;

                    end

                  end
         
                  `PIO_32_RX_MEM_WR32_FMT_TYPE : begin

                    tlp_type     <=   trn_rd[30:24];
                    req_len_o    <=   trn_rd[09:00]; 

                    if (trn_rd[09:00] == 10'b1) begin

                      wr_be_o      <=   trn_rd[07:00];
                      state        <=   `PIO_32_RX_MEM_WR32_DW1; 

                    end else begin
                    
                      state        <=   `PIO_32_RX_RST_STATE; 

                    end

                  end 

                  `PIO_32_RX_MEM_RD64_FMT_TYPE : begin

                    tlp_type     <=   trn_rd[30:24];
                    req_len_o    <=   trn_rd[09:00]; 
                 
                    if (trn_rd[09:00] == 10'b1) begin

                      req_tc_o     <=   trn_rd[22:20];  
                      req_td_o     <=   trn_rd[15];
                      req_ep_o     <=   trn_rd[14]; 
                      req_attr_o   <=   trn_rd[13:12]; 
                      req_len_o    <=   trn_rd[11:00]; 
                      state        <=   `PIO_32_RX_MEM_RD64_DW1; 

                    end else begin

                      state        <=    `PIO_32_RX_RST_STATE; 

                    end

                  end
         
                  `PIO_32_RX_MEM_WR64_FMT_TYPE : begin

                    tlp_type     <=   trn_rd[30:24];
                    req_len_o    <=   trn_rd[09:00]; 

                    if (trn_rd[09:00] == 10'b1) begin

                      wr_be_o      <=   trn_rd[07:00];
                      state        <=   `PIO_32_RX_MEM_WR64_DW1; 

                    end else begin
                    
                      state        <=   `PIO_32_RX_RST_STATE; 

                    end

                  end

                  `PIO_32_RX_IO_RD32_FMT_TYPE : begin

                    tlp_type     <=   trn_rd[30:24];
                    req_len_o    <=   trn_rd[09:00]; 
                 
                    if (trn_rd[09:00] == 10'b1) begin

                      req_tc_o     <=   trn_rd[22:20];  
                      req_td_o     <=   trn_rd[15];
                      req_ep_o     <=   trn_rd[14]; 
                      req_attr_o   <=   trn_rd[13:12]; 
                      req_len_o    <=   trn_rd[11:00]; 
                      state        <=   `PIO_32_RX_MEM_RD32_DW1; 

                    end else begin

                      state        <=   `PIO_32_RX_RST_STATE; 

                    end

                  end
         
                  `PIO_32_RX_IO_WR32_FMT_TYPE : begin

                    tlp_type     <=   trn_rd[30:24];
                    req_len_o    <=   10'h0; // len for cpl -- DRT

                    if (trn_rd[09:00] == 10'b1) begin

                      req_tc_o     <=   trn_rd[22:20];
                      req_td_o     <=   trn_rd[15];
                      req_ep_o     <=   trn_rd[14];
                      req_attr_o   <=   trn_rd[13:12];
                      req_len_o    <=   trn_rd[11:00];
                      wr_be_o      <=   trn_rd[07:00];
                      state        <=   `PIO_32_RX_IO_WR_DW1;

                    end else begin
                    
                      state        <=   `PIO_32_RX_RST_STATE; 

                    end

                  end

             
                  default : begin // other TLPs

                    state        <=   `PIO_32_RX_RST_STATE; 

                  end
              
                endcase
         
              end else
                state <=   `PIO_32_RX_RST_STATE;

            end

            `PIO_32_RX_MEM_RD32_DW1 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                req_rid_o    <=   trn_rd[31:16]; 
                req_tag_o    <=   trn_rd[15:08]; 
                req_be_o     <=   trn_rd[07:00];
                state        <=   `PIO_32_RX_MEM_RD32_DW2; 

              end else
                state        <=   `PIO_32_RX_MEM_RD32_DW1; 
         
            end

            `PIO_32_RX_MEM_RD32_DW2 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                req_addr_o   <=   {region_select[1:0], trn_rd[10:02], 2'b00};
                req_compl_o  <=   1'b1;
                trn_rdst_rdy_n <=   1'b1;

                state        <=   `PIO_32_RX_WAIT_STATE; 

              end else
                 state        <=   `PIO_32_RX_MEM_RD32_DW2; 

            end

            `PIO_32_RX_MEM_WR32_DW1 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                wr_be_o      <=   trn_rd[07:00];
                state        <=   `PIO_32_RX_MEM_WR32_DW2; 

              end else
                state        <=   `PIO_32_RX_MEM_WR32_DW1; 
         
            end

            `PIO_32_RX_MEM_WR32_DW2 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                wr_addr_o    <=   {region_select[1:0],trn_rd[10:02]};
                state        <=   `PIO_32_RX_MEM_WR32_DW3; 

              end else 
                 state        <=   `PIO_32_RX_MEM_WR32_DW2; 
         
            end

            `PIO_32_RX_MEM_WR32_DW3 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                wr_data_o  <=   trn_rd[31:00];
                wr_en_o    <=   1'b1;
                trn_rdst_rdy_n <=   1'b1;

                state      <=   `PIO_32_RX_WAIT_STATE;

              end else
                 state        <=   `PIO_32_RX_MEM_WR32_DW3; 

            end


            `PIO_32_RX_MEM_RD64_DW1 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                req_rid_o    <=   trn_rd[31:16]; 
                req_tag_o    <=   trn_rd[15:08]; 
                req_be_o     <=   trn_rd[07:00];
                state        <=   `PIO_32_RX_MEM_RD64_DW2; 

              end else
                state        <=   `PIO_32_RX_MEM_RD64_DW1; 
         
            end


            `PIO_32_RX_MEM_RD64_DW2 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                state        <=   `PIO_32_RX_MEM_RD64_DW3; 

              end else
                 state        <= `PIO_32_RX_MEM_RD64_DW2;

            end

            `PIO_32_RX_MEM_RD64_DW3 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                req_addr_o   <=   {region_select[1:0],trn_rd[10:02], 2'b00};
                req_compl_o  <=   1'b1;
                trn_rdst_rdy_n <=   1'b1;

                state        <=   `PIO_32_RX_WAIT_STATE; 

              end else
                 state        <=   `PIO_32_RX_MEM_RD64_DW3; 

            end

            `PIO_32_RX_MEM_WR64_DW1 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                wr_be_o      <=   trn_rd[07:00];
                state        <=   `PIO_32_RX_MEM_WR64_DW2; 

              end else
                state        <=   `PIO_32_RX_MEM_WR64_DW1; 
         
            end

            `PIO_32_RX_MEM_WR64_DW2 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                
                state        <=   `PIO_32_RX_MEM_WR64_DW3; 

              end else 
                 state        <=   `PIO_32_RX_MEM_WR64_DW2; 
         
            end

            `PIO_32_RX_MEM_WR64_DW3 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                wr_addr_o    <=   {region_select[1:0],trn_rd[10:2]};
                state        <=   `PIO_32_RX_MEM_WR64_DW4; 

              end else 
                 state        <=   `PIO_32_RX_MEM_WR64_DW3; 
         
            end

            `PIO_32_RX_MEM_WR64_DW4 : begin

              if ((!trn_rsrc_rdy_n) && 
                  (!trn_rdst_rdy_n)) begin

                wr_data_o  <=   trn_rd[31:00];
                wr_en_o    <=   1'b1;
                trn_rdst_rdy_n <=   1'b1;

                state      <=   `PIO_32_RX_WAIT_STATE;

              end else
                 state        <=   `PIO_32_RX_MEM_WR64_DW4; 

            end


            `PIO_32_RX_IO_WR_DW1 : begin

              if ((!trn_rsrc_rdy_n) &&
                  (!trn_rdst_rdy_n)) begin
 
                req_tag_o    <=   trn_rd[15:08];
                wr_be_o      <=   trn_rd[07:00];
                state        <=   `PIO_32_RX_IO_WR_DW2;

              end else
                state        <=   `PIO_32_RX_IO_WR_DW1;

            end

            `PIO_32_RX_IO_WR_DW2 : begin

              if ((!trn_rsrc_rdy_n) &&
                  (!trn_rdst_rdy_n)) begin

                wr_addr_o    <=   {region_select[1:0],trn_rd[10:02]};
                state        <=   `PIO_32_RX_IO_WR_DW3;

              end else
                 state        <=   `PIO_32_RX_IO_WR_DW2;

            end

            `PIO_32_RX_IO_WR_DW3 : begin

              if ((!trn_rsrc_rdy_n) &&
                  (!trn_rdst_rdy_n)) begin

                wr_data_o  <=   trn_rd[31:00];
                wr_en_o    <=   1'b1;
                trn_rdst_rdy_n <=   1'b1;
                req_compl_o <=   1'b1;
                req_compl_with_data_o <=   1'b0;

                state      <=   `PIO_32_RX_WAIT_STATE;

              end else
                 state        <=   `PIO_32_RX_IO_WR_DW3;

            end


            `PIO_32_RX_WAIT_STATE : begin

              wr_en_o      <=   1'b0;
              req_compl_o  <=   1'b0;

              if ((tlp_type == `PIO_32_RX_MEM_WR32_FMT_TYPE) &&
                  (!wr_busy_i)) begin

                trn_rdst_rdy_n <=   1'b0;
                state        <=   `PIO_32_RX_RST_STATE; 

              end else if ((tlp_type == `PIO_32_RX_IO_WR32_FMT_TYPE) &&
                  (compl_done_i)) begin  // DRT -testing

                trn_rdst_rdy_n <=   1'b0;
                state        <=   `PIO_32_RX_RST_STATE; 

              end else if ((tlp_type == `PIO_32_RX_MEM_WR64_FMT_TYPE) &&
                  (!wr_busy_i)) begin

                trn_rdst_rdy_n <=   1'b0;
                state        <=   `PIO_32_RX_RST_STATE; 

              end else if ((tlp_type == `PIO_32_RX_MEM_RD32_FMT_TYPE) &&
                           (compl_done_i)) begin

                trn_rdst_rdy_n <=   1'b0;
                state        <=   `PIO_32_RX_RST_STATE; 

              end else if ((tlp_type == `PIO_32_RX_IO_RD32_FMT_TYPE) &&
                           (compl_done_i)) begin

                trn_rdst_rdy_n <=   1'b0;
                state        <=   `PIO_32_RX_RST_STATE; 

              end else if ((tlp_type == `PIO_32_RX_MEM_RD64_FMT_TYPE) &&
                           (compl_done_i)) begin

                trn_rdst_rdy_n <=   1'b0;
                state        <=   `PIO_32_RX_RST_STATE; 

              end else
                state        <=   `PIO_32_RX_WAIT_STATE; 

            end
                   
          endcase

        end   

    end       

    assign mem64_bar_hit_n = 1'b1;
    assign io_bar_hit_n = 1'b1;
    assign mem32_bar_hit_n = trn_rbar_hit_n[0];
    assign erom_bar_hit_n  = trn_rbar_hit_n[6];


  always @*
  begin
     case ({io_bar_hit_n, mem32_bar_hit_n, mem64_bar_hit_n, erom_bar_hit_n})
     
        4'b0111 : begin
             region_select <=   2'b00;    // Select IO region  BAR 1
        end

        4'b1011 : begin
             region_select <=   2'b01;    // Select Mem32 region BAR 0
        end
        
        4'b1101 : begin
             region_select <=   2'b10;    // Select Mem64 region
        end        

        4'b1110 : begin
             region_select <=   2'b11;    // Select EROM region
        end
        
        default : begin 
             region_select <=   2'b00;    // Error selection will select IO region
        end

     endcase
        
  end


  // synthesis translate_off
  reg  [8*20:1] state_ascii;
  always @(state)
  begin
    if      (state==`PIO_32_RX_RST_STATE)         state_ascii <= #`TCQ "RX_RST_STATE";
    else if (state==`PIO_32_RX_MEM_RD32_DW1)      state_ascii <= #`TCQ "RX_MEM_RD32_DW1";
    else if (state==`PIO_32_RX_MEM_RD32_DW2)      state_ascii <= #`TCQ "RX_MEM_RD32_DW2";
    else if (state==`PIO_32_RX_MEM_WR32_DW1)      state_ascii <= #`TCQ "RX_MEM_WR32_DW1";
    else if (state==`PIO_32_RX_MEM_WR32_DW2)      state_ascii <= #`TCQ "RX_MEM_WR32_DW2";
    else if (state==`PIO_32_RX_MEM_WR32_DW3)      state_ascii <= #`TCQ "RX_MEM_WR32_DW3";
    else if (state==`PIO_32_RX_MEM_RD64_DW1)      state_ascii <= #`TCQ "RX_MEM_RD64_DW1";
    else if (state==`PIO_32_RX_MEM_RD64_DW2)      state_ascii <= #`TCQ "RX_MEM_RD64_DW2";
    else if (state==`PIO_32_RX_MEM_RD64_DW3)      state_ascii <= #`TCQ "RX_MEM_RD64_DW3";
    else if (state==`PIO_32_RX_MEM_WR64_DW1)      state_ascii <= #`TCQ "RX_MEM_WR64_DW1";
    else if (state==`PIO_32_RX_MEM_WR64_DW2)      state_ascii <= #`TCQ "RX_MEM_WR64_DW2";
    else if (state==`PIO_32_RX_MEM_WR64_DW3)      state_ascii <= #`TCQ "RX_MEM_WR64_DW3";
    else if (state==`PIO_32_RX_MEM_WR64_DW4)      state_ascii <= #`TCQ "RX_MEM_WR64_DW4";
    else if (state==`PIO_32_RX_WAIT_STATE)        state_ascii <= #`TCQ "RX_WAIT_STATE";
    else                                          state_ascii <= #`TCQ "PIO 32 STATE ERR";

  end
  // synthesis translate_on




endmodule // PIO_32_RX_ENGINE

