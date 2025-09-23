`timescale 1ns / 1ps
module DDS_top(
 input clk,
 input rst,
 input [7:0] ctrl,// FCW
 input [1:0] ctrl_wav,// 开关控制波形
 input ctrl_dis,
 input [2:0] song_num,
 input auto_en,
 input SD,
 output [7:0] wave_out,// 输出波形
 output [7:0] dis_dig,
 output  [13:0] dis_num,
 output sd,
 output audio_out,
 // 实际波形频率显示
 output DAC_ILE,
 output DAC_CS,
 output DAC_WR1,
 output DAC_WR2,
 output DAC_XFER
 );
    wire clk_div_1; //10kHz
    wire clk_div_2; //0.5kHz
    wire [7:0] wave_sin;
    wire [7:0] wave_squ;
    wire [7:0] wave_tri;
    wire [7:0] wave_saw;
    wire [7:0] wave1_sin;// 输出正弦波形
    wire [7:0] wave1_squ;// 输出方波波形
    wire [7:0] wave1_tri;// 输出三角波波形
    wire [7:0] wave1_saw;// 输出锯齿波形

    // 理论输入到最终显示模块
    wire [3:0] thou_the;
    wire [3:0] hund_the;
    wire [3:0] ten_the;
    wire [3:0] one_the;

    // 实际输入到最终显示模块
    wire [3:0] fre_rea_thou;
    wire [3:0] fre_rea_hund;
    wire [3:0] fre_rea_ten;
    wire [3:0] fre_rea_one;
    wire [3:0] dis_the4;
    wire [3:0] dis_real4;
    wire [13:0] dis_all;
    wire [7:0] p;
    wire [13:0] q;
    wire clk_select;
    wire [4:0] tone;

    assign DAC_ILE=1;
    assign DAC_CS=0;
    assign DAC_WR1=0;
    assign DAC_WR2=0;
    assign DAC_XFER=0;

    DIV div0(
    .clk(clk),
    .rst(rst),
    .clk_div_1(clk_div_1),
    .clk_div_2(clk_div_2)
    );

    FULL_Adder add1(
    .clk(clk_div_1),
    .ctrl(ctrl),
    .rst(rst),
    .wave_sin(wave_sin),
    .wave_squ(wave_squ),
    .wave_tri(wave_tri),
    .wave_saw(wave_saw)
    );
    
    test_theory the0(
    .clk(clk),
    .ctrl(ctrl),
    .thou_the(thou_the),
    .hund_the(hund_the),
    .ten_the(ten_the),
    .one_the(one_the)
    );

    waveout out0(
    .clk(clk),
    .wave1_sin(wave_sin),
    .wave1_squ(wave_squ),
    .wave1_tri(wave_tri),
    .wave1_saw(wave_saw),
    .keys(ctrl_wav),
    .wave_out(wave_out)
    );

    test_fre_real t1(
    .clk(clk),
    .clk_half(clk_div_2),
    .rst(rst),
    .wave_out(wave_out),
    .fre_rea_thou(fre_rea_thou),
    .fre_rea_hund(fre_rea_hund),
    .fre_rea_ten(fre_rea_ten),
    .fre_rea_one(fre_rea_one)
    );

    showmaker d0(
    .clk(clk),
    .rst(rst),
    .thou_the(thou_the),
    .hund_the(hund_the),
    .ten_the(ten_the),
    .one_the(one_the),
    .thou_real(fre_rea_thou),
    .hund_real(fre_rea_hund),
    .ten_real(fre_rea_ten),
    .one_real(fre_rea_one),
    .dis_the4(dis_the4),
    .dis_real4(dis_real4),
    .dis_all(dis_all)
    );

    loop_num l0(
    .clk(clk),
    .p(p),
    .q(q)
    );

    select s0(
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

    music_clk_control m1(
    .sys_clk(clk),
    .sel(song_num),
    .clk_select(clk_select)
    );

    music_auto_display m2(
    .clk_sel(clk_select),
    .en(auto_en),
    .songs_num(song_num),
    .tone(tone)
    );

    music_audio_port m3(
    .clk(clk),
    .SD(SD),
    .tone(tone),
    .sd(sd), 
    .audio_out(audio_out)
    );

endmodule