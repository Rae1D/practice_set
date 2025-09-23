module loop_num_simu;
    reg clk;
    wire [7:0] p; 
    wire [13:0] q;
    
    loop_num uo(
    .clk(clk),
    .p(p),
    .q(q)
    );
    
    parameter period_clk=2;
    
    always
    begin
        clk=1'b0;
        #(period_clk/2) clk=1'b1;
        #(period_clk/2);
    end

endmodule
