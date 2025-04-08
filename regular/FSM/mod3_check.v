
// 模3检测器
// 检测串行输入序列，若能被3整除则输出1，否则输出0
module mod3_check (
    input clk,
    input rst_n,
    input din,
    output dout
);
    // 1. 定义状态机
    parameter IDLE = 4'b0001;
    parameter mod_0 = 4'b0010;
    parameter mod_1 = 4'b0100;
    parameter mod_2 = 4'b1000;

    // 2. 三段FSM
    // a. 状态转换（时序，控制当前状态）
    reg [3:0] r_cstate;
    reg [3:0] r_nstate;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            r_cstate <= IDLE;
        else
            r_cstate <= r_nstate;
    end

    // b. 状态转移（组合，根据当前状态和输入控制下个状态）
    always @(*) begin
        case (r_cstate)
            IDLE: r_nstate = din ? mod_1 : mod_0;
            mod_0: r_nstate = din ? mod_1 : mod_0;
            mod_1: r_nstate = din ? mod_0 : mod_2;
            mod_2: r_nstate = din ? mod_2 : mod_1; 
            default: r_nstate = IDLE;
        endcase
    end

    // c. 状态输出（时序，根据当前状态和输入控制输出，但会落后一个状态）
    /* 此方法可以，但不建议
    assign out = (r_cstate == mod_0) ? 1'b1 : 1'b0;
    */
    reg r_out;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            r_out <= 1'b0;
        else if (mod_0)
            r_out <= 1'b1;
        else
            r_out <= 1'b0;
    end
    assign out = r_out;

endmodule