////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : Control Unit 
///////////////////////////////////////////////

module control_unit (op,funct,zero_flag,MemtoReg,MemWrite,PCSrc,alu_control,alusrc,RegDst,RegWrite,jump);
    input [5:0] op , funct;
    input zero_flag;
    output reg MemtoReg , MemWrite , PCSrc , alusrc , RegDst , RegWrite , jump;
    output reg [2:0] alu_control;
    reg branch;
    reg [1:0] alu_op;


    // branching case 
    always @(*) begin
        PCSrc = branch & zero_flag;    
    end


    // main decoder (take decision on opcode only)
   always @(*) begin
        case (op)
            6'b100011: begin  // lw instruction
                RegWrite = 1;
                alusrc = 1;
                MemtoReg = 1;
                RegDst = 0;
                branch = 0;
                MemWrite = 0;
                jump = 0;
                alu_op = 2'b00;  // we make addition (base address + offset) in the lw instruction
            end 

            6'b101011: begin  // sw instruction
                RegWrite = 0;
                RegDst = 0;
                alusrc = 1;
                MemWrite = 1;
                branch = 0;
                MemtoReg = 0;
                jump = 0;
                alu_op = 2'b00;  // we make addition (base address + offset) in the sw instruction
            end 

            6'b000100: begin  // beq instruction
                RegWrite = 0;
                RegDst = 0;
                alusrc = 0;
                branch = 1;
                MemtoReg = 0;
                MemWrite = 0;
                jump = 0;
                alu_op = 2'b01;  // we make subtraction in the beq instruction
            end 

            6'b001000: begin  // addi instruction
                RegDst = 0;
                RegWrite = 1;
                alusrc = 1;
                branch = 0;
                MemtoReg = 0;
                MemWrite = 0;
                jump = 0;
                alu_op = 2'b00;  
            end 

            6'b000000: begin  // R-type instruction (add , sub , and , or , slt)
                RegWrite = 1;
                RegDst = 1;
                alusrc = 0;
                branch = 0;
                MemtoReg = 0;
                MemWrite = 0;
                jump = 0;
                alu_op = 2'b10;  // look at funct field
            end 

            6'b000010: begin  // jump instruction
                RegWrite = 0;
                alusrc = 0;
                MemtoReg = 0;
                RegDst = 0;
                branch = 0;
                MemWrite = 0;
                jump = 1;
                alu_op = 2'b00;
            end 

            default: begin
                RegWrite =0;
                RegDst = 0;
                alusrc = 0;
                branch = 0;
                MemtoReg = 0;
                MemWrite = 0;
                jump = 0;
                alu_op = 2'b00;
            end
        endcase
    end

    // ALU decoder (take decision on funct field)
    always @(*) begin
        casex (alu_op)
            2'b00: alu_control = 010; //add
            2'b01: alu_control = 110; //subtract

            2'b1x: case (funct)
                    6'b100000: alu_control = 010; //add
                    6'b100010: alu_control = 110; //subtract
                    6'b100100: alu_control = 000; //AND
                    6'b100101: alu_control = 001; //OR
                    6'b101010: alu_control = 111; //slt
                default: alu_control = 010; //add
            endcase
            default: alu_control = 010; //add
        endcase
    end


endmodule