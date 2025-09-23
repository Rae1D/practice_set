`timescale 1ns / 1ps
module DDS_top_simu;
reg clk;
reg [7:0] ctrl;//频率控制字输入
reg [1:0] ctrl_wav;//开关控制波形
reg ctrl_dis;
reg [2:0] song_num;
reg auto_en;
wire [7:0] wave_out;//输出波形
wire [7:0] dis_dig;
wire [13:0] dis_num;
wire sd;
wire audio_out;
wire DAC_ILE;
wire DAC_CS;
wire DAC_WR1;
wire DAC_WR2;
wire DAC_XFER;
DDS_top u0(
.clk(clk),
//.rst(rst),
.ctrl(ctrl),//频率控制字输入
.ctrl_wav(ctrl_wav),//开关控制波形
.ctrl_dis(ctrl_dis),
.song_num(song_num),
.auto_en(auto_en),
.wave_out(wave_out),//输出波形
.dis_dig(dis_dig),
.dis_num(dis_num),
.sd(sd),
.audio_out(audio_out),
 //实际波形频率显示
.DAC_ILE(DAC_ILE),
.DAC_CS(DAC_CS),
.DAC_WR1(DAC_WR1),
.DAC_WR2(DAC_WR2),
.DAC_XFER(DAC_XFER)
);
initial begin
clk<=1'b0;
ctrl<=8'd3;
ctrl_wav<=2'd0;
ctrl_dis<=1'b0;
song_num<=3'b100;
auto_en<=1'b1;
//#20000000 ctrl_wav<=2'd1;
//#20000000 ctrl_wav<=2'd2;
//#20000000 ctrl_wav<=2'd3;
//#20000000 ctrl_wav<=2'd0;
//#20000000 ctrl<=8'd30;
//#20000000 ctrl<=8'd60;
//#20000000 ctrl<=8'd120;
//#20000000 ctrl<=8'd3;
end

always begin
#5 clk<=1'b0;
#5 clk<=1'b1;
end
endmodule
