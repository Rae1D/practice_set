`timescale 1ns / 1ps
module AM_outs_simu;
reg clk;
wire [7:0] AM_wave;
wire DAC_ILE;
wire DAC_CS;
wire DAC_WR1;
wire DAC_WR2;
wire DAC_XFER;
AM_outs u0(
.clk(clk),
.AM_wave(AM_wave),
.DAC_ILE(DAC_ILE),
.DAC_CS(DAC_CS),
.DAC_WR1(DAC_WR1),
.DAC_WR2(DAC_WR2),
.DAC_XFER(DAC_XFER)
);
initial begin
clk<=1'b0;
end
always begin
#5 clk<=1'b0;
#5 clk<=1'b1;
end
endmodule
