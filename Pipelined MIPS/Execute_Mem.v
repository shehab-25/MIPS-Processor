module Execute_Mem (clk , rst , RegWriteE , MemtoRegE,  MemWriteE , alu_resultE , write_dataE, write_regE,
    RegWriteM , MemtoRegM,  MemWriteM , alu_resultM , write_dataM , write_regM);

    parameter DATA_WIDTH = 32;
    input clk , rst , RegWriteE , MemtoRegE,  MemWriteE;
    input [DATA_WIDTH-1:0] alu_resultE , write_dataE;
    input [4:0] write_regE;
    output reg RegWriteM , MemtoRegM, MemWriteM;
    output reg [DATA_WIDTH-1:0] alu_resultM , write_dataM;
    output reg [4:0] write_regM;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            RegWriteM <= 0;
            MemtoRegM <= 0;
            MemWriteM <= 0;
            alu_resultM <= 0;
            write_dataM <= 0;
            write_regM <= 0;
        end
        else begin
            RegWriteM <= RegWriteE;
            MemtoRegM <= MemtoRegE;
            MemWriteM <= MemWriteE;
            alu_resultM <= alu_resultE;
            write_dataM <= write_dataE;
            write_regM <= write_regE;
        end
    end
endmodule