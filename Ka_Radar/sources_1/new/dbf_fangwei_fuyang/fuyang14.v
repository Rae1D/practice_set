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


module fuyang70(
    input clk,
    input [15:0] dataI,
    input [15:0] dataQ,
    input data_in_valid,
    input [2:0]fy_cut_ctl,
    
    input [15:0]A,
    input [15:0] ph_real_1  ,
    input [15:0] ph_real_2  ,
    input [15:0] ph_real_3  ,
    input [15:0] ph_real_4  ,
    input [15:0] ph_real_5  ,
    input [15:0] ph_real_6  ,
    input [15:0] ph_real_7  ,
    input [15:0] ph_real_8  ,
    input [15:0] ph_real_9  ,
    input [15:0] ph_real_10 ,
    input [15:0] ph_real_11 ,
    input [15:0] ph_real_12 ,
    input [15:0] ph_real_13 ,
    input [15:0] ph_real_14 ,
    input [15:0] ph_real_15 ,
    input [15:0] ph_real_16 ,
    input [15:0] ph_real_17 ,
    input [15:0] ph_real_18 ,
    input [15:0] ph_real_19 ,
    input [15:0] ph_real_20 ,
    input [15:0] ph_real_21 ,
    input [15:0] ph_real_22 ,
    input [15:0] ph_real_23 ,
    input [15:0] ph_real_24 ,
    input [15:0] ph_real_25 ,
    input [15:0] ph_real_26 ,
    input [15:0] ph_real_27 ,
    input [15:0] ph_real_28 ,
    input [15:0] ph_real_29 ,
    input [15:0] ph_real_30 ,
    input [15:0] ph_real_31 ,
    input [15:0] ph_real_32 ,
    input [15:0] ph_real_33 ,
    input [15:0] ph_real_34 ,
    input [15:0] ph_real_35 ,
    input [15:0] ph_real_36,
    input [15:0] ph_real_37,
    input [15:0] ph_real_38,
    input [15:0] ph_real_39,
    input [15:0] ph_real_40,
    input [15:0] ph_real_41,
    input [15:0] ph_real_42,
    input [15:0] ph_real_43,
    input [15:0] ph_real_44,
    input [15:0] ph_real_45,
    input [15:0] ph_real_46,
    input [15:0] ph_real_47,
    input [15:0] ph_real_48,
    input [15:0] ph_real_49,
    input [15:0] ph_real_50,
    input [15:0] ph_real_51,
    input [15:0] ph_real_52,
    input [15:0] ph_real_53,
    input [15:0] ph_real_54,
    input [15:0] ph_real_55,
    input [15:0] ph_real_56,
    input [15:0] ph_real_57,
    input [15:0] ph_real_58,
    input [15:0] ph_real_59,
    input [15:0] ph_real_60,
    input [15:0] ph_real_61,
    input [15:0] ph_real_62,
    input [15:0] ph_real_63,
    input [15:0] ph_real_64,
    input [15:0] ph_real_65,
    input [15:0] ph_real_66,
    input [15:0] ph_real_67,
    input [15:0] ph_real_68,
    input [15:0] ph_real_69,
    input [15:0] ph_real_70,
    input [15:0] ph_image_1  ,
    input [15:0] ph_image_2  ,
    input [15:0] ph_image_3  ,
    input [15:0] ph_image_4  ,
    input [15:0] ph_image_5  ,
    input [15:0] ph_image_6  ,
    input [15:0] ph_image_7  ,
    input [15:0] ph_image_8  ,
    input [15:0] ph_image_9  ,
    input [15:0] ph_image_10 ,
    input [15:0] ph_image_11 ,
    input [15:0] ph_image_12 ,
    input [15:0] ph_image_13 ,
    input [15:0] ph_image_14 ,
    input [15:0] ph_image_15 ,
    input [15:0] ph_image_16 ,
    input [15:0] ph_image_17 ,
    input [15:0] ph_image_18 ,
    input [15:0] ph_image_19 ,
    input [15:0] ph_image_20 ,
    input [15:0] ph_image_21 ,
    input [15:0] ph_image_22 ,
    input [15:0] ph_image_23 ,
    input [15:0] ph_image_24 ,
    input [15:0] ph_image_25 ,
    input [15:0] ph_image_26 ,
    input [15:0] ph_image_27 ,
    input [15:0] ph_image_28 ,
    input [15:0] ph_image_29 ,
    input [15:0] ph_image_30 ,
    input [15:0] ph_image_31 ,
    input [15:0] ph_image_32 ,
    input [15:0] ph_image_33 ,
    input [15:0] ph_image_34 ,
    input [15:0] ph_image_35 ,
    input [15:0] ph_image_36,
    input [15:0] ph_image_37,
    input [15:0] ph_image_38,
    input [15:0] ph_image_39,
    input [15:0] ph_image_40,
    input [15:0] ph_image_41,
    input [15:0] ph_image_42,
    input [15:0] ph_image_43,
    input [15:0] ph_image_44,
    input [15:0] ph_image_45,
    input [15:0] ph_image_46,
    input [15:0] ph_image_47,
    input [15:0] ph_image_48,
    input [15:0] ph_image_49,
    input [15:0] ph_image_50,
    input [15:0] ph_image_51,
    input [15:0] ph_image_52,
    input [15:0] ph_image_53,
    input [15:0] ph_image_54,
    input [15:0] ph_image_55,
    input [15:0] ph_image_56,
    input [15:0] ph_image_57,
    input [15:0] ph_image_58,
    input [15:0] ph_image_59,
    input [15:0] ph_image_60,
    input [15:0] ph_image_61,
    input [15:0] ph_image_62,
    input [15:0] ph_image_63,
    input [15:0] ph_image_64,
    input [15:0] ph_image_65,
    input [15:0] ph_image_66,
    input [15:0] ph_image_67,
    input [15:0] ph_image_68,
    input [15:0] ph_image_69,
    input [15:0] ph_image_70,
    input phase_data_valid,
    
    output [15:0]data_out_I_1,
    output [15:0]data_out_Q_1,
    output [15:0]data_out_I_2,
    output [15:0]data_out_Q_2,
    output [15:0]data_out_I_3,
    output [15:0]data_out_Q_3,
    output [15:0]data_out_I_4,
    output [15:0]data_out_Q_4,
    output [15:0]data_out_I_5,
    output [15:0]data_out_Q_5,
    output [15:0]data_out_I_6,
    output [15:0]data_out_Q_6,
    output [15:0]data_out_I_7,
    output [15:0]data_out_Q_7,
    output [15:0]data_out_I_8,
    output [15:0]data_out_Q_8,
    output [15:0]data_out_I_9,
    output [15:0]data_out_Q_9,
    output [15:0]data_out_I_10,
    output [15:0]data_out_Q_10,
    output [15:0]data_out_I_11,
    output [15:0]data_out_Q_11,
    output [15:0]data_out_I_12,
    output [15:0]data_out_Q_12,
    output [15:0]data_out_I_13,
    output [15:0]data_out_Q_13,
    output [15:0]data_out_I_14,
    output [15:0]data_out_Q_14,
    output [15:0]data_out_I_15,
    output [15:0]data_out_Q_15,
    output [15:0]data_out_I_16,
    output [15:0]data_out_Q_16,
    output [15:0]data_out_I_17,
    output [15:0]data_out_Q_17,
    output [15:0]data_out_I_18,
    output [15:0]data_out_Q_18,
    output [15:0]data_out_I_19,
    output [15:0]data_out_Q_19,
    output [15:0]data_out_I_20,
    output [15:0]data_out_Q_20,
    output [15:0]data_out_I_21,
    output [15:0]data_out_Q_21,
    output [15:0]data_out_I_22,
    output [15:0]data_out_Q_22,
    output [15:0]data_out_I_23,
    output [15:0]data_out_Q_23,
    output [15:0]data_out_I_24,
    output [15:0]data_out_Q_24,
    output [15:0]data_out_I_25,
    output [15:0]data_out_Q_25,
    output [15:0]data_out_I_26,
    output [15:0]data_out_Q_26,
    output [15:0]data_out_I_27,
    output [15:0]data_out_Q_27,
    output [15:0]data_out_I_28,
    output [15:0]data_out_Q_28,
    output [15:0]data_out_I_29,
    output [15:0]data_out_Q_29,
    output [15:0]data_out_I_30,
    output [15:0]data_out_Q_30,
    output [15:0]data_out_I_31,
    output [15:0]data_out_Q_31,
    output [15:0]data_out_I_32,
    output [15:0]data_out_Q_32,
    output [15:0]data_out_I_33,
    output [15:0]data_out_Q_33,
    output [15:0]data_out_I_34,
    output [15:0]data_out_Q_34,
    output [15:0]data_out_I_35,
    output [15:0]data_out_Q_35,
    output [15:0]data_out_I_36,
    output [15:0]data_out_Q_36,
    output [15:0]data_out_I_37,
    output [15:0]data_out_Q_37,
    output [15:0]data_out_I_38,
    output [15:0]data_out_Q_38,
    output [15:0]data_out_I_39,
    output [15:0]data_out_Q_39,
    output [15:0]data_out_I_40,
    output [15:0]data_out_Q_40,
    output [15:0]data_out_I_41,
    output [15:0]data_out_Q_41,
    output [15:0]data_out_I_42,
    output [15:0]data_out_Q_42,
    output [15:0]data_out_I_43,
    output [15:0]data_out_Q_43,
    output [15:0]data_out_I_44,
    output [15:0]data_out_Q_44,
    output [15:0]data_out_I_45 ,
    output [15:0]data_out_Q_45,
    output [15:0]data_out_I_46,
    output [15:0]data_out_Q_46,
    output [15:0]data_out_I_47,
    output [15:0]data_out_Q_47,
    output [15:0]data_out_I_48,
    output [15:0]data_out_Q_48,
    output [15:0]data_out_I_49,
    output [15:0]data_out_Q_49,
    output [15:0]data_out_I_50,
    output [15:0]data_out_Q_50,
    output [15:0]data_out_I_51,
    output [15:0]data_out_Q_51,
    output [15:0]data_out_I_52,
    output [15:0]data_out_Q_52,
    output [15:0]data_out_I_53,
    output [15:0]data_out_Q_53,
    output [15:0]data_out_I_54,
    output [15:0]data_out_Q_54,
    output [15:0]data_out_I_55,
    output [15:0]data_out_Q_55,
    output [15:0]data_out_I_56,
    output [15:0]data_out_Q_56,
    output [15:0]data_out_I_57,
    output [15:0]data_out_Q_57,
    output [15:0]data_out_I_58,
    output [15:0]data_out_Q_58,
    output [15:0]data_out_I_59,
    output [15:0]data_out_Q_59,
    output [15:0]data_out_I_60,
    output [15:0]data_out_Q_60,
    output [15:0]data_out_I_61,
    output [15:0]data_out_Q_61,
    output [15:0]data_out_I_62,
    output [15:0]data_out_Q_62,
    output [15:0]data_out_I_63,
    output [15:0]data_out_Q_63,
    output [15:0]data_out_I_64,
    output [15:0]data_out_Q_64,
    output [15:0]data_out_I_65,
    output [15:0]data_out_Q_65,
    output [15:0]data_out_I_66,
    output [15:0]data_out_Q_66,
    output [15:0]data_out_I_67,
    output [15:0]data_out_Q_67,
    output [15:0]data_out_I_68,
    output [15:0]data_out_Q_68,
    output [15:0]data_out_I_69,
    output [15:0]data_out_Q_69,
    output [15:0]data_out_I_70,
    output [15:0]data_out_Q_70,
    output data_out_valid  
    );
//    wire [31:0]data_sum_I1;
//    wire [31:0]data_sum_Q1;
//    wire [31:0]data_sum_I2;
//    wire [31:0]data_sum_Q2;
//    wire [31:0]data_sum_I3;
//    wire [31:0]data_sum_Q3;
//    wire [31:0]data_sum_I4;
//    wire [31:0]data_sum_Q4;
//    wire [31:0]data_sum_I5;
//    wire [31:0]data_sum_Q5;
//    wire [31:0]data_sum_I6;
//    wire [31:0]data_sum_Q6;
//    wire [31:0]data_sum_I7;
//    wire [31:0]data_sum_Q7;
//    wire [31:0]data_sum_I8;
//    wire [31:0]data_sum_Q8;
//    wire [31:0]data_sum_I9;
//    wire [31:0]data_sum_Q9;
//    wire [31:0]data_sum_I10;
//    wire [31:0]data_sum_Q10;
//    wire [31:0]data_sum_I11;
//    wire [31:0]data_sum_Q11;
//    wire [31:0]data_sum_I12;
//    wire [31:0]data_sum_Q12;
//    wire [31:0]data_sum_I13;
//    wire [31:0]data_sum_Q13;
//    wire [31:0]data_sum_I14;
//    wire [31:0]data_sum_Q14;
    
    
    
dbf_q_fy_save dbf_q_fy_1(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_1),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
        .ph_real(ph_real_1),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_1),
        .data_outQ(data_out_Q_1),
        .data_out_valid(data_out_valid)
         
         );      
         
 dbf_q_fy_save dbf_q_fy_2(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_2), //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_2),
                .phase_data_valid(phase_data_valid),        
                .fy_cut_ctl(fy_cut_ctl),   
                .data_outI(data_out_I_2),
                .data_outQ(data_out_Q_2),
                .data_out_valid()                
                 ); 
 
 dbf_q_fy_save dbf_q_fy_3(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_3), //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_3),
                .phase_data_valid(phase_data_valid),   
                .fy_cut_ctl(fy_cut_ctl),          
                .data_outI(data_out_I_3),
                .data_outQ(data_out_Q_3),
                .data_out_valid()                
                 ); 
  
  
  dbf_q_fy_save dbf_q_fy_4(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_4),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_4),
                .phase_data_valid(phase_data_valid), 
                .fy_cut_ctl(fy_cut_ctl),   
                .data_outI(data_out_I_4),
                .data_outQ(data_out_Q_4),
                .data_out_valid()                
                 );                                      
 
  dbf_q_fy_save dbf_q_fy_5(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_5),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_5),
                .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
                .data_outI(data_out_I_5),
                .data_outQ(data_out_Q_5),
                .data_out_valid()                
                 );     
                 
   dbf_q_fy_save dbf_q_fy_6(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_6),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_6),
               .phase_data_valid(phase_data_valid),    
                .fy_cut_ctl(fy_cut_ctl),     
               .data_outI(data_out_I_6),
               .data_outQ(data_out_Q_6),
               .data_out_valid()                
                );   
    dbf_q_fy_save dbf_q_fy_7(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_7),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_7),
                .phase_data_valid(phase_data_valid),   
                .fy_cut_ctl(fy_cut_ctl),      
                .data_outI(data_out_I_7),
                .data_outQ(data_out_Q_7),
                .data_out_valid()                
                 );     
                            
     dbf_q_fy_save dbf_q_fy_8(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                 .ph_image(ph_image_8),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_8),
                 .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
                 .data_outI(data_out_I_8),
                 .data_outQ(data_out_Q_8),
                 .data_out_valid()                
                  );     
                  
       
       dbf_q_fy_save dbf_q_fy_9(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
              .ph_image(ph_image_9),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_9),
                  .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
                  .data_outI(data_out_I_9),
                  .data_outQ(data_out_Q_9),
                  .data_out_valid()                
                   );                
  
     dbf_q_fy_save dbf_q_fy_10(
             .clk(clk),
             .dataI(dataI),  
             .dataQ(dataQ),
             .data_in_valid(data_in_valid),
             .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
             .ph_image(ph_image_10),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_10),
             .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
             .data_outI(data_out_I_10),
             .data_outQ(data_out_Q_10),
             .data_out_valid()                
              );                
 
 
     dbf_q_fy_save dbf_q_fy_11(
             .clk(clk),
             .dataI(dataI),  
             .dataQ(dataQ),
             .data_in_valid(data_in_valid),
             .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
             .ph_image(ph_image_11),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_11),
             .phase_data_valid(phase_data_valid),   
                .fy_cut_ctl(fy_cut_ctl),   
             .data_outI(data_out_I_11),
             .data_outQ(data_out_Q_11),
             .data_out_valid()                
              );    
              
  
     dbf_q_fy_save dbf_q_fy_12(
              .clk(clk),
              .dataI(dataI),  
              .dataQ(dataQ),
              .data_in_valid(data_in_valid),
              .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
              .ph_image(ph_image_12),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_12),
              .phase_data_valid(phase_data_valid),
                .fy_cut_ctl(fy_cut_ctl),     
              .data_outI(data_out_I_12),
              .data_outQ(data_out_Q_12),
              .data_out_valid()                
               );    
 
     dbf_q_fy_save dbf_q_fy_13(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
              .ph_image(ph_image_13),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_13),
               .phase_data_valid(phase_data_valid),    
                .fy_cut_ctl(fy_cut_ctl),   
               .data_outI(data_out_I_13),
               .data_outQ(data_out_Q_13),
               .data_out_valid()                
                );    

     dbf_q_fy_save dbf_q_fy_14(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_14),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_14),
               .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
               .data_outI(data_out_I_14),
               .data_outQ(data_out_Q_14),
               .data_out_valid()                
                ); 
 dbf_q_fy_save dbf_q_fy_15(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
         .ph_image(ph_image_15),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_15),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_15),
        .data_outQ(data_out_Q_15),
        .data_out_valid()
         
         );     
 dbf_q_fy_save dbf_q_fy_16(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_16),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_16),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_16),
        .data_outQ(data_out_Q_16),
        .data_out_valid()
         
         ); 
 dbf_q_fy_save dbf_q_fy_17(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_17),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_17),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_17),
        .data_outQ(data_out_Q_17),
        .data_out_valid()
         
         );            
 dbf_q_fy_save dbf_q_fy_18(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_18),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_18),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_18),
        .data_outQ(data_out_Q_18),
        .data_out_valid()
         
         );     
 dbf_q_fy_save dbf_q_fy_19(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_19),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_19),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_19),
        .data_outQ(data_out_Q_19),
        .data_out_valid()
         
         );  
 dbf_q_fy_save dbf_q_fy_20(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_20),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_20),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_20),
        .data_outQ(data_out_Q_20),
        .data_out_valid()
         
         );           
 dbf_q_fy_save dbf_q_fy_21(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
         .ph_image(ph_image_21),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_21),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_21),
        .data_outQ(data_out_Q_21),
        .data_out_valid()
         
         );          
dbf_q_fy_save dbf_q_fy_22(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_22),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_22),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_22),
        .data_outQ(data_out_Q_22),
        .data_out_valid()
         
         );  
dbf_q_fy_save dbf_q_fy_23(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_23),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_23),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_23),
        .data_outQ(data_out_Q_23),
        .data_out_valid()
         
         );  
dbf_q_fy_save dbf_q_fy_24(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_24),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_24),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_24),
        .data_outQ(data_out_Q_24),
        .data_out_valid()
         
         );      
 dbf_q_fy_save dbf_q_fy_25(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
      .ph_image(ph_image_25),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_25),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_25),
        .data_outQ(data_out_Q_25),
        .data_out_valid()
         
         );    
 dbf_q_fy_save dbf_q_fy_26(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_26),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_26),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_26),
        .data_outQ(data_out_Q_26),
        .data_out_valid()
         
         );      
 dbf_q_fy_save dbf_q_fy_27(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_27),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_27),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_27),
        .data_outQ(data_out_Q_27),
        .data_out_valid()
         
         ); 
 dbf_q_fy_save dbf_q_fy_28(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_28),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_28),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_28),
        .data_outQ(data_out_Q_28),
        .data_out_valid()
         
         ); 
  dbf_q_fy_save dbf_q_fy_29(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_29),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_29),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_29),
        .data_outQ(data_out_Q_29),
        .data_out_valid()
         
         );        
 dbf_q_fy_save dbf_q_fy_30(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_30),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_30),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_30),
        .data_outQ(data_out_Q_30),
        .data_out_valid()
         
         );     
dbf_q_fy_save dbf_q_fy_31(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
      .ph_image(ph_image_31),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_31),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_31),
        .data_outQ(data_out_Q_31),
        .data_out_valid()
         
         );     
dbf_q_fy_save dbf_q_fy_32(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_32),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_32),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_32),
        .data_outQ(data_out_Q_32),
        .data_out_valid()
         
         );  
 dbf_q_fy_save dbf_q_fy_33(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_33),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_33),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_33),
        .data_outQ(data_out_Q_33),
        .data_out_valid()
         
         );                                                                                                                                             
 dbf_q_fy_save dbf_q_fy_34(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
         .ph_image(ph_image_34),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_34),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_34),
        .data_outQ(data_out_Q_34),
        .data_out_valid()
         
         );
 dbf_q_fy_save dbf_q_fy_35(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
         .ph_image(ph_image_35),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_35),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_35),
        .data_outQ(data_out_Q_35),
        .data_out_valid()
         
         );    
         dbf_q_fy_save dbf_q_fy_36(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_36),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_36),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_36),
        .data_outQ(data_out_Q_36),
        .data_out_valid()
         
         );      
         
 dbf_q_fy_save dbf_q_fy_37(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_37),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_37),
                .phase_data_valid(phase_data_valid),        
                .fy_cut_ctl(fy_cut_ctl),   
                .data_outI(data_out_I_37),
                .data_outQ(data_out_Q_37),
                .data_out_valid()                
                 ); 
 
 dbf_q_fy_save dbf_q_fy_38(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_38),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_38),
                .phase_data_valid(phase_data_valid),   
                .fy_cut_ctl(fy_cut_ctl),          
                .data_outI(data_out_I_38),
                .data_outQ(data_out_Q_38),
                .data_out_valid()                
                 ); 
  
  
  dbf_q_fy_save dbf_q_fy_39(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_39),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_39),
                .phase_data_valid(phase_data_valid), 
                .fy_cut_ctl(fy_cut_ctl),   
                .data_outI(data_out_I_39),
                .data_outQ(data_out_Q_39),
                .data_out_valid()                
                 );                                      
 
  dbf_q_fy_save dbf_q_fy_40(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_40),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_40),
                .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
                .data_outI(data_out_I_40),
                .data_outQ(data_out_Q_40),
                .data_out_valid()                
                 );     
                 
   dbf_q_fy_save dbf_q_fy_41(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
            .ph_image(ph_image_41),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_41),
               .phase_data_valid(phase_data_valid),    
                .fy_cut_ctl(fy_cut_ctl),     
               .data_outI(data_out_I_41),
               .data_outQ(data_out_Q_41),
               .data_out_valid()                
                );   
    dbf_q_fy_save dbf_q_fy_42(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_42),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_42),
                .phase_data_valid(phase_data_valid),   
                .fy_cut_ctl(fy_cut_ctl),      
                .data_outI(data_out_I_42),
                .data_outQ(data_out_Q_42),
                .data_out_valid()                
                 );     
                            
     dbf_q_fy_save dbf_q_fy_43(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                 .ph_image(ph_image_43),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_43),
                 .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
                 .data_outI(data_out_I_43),
                 .data_outQ(data_out_Q_43),
                 .data_out_valid()                
                  );     
                  
       
       dbf_q_fy_save dbf_q_fy_44(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_44),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_44),
                  .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
                  .data_outI(data_out_I_44),
                  .data_outQ(data_out_Q_44),
                  .data_out_valid()                
                   );                
  
     dbf_q_fy_save dbf_q_fy_45(
             .clk(clk),
             .dataI(dataI),  
             .dataQ(dataQ),
             .data_in_valid(data_in_valid),
             .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
             .ph_image(ph_image_45),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_45),
             .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
             .data_outI(data_out_I_45),
             .data_outQ(data_out_Q_45),
             .data_out_valid()                
              );                
 
 
     dbf_q_fy_save dbf_q_fy_46(
             .clk(clk),
             .dataI(dataI),  
             .dataQ(dataQ),
             .data_in_valid(data_in_valid),
             .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
             .ph_image(ph_image_46),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_46),
             .phase_data_valid(phase_data_valid),   
                .fy_cut_ctl(fy_cut_ctl),   
             .data_outI(data_out_I_46),
             .data_outQ(data_out_Q_46),
             .data_out_valid()                
              );    
              
  
     dbf_q_fy_save dbf_q_fy_47(
              .clk(clk),
              .dataI(dataI),  
              .dataQ(dataQ),
              .data_in_valid(data_in_valid),
              .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
            .ph_image(ph_image_47),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_47),
              .phase_data_valid(phase_data_valid),
                .fy_cut_ctl(fy_cut_ctl),     
              .data_outI(data_out_I_47),
              .data_outQ(data_out_Q_47),
              .data_out_valid()                
               );    
 
     dbf_q_fy_save dbf_q_fy_48(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
             .ph_image(ph_image_48),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_48),
               .phase_data_valid(phase_data_valid),    
                .fy_cut_ctl(fy_cut_ctl),   
               .data_outI(data_out_I_48),
               .data_outQ(data_out_Q_48),
               .data_out_valid()                
                );    

     dbf_q_fy_save dbf_q_fy_49(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
             .ph_image(ph_image_49),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_49),
               .phase_data_valid(phase_data_valid),  
                .fy_cut_ctl(fy_cut_ctl),   
               .data_outI(data_out_I_49),
               .data_outQ(data_out_Q_49),
               .data_out_valid()                
                ); 
 dbf_q_fy_save dbf_q_fy_50(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
      .ph_image(ph_image_50),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_50),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_50),
        .data_outQ(data_out_Q_50),
        .data_out_valid()
         
         );     
 dbf_q_fy_save dbf_q_fy_51(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
         .ph_image(ph_image_51),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_51),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_51),
        .data_outQ(data_out_Q_51),
        .data_out_valid()
         
         ); 
 dbf_q_fy_save dbf_q_fy_52(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_52),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_52),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_52),
        .data_outQ(data_out_Q_52),
        .data_out_valid()
         
         );            
 dbf_q_fy_save dbf_q_fy_53(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_53),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_53),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_53),
        .data_outQ(data_out_Q_53),
        .data_out_valid()
         
         );     
 dbf_q_fy_save dbf_q_fy_54(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_54),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_54),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_54),
        .data_outQ(data_out_Q_54),
        .data_out_valid()
         
         );  
 dbf_q_fy_save dbf_q_fy_55(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_55),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_55),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_55),
        .data_outQ(data_out_Q_55),
        .data_out_valid()
         
         );           
 dbf_q_fy_save dbf_q_fy_56(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_56),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_56),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_56),
        .data_outQ(data_out_Q_56),
        .data_out_valid()
         
         );          
dbf_q_fy_save dbf_q_fy_57(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_57),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_57),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_57),
        .data_outQ(data_out_Q_57),
        .data_out_valid()
         
         );  
dbf_q_fy_save dbf_q_fy_58(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
      .ph_image(ph_image_58),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_58),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_58),
        .data_outQ(data_out_Q_58),
        .data_out_valid()
         
         );  
dbf_q_fy_save dbf_q_fy_59(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_59),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_59),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_59),
        .data_outQ(data_out_Q_59),
        .data_out_valid()
         
         );      
 dbf_q_fy_save dbf_q_fy_60(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_60),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_60),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_60),
        .data_outQ(data_out_Q_60),
        .data_out_valid()
         
         );    
 dbf_q_fy_save dbf_q_fy_61(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
         .ph_image(ph_image_61),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_61),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_61),
        .data_outQ(data_out_Q_61),
        .data_out_valid()
         
         );      
 dbf_q_fy_save dbf_q_fy_62(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_62),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_62),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_62),
        .data_outQ(data_out_Q_62),
        .data_out_valid()
         
         ); 
 dbf_q_fy_save dbf_q_fy_63(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_63),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_63),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_63),
        .data_outQ(data_out_Q_63),
        .data_out_valid()
         
         ); 
  dbf_q_fy_save dbf_q_fy_64(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_64),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_64),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_64),
        .data_outQ(data_out_Q_64),
        .data_out_valid()
         
         );        
 dbf_q_fy_save dbf_q_fy_65(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
     .ph_image(ph_image_65),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_65),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_65),
        .data_outQ(data_out_Q_65),
        .data_out_valid()
         
         );     
dbf_q_fy_save dbf_q_fy_66(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
     .ph_image(ph_image_66),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_66),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_66),
        .data_outQ(data_out_Q_66),
        .data_out_valid()
         
         );     
dbf_q_fy_save dbf_q_fy_67(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
       .ph_image(ph_image_67),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_67),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_67),
        .data_outQ(data_out_Q_67),
        .data_out_valid()
         
         );  
 dbf_q_fy_save dbf_q_fy_68(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_68),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_68),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_68),
        .data_outQ(data_out_Q_68),
        .data_out_valid()
         
         );                                                                                                                                             
 dbf_q_fy_save dbf_q_fy_69(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_69),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_69),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_69),
        .data_outQ(data_out_Q_69),
        .data_out_valid()
         
         );
 dbf_q_fy_save dbf_q_fy_70(
        .clk(clk),
        .dataI(dataI),  
        .dataQ(dataQ),
        .data_in_valid(data_in_valid),
        .A(A),           //  加权系数增益 ,满量程表示增益最大，增益为1
      .ph_image(ph_image_70),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_70),
        .phase_data_valid(phase_data_valid), 
        .fy_cut_ctl(fy_cut_ctl),
                 
        .data_outI(data_out_I_70),
        .data_outQ(data_out_Q_70),
        .data_out_valid()
         
         );                                                    
//assign   data_out_I_1 = data_sum_I1[31:16];                  
//assign   data_out_Q_1 = data_sum_Q1[31:16];                  
//assign   data_out_I_2 = data_sum_I2[31:16];                  
//assign   data_out_Q_2 = data_sum_Q2[31:16];                  
//assign   data_out_I_3 = data_sum_I3[31:16];                  
//assign   data_out_Q_3 = data_sum_Q3[31:16];                  
//assign   data_out_I_4 = data_sum_I4[31:16];                  
//assign   data_out_Q_4 = data_sum_Q4[31:16];                  
//assign   data_out_I_5 = data_sum_I5[31:16];                  
//assign   data_out_Q_5 = data_sum_Q5[31:16];                  
//assign   data_out_I_6 = data_sum_I6[31:16];                  
//assign   data_out_Q_6 = data_sum_Q6[31:16];                  
//assign   data_out_I_7 = data_sum_I7[31:16];                  
//assign   data_out_Q_7 = data_sum_Q7[31:16];                  
//assign   data_out_I_8 = data_sum_I8[31:16];                  
//assign   data_out_Q_8 = data_sum_Q8[31:16];                  
//assign   data_out_I_9 = data_sum_I9[31:16];                  
//assign   data_out_Q_9 = data_sum_Q9[31:16];                  
//assign   data_out_I_10 = data_sum_I10[31:16];                  
//assign   data_out_Q_10 = data_sum_Q10[31:16];                  
//assign   data_out_I_11 = data_sum_I11[31:16];                  
//assign   data_out_Q_11 = data_sum_Q11[31:16];                  
//assign   data_out_I_12 = data_sum_I12[31:16];                  
//assign   data_out_Q_12 = data_sum_Q12[31:16];                  
//assign   data_out_I_13 = data_sum_I13[31:16];                  
//assign   data_out_Q_13 = data_sum_Q13[31:16];                  
//assign   data_out_I_14 = data_sum_I14[31:16];                  
//assign   data_out_Q_14 = data_sum_Q14[31:16];                  
        
    
    
    
    
    
endmodule
