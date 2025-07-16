module hazard_unit(rsD , rtD , rtE ,MemtoRegE , MemtoRegM , branchD , RegWriteE , write_regE , write_regM, jumpD,
    stallF , stallD , flushD , flushE);
    input [4:0] rsD , rtE , rtD , write_regE , write_regM;
    input MemtoRegE , MemtoRegM , branchD , RegWriteE , jumpD;
    output stallF , stallD , flushD ,flushE;
    reg lwstall , branch_stall;
    

    // lw stall
    always @(*) begin
        if (((rsD == rtE) || (rtD == rtE)) && MemtoRegE) begin
            lwstall = 1;
        end
        else begin
            lwstall = 0;
        end
    end

    // barnch stall
    always @(*) begin
        if (((branchD) && (RegWriteE) && ((write_regE == rsD) || (write_regE == rtD))) || ((branchD) && (MemtoRegM) && ((write_regM == rsD) || (write_regM == rtD)))) begin
            branch_stall = 1;
        end
        else begin
            branch_stall = 0;
        end
    end

    // the processor might stall due to either a load or a branch hazard
    assign stallF = lwstall || branch_stall;
    assign stallD = lwstall || branch_stall;
    assign flushD = jumpD;
    assign flushE = lwstall || branch_stall ||jumpD;
endmodule