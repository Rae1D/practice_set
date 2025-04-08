
// VL7 求两个数的差值
`timescale 1ns/1ns
module data_minus(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,

	output  reg [8:0]c
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            c <= 9'b0;
        else if (a > b)
            c <= a - b;
        else
            c <= b - a;
    end    

endmodule