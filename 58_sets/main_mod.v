
// VL9 使用子模块实现三输入数的大小比较
`timescale 1ns/1ns
module main_mod(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	
	output [7:0]d
);

    wire [7:0] r_d1, r_d2;
    // 1. 例化child模块*2
    child_mod u_child_mod1(
	.clk(clk),
	.rst_n(rst_n),
	.a(a),
	.b(b),
	.d(r_d1)
    );

    child_mod u_child_mod2(
	.clk(clk),
	.rst_n(rst_n),
	.a(a),
	.b(c),
	.d(r_d2)
    );

    child_mod u_child_mod3(
	.clk(clk),
	.rst_n(rst_n),
	.a(r_d1),
	.b(r_d2),
	.d(d)
    );    


endmodule



module child_mod(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,
	
	output [7:0]d
);
    reg [7:0] r_d;
    // 完成两输入的大小比较
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            r_d <= 8'b0;
        else if (a > b)
            r_d <= b;
        else
            r_d <= a;
    end   

    assign d = r_d;  

endmodule