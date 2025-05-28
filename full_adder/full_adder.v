module full_adder (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [2:0]cout;
    
    assign sum[0] = x[0] ^ y[0];
    assign cout[0] = x[0] & y[0];
    
    assign sum[1] = x[1] ^ y[1] ^ cout[0];
    assign cout[1] = (x[1] & cout[0]) | (y[1] & cout[0]) | (x[1] & y[1]);
    
    assign sum[2] = x[2] ^ y[2] ^ cout[1];
    assign cout[2] = (x[2] & cout[1]) | (y[2] & cout[1]) | (x[2] & y[2]);
    
    assign sum[3] = x[3] ^ y[3] ^ cout[2];
    assign sum[4] = (x[3] & cout[2]) | (y[3] & cout[2]) | (x[3] & y[3]);

endmodule