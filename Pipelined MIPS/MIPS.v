////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : MIPS Top wrapper module instantiating all blocks 
///////////////////////////////////////////////

module mips #(parameter DATA_WIDTH = 32) (
    input clk,
    input rst,
    output [DATA_WIDTH-1:0] instructionF
    );
    wire [4:0] write_regE , write_regM , write_regW;
    wire [4:0] RsD , RtD , RdD , RsE , RtE , RdE; 
    wire [DATA_WIDTH-1:0] pc , pc_branchD , pc_plus4F , pc_F , instruction_D , pc_plus4_D , PCSrcD_muxout;
    wire [DATA_WIDTH-1:0] write_dataE , write_dataM;
    wire [DATA_WIDTH-1:0] sign_imm_outD;
    wire [DATA_WIDTH-1:0] sign_imm_shiftedD;
    wire [DATA_WIDTH-1:0] RD2_D , RD1_D , RD1_E , RD2_E , RD1_D_muxout , RD2_D_muxout , SrcAE , forwardBE_muxout , SrcBE , RD_M , RD_W , sign_imm_outE;
    wire [DATA_WIDTH-1:0] alu_resultE , alu_resultM , alu_resultW , resultW;
    wire RegWriteD , MemtoRegD, MemWriteD , branchD , alu_srcD , RegDstD , jumpD;
    wire [2:0] alu_controlD , alu_controlE;
    wire [27:0] jump_address;

    wire RegWriteE , MemtoRegE,  MemWriteE , alu_srcE , RegDstE;
    wire RegWriteM, MemtoRegM,  MemWriteM , branchM , PCSrcD; 
    wire RegWriteW , MemtoRegW;
    wire stallF , stallD  , flushD , flushE, forwardAD , forwardBD ,EqualD;
    wire [1:0] forwardAE , forwardBE;

    assign write_dataE = forwardBE_muxout;
    assign PCSrcD = branchD & EqualD ; 
    assign RsD = instruction_D[25:21];
    assign RtD = instruction_D[20:16];
    assign RdD = instruction_D[15:11];

    mux pc_mux(pc_plus4F , pc_branchD , PCSrcD , PCSrcD_muxout);

    shift_left_jump jump_shift(instruction_D[25:0],jump_address);

    mux jump_mux (PCSrcD_muxout , {pc_plus4F[31:28],jump_address} , jumpD , pc);

    PC pc_inst(clk , rst , stallF ,  pc , pc_F);

    adder pc_add_4 (pc_F , 4 , pc_plus4F);

    instruction_memory inst_mem(pc_F,instructionF);

    fetch_decode F_D(clk , rst , stallD , PCSrcD , flushD , instructionF , pc_plus4F , instruction_D , pc_plus4_D);

    sign_extend sign_extend_inst(instruction_D[15:0] , sign_imm_outD);

    shift_left_2 shift_left2_inst(sign_imm_outD,sign_imm_shiftedD);

    adder pc_branch_adder (sign_imm_shiftedD , pc_plus4_D , pc_branchD);

    register_file reg_file (clk , rst , instruction_D[25:21] , instruction_D[20:16] , write_regW , RegWriteW , resultW , RD1_D , RD2_D);

    mux ForwardAD_mux (RD1_D , alu_resultM , forwardAD , RD1_D_muxout);

    mux ForwardBD_mux (RD2_D , alu_resultM , forwardBD , RD2_D_muxout);

    comparator comparator_inst (RD1_D_muxout , RD2_D_muxout , EqualD);

    control_unit controller(instruction_D[31:26],instruction_D[5:0],MemtoRegD,MemWriteD,branchD,alu_controlD,alu_srcD,RegDstD,RegWriteD,jumpD);

    decode_execute Dec_Ex(clk , rst , flushE ,RD1_D , RD2_D , RsD , RtD, RdD , sign_imm_outD, 
    RegWriteD , MemtoRegD,  MemWriteD , alu_controlD , alu_srcD , RegDstD,
    RegWriteE , MemtoRegE,  MemWriteE , alu_controlE , alu_srcE , RegDstE,
    RD1_E , RD2_E , RsE , RtE , RdE , sign_imm_outE);

    mux #(.DATA_WIDTH(5)) Reg_Dst_mux(RtE , RdE , RegDstE , write_regE);

    mux3_1 ForwardAE_mux (RD1_E , resultW , alu_resultM , forwardAE , SrcAE);

    mux3_1 ForwardBE_mux (RD2_E , resultW , alu_resultM , forwardBE , forwardBE_muxout);

    mux alu_src_mux(forwardBE_muxout , sign_imm_outE , alu_srcE , SrcBE);
    
    ALU ALU_inst(SrcAE,SrcBE,alu_controlE,alu_resultE);

    Execute_Mem EX_MEM(clk , rst , RegWriteE , MemtoRegE,  MemWriteE , alu_resultE , write_dataE, write_regE,
    RegWriteM , MemtoRegM,  MemWriteM , alu_resultM , write_dataM , write_regM);

    data_memory data_mem(clk , rst , MemWriteM , write_dataM , alu_resultM , RD_M);

    Memory_Writeback MEM_WB(clk , rst , RegWriteM , MemtoRegM , alu_resultM , RD_M , write_regM,
    RegWriteW , MemtoRegW , alu_resultW , RD_W , write_regW);

    mux MemtoReg_mux(alu_resultW , RD_W , MemtoRegW , resultW);

    forward_unit forwarding_unit(RsD , RtD, RsE , RtE , write_regM , RegWriteM , write_regW , RegWriteW , 
    forwardAE , forwardBE , forwardAD , forwardBD);

    hazard_unit hazard_inst(RsD , RtD , RtE ,MemtoRegE , MemtoRegM , branchD , RegWriteE , write_regE , write_regM, jumpD,
    stallF , stallD , flushD , flushE);
    
endmodule