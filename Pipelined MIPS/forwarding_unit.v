module forward_unit(rsD , rtD, rsE , rtE , write_regM , RegWriteM , write_regW , RegWriteW , 
forwardAE , forwardBE , forwardAD , forwardBD);
    input [4:0] rsD , rtD, rsE , rtE , write_regM , write_regW;
    input RegWriteM , RegWriteW ;
    output reg [1:0] forwardAE , forwardBE;
    output reg forwardAD , forwardBD;
    
    // Execute Satge
    // srcA forwarding
    always @(*) begin
        if ((rsE != 0) && (rsE == write_regM) && (RegWriteM)) begin
            forwardAE = 2'b10;
        end
        else if ((rsE != 0) && (rsE == write_regW) && (RegWriteW)) begin
            forwardAE = 2'b01;
        end
        else begin
            forwardAE = 2'b00;
        end
    end

    // srcB forwarding
    always @(*) begin
        if ((rtE != 0) && (rtE == write_regM) && (RegWriteM)) begin
            forwardBE = 2'b10;
        end
        else if ((rtE != 0) && (rtE == write_regW) && (RegWriteW)) begin
            forwardBE = 2'b01;
        end
        else begin
            forwardBE = 2'b00;
        end
    end

    // Decode Satge
    // srcA forwarding
    always @(*) begin
        if ((rsD != 0) && (rsD == write_regM) && (RegWriteM)) begin
            forwardAD = 1'b1;
        end
        else begin
            forwardAD = 1'b0;
        end
    end

    // srcB forwarding
    always @(*) begin
        if ((rtD != 0) && (rtD == write_regM) && (RegWriteM)) begin
            forwardBD = 1'b1;
        end
        else begin
            forwardBD = 1'b0;
        end
    end
endmodule