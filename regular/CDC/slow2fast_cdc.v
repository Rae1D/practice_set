
// 单bit跨时钟域处理（慢到快）
module slow2fast_cdc (
    input i_clk_s,  // 慢时钟
    input i_pulse_s,
    input i_clk_f,  // 快时钟
    output i_pulse_f
);
    // 1. 定义2个D触发器（打两拍）
    reg r_pulse_s_d0, r_pulse_s_d1;

    // 2. 在快时钟域下对慢时钟信号进行打两拍操作
    always @(posedge i_clk_f) begin
        r_pulse_s_d0 <= i_pulse_s;
        r_pulse_s_d1 <= r_pulse_s_d0;
    end

    assign i_pulse_f = r_pulse_s_d1;

    
endmodule