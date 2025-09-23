`timescale 1ns / 1ps
module signal_maker(
 input clk,
 input rstn,
 output reg [7:0] cos_s,
 output reg signed [7:0] cos_c
 );
    parameter freq_s=10'd512;// 调制信号频率 5kHz
    parameter freq_c=14'd10240;// 载波频率 100kHz
    parameter cnt_width = 8'd16;

    reg [cnt_width:0] cnt_s=0;
    reg [cnt_width-1:0] cnt_c=0;

    wire [9:0] addr_s;
    wire [9:0] addr_c;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnt_s<=0;
            cnt_c<=0;
        end
        else begin
            cnt_s <= cnt_s + freq_s;
            cnt_c <= cnt_c + freq_c;
        end
    end

    assign addr_s = cnt_s[cnt_width-1:cnt_width-10];
    assign addr_c = cnt_c[cnt_width-1:cnt_width-10];
    
    wire signed [7:0] cos_s_r;
    wire signed [7:0] cos_c_r;

    cos_rom cr_0 (
    .clka(clk), // input wire clka
    .addra(addr_s), // input wire [9 : 0] addra
    .douta(cos_s_r), // output wire [7 : 0] douta
    .clkb(clk), // input wire clkb
    .addrb(addr_c), // input wire [9 : 0] addrb
    .doutb(cos_c_r) // output wire [7 : 0] doutb
    );

endmodule