
// 多bit跨时钟域处理（慢到快）
// 格雷码+同步：只适用于数值依次增大或减小的数据线或地址线
module gray_cdc (
    input i_clk_s,  // 慢时钟
    input [3:0] i_din,
    input i_clk_f,  // 快时钟
    output [3:0] o_dout
);
    // 1. 二进制到格雷码的转换（右移+异或）
    wire [3:0] w_din_gray;
    assign w_din_gray = (i_din >> 1) ^ i_din;

    // 2. 打两拍同步
    reg [3:0] r_din_gray_d0, r_din_gray_d1;
    always @(posedge i_clk_f) begin
        r_din_gray_d0 <= w_din_gray;
        r_din_gray_d1 <= r_din_gray_d0;
    end

    assign o_dout = r_din_gray_d1;

endmodule