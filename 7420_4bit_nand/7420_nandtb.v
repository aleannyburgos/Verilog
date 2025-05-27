`timescale 1ns/1ps
module top_module;

	reg p1a, p1b, p1c, p1d;
	wire p1y;
	reg p2a, p2b, p2c, p2d;
	wire p2y;

	nand_7420 dut  (.p1a(p1a), .p1b(p1b), 
			.p1c(p1c), .p1d(p1d),
			.p2a(p2a), .p2b(p2b), 
			.p2c(p2c), .p2d(p2d),
			.p1y(p1y), .p2y(p2y)
	);
 
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars (0, top_module);
		{p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d} = 8'b0000_0000;
		#10
		{p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d} = 8'b0000_1111;
		#10
		{p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d} = 8'b0101_1010;
		#10
		{p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d} = 8'b0100_1000;
		#10
		$finish;
	end
endmodule
	
