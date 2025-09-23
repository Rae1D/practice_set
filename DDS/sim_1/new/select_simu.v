`timescale 1ns / 1ps
module select_simu;
reg clk;  //10k
reg ctrl_dis;
reg [3:0] dis_the4;//理论值显示位
reg [3:0] dis_real4;//实际值显示位
reg [13:0] dis_all;
reg [7:0] p; //4+4
reg [13:0] q;
wire [7:0] dis_dig;
wire [13:0] dis_num;
select u0(
.clk(clk),
.ctrl_dis(ctrl_dis),
.dis_the4(dis_the4),
.dis_real4(dis_real4),
.dis_all(dis_all),
.p(p),
.q(q),
.dis_dig(dis_dig),
.dis_num(dis_num)
);
initial begin
ctrl_dis<=1'd1;
dis_the4<=4'b1000;
dis_real4<=4'b1000;
dis_all<=13'b0110000_0110000;
p<=8'b0100_0000;
q<=14'b0110000_0110000;
end
always begin
#20 clk=1'b0;
#20 clk=1'b1;
#10000 ctrl_dis<=~ctrl_dis;
end
endmodule
