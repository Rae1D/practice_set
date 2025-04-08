
// 异步复位
module asyn_rst (
    input clk,
    input rst_n,
    input in,
    output reg out
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out <= 1'b0;
        end
        else
            out <= in;
    end
endmodule