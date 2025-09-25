`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/16 21:45:11
// Design Name: 
// Module Name: dbf_cell_save
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


module dbf_cell_save(

    input clk,
    input [15:0] dataI,  
    input [15:0] dataQ,
    input data_in_valid,
         //  加权系数增益 ,满量程表示增益最大，增益为1
    input [15:0] ph_image,  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    input [15:0] ph_real,

    
    output[32:0] data_outI,
    output[32:0] data_outQ,
    output data_out_valid
    
    );

   // 复数乘法器 延迟6个时钟周期
   wire [79:0] cmpy_v1_dout;
    cmpy_v1 cmpy_v1_inst (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image,ph_real}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({dataQ,dataI}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(data_out_valid),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout)    // output wire [79 : 0] m_axis_dout_tdata
    );
    
assign   data_outI = cmpy_v1_dout[32:0];
assign   data_outQ = cmpy_v1_dout[72:40];
    
endmodule


