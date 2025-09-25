`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/13 11:20:07
// Design Name: 
// Module Name: dbf_q
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


module dbf_q(
    input clk,
    input [15:0] dataI,  
    input [15:0] dataQ,
    input data_in_valid,
    input [15:0] A,           //  加权系数增益 ,满量程表示增益最大，增益为1
    input [15:0] ph_image,  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    input [15:0] ph_real, 
    input  phase_data_valid,  
    
    output[31:0] data_outI,
    output[31:0] data_outQ,
    output data_out_valid

);

wire [32:0]data_outI_temp;  //乘法溢出，多一位
wire [32:0]data_outQ_temp;

wire [15:0]ph_image_1;
wire [15:0]ph_real_1;
 assign ph_image_1 = ph_image;
 assign ph_real_1 =ph_real;
// assign phase_data_1_1 = (phase_data_1) ^ 16'hFFFF;

 
       dbf_cell dbf_cell_1(
       .clk(clk),
       .dataI(dataI),  
       .dataQ(dataQ),
       .data_in_valid(data_in_valid),
       .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_1),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
       .ph_real(ph_real_1), 
       .phase_data_valid(phase_data_valid),  
        
       .data_outI(data_outI_temp),
       .data_outQ(data_outQ_temp),
       .data_out_valid(data_out_valid)
        
        );

assign data_outI = data_outI_temp[32:1];    //除2
assign data_outQ = data_outQ_temp[32:1];
endmodule