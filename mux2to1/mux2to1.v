module mux2to1( 
    input a, b, sel,
    output out );
    
    wire and1;
    wire and2;
    
    assign and1 = sel & b;
    assign and2 = ~sel & a;
    assign out = and1 | and2;

endmodule