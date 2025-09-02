
// VL25 输入序列连续的序列检测
// 解法1：状态机
`timescale 1ns/1ns
module sequence_detect(
	input clk,
	input rst_n,
	input a,
	output reg match
	);

    parameter IDLE = 9'b0_0000_0001;
    parameter S1 = 9'b0_0000_0010;
    parameter S2 = 9'b0_0000_0100;
    parameter S3 = 9'b0_0000_1000;
    parameter S4 = 9'b0_0001_0000;
    parameter S5 = 9'b0_0010_0000;
    parameter S6 = 9'b0_0100_0000;
    parameter S7 = 9'b0_1000_0000;
    parameter S8 = 9'b1_0000_0000;

    reg [8:0] cstate;
    reg [8:0] nstate;

    // 1. step one
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cstate <= IDLE; // 是IDLE状态！不是9'b0！
        else
            cstate <= nstate;
    end

    // 2. step two
    always @(*) begin
        case (cstate)
            IDLE: nstate = a ? IDLE : S1;
            S1: nstate = a ? S2 : S1;
            S2: nstate = a ? S3 : S1;
            S3: nstate = a ? S4 : S1;
            S4: nstate = a ? IDLE : S5;
            S5: nstate = a ? S2 : S6;
            S6: nstate = a ? S2 : S7;
            S7: nstate = a ? S8 : S1;
            S8: nstate = a ? S3 : S1;
            default: nstate = IDLE;
        endcase
    end

    // 3. step three
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            match <= 1'b0;
        else
            match <= (cstate == S8);
    end

endmodule

// 解法2：移位寄存器
module sequence_detect(
    input clk,
    input rst_n,
    input a,
    output reg match
    );
 
    reg [7:0] a_tem;    // 定义移位寄存器
     
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            begin 
                match <= 1'b0;
            end
        else if (a_tem == 8'b0111_0001)
            begin
                match <= 1'b1;
            end
        else 
            begin  
                match <= 1'b0;
            end
         
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            begin 
                a_tem <= 8'b1;
            end
        else 
            begin
                a_tem <= {a_tem[6:0],a};
            end
endmodule