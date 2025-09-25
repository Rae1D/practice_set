`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 12:25:40
// Design Name: 
// Module Name: add_16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// 相加即可
module add_24(
input clk,
input [31:0]data_in1,
input [31:0]data_in2,
input [31:0]data_in3,
input [31:0]data_in4,
input [31:0]data_in5,
input [31:0]data_in6,
input [31:0]data_in7,
input [31:0]data_in8,
input [31:0]data_in9,
input [31:0]data_in10,
input [31:0]data_in11,
input [31:0]data_in12,
input [31:0]data_in13,
input [31:0]data_in14,
input [31:0]data_in15,
input [31:0]data_in16,
input [31:0]data_in17,
input [31:0]data_in18,
input [31:0]data_in19,
input [31:0]data_in20,
input [31:0]data_in21,
input [31:0]data_in22,
input [31:0]data_in23,
input [31:0]data_in24,
input in_valid,

output out_valid,
output [36:0] data_add_out

    );

/////////��λ����//////////////
    wire [36:0] in_1_I;
    wire [36:0] in_2_I;
    wire [36:0] in_3_I;
    wire [36:0] in_4_I;
    wire [36:0] in_5_I;
    wire [36:0] in_6_I;
    wire [36:0] in_7_I;
    wire [36:0] in_8_I;
    wire [36:0] in_9_I;
    wire [36:0] in_10_I;
    wire [36:0] in_11_I;
    wire [36:0] in_12_I;
    wire [36:0] in_13_I;
    wire [36:0] in_14_I; 
    wire [36:0] in_15_I;
    wire [36:0] in_16_I; 
    wire [36:0] in_17_I;
    wire [36:0] in_18_I;
    wire [36:0] in_19_I;
    wire [36:0] in_20_I;
    wire [36:0] in_21_I;
    wire [36:0] in_22_I; 
    wire [36:0] in_23_I;
    wire [36:0] in_24_I; 
    
// 符号位扩展
assign in_1_I = {data_in1[31],data_in1[31],data_in1[31],data_in1[31],data_in1[31],data_in1[31:0]};
assign in_2_I = {data_in2[31],data_in2[31],data_in2[31],data_in2[31],data_in2[31],data_in2[31:0]};
assign in_3_I = {data_in3[31],data_in3[31],data_in3[31],data_in3[31],data_in3[31],data_in3[31:0]};
assign in_4_I = {data_in4[31],data_in4[31],data_in4[31],data_in4[31],data_in4[31],data_in4[31:0]};
assign in_5_I = {data_in5[31],data_in5[31],data_in5[31],data_in5[31],data_in5[31],data_in5[31:0]};
assign in_6_I = {data_in6[31],data_in6[31],data_in6[31],data_in6[31],data_in6[31],data_in6[31:0]};
assign in_7_I = {data_in7[31],data_in7[31],data_in7[31],data_in7[31],data_in7[31],data_in7[31:0]};
assign in_8_I = {data_in8[31],data_in8[31],data_in8[31],data_in8[31],data_in8[31],data_in8[31:0]};
assign in_9_I = {data_in9[31],data_in9[31],data_in9[31],data_in9[31],data_in9[31],data_in9[31:0]};
assign in_10_I = {data_in10[31],data_in10[31],data_in10[31],data_in10[31],data_in10[31],data_in10[31:0]};
assign in_11_I = {data_in11[31],data_in11[31],data_in11[31],data_in11[31],data_in11[31],data_in11[31:0]};
assign in_12_I = {data_in12[31],data_in12[31],data_in12[31],data_in12[31],data_in12[31],data_in12[31:0]};
assign in_13_I = {data_in13[31],data_in13[31],data_in13[31],data_in13[31],data_in13[31],data_in13[31:0]};
assign in_14_I = {data_in14[31],data_in14[31],data_in14[31],data_in14[31],data_in14[31],data_in14[31:0]};        
assign in_15_I = {data_in15[31],data_in15[31],data_in15[31],data_in15[31],data_in15[31],data_in15[31:0]};        
assign in_16_I = {data_in16[31],data_in16[31],data_in16[31],data_in16[31],data_in16[31],data_in16[31:0]};        
assign in_17_I = {data_in17[31],data_in17[31],data_in17[31],data_in17[31],data_in17[31],data_in17[31:0]};
assign in_18_I = {data_in18[31],data_in18[31],data_in18[31],data_in18[31],data_in18[31],data_in18[31:0]};
assign in_19_I = {data_in19[31],data_in19[31],data_in19[31],data_in19[31],data_in19[31],data_in19[31:0]};
assign in_20_I = {data_in20[31],data_in20[31],data_in20[31],data_in20[31],data_in20[31],data_in20[31:0]};
assign in_21_I = {data_in21[31],data_in21[31],data_in21[31],data_in21[31],data_in21[31],data_in21[31:0]};
assign in_22_I = {data_in22[31],data_in22[31],data_in22[31],data_in22[31],data_in22[31],data_in22[31:0]};        
assign in_23_I = {data_in23[31],data_in23[31],data_in23[31],data_in23[31],data_in23[31],data_in23[31:0]};        
assign in_24_I = {data_in24[31],data_in24[31],data_in24[31],data_in24[31],data_in24[31],data_in24[31:0]};      
reg [36:0]data_add_out_t;
reg data_valid_t;
always@(posedge clk)
begin
    if(in_valid)
    begin
    data_add_out_t <= (in_1_I+in_2_I)+(in_3_I+in_4_I)+(in_5_I+in_6_I)+(in_7_I+in_8_I)+(in_9_I+in_10_I)+(in_11_I+in_12_I)+(in_13_I+in_14_I)+(in_15_I+in_16_I)+(in_17_I+in_18_I)+(in_19_I+in_20_I)+(in_21_I+in_22_I)+(in_23_I+in_24_I);
    end
    data_valid_t <= in_valid;
end 

assign data_add_out = data_add_out_t;
assign out_valid = data_valid_t;
    
endmodule
