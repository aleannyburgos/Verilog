module four_bit_counter (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q
);

    always @(posedge clk) begin
        if(reset)
            q = 4'b0000;
        else if (q == 4'b1111)
        	q <= 4'b0000;
        //just to make sure it manually resets although it warps automatically
        else
            q <= q + 1'b1;
    end
            
endmodule
