
// 多bit跨时钟域处理
// 握手信号（data_driver部分）
module data_driver (
    // 时钟域A
    input i_clk_a,
    input i_rst_n,
    // 时钟域B返回
    input i_data_ack,
    //输出至时钟域B
    output reg [3:0] o_data,
    output reg o_data_req
);
    // 1. 对ack信号进行同步处理+上升沿检测
    reg r_data_ack_d0, r_data_ack_d1;
    always @(posedge i_clk_a or negedge i_rst_n) begin
        if(!i_rst_n) begin
            r_data_ack_d0 <= 'd0;
            r_data_ack_d1 <= 'd0;
        end
        else begin
            r_data_ack_d0 <= i_data_ack;
            r_data_ack_d1 <= r_data_ack_d0;        
        end
    end

    wire w_pos_data_ack;
    assign w_pos_data_ack = r_data_ack_d0 && !r_data_ack_d1;    // 上升沿检测

    // 2. 在ack有效后,计数器计数5个时钟,然后发送req
    reg [2:0] r_cnt;
    // a. 在ack有效后,计数器从零开始计数
    always @(posedge i_clk_a or negedge i_rst_n) begin
        if(!i_rst_n)
            r_cnt <= 'd0;
        else if (w_pos_data_ack)
            r_cnt <= 'd0;
        else if (o_data_req)
            r_cnt <= r_cnt;
        else
            r_cnt <= r_cnt + 1'b1;
    end

    // b. 计数5个时钟,发送req
    always @(posedge i_clk_a or negedge i_rst_n) begin
        if(!i_rst_n)
            o_data_req <= 1'b0;
        else if (r_cnt == 3'b4) // 计数5个时钟
            o_data_req <= 1'b1;
        else if (w_pos_data_ack)    // 在ack有效后拉低
            o_data_req <= 1'b0;
        else
            o_data_req <= o_data_req;
    end    

    // 3. 在ack有效后,发送数据（数据依次加1）
    always @(posedge i_clk_a or negedge i_rst_n) begin
        if(!i_rst_n)
            o_data <= 'd0;
        else if (w_pos_data_ack) // 在ack有效后，发送数据
            o_data <= o_data + 1'b1;
        else
            o_data <= o_data;
    end    

endmodule