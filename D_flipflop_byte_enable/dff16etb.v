`timescale  1ns/1ps
module top_module;
	wire [15:0] q;
	reg [1:0] byteena;
	reg resetn;
	reg [15:0] d;
	reg clk;

	dff16e dut (.clk(clk),
		    .resetn(resetn),
		    .byteena(byteena),
		    .d(d), 
		    .q(q)
		   );

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, top_module);

	resetn = 0;
	d = 16'h0000;
	byteena = 2'b00;

	#10;
	resetn = 1;

	d = 16'b0000_0010_0001_0000;
	byteena = 2'b00;

	#10; 	
	d = 16'b1100_0010_0111_0010;
	byteena = 2'b01;
	resetn = 1;

	#10; 	
	d = 16'b0000_0010_1000_0011;
	byteena =2'b00;
	resetn = 1;

	#10; 	
	d = 16'b0110_0000_0001_0000;
	byteena = 2'b01;
	resetn = 1;

	#10;
	$finish;
end

endmodule