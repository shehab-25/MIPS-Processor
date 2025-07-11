###################################
# Do file to automate simulation of the Design in Questasim
###################################

vlib work
vlog adder.v ALU.v control_unit.v data_memory.v instruction_memory.v MIPS.v mux.v PC.v MIPS_tb.v register_file.v shift_left_2.v shift_left_jump.v sign_extend.v
vsim -voptargs=+acc work.MIPS_tb
add wave *

add wave /MIPS_tb/DUT/pc_reg
add wave /MIPS_tb/DUT/pc_plus4
add wave /MIPS_tb/DUT/pc_branch
add wave /MIPS_tb/DUT/jump_address
add wave /MIPS_tb/DUT/RegWrite
add wave /MIPS_tb/DUT/MemWrite
add wave /MIPS_tb/DUT/RegDst_sel
add wave /MIPS_tb/DUT/alu_src_sel
add wave /MIPS_tb/DUT/MemtoReg_sel
add wave /MIPS_tb/DUT/PCSrc_sel
add wave /MIPS_tb/DUT/jump
add wave /MIPS_tb/DUT/alu_control
add wave /MIPS_tb/DUT/zero_flag
add wave /MIPS_tb/DUT/RD1
add wave /MIPS_tb/DUT/RD2
add wave /MIPS_tb/DUT/SrcB
add wave /MIPS_tb/DUT/write_data
add wave /MIPS_tb/DUT/RD
add wave /MIPS_tb/DUT/alu_result
add wave /MIPS_tb/DUT/result
add wave /MIPS_tb/DUT/reg_file_inst/A1
add wave /MIPS_tb/DUT/reg_file_inst/A2
add wave /MIPS_tb/DUT/reg_file_inst/A3
add wave /MIPS_tb/DUT/sign_imm_out
add wave /MIPS_tb/DUT/sign_imm_shifted
add wave /MIPS_tb/DUT/reg_file_inst/reg_file
add wave /MIPS_tb/DUT/data_mem/data_mem
add wave /MIPS_tb/DUT/inst_mem/inst_mem
run -all
#quit -sim