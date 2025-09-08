
// VL4 移位运算与乘法
`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant,
output reg [10:0]out
);
//*************code***********//
    // 1. 计数（0-1-2-3循环）
    reg [1:0] r_count;
    always @(posedge clk or negedge rst) begin
        if(!rst)
            r_count <= 2'b0;
        else
            r_count <= r_count + 1'b1;
    end

    // 2. FSM（不同state：输入*1/3/7/8）
    reg [7:0] r_d;
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            r_d <= 8'b0;
            input_grant <= 1'b0;
            out <= 11'b0;
        end
        else begin
            case (r_count)
                2'b00: begin    // 输入*1
                    r_d <= d;
                    out <= d;
                    input_grant <= 1'b1;
                end
                2'b01: begin    // 输入*3
                out <= {r_d, 1'b0} + r_d;
                    input_grant <= 1'b0;
                end
                2'b10: begin    // 输入*7
                    // out <= {r_d, 2'b0} + {r_d, 1'b0} + r_d;
                    out <= (r_d << 3) - r_d; // 这样也行，但注意移位符加括号（优先级低于加减）
                    input_grant <= 1'b0;
                end
                2'b11: begin    // 输入*8
                    out <= r_d << 3;
                    input_grant <= 1'b0;
                end
                default: begin
                    out <= d;
                    input_grant <= 1'b0;
                end
            endcase
        end
    end    

//*************code***********//
endmodule