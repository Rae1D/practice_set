`timescale 1ns / 1ps
module DIV_simu;
reg clk;
reg rstn;
wire clk_div_1;
wire clk_div_2;

DIV u0(
.clk(clk),
.rstn(rstn),
.clk_div_1(clk_div_1),
.clk_div_2(clk_div_2)
);

initial begin
    clk = 1'b0;
    rstn = 1'b0;
    #2 rstn = 1'b1;
end

parameter period_clk = 4'd10;

always begin
    #(period_clk/2)
    clk <= ~clk;
end
endmodule