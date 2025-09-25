`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 22:32:58
// Design Name: 
// Module Name: dbf_cell
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


module dbf_cell(
    input clk,
    input [15:0] dataI,  
    input [15:0] dataQ,
    input data_in_valid,
    input [15:0] A,           //  加权系数增益 ,满量程表示增益最大，增益为1
    input [15:0] ph_image,  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    input [15:0] ph_real,
    input  phase_data_valid,  
    
    output[32:0] data_outI,
    output[32:0] data_outQ,
    output data_out_valid
    
    );
    
    
    
//    //cordic 生成 sin cos  ，m_axis_dout_tdata低16位是real，高16位是image ，输出延迟20个时钟周期
//    cordic_sin_cos cordic_sin_cos_inst (
//      .aclk(clk),                                // input wire aclk
//      .s_axis_phase_tvalid(phase_data_valid),  // input wire s_axis_phase_tvalid
//      .s_axis_phase_tdata(phase_data),    // input wire [15 : 0] s_axis_phase_tdata
//      .m_axis_dout_tvalid(m_axis_dout_tvalid),    // output wire m_axis_dout_tvalid
//      .m_axis_dout_tdata(m_axis_dout_tdata)      // output wire [31 : 0] m_axis_dout_tdata
//    );
//    //
    wire[15:0] ph_real_cell;
    wire[15:0] ph_image_cell;
   
    mult_16 mult_inst_real (
      .CLK(clk),  // input wire CLK
      .A(A),      // input wire [15 : 0] A
      .B(ph_real),      // input wire [15 : 0] B
      .P(ph_real_cell)      // output wire [15 : 0] P
    );
     
     mult_16 mult_inst_image (
      .CLK(clk),  // input wire CLK
      .A(A),      // input wire [15 : 0] A
      .B(ph_image),      // input wire [15 : 0] B
      .P(ph_image_cell)      // output wire [15 : 0] P
    );
   // 复数乘法器 延迟6个时钟周期
   wire [79:0] cmpy_v1_dout;
    cmpy_v1 cmpy_v1_inst (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_cell,ph_real_cell}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({dataQ,dataI}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(data_out_valid),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout)    // output wire [79 : 0] m_axis_dout_tdata
    );
    
assign   data_outI = cmpy_v1_dout[32:0];
assign   data_outQ = cmpy_v1_dout[72:40];
    
endmodule
