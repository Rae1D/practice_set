`timescale 1ns / 1ps
module FULL_Adder(
 input clk,// 10KHz 时钟信号
 input rstn,
 input [7:0] ctrl,// 频率控制字
 output [7:0] wave_sin,// 输出正弦波形
 output [7:0] wave_squ,// 输出方波波形
 output [7:0] wave_tri,// 输出三角波波形
 output [7:0] wave_saw// 输出锯齿波波形
 );
    reg [7:0] addr;// ROM地址，即累加和

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            addr <= 8'b0;
        end
        else begin
            addr <= addr + ctrl;
        end
    end

    wire [7:0] addra;
    assign addra = addr[7:0];

    // 输出四种波形
    sin_rom sin (
    .clka(clk), // input wire clka
    .addra(addra), // input wire [7 : 0] addra
    .douta(wave_sin) // output wire [7 : 0] douta
    );

    squ_rom square (
    .clka(clk), // input wire clka
    .addra(addra), // input wire [7 : 0] addra
    .douta(wave_squ) // output wire [7 : 0] douta
    );

    tri_rom triangle (
    .clka(clk), // input wire clka
    .addra(addra), // input wire [7 : 0] addra
    .douta(wave_tri) // output wire [7 : 0] douta
    );

    saw_rom sawtooth(
    .clka(clk), // input wire clka
    .addra(addra), // input wire [7 : 0] addra
    .douta(wave_saw) // output wire [7 : 0] douta
    );

endmodule
