`timescale 1ns/1ps
module top_module;

	reg p1a, p1b, p1c, p1d, p1e, p1f;
	wire p1y;

	reg p2a, p2b, p2c, p2d;
	wire p2y;

chip7458 dut (
.p1a(p1a), .p1b(p1b), .p1c(p1c),
.p1d(p1d), .p1e(p1e), .p1f(p1f),
.p1y(p1y),
.p2a(p2a), .p2b(p2b), .p2c(p2c), .p2d(p2d),
.p2y(p2y)
);

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, top_module);
	
	{p1a, p1b, p1c, p1d, p1e, p1f, p2a, p2b, p2c, p2d} = 10'b0;
	#10
	{p1a, p1b, p1c} = 3'b111; 
	#10
	{p1a, p1b, p1c, p1d, p1e, p1f} = 6'b000_111; 
	#10
	{p2a, p2b, p2c, p2d} = 4'b1100;
	#10
	{p2a, p2b, p2c, p2d} = 4'b0011; 
	#10
	{p1a, p1b, p1c, p1d, p1e, p1f} = 6'b101010;
	{p2a, p2b, p2c, p2d} = 4'b1001;
	#10
	$finish;
end
endmodule