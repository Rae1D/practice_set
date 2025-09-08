
// VL3 奇偶校验
// 奇偶检测：奇检测：如果输入为奇数个1则结果为1（检测通过）；偶检测：如果输入为偶数个1则结果为1（检测通过）
`timescale 1ns/1ns
module odd_sel(
input [31:0] bus,
input sel,
output check
);
//*************code***********//
    wire w_num_1;
    assign w_num_1 = ^bus; // 输出为奇数个1则为1

    assign check = sel ? w_num_1 : ~w_num_1;    // sel选择奇偶检测模式

//*************code***********//
endmodule


// 9.3
module odd_sel(
input [31:0] bus,
input sel,
output check
);

    wire w_num_1;
    assign w_num_1 = ^bus; // 输出为奇数个1则为1

    assign check = sel ? w_num_1 : ~w_num_1;



endmodule