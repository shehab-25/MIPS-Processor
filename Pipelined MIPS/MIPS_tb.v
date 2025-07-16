////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : testbench simulation
///////////////////////////////////////////////
module MIPS_tb ();
    // signal declaration
    parameter DATA_WIDTH = 32;
    reg clk;
    reg rst;
    wire [DATA_WIDTH-1:0] instructionF;

    // module instance
    mips #(DATA_WIDTH) DUT(clk , rst , instructionF);

    // clock generation
    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    // stimulus generation
    initial begin
        rst = 1 ; //initilalize design
        repeat(3)
            @(negedge clk);
        rst = 0;
        repeat(3)
            @(negedge clk);
        rst = 1;  // test reset (pc should point to the 1st instruction again)
        repeat(3)
            @(negedge clk);
        rst = 0;
        repeat(80)
            @(negedge clk);
        $stop;
    end
endmodule