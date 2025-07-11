`timescale 1ns/1ps
module top_module;

	reg clk;
	wire [3:0] q;
	reg reset;

	four_bit_counter dut (.clk(clk), .q(q), 
		       .reset(reset)
		      );

	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, top_module);
	
		reset = 1; 
		#10
		reset = 0;
		#100
		$finish;
	end
endmodule