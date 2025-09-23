`timescale 1ns / 1ps
module test_theory_simu;
reg [7:0] ctrl;
reg clk;
wire [3:0] thou_the;
wire [3:0] hund_the;
wire [3:0] ten_the;
wire [3:0] one_the;
test_theory u0(
.clk(clk),
.ctrl(ctrl),
.thou_the(thou_the),
.hund_the(hund_the),
.ten_the(ten_the),
.one_the(one_the)
);
initial
begin
ctrl<=8'd37;
end
always begin
#10 clk=1'b0;
#10 clk=1'b1;
end
endmodule