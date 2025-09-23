`timescale 1ns / 1ps
module waveout(
 input clk,
 input [7:0] wave1_sin,// 输出正弦波形
 input [7:0] wave1_squ,// 输出方波波形
 input [7:0] wave1_tri,// 输出三角波波形
 input [7:0] wave1_saw,// 输出锯齿波形
 input [1:0] keys,// 开关按键
 output reg [7:0] wave_out
 );

    always @(posedge clk) begin
        case(keys)
            0: wave_out <= wave1_sin;
            1: wave_out <= wave1_squ;
            2: wave_out <= wave1_tri;
            3: wave_out <= wave1_saw;
            default: wave_out <= 8'd0;
        endcase
    end 

endmodule
