
// 异步复位同步释放
module async_reset_sync_release (
    input i_sys_clk,
    input i_async_rst_n,
    output o_sync_rst_n
);
    reg r_sync_rst_n;
    reg r1_sync_rst_n;
    always @(posedge i_sys_clk or negedge i_async_rst_n) begin
        if (!i_async_rst_n) begin
            r_sync_rst_n <= 0;
            r1_sync_rst_n <= 0;
        end
        else begin
            r_sync_rst_n <= 1'b1;
            r1_sync_rst_n <= r_sync_rst_n;
        end
    end
    assign o_sync_rst_n = r1_sync_rst_n;

endmodule