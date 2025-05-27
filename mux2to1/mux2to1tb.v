`timescale 1ns/1ps
module top_module;

	reg a, b, sel;
	wire out;

	mux2to1 dut (
	.a(a), .b(b), .sel(sel), .out(out)
	);
	
	initial begin
		$dumpfile ("dump.vcd");
		$dumpvars (0, top_module);

		{sel, a, b} = 3'b000;
		#10
		{sel, a, b} = 3'b001;
		#10
		{sel, a, b} = 3'b010;
		#10
		{sel, a, b} = 3'b011;
		#10
		{sel, a, b} = 3'b100;
		#10
		{sel, a, b} = 3'b101;
		#10
		{sel, a, b} = 3'b110;
		#10
		{sel, a, b} = 3'b111;
		#10

		$finish;
	end
endmodule