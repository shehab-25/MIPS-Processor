////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : PC (Program Counter) which points to the next instruction
///////////////////////////////////////////////
module PC (clk,rst,enable,pc_in,pc_out);
    parameter DATA_WIDTH = 32;
    input clk , rst , enable;
    input [DATA_WIDTH-1:0] pc_in ;
    output reg [DATA_WIDTH-1:0] pc_out;

    always @(posedge clk , posedge rst) begin  // Asynchronous active high reset
        if (rst) begin
            pc_out <= 0;
        end
        else if (enable == 0) begin
            pc_out <= pc_in;
        end
    end
endmodule