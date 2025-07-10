module double_mux_ff (
	input clk,
	input w, R, E, L,
	output reg Q
	);

	wire d1,d2;

	assign d1 = E ? w : Q;
	assign d2 = L ? R : d1;

	always @(posedge clk) begin
		Q <= d2;
	end

endmodule