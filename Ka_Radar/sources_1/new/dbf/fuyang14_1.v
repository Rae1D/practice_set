`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 16:42:46
// Design Name: 
// Module Name: fuyang14
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


module fuyang35_1(
    input clk,
    
    input [15:0] data_in_I1,
    input [15:0] data_in_Q1,
    input [15:0] data_in_I2,
    input [15:0] data_in_Q2,
    input [15:0] data_in_I3,
    input [15:0] data_in_Q3,
    input [15:0] data_in_I4,
    input [15:0] data_in_Q4,
    input [15:0] data_in_I5,
    input [15:0] data_in_Q5,
    input [15:0] data_in_I6,
    input [15:0] data_in_Q6,
    input [15:0] data_in_I7,
    input [15:0] data_in_Q7,
    input [15:0] data_in_I8,
    input [15:0] data_in_Q8,
    input [15:0] data_in_I9,
    input [15:0] data_in_Q9,
    input [15:0] data_in_I10,
    input [15:0] data_in_Q10,
    input [15:0] data_in_I11,
    input [15:0] data_in_Q11,
    input [15:0] data_in_I12,
    input [15:0] data_in_Q12,
    input [15:0] data_in_I13,
    input [15:0] data_in_Q13,
    input [15:0] data_in_I14,
    input [15:0] data_in_Q14,
    input [15:0] data_in_I15,
    input [15:0] data_in_Q15,
    input [15:0] data_in_I16,
    input [15:0] data_in_Q16,
    input [15:0] data_in_I17,
    input [15:0] data_in_Q17,
    input [15:0] data_in_I18,
    input [15:0] data_in_Q18,
    input [15:0] data_in_I19,
    input [15:0] data_in_Q19,
    input [15:0] data_in_I20,
    input [15:0] data_in_Q20,
    input [15:0] data_in_I21,
    input [15:0] data_in_Q21,
    input [15:0] data_in_I22,
    input [15:0] data_in_Q22,
    input [15:0] data_in_I23,
    input [15:0] data_in_Q23,
    input [15:0] data_in_I24,
    input [15:0] data_in_Q24,
    input [15:0] data_in_I25,
    input [15:0] data_in_Q25,
    input [15:0] data_in_I26,
    input [15:0] data_in_Q26,
    input [15:0] data_in_I27,
    input [15:0] data_in_Q27,
    input [15:0] data_in_I28,
    input [15:0] data_in_Q28,
    input [15:0] data_in_I29,
    input [15:0] data_in_Q29,
    input [15:0] data_in_I30,
    input [15:0] data_in_Q30,
    input [15:0] data_in_I31,
    input [15:0] data_in_Q31,
    input [15:0] data_in_I32,
    input [15:0] data_in_Q32,
    input [15:0] data_in_I33,
    input [15:0] data_in_Q33,
    input [15:0] data_in_I34,
    input [15:0] data_in_Q34,
    input [15:0] data_in_I35,
    input [15:0] data_in_Q35,
    input data_in_valid,
    
    input [15:0]ph_real_1  ,
    input [15:0]ph_real_2  ,
    input [15:0]ph_real_3  ,
    input [15:0]ph_real_4  ,
    input [15:0]ph_real_5  ,
    input [15:0]ph_real_6  ,
    input [15:0]ph_real_7  ,
    input [15:0]ph_real_8  ,
    input [15:0]ph_real_9  ,
    input [15:0]ph_real_10  ,
    input [15:0]ph_real_11  ,
    input [15:0]ph_real_12  ,
    input [15:0]ph_real_13  ,
    input [15:0]ph_real_14  ,
    input [15:0]ph_real_15  ,
    input [15:0]ph_real_16  ,
    input [15:0]ph_real_17  ,
    input [15:0]ph_real_18  ,
    input [15:0]ph_real_19  ,
    input [15:0]ph_real_20  ,
    input [15:0]ph_real_21  ,
    input [15:0]ph_real_22  ,
    input [15:0]ph_real_23  ,
    input [15:0]ph_real_24  ,
    input [15:0]ph_real_25  ,
    input [15:0]ph_real_26  ,
    input [15:0]ph_real_27  ,
    input [15:0]ph_real_28  ,
    input [15:0]ph_real_29  ,
    input [15:0]ph_real_30  ,
    input [15:0]ph_real_31  ,
    input [15:0]ph_real_32  ,
    input [15:0]ph_real_33  ,
    input [15:0]ph_real_34  ,
    input [15:0]ph_real_35  ,
    
    input [15:0]ph_image_1 ,
    input [15:0]ph_image_2 ,
    input [15:0]ph_image_3 ,
    input [15:0]ph_image_4 ,
    input [15:0]ph_image_5 ,
    input [15:0]ph_image_6 ,
    input [15:0]ph_image_7 ,
    input [15:0]ph_image_8 ,
    input [15:0]ph_image_9 ,
    input [15:0]ph_image_10 ,
    input [15:0]ph_image_11 ,
    input [15:0]ph_image_12 ,
    input [15:0]ph_image_13 ,
    input [15:0]ph_image_14 ,
    input [15:0]ph_image_15 ,
    input [15:0]ph_image_16 ,
    input [15:0]ph_image_17 ,
    input [15:0]ph_image_18 ,
    input [15:0]ph_image_19 ,
    input [15:0]ph_image_20 ,
    input [15:0]ph_image_21 ,
    input [15:0]ph_image_22 ,
    input [15:0]ph_image_23 ,
    input [15:0]ph_image_24 ,
    input [15:0]ph_image_25 ,
    input [15:0]ph_image_26 ,
    input [15:0]ph_image_27 ,
    input [15:0]ph_image_28 ,
    input [15:0]ph_image_29 ,
    input [15:0]ph_image_30 ,
    input [15:0]ph_image_31 ,
    input [15:0]ph_image_32 ,
    input [15:0]ph_image_33 ,
    input [15:0]ph_image_34 ,
    input [15:0]ph_image_35 ,
    
    output [23:0]sum_1_35_I,
    output [23:0]sum_1_35_Q,
    output data_out_valid  
    );
    wire [15:0]data_sum_I1;
    wire [15:0]data_sum_Q1;
    wire [15:0]data_sum_I2;
    wire [15:0]data_sum_Q2;
    wire [15:0]data_sum_I3;
    wire [15:0]data_sum_Q3;
    wire [15:0]data_sum_I4;
    wire [15:0]data_sum_Q4;
    wire [15:0]data_sum_I5;
    wire [15:0]data_sum_Q5;
    wire [15:0]data_sum_I6;
    wire [15:0]data_sum_Q6;
    wire [15:0]data_sum_I7;
    wire [15:0]data_sum_Q7;
    wire [15:0]data_sum_I8;
    wire [15:0]data_sum_Q8;
    wire [15:0]data_sum_I9;
    wire [15:0]data_sum_Q9;
    wire [15:0]data_sum_I10;
    wire [15:0]data_sum_Q10;
    wire [15:0]data_sum_I11;
    wire [15:0]data_sum_Q11;
    wire [15:0]data_sum_I12;
    wire [15:0]data_sum_Q12;
    wire [15:0]data_sum_I13;
    wire [15:0]data_sum_Q13;
    wire [15:0]data_sum_I14;
    wire [15:0]data_sum_Q14;
    wire [15:0]data_sum_I15;
    wire [15:0]data_sum_Q15;
    wire [15:0]data_sum_I16;
    wire [15:0]data_sum_Q16;
    wire [15:0]data_sum_I17;
    wire [15:0]data_sum_Q17;
    wire [15:0]data_sum_I18;
    wire [15:0]data_sum_Q18;
    wire [15:0]data_sum_I19;
    wire [15:0]data_sum_Q19;
    wire [15:0]data_sum_I20;
    wire [15:0]data_sum_Q20;
    wire [15:0]data_sum_I21;
    wire [15:0]data_sum_Q21;
    wire [15:0]data_sum_I22;
    wire [15:0]data_sum_Q22;
    wire [15:0]data_sum_I23;
    wire [15:0]data_sum_Q23;
    wire [15:0]data_sum_I24;
    wire [15:0]data_sum_Q24;
    wire [15:0]data_sum_I25;
    wire [15:0]data_sum_Q25;
    wire [15:0]data_sum_I26;
    wire [15:0]data_sum_Q26;
    wire [15:0]data_sum_I27;
    wire [15:0]data_sum_Q27;
    wire [15:0]data_sum_I28;
    wire [15:0]data_sum_Q28;
    wire [15:0]data_sum_I29;
    wire [15:0]data_sum_Q29;
    wire [15:0]data_sum_I30;
    wire [15:0]data_sum_Q30;
    wire [15:0]data_sum_I31;
    wire [15:0]data_sum_Q31;
    wire [15:0]data_sum_I32;
    wire [15:0]data_sum_Q32;
    wire [15:0]data_sum_I33;
    wire [15:0]data_sum_Q33;
    wire [15:0]data_sum_I34;
    wire [15:0]data_sum_Q34;
    wire [15:0]data_sum_I35;
    wire [15:0]data_sum_Q35;
   
    wire data_valid; 
///////////////////////////////////////////////////////////////
wire [79:0] cmpy_v1_dout_1 ;
wire [79:0] cmpy_v1_dout_2 ;
wire [79:0] cmpy_v1_dout_3 ;
wire [79:0] cmpy_v1_dout_4 ;
wire [79:0] cmpy_v1_dout_5 ;
wire [79:0] cmpy_v1_dout_6 ;
wire [79:0] cmpy_v1_dout_7 ;
wire [79:0] cmpy_v1_dout_8 ;
wire [79:0] cmpy_v1_dout_9 ;
wire [79:0] cmpy_v1_dout_10;
wire [79:0] cmpy_v1_dout_11;
wire [79:0] cmpy_v1_dout_12;
wire [79:0] cmpy_v1_dout_13;
wire [79:0] cmpy_v1_dout_14;
wire [79:0] cmpy_v1_dout_15;
wire [79:0] cmpy_v1_dout_16;
wire [79:0] cmpy_v1_dout_17;
wire [79:0] cmpy_v1_dout_18;
wire [79:0] cmpy_v1_dout_19;
wire [79:0] cmpy_v1_dout_20;
wire [79:0] cmpy_v1_dout_21;
wire [79:0] cmpy_v1_dout_22;
wire [79:0] cmpy_v1_dout_23;
wire [79:0] cmpy_v1_dout_24;
wire [79:0] cmpy_v1_dout_25;
wire [79:0] cmpy_v1_dout_26;
wire [79:0] cmpy_v1_dout_27;
wire [79:0] cmpy_v1_dout_28;
wire [79:0] cmpy_v1_dout_29;
wire [79:0] cmpy_v1_dout_30;
wire [79:0] cmpy_v1_dout_31;
wire [79:0] cmpy_v1_dout_32;
wire [79:0] cmpy_v1_dout_33;
wire [79:0] cmpy_v1_dout_34;
wire [79:0] cmpy_v1_dout_35;

// ??Ey?E???? NO?U6?oE±OOOU?U
    cmpy_v2 cmpy_v1_inst_1 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_1,ph_real_1}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q1,data_in_I1}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(data_valid),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_1)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_2 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_2,ph_real_2}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q2,data_in_I2}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_2)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_3 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_3,ph_real_3}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q3,data_in_I3}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_3)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_4 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_4,ph_real_4}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q4,data_in_I4}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_4)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_5 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_5,ph_real_5}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q5,data_in_I5}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_5)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_6 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_6,ph_real_6}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q6,data_in_I6}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_6)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_7 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_7,ph_real_7}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q7,data_in_I7}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_7)    // output wire [79 : 0] m_axis_dout_tdata
    );
    cmpy_v2 cmpy_v1_inst_8 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_8,ph_real_8}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q8,data_in_I8}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_8)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_9 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_9,ph_real_9}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q9,data_in_I9}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_9)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_10 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_10,ph_real_10}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q10,data_in_I10}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_10)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_11 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_11,ph_real_11}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q11,data_in_I11}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_11)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_12 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_12,ph_real_12}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q12,data_in_I12}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_12)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_13 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_13,ph_real_13}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q13,data_in_I13}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_13)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_14 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_14,ph_real_14}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q14,data_in_I14}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_14)    // output wire [79 : 0] m_axis_dout_tdata
    ); 
    cmpy_v2 cmpy_v1_inst_15 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_15,ph_real_15}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q15,data_in_I15}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_15)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_16 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_16,ph_real_16}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q16,data_in_I16}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_16)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_17 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_17,ph_real_17}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q17,data_in_I17}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_17)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_18 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_18,ph_real_18}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q18,data_in_I18}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_18)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_19 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_19,ph_real_19}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q19,data_in_I19}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_19)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_20 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_20,ph_real_20}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q20,data_in_I20}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_20)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_21 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_21,ph_real_21}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q21,data_in_I21}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_21)    // output wire [79 : 0] m_axis_dout_tdata
    );
     cmpy_v2 cmpy_v1_inst_22 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_22,ph_real_22}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q22,data_in_I22}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_22)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_23 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_23,ph_real_23}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q23,data_in_I23}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_23)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_24 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_24,ph_real_24}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q24,data_in_I24}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_24)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_25 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_25,ph_real_25}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q25,data_in_I25}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_25)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_26 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_26,ph_real_26}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q26,data_in_I26}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_26)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_27 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_27,ph_real_27}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q27,data_in_I27}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_27)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_28 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_28,ph_real_28}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q28,data_in_I28}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_28)    // output wire [79 : 0] m_axis_dout_tdata
    );
     cmpy_v2 cmpy_v1_inst_29 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_29,ph_real_29}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q29,data_in_I29}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_29)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_30 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_30,ph_real_30}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q30,data_in_I30}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_30)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_31 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_31,ph_real_31}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q31,data_in_I31}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_31)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_32 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_32,ph_real_32}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q32,data_in_I32}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_32)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_33 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_33,ph_real_33}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q33,data_in_I33}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_33)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_34 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_34,ph_real_34}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q34,data_in_I34}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_34)    // output wire [79 : 0] m_axis_dout_tdata
    );

    cmpy_v2 cmpy_v1_inst_35 (
      .aclk(clk),                              // input wire aclk
      .s_axis_a_tvalid(data_in_valid),        // input wire s_axis_a_tvalid
      .s_axis_a_tdata({ph_image_35,ph_real_35}),          // input wire [31 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(data_in_valid),        // input wire s_axis_b_tvalid
      .s_axis_b_tdata({data_in_Q35,data_in_I35}),          // input wire [31 : 0] s_axis_b_tdata
      .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(cmpy_v1_dout_35)    // output wire [79 : 0] m_axis_dout_tdata
    );
//////////////////////////////////////////
assign   data_sum_I1  = cmpy_v1_dout_1 [32:17];
assign   data_sum_I2  = cmpy_v1_dout_2 [32:17];
assign   data_sum_I3  = cmpy_v1_dout_3 [32:17];
assign   data_sum_I4  = cmpy_v1_dout_4 [32:17];
assign   data_sum_I5  = cmpy_v1_dout_5 [32:17];
assign   data_sum_I6  = cmpy_v1_dout_6 [32:17];
assign   data_sum_I7  = cmpy_v1_dout_7 [32:17];
assign   data_sum_I8  = cmpy_v1_dout_8 [32:17];
assign   data_sum_I9  = cmpy_v1_dout_9 [32:17];
assign   data_sum_I10  = cmpy_v1_dout_10 [32:17];
assign   data_sum_I11  = cmpy_v1_dout_11 [32:17];
assign   data_sum_I12  = cmpy_v1_dout_12 [32:17];
assign   data_sum_I13  = cmpy_v1_dout_13 [32:17];
assign   data_sum_I14  = cmpy_v1_dout_14 [32:17];
assign   data_sum_I15  = cmpy_v1_dout_15 [32:17];
assign   data_sum_I16  = cmpy_v1_dout_16 [32:17];
assign   data_sum_I17  = cmpy_v1_dout_17 [32:17];
assign   data_sum_I18  = cmpy_v1_dout_18 [32:17];
assign   data_sum_I19  = cmpy_v1_dout_19 [32:17];
assign   data_sum_I20  = cmpy_v1_dout_20 [32:17];
assign   data_sum_I21  = cmpy_v1_dout_21 [32:17];
assign   data_sum_I22  = cmpy_v1_dout_22 [32:17];
assign   data_sum_I23  = cmpy_v1_dout_23 [32:17];
assign   data_sum_I24  = cmpy_v1_dout_24 [32:17];
assign   data_sum_I25  = cmpy_v1_dout_25 [32:17];
assign   data_sum_I26  = cmpy_v1_dout_26 [32:17];
assign   data_sum_I27  = cmpy_v1_dout_27 [32:17];
assign   data_sum_I28  = cmpy_v1_dout_28 [32:17];
assign   data_sum_I29  = cmpy_v1_dout_29 [32:17];
assign   data_sum_I30  = cmpy_v1_dout_30 [32:17];
assign   data_sum_I31  = cmpy_v1_dout_31 [32:17];
assign   data_sum_I32  = cmpy_v1_dout_32 [32:17];
assign   data_sum_I33  = cmpy_v1_dout_33 [32:17];
assign   data_sum_I34  = cmpy_v1_dout_34 [32:17];
assign   data_sum_I35  = cmpy_v1_dout_35 [32:17];

assign   data_sum_Q1  = cmpy_v1_dout_1 [72:57];
assign   data_sum_Q2  = cmpy_v1_dout_2 [72:57];
assign   data_sum_Q3  = cmpy_v1_dout_3 [72:57];
assign   data_sum_Q4  = cmpy_v1_dout_4 [72:57];
assign   data_sum_Q5  = cmpy_v1_dout_5 [72:57];
assign   data_sum_Q6  = cmpy_v1_dout_6 [72:57];
assign   data_sum_Q7  = cmpy_v1_dout_7 [72:57];
assign   data_sum_Q8  = cmpy_v1_dout_8 [72:57];
assign   data_sum_Q9  = cmpy_v1_dout_9 [72:57];
assign   data_sum_Q10  = cmpy_v1_dout_10 [72:57];
assign   data_sum_Q11  = cmpy_v1_dout_11 [72:57];
assign   data_sum_Q12  = cmpy_v1_dout_12 [72:57];
assign   data_sum_Q13  = cmpy_v1_dout_13 [72:57];
assign   data_sum_Q14  = cmpy_v1_dout_14 [72:57];
assign   data_sum_Q15  = cmpy_v1_dout_15 [72:57];
assign   data_sum_Q16  = cmpy_v1_dout_16 [72:57];
assign   data_sum_Q17  = cmpy_v1_dout_17 [72:57];
assign   data_sum_Q18  = cmpy_v1_dout_18 [72:57];
assign   data_sum_Q19  = cmpy_v1_dout_19 [72:57];
assign   data_sum_Q20  = cmpy_v1_dout_20 [72:57];
assign   data_sum_Q21  = cmpy_v1_dout_21 [72:57];
assign   data_sum_Q22  = cmpy_v1_dout_22 [72:57];
assign   data_sum_Q23  = cmpy_v1_dout_23 [72:57];
assign   data_sum_Q24  = cmpy_v1_dout_24 [72:57];
assign   data_sum_Q25  = cmpy_v1_dout_25 [72:57];
assign   data_sum_Q26  = cmpy_v1_dout_26 [72:57];
assign   data_sum_Q27  = cmpy_v1_dout_27 [72:57];
assign   data_sum_Q28  = cmpy_v1_dout_28 [72:57];
assign   data_sum_Q29  = cmpy_v1_dout_29 [72:57];
assign   data_sum_Q30  = cmpy_v1_dout_30 [72:57];
assign   data_sum_Q31  = cmpy_v1_dout_31 [72:57];
assign   data_sum_Q32  = cmpy_v1_dout_32 [72:57];
assign   data_sum_Q33  = cmpy_v1_dout_33 [72:57];
assign   data_sum_Q34  = cmpy_v1_dout_34 [72:57];
assign   data_sum_Q35  = cmpy_v1_dout_35 [72:57];

/////////??I»A??i//////////////
    wire [23:0] in_1_I;
    wire [23:0] in_1_Q;
    wire [23:0] in_2_I;
    wire [23:0] in_2_Q;
    wire [23:0] in_3_I;
    wire [23:0] in_3_Q;
    wire [23:0] in_4_I;
    wire [23:0] in_4_Q;
    wire [23:0] in_5_I;
    wire [23:0] in_5_Q;
    wire [23:0] in_6_I;
    wire [23:0] in_6_Q;
    wire [23:0] in_7_I;
    wire [23:0] in_7_Q;
    wire [23:0] in_8_I;
    wire [23:0] in_8_Q;
    wire [23:0] in_9_I;
    wire [23:0] in_9_Q;
    wire [23:0] in_10_I;
    wire [23:0] in_10_Q;
    wire [23:0] in_11_I;
    wire [23:0] in_11_Q;
    wire [23:0] in_12_I;
    wire [23:0] in_12_Q;
    wire [23:0] in_13_I;
    wire [23:0] in_13_Q;
    wire [23:0] in_14_I;
    wire [23:0] in_14_Q;
    wire [23:0] in_15_I;
    wire [23:0] in_15_Q;
    wire [23:0] in_16_I;
    wire [23:0] in_16_Q;
    wire [23:0] in_17_I;
    wire [23:0] in_17_Q;
    wire [23:0] in_18_I;
    wire [23:0] in_18_Q;
    wire [23:0] in_19_I;
    wire [23:0] in_19_Q;
    wire [23:0] in_20_I;
    wire [23:0] in_20_Q;
    wire [23:0] in_21_I;
    wire [23:0] in_21_Q;
    wire [23:0] in_22_I;
    wire [23:0] in_22_Q;
    wire [23:0] in_23_I;
    wire [23:0] in_23_Q;
    wire [23:0] in_24_I;
    wire [23:0] in_24_Q;
    wire [23:0] in_25_I;
    wire [23:0] in_25_Q;
    wire [23:0] in_26_I;
    wire [23:0] in_26_Q;
    wire [23:0] in_27_I;
    wire [23:0] in_27_Q;
    wire [23:0] in_28_I;
    wire [23:0] in_28_Q;
    wire [23:0] in_29_I;
    wire [23:0] in_29_Q;
    wire [23:0] in_30_I;
    wire [23:0] in_30_Q;
    wire [23:0] in_31_I;
    wire [23:0] in_31_Q;
    wire [23:0] in_32_I;
    wire [23:0] in_32_Q;
    wire [23:0] in_33_I;
    wire [23:0] in_33_Q;
    wire [23:0] in_34_I;
    wire [23:0] in_34_Q;
    wire [23:0] in_35_I;
    wire [23:0] in_35_Q;
    
assign in_1_I = {data_sum_I1[15],data_sum_I1[15],data_sum_I1[15],data_sum_I1[15],data_sum_I1[15],data_sum_I1[15],data_sum_I1[15],data_sum_I1[15],data_sum_I1[15:0]};
assign in_1_Q = {data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15],data_sum_Q1[15:0]};
assign in_2_I = {data_sum_I2[15],data_sum_I2[15],data_sum_I2[15],data_sum_I2[15],data_sum_I2[15],data_sum_I2[15],data_sum_I2[15],data_sum_I2[15],data_sum_I2[15:0]};
assign in_2_Q = {data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15],data_sum_Q2[15:0]};
assign in_3_I = {data_sum_I3[15],data_sum_I3[15],data_sum_I3[15],data_sum_I3[15],data_sum_I3[15],data_sum_I3[15],data_sum_I3[15],data_sum_I3[15],data_sum_I3[15:0]};
assign in_3_Q = {data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15],data_sum_Q3[15:0]};
assign in_4_I = {data_sum_I4[15],data_sum_I4[15],data_sum_I4[15],data_sum_I4[15],data_sum_I4[15],data_sum_I4[15],data_sum_I4[15],data_sum_I4[15],data_sum_I4[15:0]};
assign in_4_Q = {data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15],data_sum_Q4[15:0]};
assign in_5_I = {data_sum_I5[15],data_sum_I5[15],data_sum_I5[15],data_sum_I5[15],data_sum_I5[15],data_sum_I5[15],data_sum_I5[15],data_sum_I5[15],data_sum_I5[15:0]};
assign in_5_Q = {data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15],data_sum_Q5[15:0]};
assign in_6_I = {data_sum_I6[15],data_sum_I6[15],data_sum_I6[15],data_sum_I6[15],data_sum_I6[15],data_sum_I6[15],data_sum_I6[15],data_sum_I6[15],data_sum_I6[15:0]};
assign in_6_Q = {data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15],data_sum_Q6[15:0]};
assign in_7_I = {data_sum_I7[15],data_sum_I7[15],data_sum_I7[15],data_sum_I7[15],data_sum_I7[15],data_sum_I7[15],data_sum_I7[15],data_sum_I7[15],data_sum_I7[15:0]};
assign in_7_Q = {data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15],data_sum_Q7[15:0]}; 
assign in_8_I = {data_sum_I8[15],data_sum_I8[15],data_sum_I8[15],data_sum_I8[15],data_sum_I8[15],data_sum_I8[15],data_sum_I8[15],data_sum_I8[15],data_sum_I8[15:0]};
assign in_8_Q = {data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15],data_sum_Q8[15:0]};
assign in_9_I = {data_sum_I9[15],data_sum_I9[15],data_sum_I9[15],data_sum_I9[15],data_sum_I9[15],data_sum_I9[15],data_sum_I9[15],data_sum_I9[15],data_sum_I9[15:0]};
assign in_9_Q = {data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15],data_sum_Q9[15:0]};
assign in_10_I = {data_sum_I10[15],data_sum_I10[15],data_sum_I10[15],data_sum_I10[15],data_sum_I10[15],data_sum_I10[15],data_sum_I10[15],data_sum_I10[15],data_sum_I10[15:0]};
assign in_10_Q = {data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15],data_sum_Q10[15:0]};
assign in_11_I = {data_sum_I11[15],data_sum_I11[15],data_sum_I11[15],data_sum_I11[15],data_sum_I11[15],data_sum_I11[15],data_sum_I11[15],data_sum_I11[15],data_sum_I11[15:0]};
assign in_11_Q = {data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15],data_sum_Q11[15:0]};
assign in_12_I = {data_sum_I12[15],data_sum_I12[15],data_sum_I12[15],data_sum_I12[15],data_sum_I12[15],data_sum_I12[15],data_sum_I12[15],data_sum_I12[15],data_sum_I12[15:0]};
assign in_12_Q = {data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15],data_sum_Q12[15:0]};
assign in_13_I = {data_sum_I13[15],data_sum_I13[15],data_sum_I13[15],data_sum_I13[15],data_sum_I13[15],data_sum_I13[15],data_sum_I13[15],data_sum_I13[15],data_sum_I13[15:0]};
assign in_13_Q = {data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15],data_sum_Q13[15:0]};
assign in_14_I = {data_sum_I14[15],data_sum_I14[15],data_sum_I14[15],data_sum_I14[15],data_sum_I14[15],data_sum_I14[15],data_sum_I14[15],data_sum_I14[15],data_sum_I14[15:0]};
assign in_14_Q = {data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15],data_sum_Q14[15:0]}; 
assign in_15_I = {data_sum_I15[15],data_sum_I15[15],data_sum_I15[15],data_sum_I15[15],data_sum_I15[15],data_sum_I15[15],data_sum_I15[15],data_sum_I15[15],data_sum_I15[15:0]};
assign in_15_Q = {data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15],data_sum_Q15[15:0]};
assign in_16_I = {data_sum_I16[15],data_sum_I16[15],data_sum_I16[15],data_sum_I16[15],data_sum_I16[15],data_sum_I16[15],data_sum_I16[15],data_sum_I16[15],data_sum_I16[15:0]};
assign in_16_Q = {data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15],data_sum_Q16[15:0]};
assign in_17_I = {data_sum_I17[15],data_sum_I17[15],data_sum_I17[15],data_sum_I17[15],data_sum_I17[15],data_sum_I17[15],data_sum_I17[15],data_sum_I17[15],data_sum_I17[15:0]};
assign in_17_Q = {data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15],data_sum_Q17[15:0]};
assign in_18_I = {data_sum_I18[15],data_sum_I18[15],data_sum_I18[15],data_sum_I18[15],data_sum_I18[15],data_sum_I18[15],data_sum_I18[15],data_sum_I18[15],data_sum_I18[15:0]};
assign in_18_Q = {data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15],data_sum_Q18[15:0]};
assign in_19_I = {data_sum_I19[15],data_sum_I19[15],data_sum_I19[15],data_sum_I19[15],data_sum_I19[15],data_sum_I19[15],data_sum_I19[15],data_sum_I19[15],data_sum_I19[15:0]};
assign in_19_Q = {data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15],data_sum_Q19[15:0]};
assign in_20_I = {data_sum_I20[15],data_sum_I20[15],data_sum_I20[15],data_sum_I20[15],data_sum_I20[15],data_sum_I20[15],data_sum_I20[15],data_sum_I20[15],data_sum_I20[15:0]};
assign in_20_Q = {data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15],data_sum_Q20[15:0]};
assign in_21_I = {data_sum_I21[15],data_sum_I21[15],data_sum_I21[15],data_sum_I21[15],data_sum_I21[15],data_sum_I21[15],data_sum_I21[15],data_sum_I21[15],data_sum_I21[15:0]};
assign in_21_Q = {data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15],data_sum_Q21[15:0]}; 
assign in_22_I = {data_sum_I22[15],data_sum_I22[15],data_sum_I22[15],data_sum_I22[15],data_sum_I22[15],data_sum_I22[15],data_sum_I22[15],data_sum_I22[15],data_sum_I22[15:0]};
assign in_22_Q = {data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15],data_sum_Q22[15:0]};
assign in_23_I = {data_sum_I23[15],data_sum_I23[15],data_sum_I23[15],data_sum_I23[15],data_sum_I23[15],data_sum_I23[15],data_sum_I23[15],data_sum_I23[15],data_sum_I23[15:0]};
assign in_23_Q = {data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15],data_sum_Q23[15:0]};
assign in_24_I = {data_sum_I24[15],data_sum_I24[15],data_sum_I24[15],data_sum_I24[15],data_sum_I24[15],data_sum_I24[15],data_sum_I24[15],data_sum_I24[15],data_sum_I24[15:0]};
assign in_24_Q = {data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15],data_sum_Q24[15:0]};
assign in_25_I = {data_sum_I25[15],data_sum_I25[15],data_sum_I25[15],data_sum_I25[15],data_sum_I25[15],data_sum_I25[15],data_sum_I25[15],data_sum_I25[15],data_sum_I25[15:0]};
assign in_25_Q = {data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15],data_sum_Q25[15:0]};
assign in_26_I = {data_sum_I26[15],data_sum_I26[15],data_sum_I26[15],data_sum_I26[15],data_sum_I26[15],data_sum_I26[15],data_sum_I26[15],data_sum_I26[15],data_sum_I26[15:0]};
assign in_26_Q = {data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15],data_sum_Q26[15:0]};
assign in_27_I = {data_sum_I27[15],data_sum_I27[15],data_sum_I27[15],data_sum_I27[15],data_sum_I27[15],data_sum_I27[15],data_sum_I27[15],data_sum_I27[15],data_sum_I27[15:0]};
assign in_27_Q = {data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15],data_sum_Q27[15:0]};
assign in_28_I = {data_sum_I28[15],data_sum_I28[15],data_sum_I28[15],data_sum_I28[15],data_sum_I28[15],data_sum_I28[15],data_sum_I28[15],data_sum_I28[15],data_sum_I28[15:0]};
assign in_28_Q = {data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15],data_sum_Q28[15:0]}; 
assign in_29_I = {data_sum_I29[15],data_sum_I29[15],data_sum_I29[15],data_sum_I29[15],data_sum_I29[15],data_sum_I29[15],data_sum_I29[15],data_sum_I29[15],data_sum_I29[15:0]};
assign in_29_Q = {data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15],data_sum_Q29[15:0]};
assign in_30_I = {data_sum_I30[15],data_sum_I30[15],data_sum_I30[15],data_sum_I30[15],data_sum_I30[15],data_sum_I30[15],data_sum_I30[15],data_sum_I30[15],data_sum_I30[15:0]};
assign in_30_Q = {data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15],data_sum_Q30[15:0]};
assign in_31_I = {data_sum_I31[15],data_sum_I31[15],data_sum_I31[15],data_sum_I31[15],data_sum_I31[15],data_sum_I31[15],data_sum_I31[15],data_sum_I31[15],data_sum_I31[15:0]};
assign in_31_Q = {data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15],data_sum_Q31[15:0]};
assign in_32_I = {data_sum_I32[15],data_sum_I32[15],data_sum_I32[15],data_sum_I32[15],data_sum_I32[15],data_sum_I32[15],data_sum_I32[15],data_sum_I32[15],data_sum_I32[15:0]};
assign in_32_Q = {data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15],data_sum_Q32[15:0]};
assign in_33_I = {data_sum_I33[15],data_sum_I33[15],data_sum_I33[15],data_sum_I33[15],data_sum_I33[15],data_sum_I33[15],data_sum_I33[15],data_sum_I33[15],data_sum_I33[15:0]};
assign in_33_Q = {data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15],data_sum_Q33[15:0]};
assign in_34_I = {data_sum_I34[15],data_sum_I34[15],data_sum_I34[15],data_sum_I34[15],data_sum_I34[15],data_sum_I34[15],data_sum_I34[15],data_sum_I34[15],data_sum_I34[15:0]};
assign in_34_Q = {data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15],data_sum_Q34[15:0]};
assign in_35_I = {data_sum_I35[15],data_sum_I35[15],data_sum_I35[15],data_sum_I35[15],data_sum_I35[15],data_sum_I35[15],data_sum_I35[15],data_sum_I35[15],data_sum_I35[15:0]};
assign in_35_Q = {data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15],data_sum_Q35[15:0]}; 


reg [23:0]sum_1_35_I_1;
reg [23:0]sum_1_35_Q_1;
reg data_valid_t;
always@(posedge clk)
begin
    if(data_valid)
    begin
    sum_1_35_I_1 <= (in_1_I+in_2_I)+(in_3_I+in_4_I)+(in_5_I+in_6_I)+(in_7_I+in_8_I)+(in_9_I+in_10_I)+(in_11_I+in_12_I)+(in_13_I+in_14_I)+(in_15_I+in_16_I)+(in_17_I+in_18_I)+(in_19_I+in_20_I)+(in_21_I+in_22_I)
                     +(in_23_I+in_24_I)+(in_25_I+in_26_I)+(in_27_I+in_28_I)+(in_29_I+in_30_I)+(in_31_I+in_32_I)+(in_33_I+in_34_I)+in_35_I;
    sum_1_35_Q_1 <= (in_1_Q+in_2_Q)+(in_3_Q+in_4_Q)+(in_5_Q+in_6_Q)+(in_7_Q+in_8_Q)+(in_9_Q+in_10_Q)+(in_11_Q+in_12_Q)+(in_13_Q+in_14_Q)+(in_15_Q+in_16_Q)+(in_17_Q+in_18_Q)+(in_19_Q+in_20_Q)+(in_21_Q+in_22_Q)
                     +(in_23_Q+in_24_Q)+(in_25_Q+in_26_Q)+(in_27_Q+in_28_Q)+(in_29_Q+in_30_Q)+(in_31_Q+in_32_Q)+(in_33_Q+in_34_Q)+in_35_Q;
    end

    data_valid_t <= data_valid;
end 

assign sum_1_35_I = sum_1_35_I_1;
assign sum_1_35_Q = sum_1_35_Q_1; 
assign data_out_valid = data_valid_t;

        
  
endmodule
