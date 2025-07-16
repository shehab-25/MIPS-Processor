module decode_execute (clk , rst , CLR ,RD1_D , RD2_D , A1_D , A2_D , A3_D , sign_imm_outD , 
    RegWriteD , MemtoRegD,  MemWriteD , alu_controlD , alu_srcD , RegDstD,
    RegWriteE , MemtoRegE,  MemWriteE , alu_controlE , alu_srcE , RegDstE,
    RD1_E , RD2_E , RsE, RtE , RdE , sign_imm_outE);

    parameter DATA_WIDTH = 32;
    input clk , rst , CLR;
    input [DATA_WIDTH-1:0] RD1_D , RD2_D , sign_imm_outD ;
    input RegWriteD , MemtoRegD,  MemWriteD , alu_srcD , RegDstD;
    input [2:0] alu_controlD;
    input [4:0] A1_D , A2_D , A3_D;
    output reg RegWriteE , MemtoRegE,  MemWriteE , alu_srcE , RegDstE;
    output reg [2:0] alu_controlE;
    output reg [DATA_WIDTH-1:0] RD1_E , RD2_E , sign_imm_outE;
    output reg [4:0] RsE , RtE , RdE;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            RegWriteE <= 0;
            MemtoRegE <= 0;
            MemWriteE <= 0;
            alu_controlE <= 0;
            alu_srcE <= 0;
            RegDstE <= 0;
            RD1_E <= 0;
            RD2_E <= 0;
            sign_imm_outE <= 0;
            RsE <= 0;
            RtE <= 0;
            RdE <= 0;

        end
        else begin
            if (CLR) begin
                RegWriteE <= 0;
                MemtoRegE <= 0;
                MemWriteE <= 0;
                alu_controlE <= 0;
                alu_srcE <= 0;
                RegDstE <= 0;
                RD1_E <= 0;
                RD2_E <= 0;
                sign_imm_outE <= 0;
                RsE <= 0;
                RtE <= 0;
                RdE <= 0;
            end
            else begin
                RegWriteE <= RegWriteD;
                MemtoRegE <= MemtoRegD;
                MemWriteE <= MemWriteD;
                alu_controlE <= alu_controlD;
                alu_srcE <= alu_srcD;
                RegDstE <= RegDstD;
                RD1_E <= RD1_D;
                RD2_E <= RD2_D;
                sign_imm_outE <= sign_imm_outD;
                RsE <= A1_D;
                RtE <= A2_D;
                RdE <= A3_D;
            end
        end
    end
    
endmodule