`timescale 1ns / 1ps
module test_fre_real_simu;
reg clk;
reg clk_half;
reg [7:0] wave_out;
//reg [7:0] DAC_sin;
//reg [7:0] DAC_squ;
//reg [7:0] DAC_tri;
//reg [7:0] DAC_saw;
wire [3:0] fre_rea_thou;
wire [3:0] fre_rea_hund;
wire [3:0] fre_rea_ten;
wire [3:0] fre_rea_one;
test_fre_real u0(
.clk(clk),
.clk_half(clk_half),
.wave_out(wave_out),
//.DAC_sin(DAC_sin),
//.DAC_squ(DAC_squ),
//.DAC_tri(DAC_tri),
//.DAC_saw(DAC_saw),
.fre_rea_thou(fre_rea_thou),
.fre_rea_hund(fre_rea_hund),
.fre_rea_ten(fre_rea_ten),
.fre_rea_one(fre_rea_one)
);
initial begin
wave_out<=8'd0;
clk_half=1'b1;
end
always begin
#10 clk=1'b0;
#10 clk=1'b1;
end
always begin
#5000 clk_half=1'b0;    //Ä£Äâ0.5Hz
#5000 clk_half=1'b1;
end
always begin
#20 wave_out<=8'd200;    //´óÓÚ127
#20 wave_out<=8'd1;
end
endmodule
