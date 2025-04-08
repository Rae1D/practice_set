
// VL5 位拆分与运算
`timescale 1ns/1ns

module data_cal(
input clk,
input rst,
input [15:0]d,
input [1:0]sel,

output [4:0]out,
output validout
);
//*************code***********//
    reg [15:0] r_d;
    reg [4:0] r_out;
    reg r_validout;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            r_d <= 16'b0;
            r_out <= 5'b0;
            r_validout <= 1'b0;
        end
        else begin
            case (sel)
                2'b00: begin
                    r_d <= d;
                    r_out <= 5'b0;
                    r_validout <= 1'b0;                    
                end
                2'b01: begin
                    r_out <= r_d[3:0] + r_d[7:4];
                    r_validout <= 1'b1;                    
                end
                2'b10: begin
                    r_out <= r_d[3:0] + r_d[11:8];
                    r_validout <= 1'b1;                    
                end
                2'b11: begin
                    r_out <= r_d[3:0] + r_d[15:12];
                    r_validout <= 1'b1;                    
                end
                default: begin
                    r_out <= 5'b0;
                    r_validout <= 1'b0;                    
                end 
            endcase
        end
    end

    assign out = r_out;
    assign validout = r_validout;

//*************code***********//
endmodule