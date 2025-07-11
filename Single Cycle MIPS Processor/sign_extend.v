////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : sign extender 
///////////////////////////////////////////////
module sign_extend (in,sign_imm);
    input [15:0] in;
    output [31:0] sign_imm;
    assign sign_imm = {{16{in[15]}},in[15:0]};
endmodule