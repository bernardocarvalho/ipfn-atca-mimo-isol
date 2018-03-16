//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: INSTITUTO DOS PLASMAS E FUSAO NUCLEAR
// Engineer: AJNB
//
// Project Name:   JET PLASMA VS CONTROLLER
// Design Name:    ATCA-GPIO-CONTROL FIRMWARE
// Module Name:    AD9511
// Target Devices: XC4VFX60-11FF1152 or XC4VFX100-11FF1152
//
// Revision: Final 1
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module AD9511 (
input reset,
input AD9511_SCLK,
output reg AD9511_CSB,
output AD9511_SDIO
);

reg [4:0] instruction_bits_counter = 24;
reg [8:0] config_bits_counter = 0;

AD9511_CONFIG ROM (
.a(config_bits_counter),
.spo(AD9511_SDIO)
);

always @ (negedge AD9511_SCLK)
begin
 if((reset == 0) && (config_bits_counter != 450) && (instruction_bits_counter != 0))
  begin
   AD9511_CSB <= 0;
	config_bits_counter <= config_bits_counter + 1;
	instruction_bits_counter <= instruction_bits_counter - 1;
  end	
 else
  if((reset == 0) && (config_bits_counter != 450) && (instruction_bits_counter == 0))
   begin
    AD9511_CSB <= 1;
	 instruction_bits_counter <= 24;
    config_bits_counter <= config_bits_counter + 1;	 
   end
  else
   if((reset == 0) && (config_bits_counter == 450))
	 begin
     AD9511_CSB <= 1;
	 end
   else
    if(reset == 1)
     begin
      AD9511_CSB <= 1;
      config_bits_counter <= 0;
	   instruction_bits_counter <= 24;
	  end 
end

endmodule
