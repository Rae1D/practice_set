
// 多bit跨时钟域处理
// 握手信号（data_receiver部分）
module data_receiver (
    // 时钟域B
    input i_clk_b,
    input i_rst_n,
    // 时钟域A发送
    input i_data_req,
    input [3:0] i_data,
    //输出至时钟域A
    output reg o_data_ack
);
    // 1. 对req信号进行同步处理+上升沿检测
    reg r_data_req_d0, r_data_req_d1;
    always @(posedge i_clk_b or negedge i_rst_n) begin
        if(!i_rst_n) begin
            r_data_req_d0 <= 'd0;
            r_data_req_d1 <= 'd0;
        end
        else begin
            r_data_req_d0 <= i_data_req;
            r_data_req_d1 <= r_data_req_d0;        
        end
    end

    wire w_pos_data_req;
    assign w_pos_data_req = r_data_req_d0 && !r_data_req_d1;    // 上升沿检测

    // 2. 检测到req信号后，输出ack
    always @(posedge i_clk_b or negedge i_rst_n) begin
        if(!i_rst_n)
            o_data_ack <= 1'b0;
        else if (r_data_req_d1)
            o_data_ack <= 1'b1;
        else
            o_data_ack <= 1'b0;
    end   

    // 3. 检测到req信号后，保存接收数据
    reg [3:0] r_data_reg;
    always @(posedge i_clk_b or negedge i_rst_n) begin
        if(!i_rst_n)
            r_data_reg <= 'd0;
        else if (w_pos_data_req) // 在ack有效后，发送数据
            r_data_reg <= i_data;
        else
            r_data_reg <= r_data_reg;
    end    

endmodule