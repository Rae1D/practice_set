`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 12:09:29
// Design Name: 
// Module Name: dbf_v1
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


module dbf_v1(
    input clk,
    input [15:0] dataI,
    input [15:0] dataQ,
    input data_in_valid,
    input [2:0]fw_cut_ctl,
    
    input [15:0]A_1  ,
    input [15:0]A_2  , 
    input [15:0]A_3  ,
    input [15:0]A_4  ,
    input [15:0]A_5  ,
    input [15:0]A_6  ,
    input [15:0]A_7  ,
    input [15:0]A_8  ,
    input [15:0]A_9  ,
    input [15:0]A_10 ,
    input [15:0]A_11 ,
    input [15:0]A_12 ,
    input [15:0]A_13 ,
    input [15:0]A_14 ,
    input [15:0]A_15 ,
    input [15:0]A_16 ,
    input [15:0]A_17 ,
    input [15:0]A_18 ,
    input [15:0]A_19 ,
    input [15:0]A_20 ,
    input [15:0]A_21 ,
    input [15:0]A_22 ,
    input [15:0]A_23 ,
    input [15:0]A_24 ,

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
    
    input phase_data_valid,
    
    output [15:0]add_out_I,
    output [15:0]add_out_Q,
    output data_out_valid_1,
    
    
    
   output [31:0]data_sum_I1,
   output [31:0]data_sum_Q1,
   output [31:0]data_sum_I2,
   output [31:0]data_sum_Q2,
   output [31:0]data_sum_I3,
   output [31:0]data_sum_Q3,
   output [31:0]data_sum_I4,
   output [31:0]data_sum_Q4,
   output [31:0]data_sum_I5,
   output [31:0]data_sum_Q5,
   output [31:0]data_sum_I6,
   output [31:0]data_sum_Q6,
   output [31:0]data_sum_I7,
   output [31:0]data_sum_Q7,
   output [31:0]data_sum_I8,
   output [31:0]data_sum_Q8,
   output [31:0]data_sum_I9,
   output [31:0]data_sum_Q9,
   output [31:0]data_sum_I10,
   output [31:0]data_sum_Q10,
   output [31:0]data_sum_I11,
   output [31:0]data_sum_Q11,
   output [31:0]data_sum_I12,
   output [31:0]data_sum_Q12,
   output [31:0]data_sum_I13,
   output [31:0]data_sum_Q13,
   output [31:0]data_sum_I14,
   output [31:0]data_sum_Q14,
   output [31:0]data_sum_I15,
   output [31:0]data_sum_Q15,
   output [31:0]data_sum_I16,
   output [31:0]data_sum_Q16, 
   output [31:0]data_sum_I17,
   output [31:0]data_sum_Q17,
   output [31:0]data_sum_I18,
   output [31:0]data_sum_Q18,
   output [31:0]data_sum_I19,
   output [31:0]data_sum_Q19,
   output [31:0]data_sum_I20,
   output [31:0]data_sum_Q20,
   output [31:0]data_sum_I21,
   output [31:0]data_sum_Q21,
   output [31:0]data_sum_I22,
   output [31:0]data_sum_Q22,  
   output [31:0]data_sum_I23,
   output [31:0]data_sum_Q23,
   output [31:0]data_sum_I24,
   output [31:0]data_sum_Q24
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
//    wire [31:0]data_sum_I15;
//    wire [31:0]data_sum_Q15;
//    wire [31:0]data_sum_I16;
//    wire [31:0]data_sum_Q16;
    
    wire data_out_valid;
    reg data_out_valid_t;
       
 dbf_q dbf_q_1(
          .clk(clk),
          .dataI(dataI),  
          .dataQ(dataQ),
          .data_in_valid(data_in_valid),
          .A(A_1),           //  加权系数增益 ,满量程表示增益最大，增益为1
        .ph_image(ph_image_1),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
        .ph_real(ph_real_1),
          .phase_data_valid(phase_data_valid),          
          .data_outI(data_sum_I1),
          .data_outQ(data_sum_Q1),
          .data_out_valid(data_out_valid)
           
           );      
           
   dbf_q dbf_q_2(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_2),           //  加权系数增益 ,满量程表示增益最大，增益为1
                   .ph_image(ph_image_2), //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_2),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I2),
                  .data_outQ(data_sum_Q2),
                  .data_out_valid()                
                   ); 
   
   dbf_q dbf_q_3(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_3),           //  加权系数增益 ,满量程表示增益最大，增益为1
                   .ph_image(ph_image_3), //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_3),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I3),
                  .data_outQ(data_sum_Q3),
                  .data_out_valid()                
                   ); 
    
    
    dbf_q dbf_q_4(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_4),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_4),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_4),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I4),
                  .data_outQ(data_sum_Q4),
                  .data_out_valid()                
                   );                                      
   
    dbf_q dbf_q_5(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_5),           //  加权系数增益 ,满量程表示增益最大，增益为1
                    .ph_image(ph_image_5),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_5),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I5),
                  .data_outQ(data_sum_Q5),
                  .data_out_valid()                
                   );     
                   
     dbf_q dbf_q_6(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A_6),           //  加权系数增益 ,满量程表示增益最大，增益为1
  .ph_image(ph_image_6),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_6),
                 .phase_data_valid(phase_data_valid),          
                 .data_outI(data_sum_I6),
                 .data_outQ(data_sum_Q6),
                 .data_out_valid()                
                  );   
      dbf_q dbf_q_7(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_7),           //  加权系数增益 ,满量程表示增益最大，增益为1
                    .ph_image(ph_image_7),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_7),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I7),
                  .data_outQ(data_sum_Q7),
                  .data_out_valid()                
                   );     
                              
       dbf_q dbf_q_8(
                   .clk(clk),
                   .dataI(dataI),  
                   .dataQ(dataQ),
                   .data_in_valid(data_in_valid),
                   .A(A_8),           //  加权系数增益 ,满量程表示增益最大，增益为1
                   .ph_image(ph_image_8),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
                .ph_real(ph_real_8),
                   .phase_data_valid(phase_data_valid),          
                   .data_outI(data_sum_I8),
                   .data_outQ(data_sum_Q8),
                   .data_out_valid()                
                    );     
                    
         
         dbf_q dbf_q_9(
                    .clk(clk),
                    .dataI(dataI),  
                    .dataQ(dataQ),
                    .data_in_valid(data_in_valid),
                    .A(A_9),           //  加权系数增益 ,满量程表示增益最大，增益为1
                    .ph_image(ph_image_9),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_9),
                    .phase_data_valid(phase_data_valid),          
                    .data_outI(data_sum_I9),
                    .data_outQ(data_sum_Q9),
                    .data_out_valid()                
                     );                
    
       dbf_q dbf_q_10(
                    .clk(clk),
                    .dataI(dataI),  
                    .dataQ(dataQ),
                    .data_in_valid(data_in_valid),
                    .A(A_10),           //  加权系数增益 ,满量程表示增益最大，增益为1
                  .ph_image(ph_image_10),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_10),
                    .phase_data_valid(phase_data_valid),          
                    .data_outI(data_sum_I10),
                    .data_outQ(data_sum_Q10),
                    .data_out_valid()                
                     );  
   
   
       dbf_q dbf_q_11(
               .clk(clk),
               .dataI(dataI),  
               .dataQ(dataQ),
               .data_in_valid(data_in_valid),
               .A(A_11),           //  加权系数增益 ,满量程表示增益最大，增益为1
            .ph_image(ph_image_11),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_11),
               .phase_data_valid(phase_data_valid),          
               .data_outI(data_sum_I11),
               .data_outQ(data_sum_Q11),
               .data_out_valid()                
                );    
                
    
       dbf_q dbf_q_12(
                .clk(clk),
                .dataI(dataI),  
                .dataQ(dataQ),
                .data_in_valid(data_in_valid),
                .A(A_12),           //  加权系数增益 ,满量程表示增益最大，增益为1
                     .ph_image(ph_image_12),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_12),
                .phase_data_valid(phase_data_valid),          
                .data_outI(data_sum_I12),
                .data_outQ(data_sum_Q12),
                .data_out_valid()                
                 );    
   
       dbf_q dbf_q_13(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A_13),           //  加权系数增益 ,满量程表示增益最大，增益为1
            .ph_image(ph_image_13),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_13),
                 .phase_data_valid(phase_data_valid),          
                 .data_outI(data_sum_I13),
                 .data_outQ(data_sum_Q13),
                 .data_out_valid()                
                  );    

       dbf_q dbf_q_14(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A_14),           //  加权系数增益 ,满量程表示增益最大，增益为1
                  .ph_image(ph_image_14),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_14),
                 .phase_data_valid(phase_data_valid),          
                 .data_outI(data_sum_I14),
                 .data_outQ(data_sum_Q14),
                 .data_out_valid()                
                  );    

       dbf_q dbf_q_15(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A_15),           //  加权系数增益 ,满量程表示增益最大，增益为1
                  .ph_image(ph_image_15),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_15),
                 .phase_data_valid(phase_data_valid),          
                 .data_outI(data_sum_I15),
                 .data_outQ(data_sum_Q15),
                 .data_out_valid()                
                  );    

       dbf_q dbf_q_16(
                 .clk(clk),
                 .dataI(dataI),  
                 .dataQ(dataQ),
                 .data_in_valid(data_in_valid),
                 .A(A_16),           //  加权系数增益 ,满量程表示增益最大，增益为1
               .ph_image(ph_image_16),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_16),
                 .phase_data_valid(phase_data_valid),          
                 .data_outI(data_sum_I16),
                 .data_outQ(data_sum_Q16),
                 .data_out_valid()                
                  );  
         dbf_q dbf_q_17(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_17),           //  加权系数增益 ,满量程表示增益最大，增益为1
          .ph_image(ph_image_17),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_17),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I17),
                  .data_outQ(data_sum_Q17),
                  .data_out_valid()                
                   ); 
     dbf_q dbf_q_18(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_18),           //  加权系数增益 ,满量程表示增益最大，增益为1
     .ph_image(ph_image_18),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_18),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I18),
                  .data_outQ(data_sum_Q18),
                  .data_out_valid()                
                   ); 
        
           dbf_q dbf_q_19(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_19),           //  加权系数增益 ,满量程表示增益最大，增益为1
                   .ph_image(ph_image_19),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_19),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I19),
                  .data_outQ(data_sum_Q19),
                  .data_out_valid()                
                   ); 
            dbf_q dbf_q_20(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_20),           //  加权系数增益 ,满量程表示增益最大，增益为1
                .ph_image(ph_image_20),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_20),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I20),
                  .data_outQ(data_sum_Q20),
                  .data_out_valid()                
                   ); 
            dbf_q dbf_q_21(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_21),           //  加权系数增益 ,满量程表示增益最大，增益为1
                 .ph_image(ph_image_21),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_21),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I21),
                  .data_outQ(data_sum_Q21),
                  .data_out_valid()                
                   ); 
             dbf_q dbf_q_22(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_22),           //  加权系数增益 ,满量程表示增益最大，增益为1
                      .ph_image(ph_image_22),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_22),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I22),
                  .data_outQ(data_sum_Q22),
                  .data_out_valid()                
                   ); 
              dbf_q dbf_q_23(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_23),           //  加权系数增益 ,满量程表示增益最大，增益为1
                     .ph_image(ph_image_23),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_23),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I23),
                  .data_outQ(data_sum_Q23),
                  .data_out_valid()                
                   ); 
              dbf_q dbf_q_24(
                  .clk(clk),
                  .dataI(dataI),  
                  .dataQ(dataQ),
                  .data_in_valid(data_in_valid),
                  .A(A_24),           //  加权系数增益 ,满量程表示增益最大，增益为1
                    .ph_image(ph_image_24),  //加权相位,数据类型是fxi16_13，输入范围【-pi，+pi】*2^13
               .ph_real(ph_real_24),
                  .phase_data_valid(phase_data_valid),          
                  .data_outI(data_sum_I24),
                  .data_outQ(data_sum_Q24),
                  .data_out_valid()                
                   ); 

///////////////////////////////////////////////////////////////////////////////
wire [36:0]add_out_I_t;
wire [36:0]add_out_Q_t;
wire add_out_valid;
   add_24 add_24_I(
       .clk(clk),
       .data_in1(data_sum_I1),
       .data_in2(data_sum_I2),
       .data_in3(data_sum_I3),
       .data_in4(data_sum_I4),
       .data_in5(data_sum_I5),
       .data_in6(data_sum_I6),
       .data_in7(data_sum_I7),
       .data_in8(data_sum_I8),
       .data_in9(data_sum_I9),
       .data_in10(data_sum_I10),
       .data_in11(data_sum_I11),
       .data_in12(data_sum_I12),
       .data_in13(data_sum_I13),        
       .data_in14(data_sum_I14),
       .data_in15(data_sum_I15),
       .data_in16(data_sum_I16),
       .data_in17(data_sum_I17),
       .data_in18(data_sum_I18),
       .data_in19(data_sum_I19),
       .data_in20(data_sum_I20),
       .data_in21(data_sum_I21),        
       .data_in22(data_sum_I22),
       .data_in23(data_sum_I23),
       .data_in24(data_sum_I24),
       .in_valid(data_out_valid),
       
       .out_valid(add_out_valid),        
       .data_add_out(add_out_I_t)  
       );         
add_24 add_24_Q(
       .clk(clk),
       .data_in1(data_sum_Q1),
       .data_in2(data_sum_Q2),
       .data_in3(data_sum_Q3),
       .data_in4(data_sum_Q4),
       .data_in5(data_sum_Q5),
       .data_in6(data_sum_Q6),
       .data_in7(data_sum_Q7),
       .data_in8(data_sum_Q8),
       .data_in9(data_sum_Q9),
       .data_in10(data_sum_Q10),
       .data_in11(data_sum_Q11),
       .data_in12(data_sum_Q12),
       .data_in13(data_sum_Q13),
       .data_in14(data_sum_Q14),
       .data_in15(data_sum_Q15),
       .data_in16(data_sum_Q16),
       .data_in17(data_sum_Q17),
       .data_in18(data_sum_Q18),
       .data_in19(data_sum_Q19),
       .data_in20(data_sum_Q20),
       .data_in21(data_sum_Q21),
       .data_in22(data_sum_Q22),
       .data_in23(data_sum_Q23),
       .data_in24(data_sum_Q24),
       .in_valid(data_out_valid),
       
       .out_valid(),    
       .data_add_out(add_out_Q_t) 
       );     
/////////////////////////////////////////////////////////
cut_ctl_top #(.LEN(37)) fw_cut(
    .clk(clk),
    .data_i(add_out_I_t),
    .data_q(add_out_Q_t),
    .in_valid(add_out_valid),
    .cut_ctl(fw_cut_ctl),
    
    .data_out_i(add_out_I),
    .data_out_q(add_out_Q),
    .out_valid(data_out_valid_1)
);


    
endmodule
