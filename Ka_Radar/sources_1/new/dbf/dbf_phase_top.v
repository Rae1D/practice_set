`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/01 20:22:14
// Design Name: 
// Module Name: dbf_phase_top
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


module dbf_phase_top(
    input clk,
    
    input phase_data_valid,
    input [15:0]phase_data_1,
    input [15:0]phase_data_2,
    input [15:0]phase_data_3,
    input [15:0]phase_data_4,
    input [15:0]phase_data_5,
    input [15:0]phase_data_6,
    input [15:0]phase_data_7,
    input [15:0]phase_data_8,
    input [15:0]phase_data_9,
    input [15:0]phase_data_10,
    input [15:0]phase_data_11,
    input [15:0]phase_data_12,
    input [15:0]phase_data_13,
    input [15:0]phase_data_14,
    input [15:0]phase_data_15,
    input [15:0]phase_data_16,
    input [15:0]phase_data_17,
    input [15:0]phase_data_18,
    input [15:0]phase_data_19,
    input [15:0]phase_data_20,
    input [15:0]phase_data_21,
    input [15:0]phase_data_22,
    input [15:0]phase_data_23,
    input [15:0]phase_data_24,
    input [15:0]phase_data_25,
    input [15:0]phase_data_26,
    input [15:0]phase_data_27,
    input [15:0]phase_data_28,
    input [15:0]phase_data_29,
    input [15:0]phase_data_30,
    input [15:0]phase_data_31,
    input [15:0]phase_data_32,
    input [15:0]phase_data_33,
    input [15:0]phase_data_34,
    input [15:0]phase_data_35,
    
    input [15:0]phase_data_1_im,
    input [15:0]phase_data_2_im,
    input [15:0]phase_data_3_im,
    input [15:0]phase_data_4_im,
    input [15:0]phase_data_5_im,
    input [15:0]phase_data_6_im,
    input [15:0]phase_data_7_im,
    input [15:0]phase_data_8_im,
    input [15:0]phase_data_9_im,
    input [15:0]phase_data_10_im,
    input [15:0]phase_data_11_im,
    input [15:0]phase_data_12_im,
    input [15:0]phase_data_13_im,
    input [15:0]phase_data_14_im, 
    input [15:0]phase_data_15_im,
    input [15:0]phase_data_16_im,
    input [15:0]phase_data_17_im,
    input [15:0]phase_data_18_im,
    input [15:0]phase_data_19_im,
    input [15:0]phase_data_20_im,
    input [15:0]phase_data_21_im,
    input [15:0]phase_data_22_im,
    input [15:0]phase_data_23_im,
    input [15:0]phase_data_24_im,
    input [15:0]phase_data_25_im,
    input [15:0]phase_data_26_im,
    input [15:0]phase_data_27_im,
    input [15:0]phase_data_28_im,
    input [15:0]phase_data_29_im,
    input [15:0]phase_data_30_im,
    input [15:0]phase_data_31_im,
    input [15:0]phase_data_32_im,
    input [15:0]phase_data_33_im,
    input [15:0]phase_data_34_im,
    input [15:0]phase_data_35_im,
    
    input [15:0] A1,
    input [15:0] A2,
    input [15:0] A3,
    input [15:0] A4,
    input [15:0] A5,
    input [15:0] A6,
    input [15:0] A7,
    input [15:0] A8,
    input [15:0] A9,
    input [15:0] A10,
    input [15:0] A11,
    input [15:0] A12,
    input [15:0] A13,
    input [15:0] A14,
    input [15:0] A15,
    input [15:0] A16,
    input [15:0] A17,
    input [15:0] A18,
    input [15:0] A19,
    input [15:0] A20,
    input [15:0] A21,
    input [15:0] A22,
    input [15:0] A23,
    input [15:0] A24,
    input [15:0] A25,
    input [15:0] A26,
    input [15:0] A27,
    input [15:0] A28,
    input [15:0] A29,
    input [15:0] A30,
    input [15:0] A31,
    input [15:0] A32,
    input [15:0] A33,
    input [15:0] A34,
    input [15:0] A35,
    
    output [15:0]ph_real_1  ,
    output [15:0]ph_real_2  ,
    output [15:0]ph_real_3  ,
    output [15:0]ph_real_4  ,
    output [15:0]ph_real_5  ,
    output [15:0]ph_real_6  ,
    output [15:0]ph_real_7  ,
    output [15:0]ph_real_8  ,
    output [15:0]ph_real_9  ,
    output [15:0]ph_real_10 ,
    output [15:0]ph_real_11 ,
    output [15:0]ph_real_12 ,
    output [15:0]ph_real_13 ,
    output [15:0]ph_real_14 ,
    output [15:0]ph_real_15 ,
    output [15:0]ph_real_16 ,
    output [15:0]ph_real_17 ,
    output [15:0]ph_real_18 ,
    output [15:0]ph_real_19 ,
    output [15:0]ph_real_20 ,
    output [15:0]ph_real_21 ,
    output [15:0]ph_real_22 ,
    output [15:0]ph_real_23 ,
    output [15:0]ph_real_24 ,
    output [15:0]ph_real_25 ,
    output [15:0]ph_real_26 ,
    output [15:0]ph_real_27 ,
    output [15:0]ph_real_28 ,
    output [15:0]ph_real_29 ,
    output [15:0]ph_real_30 ,
    output [15:0]ph_real_31 ,
    output [15:0]ph_real_32 ,
    output [15:0]ph_real_33 ,
    output [15:0]ph_real_34 ,
    output [15:0]ph_real_35 ,
    
    output [15:0]ph_image_1 ,
    output [15:0]ph_image_2 ,
    output [15:0]ph_image_3 ,
    output [15:0]ph_image_4 ,
    output [15:0]ph_image_5 ,
    output [15:0]ph_image_6 ,
    output [15:0]ph_image_7 ,
    output [15:0]ph_image_8 ,
    output [15:0]ph_image_9 ,
    output [15:0]ph_image_10 ,
    output [15:0]ph_image_11 ,
    output [15:0]ph_image_12 ,
    output [15:0]ph_image_13 ,
    output [15:0]ph_image_14 ,
    output [15:0]ph_image_15 ,
    output [15:0]ph_image_16 ,
    output [15:0]ph_image_17 ,
    output [15:0]ph_image_18 ,
    output [15:0]ph_image_19 ,
    output [15:0]ph_image_20 ,
    output [15:0]ph_image_21 ,
    output [15:0]ph_image_22 ,
    output [15:0]ph_image_23 ,
    output [15:0]ph_image_24 ,
    output [15:0]ph_image_25 ,
    output [15:0]ph_image_26 ,
    output [15:0]ph_image_27 ,
    output [15:0]ph_image_28 ,
    output [15:0]ph_image_29 ,
    output [15:0]ph_image_30 ,
    output [15:0]ph_image_31 ,
    output [15:0]ph_image_32 ,
    output [15:0]ph_image_33 ,
    output [15:0]ph_image_34 ,
    output [15:0]ph_image_35 
         
   
 
    
    );
    
    
    dbf_phase  dbf_phase_1(
    .clk(clk),
    
    .A(A1),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_1),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_1_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_1 ),
    .ph_image(ph_image_1)
    );
    
dbf_phase  dbf_phase_2(
    .clk(clk),
    
    .A(A2),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_2),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_2_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_2 ),
    .ph_image(ph_image_2)
    );
    
dbf_phase  dbf_phase_3(
    .clk(clk),
    
    .A(A3),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_3),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_3_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_3 ),
    .ph_image(ph_image_3)
    );

    dbf_phase  dbf_phase_4(
    .clk(clk),
    
    .A(A4),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_4),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_4_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_4 ),
    .ph_image(ph_image_4)
    );
    dbf_phase  dbf_phase_5(
    .clk(clk),
    
    .A(A5),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_5),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_5_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_5 ),
    .ph_image(ph_image_5)
    );
    dbf_phase  dbf_phase_6(
    .clk(clk),
    
    .A(A6),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_6),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_6_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_6 ),
    .ph_image(ph_image_6)
    );
    dbf_phase  dbf_phase_7(
    .clk(clk),
    
    .A(A7),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_7),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_7_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_7 ),
    .ph_image(ph_image_7)
    );
        dbf_phase  dbf_phase_8(
    .clk(clk),
    
    .A(A8),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_8),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_8_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_8 ),
    .ph_image(ph_image_8)
    );
    
dbf_phase  dbf_phase_9(
    .clk(clk),
    
    .A(A9),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_9),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_9_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_9 ),
    .ph_image(ph_image_9)
    );
    
dbf_phase  dbf_phase_10(
    .clk(clk),
    
    .A(A10),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_10),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_10_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_10 ),
    .ph_image(ph_image_10)
    );

    dbf_phase  dbf_phase_11(
    .clk(clk),
    
    .A(A11),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_11),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_11_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_11 ),
    .ph_image(ph_image_11)
    );
    dbf_phase  dbf_phase_12(
    .clk(clk),
    
    .A(A12),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_12),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_12_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_12 ),
    .ph_image(ph_image_12)
    );
    dbf_phase  dbf_phase_13(
    .clk(clk),
    
    .A(A13),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_13),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_13_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_13 ),
    .ph_image(ph_image_13)
    );
    dbf_phase  dbf_phase_14(
    .clk(clk),
    
    .A(A14),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_14),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_14_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_14 ),
    .ph_image(ph_image_14)
    );
        dbf_phase  dbf_phase_15(
    .clk(clk),
    
    .A(A1),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_15),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_15_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_15 ),
    .ph_image(ph_image_15)
    );
    
dbf_phase  dbf_phase_16(
    .clk(clk),
    
    .A(A16),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_16),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_16_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_16 ),
    .ph_image(ph_image_16)
    );
    
dbf_phase  dbf_phase_17(
    .clk(clk),
    
    .A(A17),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_17),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_17_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_17 ),
    .ph_image(ph_image_17)
    );

    dbf_phase  dbf_phase_18(
    .clk(clk),
    
    .A(A18),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_18),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_18_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_18 ),
    .ph_image(ph_image_18)
    );
    dbf_phase  dbf_phase_19(
    .clk(clk),
    
    .A(A19),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_19),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_19_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_19 ),
    .ph_image(ph_image_19)
    );
    dbf_phase  dbf_phase_20(
    .clk(clk),
    
    .A(A20),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_20),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_20_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_20 ),
    .ph_image(ph_image_20)
    );
    dbf_phase  dbf_phase_21(
    .clk(clk),
    
    .A(A21),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_21),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_21_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_21 ),
    .ph_image(ph_image_21)
    );
        dbf_phase  dbf_phase_22(
    .clk(clk),
    
    .A(A22),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_22),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_22_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_22 ),
    .ph_image(ph_image_22)
    );
    
dbf_phase  dbf_phase_23(
    .clk(clk),
    
    .A(A23),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_23),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_23_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_23 ),
    .ph_image(ph_image_23)
    );
    
dbf_phase  dbf_phase_24(
    .clk(clk),
    
    .A(A24),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_24),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_24_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_24 ),
    .ph_image(ph_image_24)
    );

    dbf_phase  dbf_phase_25(
    .clk(clk),
    
    .A(A25),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_25),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_25_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_25 ),
    .ph_image(ph_image_25)
    );
    dbf_phase  dbf_phase_26(
    .clk(clk),
    
    .A(A26),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_26),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_26_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_26 ),
    .ph_image(ph_image_26)
    );
    dbf_phase  dbf_phase_27(
    .clk(clk),
    
    .A(A27),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_27),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_27_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_27 ),
    .ph_image(ph_image_27)
    );
    dbf_phase  dbf_phase_28(
    .clk(clk),
    
    .A(A28),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_28),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_28_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_28 ),
    .ph_image(ph_image_28)
    );
        dbf_phase  dbf_phase_29(
    .clk(clk),
    
    .A(A29),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_29),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_29_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_29 ),
    .ph_image(ph_image_29)
    );
    
dbf_phase  dbf_phase_30(
    .clk(clk),
    
    .A(A30),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_30),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_30_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_30 ),
    .ph_image(ph_image_30)
    );
    
dbf_phase  dbf_phase_31(
    .clk(clk),
    
    .A(A31),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_31),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_31_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_31 ),
    .ph_image(ph_image_31)
    );

    dbf_phase  dbf_phase_32(
    .clk(clk),
    
    .A(A32),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_32),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_32_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_32 ),
    .ph_image(ph_image_32)
    );
    dbf_phase  dbf_phase_33(
    .clk(clk),
    
    .A(A33),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_33),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_33_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_33 ),
    .ph_image(ph_image_33)
    );
    dbf_phase  dbf_phase_34(
    .clk(clk),
    
    .A(A34),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_34),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_34_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_34 ),
    .ph_image(ph_image_34)
    );
    dbf_phase  dbf_phase_35(
    .clk(clk),
    
    .A(A35),                         //  加权系数增益 ,满量程表示增益最大，增益为1
    .phase_data(phase_data_35),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
    .phase_data_im(phase_data_35_im),       //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
//    .phase_data_valid(phase_data_valid),  
    
    .ph_real (ph_real_35 ),
    .ph_image(ph_image_35)
    );
endmodule
