
// VL21 根据状态转移表实现时序电路
// 一般为三段式
`timescale 1ns/1ns

module seq_circuit(
      input                A   ,
      input                clk ,
      input                rst_n,
 
      output   wire        Y   
);
    // 1. 定义状态机（现状态和下个状态）
    reg [1:0] curr_state;
    reg [1:0] next_state;

    // 2. 三段式
    // a. step one：将下个状态变成当前状态
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            curr_state <= 2'b00;
            next_state <= 2'b00;
        end
        else begin
            curr_state <= next_state;
        end
    end

    // b. step two：根据当前状态和输入决定下个状态
    always @(*) begin
        case (curr_state)
            2'b00: next_state = (A == 1'b0) ? 2'b01 : 2'b11;
            2'b01: next_state = (A == 1'b0) ? 2'b10 : 2'b00;
            2'b10: next_state = (A == 1'b0) ? 2'b11 : 2'b01;
            2'b11: next_state = (A == 1'b0) ? 2'b10 : 2'b00;
            default: next_state = 2'b00;
        endcase
    end

    // c. step three：根据当前状态（和输入）决定输出
    assign Y = (curr_state == 2'b11) ? 1'b1 : 1'b0;

endmodule