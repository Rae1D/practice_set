`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/17 10:34:13
// Design Name: 
// Module Name: dbf_q_fy_save
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


module dbf_q_fy_save(
input clk,
    input [15:0] dataI,  
    input [15:0] dataQ,
    input data_in_valid,
    input [15:0] A,           //  ��Ȩϵ������ ,�����̱�ʾ�����������Ϊ1
    input [15:0]ph_image,  //��Ȩ��λ,����������fxi16_13�����뷶Χ��-pi��+pi��*2^13
    input [15:0]ph_real,
    input  phase_data_valid,
    input [2:0]fy_cut_ctl,
    
    output[15:0] data_outI,
    output[15:0] data_outQ,
    output data_out_valid

);

wire [32:0]data_outI_temp;  //乘法溢出，多一位
wire [32:0]data_outQ_temp;
wire data_out_valid_t;
wire [15:0]ph_image_1;
wire [15:0]ph_real_1;

 assign ph_image_1 = ph_image;
 assign ph_real_1 = ph_real;
// assign phase_data_1_1 = (phase_data_1) ^ 16'hFFFF;

 
       dbf_cell_save dbf_cell_1(
       .clk(clk),
       .dataI(dataI),  
       .dataQ(dataQ),
       .data_in_valid(data_in_valid),
        //  ��Ȩϵ������ ,�����̱�ʾ�����������Ϊ1
      .ph_image(ph_image_1),  //��Ȩ��λ,����������fxi16_13�����뷶Χ��-pi��+pi��*2^13
       .ph_real(ph_real_1), 
  
        
       .data_outI(data_outI_temp),
       .data_outQ(data_outQ_temp),
       .data_out_valid(data_out_valid_t)
        
        );

//assign data_outI = data_outI_temp[32:1];
//assign data_outQ = data_outQ_temp[32:1];
//////////////////////////////////////////////
cut_ctl_top #(.LEN(33)) fy_cut(
    .clk(clk),
    .data_i(data_outI_temp),
    .data_q(data_outQ_temp),
    .in_valid(data_out_valid_t),
    .cut_ctl(fy_cut_ctl),
    
    .data_out_i(data_outI),
    .data_out_q(data_outQ),
    .out_valid(data_out_valid)
    );
endmodule
