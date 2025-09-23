`timescale 1ns / 1ps
module music_auto_display_simu;
reg clk_sel;//����ʱ��
reg en;//1Ϊʹ��
reg [2:0] songs_num;//����ѡ��
wire [4:0] tone;//��ֵ���
music_auto_display u0(
.clk_sel(clk_sel),
.en(en),
.songs_num(songs_num),
.tone(tone)
);
initial
begin
clk_sel<=1'b1;
en<=1'b1;
songs_num<=3'b100;
end
always begin
#10 clk_sel=1'b0;
#10 clk_sel=1'b1;
end
endmodule
