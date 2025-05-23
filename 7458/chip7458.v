module chip7458 (
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

    wire oneOne;
    wire oneTwo;
    wire twoOne;
    wire twoTwo;
    
    assign oneOne = p1a & p1b & p1c;
    assign oneTwo = p1d & p1e & p1f;
    assign p1y = oneOne | oneTwo;
    
    assign twoOne = p2a & p2b;
    assign twoTwo = p2c & p2d;
    assign p2y = twoOne | twoTwo;

endmodule
