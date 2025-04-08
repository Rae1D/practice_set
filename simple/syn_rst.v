
// 同步复位
module syn_rst (
    input clk,
    input rst_n,
    input in,
    output reg out
);
    always @(posedge clk) begin
        if (!rst_n) begin   // 低有效，rst_n=0时复位
            out <= 1'b0;
        end
        else
            out <= in;
    end
endmodule