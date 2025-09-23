`timescale 1ns / 1ps
module test_theory(
 input clk,
 input [7:0] ctrl,// 频率控制字
 output reg [3:0] thou_the,
 output reg [3:0] hund_the,
 output reg [3:0] ten_the,
 output reg [3:0] one_the
 );
    wire [13:0] fre_theory;
    assign fre_theory = ctrl * 10000 / 256; // f_the = K*f_clk/(2^N)

    always @(posedge clk) begin
        one_the <= fre_theory % 10;
        ten_the <= fre_theory / 10 % 10;
        hund_the <= fre_theory / 100 % 10;
        thou_the <= fre_theory / 1000;
    end

endmodule
