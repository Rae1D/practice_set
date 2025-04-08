
// VL1 四选一多路器
// 注意case语法，不要忘记加default
`timescale 1ns/1ns
module mux4_1(
    input [1:0]d1,d2,d3,d0,
    input [1:0]sel,
    output[1:0]mux_out
);
//*************code***********//
    reg [1:0] r_mux_out;
    always @(*) begin
        case(sel)
            2'b00: r_mux_out = d3;
            2'b01: r_mux_out = d2;
            2'b10: r_mux_out = d1;
            2'b11: r_mux_out = d0;
            default: r_mux_out = d0;
        endcase
    end

    assign mux_out = r_mux_out;
//*************code***********//
endmodule