//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: AJNB
//
// Project Name:   JET PLASMA VS CONTROLLER
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    DAC
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
// Revision: 
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module DAC (
input reset,
input [15:0] DAC_data,
input DAC_clock,
output reg DAC_serial_data,
output reg DAC_word_sync,  
output DAC_reset                                                                    				                                                             				
);

assign DAC_reset = reset;

reg [4:0] counter = 0;
reg [15:0] DAC_data_reg;
always @ (posedge DAC_clock)
begin
 if((reset == 1) || (counter == 17))
  begin
	DAC_data_reg <= DAC_data;
	counter <= 0;
  end
 else
  counter <= counter + 1;
end  
  
always @ (posedge DAC_clock)  
begin
	case(counter)
	 17 : DAC_word_sync <= 0;
	 16 : DAC_serial_data <= 0;
	 15 : DAC_serial_data <= DAC_data_reg[0];
	 14 : DAC_serial_data <= DAC_data_reg[1];
	 13 : DAC_serial_data <= DAC_data_reg[2];
	 12 : DAC_serial_data <= DAC_data_reg[3];
	 11 : DAC_serial_data <= DAC_data_reg[4];
	 10 : DAC_serial_data <= DAC_data_reg[5];
	  9 : DAC_serial_data <= DAC_data_reg[6];
	  8 : DAC_serial_data <= DAC_data_reg[7];
	  7 : DAC_serial_data <= DAC_data_reg[8];
	  6 : DAC_serial_data <= DAC_data_reg[9];
	  5 : DAC_serial_data <= DAC_data_reg[10];
	  4 : DAC_serial_data <= DAC_data_reg[11];
	  3 : DAC_serial_data <= DAC_data_reg[12];
	  2 : DAC_serial_data <= DAC_data_reg[13];
	  1 : DAC_serial_data <= DAC_data_reg[14];
	  0 : begin
	       DAC_word_sync <= 1;
	       DAC_serial_data <= DAC_data_reg[15];
			end 
	endcase
end

endmodule
