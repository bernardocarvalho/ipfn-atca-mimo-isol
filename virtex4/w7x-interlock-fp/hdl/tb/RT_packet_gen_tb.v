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

//`include "../design/ADC_DAQ_pkg.v"
	// Inputs
	reg trn_clk;
	reg pio_reset_n;
	reg ff_clk;
	reg [31:0] command;
	reg PCIe_dma_rd_en;
	//reg [15:0] int_decimate;
	reg stream_on;
	reg wordSync_n;
	reg acq_on;
	reg trigger_n;
	reg adc_chop_dly;
	reg [17:0] data_in_ch1;
	reg [17:0] data_in_ch2;
	reg [17:0] data_in_ch3;
	reg [17:0] data_in_ch4;
	reg [17:0] data_in_ch5;
	reg [17:0] data_in_ch6;
//	reg [17:0] data_in_ch7;
//	reg [17:0] data_in_ch8;
	reg [15:0] reg_offset;
	reg [15:0] raw_data1,raw_data2,raw_data3,raw_data4,raw_data5,raw_data6;
	reg [31:0] reg_data;
	reg reg_wrt_en;

	// Outputs
	wire dma_ready;
	wire [31:0] dma_data_out;
	wire [15:0] dac_out;
	wire [31:0] dsp_out;

	integer file, fileOut, c, r=1;
	reg [31:0] data_file_in;

	parameter HOLD_SAMPLES = 4;	
	reg [HOLD_SAMPLES-1:0] chop_sr= 4'b0;
	wire data_hold=chop_sr[HOLD_SAMPLES-1] ^ adc_chop_dly;
//	reg [17:0] data_in_ch1, data_in_ch2;// {2'b00, 16'h00FF};
//eg [17:0] data_in_ch1;

	reg [31:0] float_out;
	// Instantiate the Unit Under Test (UUT)
	PCIe_packet_gen uut (
		.trn_clk(trn_clk), 
		.pio_reset_n(pio_reset_n), 
		.ff_clk(ff_clk), 
		.command(command), 
		.PCIe_dma_rd_en(PCIe_dma_rd_en), 
		//.int_decimate(int_decimate), 
		.dma_ready(dma_ready), 
		.dma_data_out(dma_data_out), 
		.dac_out(dac_out), 
		.stream_on(stream_on), 
		.wordSync_n(wordSync_n), 
		.acq_on(acq_on), 
		.trigger_n(trigger_n), 
		.adc_chop_dly(adc_chop_dly), 
		.data_hold(data_hold),
		.data_in_ch1(data_in_ch1), 
		.data_in_ch2(data_in_ch2), 
		.data_in_ch3(data_in_ch3), 
		.data_in_ch4(data_in_ch4), 
		.data_in_ch5(data_in_ch5), 
		.data_in_ch6(data_in_ch6), 
//		.data_in_ch7(data_in_ch7), 
//		.data_in_ch8(data_in_ch8), 
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

//   parameter CHOP_PERIOD = 1000000; // 1 ms
//	always 
//       #(CHOP_PERIOD/2)  adc_chop_dly =  ! adc_chop_dly; 
//      adc_chop_dly = 1'b1;
//      #(CHOP_PERIOD/2) adc_chop_dly = 1'b0;
//      #(CHOP_PERIOD/2);
//   end 

	always begin
      wordSync_n = 1'b1;
      #450 wordSync_n = 1'b0;
      #50;
   end  

	parameter CHOP_RECONSTRUCT = 5'd12; // State of Chop Recontruction, if equals 1 chop is ON if 0 it is OFF

   task write_reg_t;
      input [15:0] reg_off;
      input [31:0] reg_dt;
      
      begin
		reg_offset = reg_off ;
		reg_data =  reg_dt; 
		#20;
		reg_wrt_en = 1;
		#20;
		reg_wrt_en = 0;
//		#20;
      end
   endtask
	
	initial 
	  begin
	  $timeformat (-9, 3, " ns", 13);
		// Initialize Inputs
		trn_clk = 0;
		pio_reset_n = 0;
		ff_clk = 0;
		command = 0;
		command[CHOP_RECONSTRUCT]=1'b1;
		PCIe_dma_rd_en = 0;
		//int_decimate = 0;
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
		//data_in_ch7 = 0;
		//data_in_ch8 = 0;
		reg_offset = 0;
		reg_data = 0;
		reg_wrt_en = 0;

		//$display("time bin decimal hex");
		file = $fopen("data_files/raw_data.txt","r"); // Must run 1200 ms
		if (file == 0) begin // If error opening file
        $display("Error: Failed to open file,\nExiting Simulation.");
        $finish;
		end
		fileOut = $fopen("data_files/dataFpHex.txt","w");

		// Wait 20 ns for global reset to finish
		#20;
		// Add stimulus here
		pio_reset_n = 1;
//write eo
		write_reg_t({11'd0, 5'd0}, 32'h3FF53); // -173
		write_reg_t({11'd0, 5'd1}, 32'h3FF33); // -205
		write_reg_t({11'd0, 5'd2}, 32'h3FEDC); // -292
		write_reg_t({11'd0, 5'd3}, 32'h3FF21); // -223
		write_reg_t({11'd0, 5'd4}, 32'h3FF99); // -103
		write_reg_t({11'd0, 5'd5}, 32'h0); // 0
//write wo
		write_reg_t({11'd1, 5'd0}, 32'h00005C92);//0.361604 2F0A4);// 00009CF9); // 0.6131
		write_reg_t({11'd1, 5'd1}, 32'h00000CD8);// FFFD0F5C); //  -2.9400  
		write_reg_t({11'd1, 5'd2}, 32'h0000408A);//0.252099 48F5C);//FFFD8A3D); //  -2.4600  
		write_reg_t({11'd1, 5'd3}, 32'h0000FA64);// 0.978084  328F6);//FFFB70A4); //  -4.5600  
		write_reg_t({11'd1, 5'd4}, 32'h00005103);// 0.316451  2570A);//FFFDA8F6); //  -2.3400
		write_reg_t({11'd1, 5'd5}, 32'h00000000); // 0
//write dsp
		write_reg_t({11'd2, 5'd0}, 32'hB8860705); // B2= -6.39092577e-05,  3f800000: 1.0 float 32'd1; use Octave function  num2hex(single(1.0))
		write_reg_t({11'd2, 5'd1}, 32'hB87C2271); // B3= -6.0114e-005		
		write_reg_t({11'd2, 5'd2}, 32'hB880C087); // B4= -6.1394e-005		
		write_reg_t({11'd2, 5'd3}, 32'hB88296CA); // B5= -6.2270e-005		
		write_reg_t({11'd2, 5'd4}, 32'h386FC749); // B1= 5.7168e-005		
		/*
		B/4 = array([  5.71676401e-05,   6.39092577e-05,   6.01135577e-05,  6.13937642e-05,   6.22696950e-05])
		 */
//		write_reg_t({11'd2, 5'd4}, 32'h3f800000); // 1.0 float
		write_reg_t({11'd2, 5'd5}, 32'h00000000); // 0.0	
//		reg_data =  32'h3f800000; // 1.0 float ;
//		reg_data =  32'h3f800000; // 32'h0;// 0.0 float 32'd0;

		#100;
		acq_on = 1;
		#100;
		stream_on = 1;
		float_out=32'h3f800000;
		while (r>0) begin
         //$display("r = %d", r);
         r=$fscanf(file, "%h %h %h %h %h %h", raw_data1,raw_data2,raw_data3,raw_data4,raw_data5,raw_data6);
         //r=$fscanf(file, "%h", data_file_in);
			data_in_ch1 <= {raw_data1, 2'b00}; //data_file_in[17:0];
			data_in_ch2 <= {raw_data2, 2'b00}; 
			data_in_ch3 <= {raw_data3, 2'b00}; 
			data_in_ch4 <= {raw_data4, 2'b00}; 
			data_in_ch5 <= {raw_data5, 2'b00}; 
			adc_chop_dly <= raw_data6[0];
         @(negedge wordSync_n);
			chop_sr = {chop_sr[HOLD_SAMPLES-2:0], adc_chop_dly};
         //$fmonitor(fileo, "%h", dout);
         $fdisplay(fileOut, "%h", dsp_out);
         $display("Number %d %h %h %f", data_in_ch1, data_in_ch2, dsp_out, $bitstoreal(dsp_out) );
//         $fdisplay(fileOut, "%h %h %h", data_in_ch1, data_in_ch2, dsp_out);
//			$display("The number is %f", $bitstoreal(float_out));
      end
		$display("End of file, Time=%t", $realtime);
 
// r=$fscanf(file, "%h", din);
		
		 $fclose(file);
		 $fclose(fileOut);
	end
      
endmodule

