`timescale 1ns / 1ps
module test_fre_real(
 (*DONT_TOUCH="1"*)input clk,
 (*DONT_TOUCH="1"*)input clk_half, //0.5Hz
 input rstn,
 input [7:0] wave_out,
 output reg [3:0] fre_rea_thou,
 output reg [3:0] fre_rea_hund,
 output reg [3:0] fre_rea_ten,
 output reg [3:0] fre_rea_one
 );
    reg [15:0] count;

    reg [13:0] q;
    reg [15:0] coun1;

    // 计数1秒内突变点个数
    always@(posedge wave_out[7] or negedge rstn) begin
        if (!rstn) begin
            count <= 0;
            coun1 <= 0;
            q <= 0;
        end
        else if (clk_half) begin
            count <= count + 1;
            coun1 <= count;
        end
        else begin
            q <= coun1;
            count <= 0;
        end
        end
    
    // 每秒更新
    always @(negedge clk_half) begin
        fre_rea_one <= q % 10;
        fre_rea_ten <= q / 10 % 10;
        fre_rea_hund <= q / 100 % 10;
        fre_rea_thou <= q / 1000;
    end

endmodule