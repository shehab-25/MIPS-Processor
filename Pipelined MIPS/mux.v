////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : MUX 
///////////////////////////////////////////////
module mux (in0,in1,sel,out);
    parameter DATA_WIDTH = 32;
    input sel;
    input [DATA_WIDTH-1:0] in0 , in1;
    output reg [DATA_WIDTH-1:0] out;

    always @(*) begin
        if (sel) begin
            out = in1;
        end
        else begin
            out = in0;
        end
    end
endmodule