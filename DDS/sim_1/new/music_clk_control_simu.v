`timescale 1ns / 1ps
module music_clk_control_simu;
reg sys_clk;//100MHZ
reg [2:0] sel;//¸èÇúÑ¡Ôñ
//  output reg clk_100,//¾ØÕó¼üÅÌÊ±ÖÓ100Hz·ÖÆµ
wire clk_select;

music_clk_control u0(
.sys_clk(sys_clk),
.sel(sel),
.clk_select(clk_select)
);
initial
begin
sys_clk<=1'b1;
sel<=3'b100;
end
always begin
#10 sys_clk=1'b0;
#10 sys_clk=1'b1;
end
endmodule