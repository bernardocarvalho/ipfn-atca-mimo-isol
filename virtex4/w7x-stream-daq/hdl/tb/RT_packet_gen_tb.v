`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:00:29 03/25/2015
// Design Name:   PCIe_packet_gen
// Module Name:   E:/temp/FPGA/DAQ_INT_STREAM/hdl/design/RT_packet_gen_tb.v
// Project Name:  DAQ_INT_STREAM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCIe_packet_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RT_packet_gen_tb;

	// Inputs
	reg trn_clk;
	reg pio_reset_n;
	reg ff_clk;
	reg [31:0] command;
	reg PCIe_dma_rd_en;
	reg [15:0] int_decimate;
	reg stream_on;
	reg wordSync_n;
	reg acq_on;
	reg trigger_n;
	reg adc_chop_dly;
//	reg [17:0] data_in_ch1;
//	reg [17:0] data_in_ch2;
	reg [17:0] data_in_ch3;
	reg [17:0] data_in_ch4;
	reg [17:0] data_in_ch5;
	reg [17:0] data_in_ch6;
	reg [17:0] data_in_ch7;
	reg [17:0] data_in_ch8;
	reg [15:0] reg_offset;
	reg [31:0] reg_data;
	reg reg_wrt_en;

	// Outputs
	wire dma_ready;
	wire [31:0] dma_data_out;
	wire [15:0] dac_out;

	integer file, fileOut, c, r=1;
	reg [31:0] data_file_in;
	reg [17:0] data_in_ch1, data_in_ch2;// {2'b00, 16'h00FF};
//eg [17:0] data_in_ch1;

	reg [31:0] float_out;
	wire [31:0] dsp_out;
	// Instantiate the Unit Under Test (UUT)
	PCIe_packet_gen uut (
		.trn_clk(trn_clk), 
		.pio_reset_n(pio_reset_n), 
		.ff_clk(ff_clk), 
		.command(command), 
		.PCIe_dma_rd_en(PCIe_dma_rd_en), 
		.int_decimate(int_decimate), 
		.dma_ready(dma_ready), 
		.dma_data_out(dma_data_out), 
		.dac_out(dac_out), 
		.stream_on(stream_on), 
		.wordSync_n(wordSync_n), 
		.acq_on(acq_on), 
		.trigger_n(trigger_n), 
		.adc_chop_dly(adc_chop_dly), 
		.data_in_ch1(data_in_ch1), 
		.data_in_ch2(data_in_ch2), 
		.data_in_ch3(data_in_ch3), 
		.data_in_ch4(data_in_ch4), 
		.data_in_ch5(data_in_ch5), 
		.data_in_ch6(data_in_ch6), 
		.data_in_ch7(data_in_ch7), 
		.data_in_ch8(data_in_ch8), 
		.reg_offset(reg_offset), 
		.reg_data(reg_data), 
		.reg_wrt_en(reg_wrt_en),
		.dsp_out(dsp_out)
	);

   parameter TRN_PERIOD = 5;
	// clk 200 Mhz
	always 
       #(TRN_PERIOD/2)  trn_clk =  ! trn_clk; 
		 
   parameter FF_PERIOD = 10;
	// clk 100 Mhz
	always 
       #(FF_PERIOD/2)  ff_clk =  ! ff_clk; 

   parameter CHOP_PERIOD = 1000000; // 1 ms
	always 
       #(CHOP_PERIOD/2)  adc_chop_dly =  ! adc_chop_dly; 
//      adc_chop_dly = 1'b1;
//      #(CHOP_PERIOD/2) adc_chop_dly = 1'b0;
//      #(CHOP_PERIOD/2);
//   end 

	always begin
      wordSync_n = 1'b1;
      #450 wordSync_n = 1'b0;
      #50;
   end  
	
	initial 
	  begin
	  $timeformat (-9, 3, " ns", 13);
		// Initialize Inputs
		trn_clk = 0;
		pio_reset_n = 0;
		ff_clk = 0;
		command = 0;
		PCIe_dma_rd_en = 0;
		int_decimate = 0;
		stream_on = 0;
		//wordSync_n = 0;
		acq_on = 0;
		trigger_n = 0;
		adc_chop_dly = 0;
		data_in_ch1 = 0;
		data_in_ch2 = 0;
		data_in_ch3 = 0;
		data_in_ch4 = 0;
		data_in_ch5 = 0;
		data_in_ch6 = 0;
		data_in_ch7 = 0;
		data_in_ch8 = 0;
		reg_offset = 0;
		reg_data = 0;
		reg_wrt_en = 0;

		//$display("time bin decimal hex");
		file = $fopen("data_files/sinus32bHex.txt","r");
		if (file == 0) begin // If error opening file
        $display("Error: Failed to open file,\nExiting Simulation.");
        $finish;
		end
		fileOut = $fopen("data_files/dataFpHex.txt","w");

		// Wait 20 ns for global reset to finish
		#20;
		// Add stimulus here
		pio_reset_n = 1;
		reg_offset = {11'd2, 5'd0} ;
		reg_data =  32'h3f800000; // 1.0 float 32'd1;
		#20;
		reg_wrt_en = 1;
		#20;
		reg_wrt_en = 0;
		#20;
		reg_offset = {11'd2, 5'd1} ;
		reg_data =  32'h3f800000; // 32'h0;// 0.0 float 32'd0;
		#20;
		reg_wrt_en = 1;
		#20;
		reg_wrt_en = 0;
		#20;
		reg_offset = {11'd2, 5'd5} ;
		#20;
		reg_wrt_en = 1;
		#20;
		reg_wrt_en = 0;

		#100;
		acq_on = 1;
		#100;
		stream_on = 1;
		float_out=32'h3f800000;
		while (r>0) begin
         //$display("r = %d", r);
//         r=$fscanf(file, "%h %h", data_in_ch1, data_in_ch2);
         r=$fscanf(file, "%h", data_file_in);
			data_in_ch1 <= data_file_in[17:0];
			data_in_ch2 <= data_file_in[17:0];
         @(negedge wordSync_n);
         //$fmonitor(fileo, "%h", dout);
         $fdisplay(fileOut, "%h", dsp_out);
         $display("Number %d %h %h", data_in_ch1, data_in_ch2, dsp_out);
//         $fdisplay(fileOut, "%h %h %h", data_in_ch1, data_in_ch2, dsp_out);
//			$display("The number is %f", $bitstoreal(float_out));
      end
		$display("End of file, Time=%t", $realtime);
 
// r=$fscanf(file, "%h", din);
		
		 $fclose(file);
		 $fclose(fileOut);
	end
      
endmodule

