////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : shift left 2 
///////////////////////////////////////////////
module shift_left_2 (in,out_shifted);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH-1:0] in;
    output [DATA_WIDTH-1:0] out_shifted;

    assign out_shifted = in<<2;
endmodule