module PingPong(
    input clk,
    input rst_n,
    input [7:0] in,
    output reg [7:0] out
);

    reg [7:0] buf1;
    reg [7:0] buf2;
    reg sel;

    always @(posedge clk or negedge rst) begin
        if (!rst_n) begin
            buf1 <= 'b0;
            buf2 <= 'b0;
            sel <= 'b0;
        end
        else begin
            if(sel) begin
                buf1 <= in;
            end
            else begin
                buf2 <= in;
            end
            sel <= ~sel;
        end
        
    end

    always @(*) begin
        if (sel) begin
            out = buf2 + 1; // 实现所需组合逻辑
        end
        else begin
            out = buf1 + 1;
        end
    end


endmodule