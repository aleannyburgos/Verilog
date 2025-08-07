`timescale 1ns/1ps
module top_module;

	reg clk, rst;
	wire [1:0] Alight, Blight;

	traffic_light dut (.clk(clk), .rst(rst), 
			   .Alight(Alight), .Blight(Blight)
		 	  );
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, top_module);

		rst = 1; 
		#10
		rst = 0;
		#200
		$finish;
	end
endmodule