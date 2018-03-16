// This copyright and support notice must be retained as part
// of this text at all times.
//-- Filename: PIO_DMA_32_TX_ENGINE.v
//--
//-- Description: 32 bit Local-Link Transmit Unit.
//--
//--------------------------------------------------------------------------------

`timescale 1ns/1ns

`define PIO_32_TX_CPLD_FMT_TYPE 7'b10_01010	// Completion w/ data
`define PIO_32_TX_CPL_FMT_TYPE  7'b00_01010		// Completion
`define PIO_32_TX_MWR_FMT_TYPE  7'b10_00000 	//FMT 3 DW header, with TYPE data Memory Write Request (posted TLP)

`define PIO_32_TX_RST_STATE     9'b000000000
`define PIO_32_TX_CPLD_DW1      9'b000000001
`define PIO_32_TX_CPLD_DW2      9'b000000010
`define PIO_32_TX_CPLD_DW3      9'b000000100
`define PIO_32_TX_CPL_DW1       9'b000001000
`define PIO_32_TX_CPL_DW2       9'b000010000
`define PIO_32_TX_CPL_DW3       9'b000100000
//for DMA
`define PIO_32_TX_MWR_DW1       9'b001000000
`define PIO_32_TX_MWR_DW2       9'b010000000
`define PIO_32_TX_MWR_DW3       9'b100000000

module PIO_DMA_32_TX_ENGINE    (

                        clk,
                        rst_n,

                        trn_td,
                        trn_tsof_n,
                        trn_teof_n,
                        trn_tsrc_rdy_n,
                        trn_tsrc_dsc_n,
                        trn_tdst_rdy_n,
                        trn_tdst_dsc_n,

                        req_compl_i,
                        req_compl_with_data_i, // asserted indicates to generate a completion WITH data
                                                             // otherwise a completion WITHOUT data will be generated  //DRT
                        compl_done_o,

                        req_tc_i,     
                        req_td_i,    
                        req_ep_i,   
                        req_attr_i,
                        req_len_i,         
                        req_rid_i,        
                        req_tag_i,       
                        req_be_i,
                        req_addr_i,     

                        // Read Access

//                        rd_addr_o,   
//                        rd_be_o, 
								rd_data_i,   
                        // DMA Access
                        dma_data_i,
								dma_addr_i,
								dma_start_i,
								dma_rd_en_o,
								
                        completer_id_i,
                        cfg_bus_mstr_enable_i

                        );
	`include "ADC_DAQ_pkg.v"

    input               clk;
    input               rst_n;
 
    output [31:0]       trn_td;
    output              trn_tsof_n;
    output              trn_teof_n;
    output              trn_tsrc_rdy_n;
    output              trn_tsrc_dsc_n;
    input               trn_tdst_rdy_n;
    input               trn_tdst_dsc_n;

    input               req_compl_i;
    input               req_compl_with_data_i;
    output              compl_done_o;

    input [2:0]         req_tc_i;
    input               req_td_i;
    input               req_ep_i;
    input [1:0]         req_attr_i;
    input [9:0]         req_len_i;
    input [15:0]        req_rid_i;
    input [7:0]         req_tag_i;
    input [7:0]         req_be_i;
    input [12:0]        req_addr_i;
    
//    output [10:0]       rd_addr_o;
//    output [3:0]        rd_be_o;
    input  [31:0]       rd_data_i;
    input  [31:0]       dma_data_i;
    input  [31:2]       dma_addr_i;
    input               dma_start_i;
    output reg          dma_rd_en_o;

    input [15:0]        completer_id_i;
    input               cfg_bus_mstr_enable_i;

    // Local registers

    reg [31:0]          trn_td;
    reg                 trn_tsof_n;
    reg                 trn_teof_n;
    reg                 trn_tsrc_rdy_n;
    reg                 trn_tsrc_dsc_n;
 
    reg [11:0]          byte_count;
    reg [06:0]          lower_addr;

    reg                 compl_done_o;

    reg [8:0]           state; // DRT

	 reg [9:0]           payload_cnt;  

//Local wires
	wire [3:0]        rd_be_int;
   
    /*
     * Present address and byte enable to memory module
     */

//    assign rd_addr_o = req_addr_i[12:2];
assign rd_be_int =   req_be_i[3:0];

    /*
     * Calculate byte count based on byte enable
     */

    always @ (rd_be_int) begin

      casex (rd_be_int[3:0])
      
        4'b1xx1 : byte_count = 12'h004;
        4'b01x1 : byte_count = 12'h003;
        4'b1x10 : byte_count = 12'h003;
        4'b0011 : byte_count = 12'h002;
        4'b0110 : byte_count = 12'h002;
        4'b1100 : byte_count = 12'h002;
        4'b0001 : byte_count = 12'h001;
        4'b0010 : byte_count = 12'h001;
        4'b0100 : byte_count = 12'h001;
        4'b1000 : byte_count = 12'h001;
        4'b0000 : byte_count = 12'h001;

      endcase

    end

    /*
     * Calculate lower address based on  byte enable
     */

    always @ (rd_be_int or req_addr_i) begin

      casex (rd_be_int[3:0])
      
        4'b0000 : lower_addr = {req_addr_i[6:2], 2'b00};
        4'bxxx1 : lower_addr = {req_addr_i[6:2], 2'b00};
        4'bxx10 : lower_addr = {req_addr_i[6:2], 2'b01};
        4'bx100 : lower_addr = {req_addr_i[6:2], 2'b10};
        4'b1000 : lower_addr = {req_addr_i[6:2], 2'b11};

      endcase

    end

    /*
     *  State Machine to generate Completion with 1 DW Payload or Completion
        without data -- DRT
     */
wire [9:0] dmaSize ;
assign  dmaSize = DMA_TLP_SIZE;

    always @ ( posedge clk or negedge rst_n ) begin

        if (!rst_n ) begin

          trn_tsof_n        <= 1'b1;
          trn_teof_n        <= 1'b1;
          trn_tsrc_rdy_n    <= 1'b1;
          trn_tsrc_dsc_n    <= 1'b1;
          trn_td            <= 32'b0;

          compl_done_o      <= 1'b0;
          dma_rd_en_o          <= 1'b0;

          state             <= `PIO_32_TX_RST_STATE;

        end else begin

          compl_done_o      <= 1'b0;

          case ( state )

            `PIO_32_TX_RST_STATE : begin

              trn_tsrc_dsc_n   <= 1'b1;

              if (!trn_tdst_rdy_n && dma_start_i && trn_tdst_dsc_n) begin  //DMA 32 bytes

                trn_tsof_n       <= 1'b0;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= { 
                                    {1'b0}, 															// Reserved
                                    `PIO_32_TX_MWR_FMT_TYPE, 
                                    {1'b0}, 															// Reserved
                                    {3'b0}, 															// req_tc_wr,  (Traffic Class 0-7)
                                    {4'b0}, 															// Reserved
                                    {1'b0}, 															// req_td_wr, (TLP digest present)
                                    {1'b0}, 															// req_ep_wr,  (poisoning)
                                    {2'b0}, 															// req_attr_wr, {Relaxed ordering, no snoop (cache coherency)}
                                    {2'b0}, 															// Reserved	
                                    dmaSize 														// Length of data payload in DW (10'b)
                                    };							
                state            <= `PIO_32_TX_MWR_DW1;
					end 
              else if (!trn_tdst_rdy_n && req_compl_i &&
                  req_compl_with_data_i && trn_tdst_dsc_n) begin // DRT

                trn_tsof_n       <= 1'b0;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= {
                                    {1'b0},
                                    `PIO_32_TX_CPLD_FMT_TYPE,
                                    {1'b0},
                                    req_tc_i,
                                    {4'b0},
                                    req_td_i,
                                    req_ep_i,
                                    req_attr_i,
                                    {2'b0},
                                    req_len_i
                                    };
                state            <= `PIO_32_TX_CPLD_DW1;

             // DRT - added below
             end

             else if (!trn_tdst_rdy_n && req_compl_i &&
                  !req_compl_with_data_i && trn_tdst_dsc_n) begin

                trn_tsof_n       <= 1'b0;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= {
                                    {1'b0},
                                    `PIO_32_TX_CPL_FMT_TYPE,
                                    {1'b0},
                                    req_tc_i,
                                    {4'b0},
                                    req_td_i,
                                    req_ep_i,
                                    req_attr_i,
                                    {2'b0},
                                    req_len_i
                                    };
                state            <= `PIO_32_TX_CPL_DW1;

              end else begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b1;
                trn_td           <= 32'b0;
                state            <= `PIO_32_TX_RST_STATE;

              end

            end
           `PIO_32_TX_MWR_DW1 : begin // 2nd  DMA Header

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;
              
              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= { 
                                    completer_id_i, // requester_id??
                                    8'b00001111, //tag undefined in Posted TLPs
                                    4'b1111, //last_BE (BE = Byte enable)
                                    4'b1111 //first_BE
                                    };
                state            <= `PIO_32_TX_MWR_DW2;

              end else
                state            <= `PIO_32_TX_MWR_DW1;

            end
				
            `PIO_32_TX_MWR_DW2 : begin

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;
              
              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= {dma_addr_i[31:2], {2'b0} }; // DW byte aligned
					 payload_cnt      <= DMA_TLP_SIZE;
		          dma_rd_en_o          <= 1'b1;
                state            <= `PIO_32_TX_MWR_DW3;

              end else
                state            <= `PIO_32_TX_MWR_DW2;

            end
				
            `PIO_32_TX_MWR_DW3 : begin

              if (!trn_tdst_dsc_n) begin
				  
                trn_tsrc_dsc_n   <= 1'b1;
					 dma_rd_en_o         <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;
              
				  end else if (!trn_tdst_rdy_n) begin 
				  		   			
					 trn_tsof_n       <= 1'b1;
					 trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= dma_data_i;  // 32'hA5A5A5A5;
				
					 if (payload_cnt == 10'h01) begin // End of TLP
							trn_teof_n       <= 1'b0;              
							compl_done_o     <= 1'b1;
							dma_rd_en_o         <= 1'b0;
							state            <= `PIO_32_TX_RST_STATE;
						end 
					 else begin 
							trn_teof_n       <= 1'b1;              
							compl_done_o     <= 1'b0;
							payload_cnt 	  <= payload_cnt - 1'b1;
							state            <= `PIO_32_TX_MWR_DW3;
					   end 
				
              end else
                state            <= `PIO_32_TX_MWR_DW3;
			   end 


            `PIO_32_TX_CPLD_DW1 : begin

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;
              
              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= { 
                                    completer_id_i,
                                    {3'b0}, 
                                    {1'b0},
                                    byte_count 
                                    };
                state            <= `PIO_32_TX_CPLD_DW2;

              end else
                state            <= `PIO_32_TX_CPLD_DW1;

            end

            `PIO_32_TX_CPLD_DW2 : begin

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;

              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= {
                                    req_rid_i, 
                                    req_tag_i,
                                    {1'b0}, 
                                    lower_addr
                                    };
                state            <= `PIO_32_TX_CPLD_DW3;

              end else
                state            <= `PIO_32_TX_CPLD_DW2;

            end

            `PIO_32_TX_CPLD_DW3 : begin

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b1;
                state            <= `PIO_32_TX_RST_STATE;
              
              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b0;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= { 
                                    rd_data_i
                                    };
                compl_done_o     <= 1'b1;
                state            <= `PIO_32_TX_RST_STATE;

              end else
                state            <= `PIO_32_TX_CPLD_DW3;

            end


           // DRT added

           `PIO_32_TX_CPL_DW1 : begin

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;

              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b1;
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= {
                                    completer_id_i,
                                    {3'b0},
                                    {1'b0},
                                    byte_count
                                    };
                state            <= `PIO_32_TX_CPL_DW2;

              end else
                state            <= `PIO_32_TX_CPL_DW1;

            end

            `PIO_32_TX_CPL_DW2 : begin

              if (!trn_tdst_dsc_n) begin

                trn_tsrc_dsc_n   <= 1'b0;
                state            <= `PIO_32_TX_RST_STATE;

              end else if (!trn_tdst_rdy_n) begin

                trn_tsof_n       <= 1'b1;
                trn_teof_n       <= 1'b0;  // DRT
                trn_tsrc_rdy_n   <= 1'b0;
                trn_td           <= {
                                    req_rid_i,
                                    req_tag_i,
                                    {1'b0},
                                    lower_addr
                                    };
                compl_done_o <= 1'b1; // DRT
                state            <= `PIO_32_TX_RST_STATE;

              end else
                state            <= `PIO_32_TX_CPL_DW2;

            end


          endcase

        end

    end

endmodule // PIO_DMA_32_TX_ENGINE

