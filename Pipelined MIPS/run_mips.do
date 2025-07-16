###################################
# Do file to automate simulation of the Design in Questasim
###################################

vlib work
vlog *.v
vsim -voptargs=+acc work.MIPS_tb
add wave *

# fetch stage
add wave /MIPS_tb/DUT/pc_F
add wave /MIPS_tb/DUT/pc_plus4F
add wave /MIPS_tb/DUT/jump_address
add wave /MIPS_tb/DUT/stallF
add wave /MIPS_tb/DUT/hazard_inst/lwstall
add wave /MIPS_tb/DUT/hazard_inst/branch_stall

# decode stage
add wave /MIPS_tb/DUT/instruction_D
add wave /MIPS_tb/DUT/pc_plus4_D
add wave /MIPS_tb/DUT/pc_branchD
add wave /MIPS_tb/DUT/flushD
add wave /MIPS_tb/DUT/RegWriteD
add wave /MIPS_tb/DUT/MemtoRegD
add wave /MIPS_tb/DUT/MemWriteD
add wave /MIPS_tb/DUT/branchD
add wave /MIPS_tb/DUT/alu_srcD
add wave /MIPS_tb/DUT/RegDstD
add wave /MIPS_tb/DUT/alu_controlD
add wave /MIPS_tb/DUT/jumpD
add wave /MIPS_tb/DUT/PCSrcD
add wave /MIPS_tb/DUT/stallD
add wave /MIPS_tb/DUT/forwardAD
add wave /MIPS_tb/DUT/forwardBD
add wave /MIPS_tb/DUT/EqualD
add wave /MIPS_tb/DUT/sign_imm_outD
add wave /MIPS_tb/DUT/sign_imm_shiftedD
add wave /MIPS_tb/DUT/RsD
add wave /MIPS_tb/DUT/RtD
add wave /MIPS_tb/DUT/RdD

#execute stage
add wave /MIPS_tb/DUT/RegWriteE
add wave /MIPS_tb/DUT/MemtoRegE
add wave /MIPS_tb/DUT/MemWriteE
add wave /MIPS_tb/DUT/alu_srcE
add wave /MIPS_tb/DUT/RegDstE
add wave /MIPS_tb/DUT/SrcAE
add wave /MIPS_tb/DUT/SrcBE
add wave /MIPS_tb/DUT/alu_resultE
add wave /MIPS_tb/DUT/alu_controlE
add wave /MIPS_tb/DUT/flushE
add wave /MIPS_tb/DUT/forwardAE
add wave /MIPS_tb/DUT/forwardBE
add wave /MIPS_tb/DUT/write_dataE
add wave /MIPS_tb/DUT/write_regE
add wave /MIPS_tb/DUT/RD1_E
add wave /MIPS_tb/DUT/RD2_E
add wave /MIPS_tb/DUT/RsE
add wave /MIPS_tb/DUT/RtE
add wave /MIPS_tb/DUT/RdE
add wave /MIPS_tb/DUT/sign_imm_outE

# Memory stage
add wave /MIPS_tb/DUT/RegWriteM
add wave /MIPS_tb/DUT/MemtoRegM
add wave /MIPS_tb/DUT/MemWriteM
add wave /MIPS_tb/DUT/alu_resultM
add wave /MIPS_tb/DUT/write_regM
add wave /MIPS_tb/DUT/write_dataM
add wave /MIPS_tb/DUT/RD_M

# Write_back stage
add wave /MIPS_tb/DUT/RegWriteW
add wave /MIPS_tb/DUT/MemtoRegW
add wave /MIPS_tb/DUT/alu_resultW
add wave /MIPS_tb/DUT/resultW
add wave /MIPS_tb/DUT/write_regW
add wave /MIPS_tb/DUT/RD_W

# memories
add wave /MIPS_tb/DUT/reg_file/reg_file
add wave /MIPS_tb/DUT/data_mem/data_mem
add wave /MIPS_tb/DUT/inst_mem/inst_mem
run -all
#quit -sim