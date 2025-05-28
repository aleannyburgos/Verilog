`timescale 1ns/1ps
module top_module;

	reg [3:0] x, y;
	wire [4:0] sum;

	full_adder dut (.x(x), .y(y), 
			.sum(sum)
	);
	
	initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, top_module);
		x = 4'b0000;
		y = 4'b0000;
		#10
		x = 4'b0001;
		y = 4'b0010;
		#10
		x = 4'b0100;
		y = 4'b1000;
		#10	
		x = 4'b0010;
		y = 4'b0101;
		#10	
		x = 4'b1111;
		y = 4'b1111;
		#10
		$finish;
	end
endmodule