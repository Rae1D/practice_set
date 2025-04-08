
// 三分频电路(低功耗版)
module div3_v2 (
    input i_clk,
    input i_rst_n,
    output o_clk_div3
);
    // 1. 定义计数器（0-1-2循环）
    reg [1:0] r_cnt;
    always @(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n)
            o_clk_div3 <= 'd0;
        else
            r_cnt <= (rst_n == 'd2) ? 'd0 : rst_n + 'd1;
    end

    // 2. 定义clkp和clkq
    reg r_clkp, r_clkq;
    // a. clkp（检测上升沿，当cnt为2时取反）
    always @(posedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n)
            r_clkp <= 'd0;
        else if (r_cnt == 'd2)
            r_clkp <= ~r_clkp;
    end    
    // b. clkq（检测下降沿，当cnt为1时取反）
    always @(negedge i_clk or negedge i_rst_n) begin
        if(!i_rst_n)
            r_clkq <= 'd0;
        else if (r_cnt == 'd1)
            r_clkq <= ~r_clkq;
    end 

    // 3. 对clkp、clkq进行同或操作
    assign o_clk_div3 = r_clkp ~^ r_clkq;

endmodule