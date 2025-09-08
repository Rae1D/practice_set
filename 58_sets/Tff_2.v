
// VL2 异步复位的串联T触发器
// T触发器：输入为1取反，输入为0保持
`timescale 1ns/1ns
module Tff_2 (
input wire data, clk, rst,
output reg q  
);
//*************code***********//
    reg r_q1;

    always @(posedge clk or negedge rst) begin
        if(!rst)
            r_q1 <= 1'b0;
        else if (data)
            r_q1 <= ~r_q1;
        else
            r_q1 <= r_q1;
    end

    always @(posedge clk or negedge rst) begin
        if(!rst)
            q <= 1'b0;
        else if (r_q1)
            q <= ~q;
        else
            q <= q;
    end

//*************code***********//
endmodule


// 9.3
module Tff_2 (
input wire data, clk, rst,
output reg q  
);

    reg r_q;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            r_q <= 1'b0;
        else if (data)
            r_q <= ~r_q;
        else
            r_q <= r_q;
    end

    always @(posedge clk or negedge rst) begin
    if(!rst)
        q <= 1'b0;
    else if (r_q)
        q <= ~q;
    else
        q <= q;
    end


endmodule