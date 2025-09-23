`timescale 1ns / 1ps
module FULL_Adder_simu;
reg clk;
reg rstn;
reg [7:0] ctrl;
wire [7:0] wave_sin;
wire [7:0] wave_squ;
wire [7:0] wave_tri;
wire [7:0] wave_saw;

FULL_Adder u0(
.clk(clk),
.rstn(rstn),
.ctrl(ctrl),
.wave_sin(wave_sin),
.wave_squ(wave_squ),
.wave_tri(wave_tri),
.wave_saw(wave_saw)
);

initial begin
    rstn = 0;
    ctrl = 8'd4;
    #5 rstn = 1;
end

always begin
    #20 clk = 1'b0;
    #20 clk = 1'b1;
end

endmodule

