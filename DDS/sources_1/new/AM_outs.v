`timescale 1ns / 1ps
module AM_outs(
 input clk,
 input rstn,
 output reg [7:0] AM_wave
 );
    wire signed [15:0] AM_mod;
    wire [7:0] cos_s;
    wire signed [7:0] cos_c;

    signal_maker s0(
    .clk(clk),
    .rstn(rstn),
    .cos_s(cos_s),
    .cos_c(cos_c)
    );

    mult mult_0 (
    .CLK(clk), // input wire CLK
    .A(cos_s), // input wire [7 : 0] A
    .B(cos_c), // input wire [7 : 0] B
    .P(AM_mod) // output wire [15 : 0] P
    );

    always @(posedge clk) begin
        AM_wave <= AM_mod[15:8] + 8'd127;
    end

endmodule
