////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : shift_left 
///////////////////////////////////////////////
module shift_left_jump (in,out_shifted);
    input [25:0] in;
    output [27:0] out_shifted;

    assign out_shifted = {in,2'b00};
endmodule