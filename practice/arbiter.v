
// 优先仲裁器
module fixed_priority_arbiter (
    input [7:0] req,
    output [7:0] grant
);
    assign grant = req & (~(req-1));
    
endmodule


// 轮询仲裁器
module round_robin_arbiter (
    input clk;
    input rst_n;
    input [7:0] req,
    output [7:0] grant
);
    reg [7:0] arb_switch;   // 记录当前仲裁的请求者编号
    wire [15:0] double_req;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            arb_switch <= 8'b0000_0001;
        end
        else if (|req) begin
            arb_switch <= {grant[6:0], grant{7}};   // 每当有req，grant循环右移
        end
    end

    assign double_req = {req, req} & {~({req, req} - arb_switch)};  // 类似优先仲裁器（-1【arb_switch版】， ~， &）
    assign grant = double_req[15:8] | double_req[7:0];

endmodule