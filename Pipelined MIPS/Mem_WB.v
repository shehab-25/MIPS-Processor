module Memory_Writeback (clk , rst , RegWriteM , MemtoRegM , alu_resultM , read_dataM , write_regM,
    RegWriteW , MemtoRegW , alu_resultW , read_dataW , write_regW);

    parameter DATA_WIDTH = 32;
    input clk , rst , RegWriteM , MemtoRegM;
    input [DATA_WIDTH-1:0] alu_resultM , read_dataM;
    input [4:0] write_regM;
    output reg RegWriteW , MemtoRegW;
    output reg [DATA_WIDTH-1:0] alu_resultW , read_dataW;
    output reg [4:0] write_regW;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            RegWriteW <= 0;
            MemtoRegW <= 0;
            alu_resultW <= 0;
            read_dataW <= 0;
            write_regW <= 0;
        end
        else begin
            RegWriteW <= RegWriteM;
            MemtoRegW <= MemtoRegM;
            alu_resultW <= alu_resultM;
            read_dataW <= read_dataM;
            write_regW <= write_regM;
        end
    end
endmodule