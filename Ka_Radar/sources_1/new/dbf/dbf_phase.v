`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 19:25:46
// Design Name: 
// Module Name: dbf_phase
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


module dbf_phase(
    input clk,
    
    input [15:0] A,           //  加权系数增益 ,满量程表示增益最大，增益为1
    input [15:0] phase_data,  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    input [15:0] phase_data_im,  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    input  phase_data_valid,  
    
    output [15:0] ph_real,
    output [15:0] ph_image
    );
//wire [17:0]phase_data_1;
//wire [17:0]phase_data_1_1;

// assign phase_data_1 = {phase_data[15],phase_data[15],phase_data[15:0]};
// assign phase_data_1_1 = (phase_data_1) ^ 18'h3FFFF;
//// assign phase_data_1_1 = phase_data_1;
 
//wire m_axis_dout_tvalid;
//wire[31:0] m_axis_dout_tdata;
    
////cordic 生成 sin cos  ，m_axis_dout_tdata低16位是real，高16位是image ，输出延迟20个时钟周期
//cordic_sin_cos cordic_sin_cos_inst (
//      .aclk(clk),                                // input wire aclk
//      .s_axis_phase_tvalid(phase_data_valid),  // input wire s_axis_phase_tvalid
//      .s_axis_phase_tdata({6'b0,phase_data_1_1}),    // input wire [15 : 0] s_axis_phase_tdata
//      .m_axis_dout_tvalid(m_axis_dout_tvalid),    // output wire m_axis_dout_tvalid
//      .m_axis_dout_tdata(m_axis_dout_tdata)      // output wire [31 : 0] m_axis_dout_tdata
//    );
//    //
////wire[15:0] ph_real;
////wire[15:0] ph_image;

wire [15:0]phase_data_t;
wire [15:0]phase_data_im_t;

assign phase_data_t = {phase_data[15],phase_data[15:1]};         ///////对应
assign phase_data_im_t = {phase_data_im[15],phase_data_im[15:1]};
    
mult_16 mult_inst_real (
      .CLK(clk),  // input wire CLK
      .A(A),      // input wire [15 : 0] A
      .B(phase_data_t),      // input wire [15 : 0] B
      .P(ph_real)      // output wire [15 : 0] P
    );
     
mult_16_1 mult_inst_image (
      .CLK(clk),  // input wire CLK
      .A(A),      // input wire [15 : 0] A
      .B(phase_data_im_t),      // input wire [15 : 0] B
      .P(ph_image)      // output wire [15 : 0] P
    );

endmodule
