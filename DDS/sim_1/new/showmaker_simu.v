`timescale 1ns / 1ps
module showmaker_simu;
reg clk;//时钟信号
reg [3:0] thou_the;
reg [3:0] hund_the;
reg [3:0] ten_the;
reg [3:0] one_the;
reg [3:0] thou_real;
reg [3:0] hund_real;
reg [3:0] ten_real;
reg [3:0] one_real;
wire [3:0] dis_the4;//理论值显示位
wire [3:0] dis_real4; //实际值显示位
wire [13:0] dis_all;
showmaker u0(
.clk(clk), //时钟信号
.thou_the(thou_the),
.hund_the(hund_the),
.ten_the(ten_the),
.one_the(one_the),
.thou_real(thou_real),
.hund_real(hund_real),
.ten_real(ten_real),
.one_real(one_real),
.dis_the4(dis_the4),//理论值显示
.dis_real4(dis_real4), //实际值显示
.dis_all(dis_all)
);
initial
begin
clk<=1'b1;
 thou_the<=4'd6;
 hund_the<=4'd5;
 ten_the<=4'd4;
 one_the<=4'd3;
 thou_real<=4'd7;
 hund_real<=4'd8;
 ten_real<=4'd9;
 one_real<=4'd1;
end
always begin
#10 clk=1'b0;
#10 clk=1'b1;
end
endmodule
