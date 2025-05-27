`timescale 1ns/1ps
module top_module;
	reg [3:0] a, b, c, d;
	reg [1:0] sel; 
	wire [3:0] out;

	mux4to1 dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, top_module);
		a = 4'b0101;
		b = 4'b1010;
		c = 4'b1111;
		d = 4'b0000;
		sel = 2'b00;
		#10
		sel = 2'b01;
		#10	
		sel = 2'b10;
		#10	
		sel = 2'b11;
		#10
		$finish;
	end
endmodule