
// VL10 使用函数实现数据大小端转换
// 注意function语法
`timescale 1ns/1ns
module function_mod(
	input [3:0]a,
	input [3:0]b,
	
	output [3:0]c,
	output [3:0]d
);

    assign c = begin_end(a);
    assign d = begin_end(b);

    function [3:0] begin_end;
        input [3:0] data_in;
        begin
            begin_end[3] = data_in[0];
            begin_end[2] = data_in[1];
            begin_end[1] = data_in[2];
            begin_end[0] = data_in[3];
        end
        
    endfunction

endmodule