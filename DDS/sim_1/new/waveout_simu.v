`timescale 1ns / 1ps
module waveout_simu;

reg clk;
reg [7:0] wave1_sin;
reg [7:0] wave1_squ;
reg [7:0] wave1_tri;
reg [7:0] wave1_saw;
reg [1:0] keys;
wire [7:0] wave_out;

waveout u0(
.clk(clk),
.wave1_sin(wave1_sin),
.wave1_squ(wave1_squ),
.wave1_tri(wave1_tri),
.wave1_saw(wave1_saw),
.keys(keys),
.wave_out(wave_out)
);

initial 
begin
clk<=1'b0;
keys<=2'b0;
wave1_sin<=8'd1;
wave1_squ<=8'd2;
wave1_tri<=8'd3;
wave1_saw<=8'd4;
end
always begin
#5 clk=1'b0;
#5 clk=1'b1;
end
always begin
#20 keys<=2'b00;
#20 keys<=2'b01;
#20 keys<=2'b10;
#20 keys<=2'b11;
end
endmodule
