`timescale 1ns/1ps
module top_module;
    reg [1:0] in;
    wire out;

    ANDgate dut (.in(in), .out(out));

    initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, top_module);

        in = 2'b00;
        #10 in = 2'b01;
        #10 in = 2'b10;
        #10 in = 2'b11;

	$finish;
    end
endmodule
