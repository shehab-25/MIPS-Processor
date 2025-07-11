////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : Register file 
///////////////////////////////////////////////

module register_file (clk,rst,A1,A2,A3,WE3,WD3,RD1,RD2);
    parameter DATA_WIDTH = 32;
    parameter DEPTH = 32;
    input clk,rst,WE3;
    input [4:0] A1,A2,A3;
    input [DATA_WIDTH-1:0] WD3;
    output reg [DATA_WIDTH-1:0] RD1,RD2;
    reg [DATA_WIDTH-1:0] reg_file [DEPTH-1:0];

    // read form the register file 
    always @(*) begin
        if (A1 == 0) begin // as register of number zero is read only register and it contains zeros only
            RD1 = 0;
        end
        else begin
            RD1 = reg_file[A1];
        end

        if (A2 == 0) begin
            RD2 = 0;
        end
        else begin
            RD2 = reg_file[A2];
        end
    end

    integer i;
    // write to the register file
    always @(posedge clk or posedge rst) begin  // Asynchronous active high reset
        if (rst) begin
            for (i = 0 ;i<DEPTH ;i=i+1 ) begin
            reg_file[i] <= 0;
            end
        end
        else if (WE3) begin
            if (A3 == 0) begin
                reg_file[A3] <= 0;  // as writing in $zero register is not allowed
            end
            else begin
                reg_file[A3] <= WD3;
            end
        end
        
    end
endmodule