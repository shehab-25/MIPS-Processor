////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : MIPS Top wrapper module instantiating all blocks 
///////////////////////////////////////////////

module mips #(parameter DATA_WIDTH = 32) (
    input clk,
    input rst,
    output [DATA_WIDTH-1:0] instruction
    );
    wire [4:0] write_reg;
    wire [27:0] jump_address;
    wire [DATA_WIDTH-1:0] pc , pc_branch , pc_plus4 , pc_reg;
    wire [DATA_WIDTH-1:0] pc_mux_out;
    wire [DATA_WIDTH-1:0] write_data;
    wire [DATA_WIDTH-1:0] sign_imm_out;
    wire [DATA_WIDTH-1:0] sign_imm_shifted;
    wire [DATA_WIDTH-1:0] RD2 ,RD1,SrcB , RD;
    wire [DATA_WIDTH-1:0] read_data_mem , alu_result , result;
    wire RegWrite , MemWrite , RegDst_sel , alu_src_sel , MemtoReg_sel , PCSrc_sel , jump , zero_flag;
    wire [2:0] alu_control;

    mux pc_mux(pc_plus4,pc_branch,PCSrc_sel,pc_mux_out);

    mux jump_mux (pc_mux_out,{pc_plus4[31:28],jump_address},jump,pc);

    PC pc_inst (clk,rst,pc,pc_reg);

    adder pc_add_4(pc_reg,4,pc_plus4);

    sign_extend sign_ex(instruction[15:0],sign_imm_out);

    shift_left_2 shift_left_inst(sign_imm_out,sign_imm_shifted);

    shift_left_jump shift_left_jump_inst (instruction[25:0],jump_address);

    adder pc_branch_adder(sign_imm_shifted,pc_plus4,pc_branch);

    mux #(.DATA_WIDTH(5)) RegDst_mux(instruction[20:16],instruction[15:11],RegDst_sel,write_reg);

    register_file reg_file_inst(clk,rst,instruction[25:21],instruction[20:16],write_reg,RegWrite,result,RD1,RD2);

    mux alusrc_mux(RD2,sign_imm_out,alu_src_sel,SrcB);

    ALU alu_inst(RD1,SrcB,alu_control,alu_result,zero_flag);

    instruction_memory inst_mem(pc_reg,instruction);

    data_memory data_mem(clk,rst,MemWrite,write_data,alu_result,read_data_mem);

    mux MemtoReg_mux(alu_result,read_data_mem,MemtoReg_sel,result);

    control_unit controller(instruction[31:26],instruction[5:0],zero_flag,MemtoReg_sel,MemWrite,PCSrc_sel,alu_control,alu_src_sel,RegDst_sel,RegWrite,jump);

    assign write_data = RD2;
    assign RD = read_data_mem;
    
endmodule