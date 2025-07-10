`timescale 1ns/1ps
module top_module;

	reg w, R, E, L;
	wire Q;
	reg clk; 
	reg d1,d2;
	
	double_mux_ff dut(.w(w), .R(R),
			  .E(E), .L(L),
			  .Q(Q), .clk(clk)
			 );

	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, top_module);

		w = 0;
		R = 0;
		E = 0;
		L = 0;


		#10
		w = 1;
		R = 1;
		E = 1;
		L = 0;

		#10
		w = 1;
		R = 0;
		E = 1;
		L = 0;


		#10

		w = 0;
		R = 1;
		E = 0;
		L = 0;


		#10
		w = 0;
		R = 0;
		E = 0;
		L = 0;


		#10;
		$finish;
	end
endmodule