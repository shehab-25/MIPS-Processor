////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : Data memory 
///////////////////////////////////////////////
module data_memory (clk,rst,WE,WD,A,RD);
    parameter MEM_WIDTH = 32;
    parameter MEM_DEPTH = 1024;
    parameter MEM_ADDRESS = 32;
    input clk,rst,WE;
    input [MEM_WIDTH-1:0] A,WD;
    output reg [MEM_WIDTH-1:0] RD;

    reg [MEM_WIDTH-1:0] data_mem [MEM_DEPTH-1:0];

    // write to the memory (sequential logic)
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < MEM_DEPTH; i=i+1) 
		    begin
			    data_mem[i]<=0;
		    end
        end
        else if (WE) begin
            data_mem[A] <= WD;
        end
    end

    // read from the memory (combinational logic)
    always @(*) begin
        RD = data_mem[A];
    end
endmodule