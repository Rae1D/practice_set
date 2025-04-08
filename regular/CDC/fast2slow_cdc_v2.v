
// 单bit跨时钟域处理（快到慢）
// 脉冲电平检测+双触发器同步+边沿检测
module fast2slow_cdc_v1 (
    input i_clk_f,  // 快时钟
    input i_pulse_f,
    input i_clk_s,  // 慢时钟
    output o_pulse_s
);
    // 1. 定义标志寄存器（用于脉冲电平检测）
    reg r_toggle = 0;
    always @(posedge i_clk_f) begin
        if (i_pulse_f)
            r_toggle <= ~r_toggle;  // 检测到输入信号为高，toggle翻转
        else
            r_toggle <= r_toggle;
    end

    // 2. 打三拍（前两拍用于同步，后两拍用于边沿检测）
    reg r_toggle_d0, r_toggle_d1, r_toggle_d2;
    always @(posedge i_clk_s) begin
        r_toggle_d0 <= r_toggle;
        r_toggle_d1 <= r_toggle_d0;
        r_toggle_d2 <= r_toggle_d1;
    end

    // 3. 将后两拍的值进行异或操作（即边沿检测）
    assign o_pulse_s = r_toggle_d2 ^ r_toggle_d1;

endmodule