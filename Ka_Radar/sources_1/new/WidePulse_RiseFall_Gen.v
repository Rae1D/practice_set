`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/09 14:33:30
// Design Name: 
// Module Name: WidePulse_RiseFall_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module WidePulse_RiseFall_Gen(
input clk,

input wide_pulse_in,


output reg rise,
output reg fall
);

(* KEEP="TRUE" *)reg pulse_r1,pulse_r2,pulse_r3;

always@(posedge clk)
begin
	pulse_r1 <= wide_pulse_in;
	pulse_r2 <= pulse_r1;
	pulse_r3 <= pulse_r2;
	
	
	rise <= pulse_r2 && (~pulse_r3);
	fall <= (~pulse_r2) && pulse_r3;	
end

endmodule
