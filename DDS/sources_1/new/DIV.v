`timescale 1ns / 1ps
module DIV(
 input clk, // 100MHz 时钟输入
 input rstn,
 output reg clk_div_1, // 10kHz 信号输出
 output reg clk_div_2 // 0.5Hz 信号输出
 );
    parameter div_1=13'd4999;
    parameter div_2=27'd9999_9999;

    // parameter div_1 = 13'd5000;
    // parameter div_2 = 27'd1_0000_0000;
    reg [15:0] cnt1;  // 分频计数
    reg [31:0] cnt2;

    initial begin
        clk_div_1 <= 0;
        clk_div_2 <= 0;
    end

    // 10kHz 信号输出
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnt1 <= 0;
            clk_div_1 <= 0;
        end
        else if (cnt1 == div_1) begin
            cnt1 <= 0;
            clk_div_1 <= ~clk_div_1;
        end 
        else begin
            cnt1 <= cnt1 + 1'b1;
        end
    end

    // 0.5Hz 信号输出
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnt2 <= 0;
            clk_div_2 <= 0;
        end
        else if (cnt2 == div_2) begin
            cnt2 <= 0;
            clk_div_2 <= ~clk_div_2;
        end 
        else begin
            cnt2 <= cnt2 + 1'b1;
        end
    end

endmodule