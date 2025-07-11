////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : Adder 
///////////////////////////////////////////////
module adder (a,b,c);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH-1:0] a,b;
    output [DATA_WIDTH-1:0] c;

    assign c = a + b;
endmodule