
// 单bit跨时钟域处理（快到慢）
// 脉冲展宽+同步
module fast2slow_cdc_v1 (
    input i_clk_f,  // 快时钟
    input i_pulse_f,
    input i_clk_s,  // 慢时钟
    output o_pulse_s
);
    // 1. 定义寄存器（用于信号展宽）
    reg r_pulse_f_d0, r_pulse_f_d1; // 寄存器数量取决于快时钟和慢时钟周期（e.g. 35ns -> 100ns 需要展宽3倍，即打两拍）

    // 2. 在快时钟域下进行打两拍操作
    always @(posedge i_clk_f) begin
        r_pulse_f_d0 <= i_pulse_f;
        r_pulse_f_d1 <= r_pulse_f_d0;
    end

    // // 更好的办法：
    // reg [2:0] r_pulse;  // 只需改变[2:0]即可改变展宽倍数
    // always @(posedge i_clk_f) begin
    //     r_pulse <= {r_pulse[1:0], i_pulse_f};    // 这里也改一下
    // end

    // 3. 拼接信号（完成信号展宽）
    wire w_pulse;
    assign w_pulse = i_pulse_f | r_pulse_f_d0 | r_pulse_f_d1;
    // assign w_pulse = |r_pulse;  // r_pulse[0] | r_pulse[1] | r_pulse[2]

    // 4. 打两拍同步（下面与“慢到快”的方法一致）
    reg r_pulse_d0, r_pulse_d1;
    always @(posedge i_clk_s) begin
        r_pulse_d0 <= w_pulse;
        r_pulse_d1 <= r_pulse_d0;
    end    
    assign o_pulse_s = r_pulse_d1;

endmodule