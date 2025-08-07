module traffic_light (
	input wire clk,
	input wire rst,
	output reg [1:0] Alight,
	output reg [1:0] Blight
);

	reg [1:0] state;
	reg [1:0] next_state;
	reg [3:0] counter;
	localparam maxcount = 4'd3;


	//state transition
	//states
	localparam S0 = 2'b00,
		   S1 = 2'b01,
		   S2 = 2'b10,
		   S3 = 2'b11;

	//light colors
	localparam GREEN = 2'b00,
		   YELLOW = 2'b01,
		   RED = 2'b10;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			state <= S0;
			counter <= 0;
		end 
		else begin
			if(counter == maxcount) begin	
				state <= next_state;
				counter <=0;
			end else begin
				counter <= counter + 1;
			end
		end
	end

	// state logic
	always @(*) begin
		case(state)
			S0: next_state = S1;
			S1: next_state = S2;
			S2: next_state = S3;
			S3: next_state = S0;
			default: next_state = S0;
		endcase
	end

	//Output logic
	always @(*) begin
		case(state)
			S0: begin
				Alight = GREEN;
				Blight = RED;
			end
			S1: begin
				Alight = YELLOW;
				Blight = RED;
			end
			S2: begin
				Alight = RED;
				Blight = GREEN;
			end
			S3: begin
				Alight = RED;
				Blight = YELLOW;
			end
			default: begin
				Alight = GREEN;
				Blight = GREEN;
			end
		endcase
	end
endmodule