module fetch_decode (clk , rst , enable , CLR , flushD ,instructionF , pc_plus4F , instruction_D , pc_plus4_D);
    parameter DATA_WIDTH = 32;
    input clk , rst , enable , CLR , flushD;
    input [DATA_WIDTH-1:0] instructionF , pc_plus4F;
    output reg [DATA_WIDTH-1:0] instruction_D , pc_plus4_D;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instruction_D <= 0;
            pc_plus4_D <= 0;
        end
        else begin
            if (CLR || flushD) begin
                instruction_D <= 0;
                pc_plus4_D <= 0;
            end

            else if(enable == 0) begin
                instruction_D <= instructionF ;
                pc_plus4_D <= pc_plus4F;
            end
        end
    end
    
endmodule