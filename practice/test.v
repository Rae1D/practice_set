`timescale 1ns/1ns

module pwm_top(
    input               clk         ,   //模块时钟信号
    input               resetn      ,   //模块复位信号
    input       [8:0]   duty        ,   //时钟占空比
    input       [1:0]   freq_sel    ,   //PWM时钟频率选择信号
    output              pwm_out     ,   //PWM输出信号
    output              config_done ,   //duty、freq_sel真正生效的脉冲指示信号
    output  reg         duty_error      //duty配置错误的脉冲标志位
);

parameter IDLE = 3'b000;
parameter S00 = 3'b001;
parameter S01 = 3'b010;
parameter S10 = 3'b011;
parameter S11 = 3'b100;

reg [2:0] cstate;
reg [9:0] cnt;

always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
        pwm_out <= 'b0;
        config_done <= 'b0;
        duty_error <= 'b0;
    end
    else begin
        case (freq_sel)
            2'b00: begin
                if (cnt == 499) begin
                    pwm_out <= 'b0;
                    cnt <= 'b0;
                else if (cnt==0)
                config_done <=1;    
                end else if (cnt == duty - 1) begin
                    pwm_out <= 'b0;
                    cnt <= 'b0;
                end else begin
                    pwm_out <= 'b1;
                    cnt <= cnt + 1;
                end
            end
            2'b01: begin
                if (cnt == duty - 1) begin
                    pwm_out <= 'b0;
                    cnt <= 'b0;
                end else begin
                    pwm_out <= 'b1;
                    cnt <= cnt + 1;
                end
            end
            2'b10: begin
                if (cnt == duty - 1) begin
                    pwm_out <= 'b0;
                    cnt <= 'b0;
                end else begin
                    pwm_out <= 'b1;
                    cnt <= cnt + 1;
                end
            end
            2'b11: begin
                if (cnt == duty - 1) begin
                    pwm_out <= 'b0;
                    cnt <= 'b0;
                end else begin
                    pwm_out <= 'b1;
                    cnt <= cnt + 1;
                end
            end
            default: 
        endcase
    end
end


endmodule