/////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: BBC
//
// Project Name:   COMPASS
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    ST_TR_REGISTERS
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
//-- SVN keywords
// $Date: 2015-06-11 19:43:22 +0100 (Thu, 11 Jun 2015) $
// $Revision: 7424 $
// $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_STREAM_DAQ/hdl/design/DMA_SM.v $
// Revision: Final 1
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module DMA_SM (
	input  trn_clk,
//	input pio_reset_n,
	// dma
	input dma_ready,
	input  dma_rd_en,
   input [31:2] dma_init_addr,
   output [31:2] dma_addr,		 //  O
	
	//output dmac_o,
	output dma_start_o,
	output irq_dma_o,
	input stream_on,
	output [3:0] dma_curr_buf,
	input [31:7] dma_size
);

`include "ADC_DAQ_pkg.v"

reg dma_start_r = 0;
assign 	dma_start_o = dma_start_r;
//reg dmac_r = 0;
//assign 	dmac_o = dmac_r;
reg [3:0] dma_curr_buf_r = 0;
assign dma_curr_buf = dma_curr_buf_r;


reg [31:2] dma_addr_r =0;
assign dma_addr= dma_addr_r; //{dma_addr_r, 2'b00};

reg start_int_r =0;
assign irq_dma_o=start_int_r;

reg [24:0] packet_cnt=0;
//reg [6:0] burst_cnt = 0;

localparam s1 = 5'b00001;
localparam s2 = 5'b00010;
localparam s3 = 5'b00100;
localparam s4 = 5'b01000;
localparam s5 = 5'b10000;
   (* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="YES"*) reg [4:0] state = s1;
//SAFE_RECOVERY_STATE , st_error_fsm="5'b00001" 
//http://forums.xilinx.com/t5/Synthesis/New-unknown-warning-in-ISE-12-3-XST/td-p/123192/page/2

// always@(posedge trn_clk or negedge pio_reset_n) <- Register SM resets PCIe_command register on pio reset, so the following includes this condition

always@(posedge trn_clk or negedge stream_on)
      if (~stream_on) begin
         state <= s1;
			dma_start_r <= 1'b0;
			start_int_r <= 1'b0;
			dma_curr_buf_r <= 4'd0;
      end
      else
         (* PARALLEL_CASE *) case (state)
            s1 : begin
              if (dma_ready == 1'b1 ) begin 						// wait for FIFO
							dma_start_r <= 1'b1;
							state <= s2;
						end 
               else begin
							dma_start_r <= 1'b0;
							dma_addr_r <= dma_init_addr[31:2];
							packet_cnt <= dma_size[31:7]; 
							//dmac_r  <= 1'b0;
							start_int_r <= 1'b0;
							state <= s1;
					   end
            end
            s2 : begin
               if (dma_rd_en) begin
						  dma_start_r <= 1'b0;	// Sending Payload
                    state <= s3;
						end 
               else
                  state <= s2;
            end
            s3 : begin
               if (!dma_rd_en) begin // End of TLP
							packet_cnt <= packet_cnt - 1'b1;
							dma_addr_r[31:2] <= dma_addr_r[31:2] + DMA_TLP_SIZE; //dmaSize; // add in DW units
							state <= s4;
						end 
               else
                  state <= s3;
            end
            s4 : begin
					if (packet_cnt != 25'b000000) 
						begin
							if (dma_ready == 1'b1) // wait for FIFO
								begin
									dma_start_r <= 1'b1; // keep sending TLP packets
									state <= s2;
								end
							else
								state <= s4;
						end 
               else begin		
//						if (dma_curr_buf_r == (4'd9)) // BUF9 // No needed
//							dma_curr_buf_r <= 4'b0000;
//						else
						dma_curr_buf_r <= dma_curr_buf_r + 4'b0001;
						start_int_r <= 1'b1; // Send interrupt
                  state <= s5;
					  end
            end
            s5 : begin
					start_int_r <= 1'b0;
							state <= s1;
							//*********** These have to be included here to streamline state transition 
							// (a transition to idle state with an already ready FIFO would not reset these values and would break the SM)
							dma_start_r <= 1'b0;
							dma_addr_r <= dma_init_addr[31:2];
							packet_cnt <= dma_size[31:7];//DMA_TLP_SIZE;
							//dmac_r  <= 1'b0;
							//***********
            end
            default: begin  // Fault Recovery
               state <= s1;
	    end
         endcase

endmodule
