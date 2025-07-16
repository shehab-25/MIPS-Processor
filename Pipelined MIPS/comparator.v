module comparator #(parameter DATA_WIDTH = 32) (in1 , in2 , EqualD);
    input [DATA_WIDTH-1:0] in1 , in2;
    output reg EqualD;

    always @(*) begin
        if (in1 == in2) begin
            EqualD = 1;
        end
        else begin
            EqualD = 0;
        end
    end
endmodule