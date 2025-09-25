`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/05 09:47:36
// Design Name: 
// Module Name: add_1_35
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


module add_1_35(
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
    output [21:0]sum_1_35_I,
    output [21:0]sum_1_35_Q,
    output data_out_valid  
    
    );
    wire [21:0] in_1_I;
    wire [21:0] in_1_Q;
    wire [21:0] in_2_I;
    wire [21:0] in_2_Q;
    wire [21:0] in_3_I;
    wire [21:0] in_3_Q;
    wire [21:0] in_4_I;
    wire [21:0] in_4_Q;
    wire [21:0] in_5_I;
    wire [21:0] in_5_Q;
    wire [21:0] in_6_I;
    wire [21:0] in_6_Q;
    wire [21:0] in_7_I;
    wire [21:0] in_7_Q;
    wire [21:0] in_8_I;
    wire [21:0] in_8_Q;
    wire [21:0] in_9_I;
    wire [21:0] in_9_Q;
    wire [21:0] in_10_I;
    wire [21:0] in_10_Q;
    wire [21:0] in_11_I;
    wire [21:0] in_11_Q;
    wire [21:0] in_12_I;
    wire [21:0] in_12_Q;
    wire [21:0] in_13_I;
    wire [21:0] in_13_Q;
    wire [21:0] in_14_I;
    wire [21:0] in_14_Q;
    wire [21:0] in_15_I;
    wire [21:0] in_15_Q;
    wire [21:0] in_16_I;
    wire [21:0] in_16_Q;
    wire [21:0] in_17_I;
    wire [21:0] in_17_Q;
    wire [21:0] in_18_I;
    wire [21:0] in_18_Q;
    wire [21:0] in_19_I;
    wire [21:0] in_19_Q;
    wire [21:0] in_20_I;
    wire [21:0] in_20_Q;
    wire [21:0] in_21_I;
    wire [21:0] in_21_Q;
    wire [21:0] in_22_I;
    wire [21:0] in_22_Q;
    wire [21:0] in_23_I;
    wire [21:0] in_23_Q;
    wire [21:0] in_24_I;
    wire [21:0] in_24_Q;
    wire [21:0] in_25_I;
    wire [21:0] in_25_Q;
    wire [21:0] in_26_I;
    wire [21:0] in_26_Q;
    wire [21:0] in_27_I;
    wire [21:0] in_27_Q;
    wire [21:0] in_28_I;
    wire [21:0] in_28_Q;
    wire [21:0] in_29_I;
    wire [21:0] in_29_Q;
    wire [21:0] in_30_I;
    wire [21:0] in_30_Q;
    wire [21:0] in_31_I;
    wire [21:0] in_31_Q;
    wire [21:0] in_32_I;
    wire [21:0] in_32_Q;
    wire [21:0] in_33_I;
    wire [21:0] in_33_Q;
    wire [21:0] in_34_I;
    wire [21:0] in_34_Q;
    wire [21:0] in_35_I;
    wire [21:0] in_35_Q;
       
    
    
assign in_1_I = {data_in_I1[15],data_in_I1[15],data_in_I1[15],data_in_I1[15],data_in_I1[15],data_in_I1[15],data_in_I1[15:0]};
assign in_1_Q = {data_in_Q1[15],data_in_Q1[15],data_in_Q1[15],data_in_Q1[15],data_in_Q1[15],data_in_Q1[15],data_in_Q1[15:0]};
assign in_2_I = {data_in_I2[15],data_in_I2[15],data_in_I2[15],data_in_I2[15],data_in_I2[15],data_in_I2[15],data_in_I2[15:0]};
assign in_2_Q = {data_in_Q2[15],data_in_Q2[15],data_in_Q2[15],data_in_Q2[15],data_in_Q2[15],data_in_Q2[15],data_in_Q2[15:0]};
assign in_3_I = {data_in_I3[15],data_in_I3[15],data_in_I3[15],data_in_I3[15],data_in_I3[15],data_in_I3[15],data_in_I3[15:0]};
assign in_3_Q = {data_in_Q3[15],data_in_Q3[15],data_in_Q3[15],data_in_Q3[15],data_in_Q3[15],data_in_Q3[15],data_in_Q3[15:0]};
assign in_4_I = {data_in_I4[15],data_in_I4[15],data_in_I4[15],data_in_I4[15],data_in_I4[15],data_in_I4[15],data_in_I4[15:0]};
assign in_4_Q = {data_in_Q4[15],data_in_Q4[15],data_in_Q4[15],data_in_Q4[15],data_in_Q4[15],data_in_Q4[15],data_in_Q4[15:0]};
assign in_5_I = {data_in_I5[15],data_in_I5[15],data_in_I5[15],data_in_I5[15],data_in_I5[15],data_in_I5[15],data_in_I5[15:0]};
assign in_5_Q = {data_in_Q5[15],data_in_Q5[15],data_in_Q5[15],data_in_Q5[15],data_in_Q5[15],data_in_Q5[15],data_in_Q5[15:0]};
assign in_6_I = {data_in_I6[15],data_in_I6[15],data_in_I6[15],data_in_I6[15],data_in_I6[15],data_in_I6[15],data_in_I6[15:0]};
assign in_6_Q = {data_in_Q6[15],data_in_Q6[15],data_in_Q6[15],data_in_Q6[15],data_in_Q6[15],data_in_Q6[15],data_in_Q6[15:0]};
assign in_7_I = {data_in_I7[15],data_in_I7[15],data_in_I7[15],data_in_I7[15],data_in_I7[15],data_in_I7[15],data_in_I7[15:0]};
assign in_7_Q = {data_in_Q7[15],data_in_Q7[15],data_in_Q7[15],data_in_Q7[15],data_in_Q7[15],data_in_Q7[15],data_in_Q7[15:0]}; 
assign in_8_I = {data_in_I8[15],data_in_I8[15],data_in_I8[15],data_in_I8[15],data_in_I8[15],data_in_I8[15],data_in_I8[15:0]};
assign in_8_Q = {data_in_Q8[15],data_in_Q8[15],data_in_Q8[15],data_in_Q8[15],data_in_Q8[15],data_in_Q8[15],data_in_Q8[15:0]};
assign in_9_I = {data_in_I9[15],data_in_I9[15],data_in_I9[15],data_in_I9[15],data_in_I9[15],data_in_I9[15],data_in_I9[15:0]};
assign in_9_Q = {data_in_Q9[15],data_in_Q9[15],data_in_Q9[15],data_in_Q9[15],data_in_Q9[15],data_in_Q9[15],data_in_Q9[15:0]};
assign in_10_I = {data_in_I10[15],data_in_I10[15],data_in_I10[15],data_in_I10[15],data_in_I10[15],data_in_I10[15],data_in_I10[15:0]};
assign in_10_Q = {data_in_Q10[15],data_in_Q10[15],data_in_Q10[15],data_in_Q10[15],data_in_Q10[15],data_in_Q10[15],data_in_Q10[15:0]};
assign in_11_I = {data_in_I11[15],data_in_I11[15],data_in_I11[15],data_in_I11[15],data_in_I11[15],data_in_I11[15],data_in_I11[15:0]};
assign in_11_Q = {data_in_Q11[15],data_in_Q11[15],data_in_Q11[15],data_in_Q11[15],data_in_Q11[15],data_in_Q11[15],data_in_Q11[15:0]};
assign in_12_I = {data_in_I12[15],data_in_I12[15],data_in_I12[15],data_in_I12[15],data_in_I12[15],data_in_I12[15],data_in_I12[15:0]};
assign in_12_Q = {data_in_Q12[15],data_in_Q12[15],data_in_Q12[15],data_in_Q12[15],data_in_Q12[15],data_in_Q12[15],data_in_Q12[15:0]};
assign in_13_I = {data_in_I13[15],data_in_I13[15],data_in_I13[15],data_in_I13[15],data_in_I13[15],data_in_I13[15],data_in_I13[15:0]};
assign in_13_Q = {data_in_Q13[15],data_in_Q13[15],data_in_Q13[15],data_in_Q13[15],data_in_Q13[15],data_in_Q13[15],data_in_Q13[15:0]};
assign in_14_I = {data_in_I14[15],data_in_I14[15],data_in_I14[15],data_in_I14[15],data_in_I14[15],data_in_I14[15],data_in_I14[15:0]};
assign in_14_Q = {data_in_Q14[15],data_in_Q14[15],data_in_Q14[15],data_in_Q14[15],data_in_Q14[15],data_in_Q14[15],data_in_Q14[15:0]}; 
assign in_15_I = {data_in_I15[15],data_in_I15[15],data_in_I15[15],data_in_I15[15],data_in_I15[15],data_in_I15[15],data_in_I15[15:0]};
assign in_15_Q = {data_in_Q15[15],data_in_Q15[15],data_in_Q15[15],data_in_Q15[15],data_in_Q15[15],data_in_Q15[15],data_in_Q15[15:0]};
assign in_16_I = {data_in_I16[15],data_in_I16[15],data_in_I16[15],data_in_I16[15],data_in_I16[15],data_in_I16[15],data_in_I16[15:0]};
assign in_16_Q = {data_in_Q16[15],data_in_Q16[15],data_in_Q16[15],data_in_Q16[15],data_in_Q16[15],data_in_Q16[15],data_in_Q16[15:0]};
assign in_17_I = {data_in_I17[15],data_in_I17[15],data_in_I17[15],data_in_I17[15],data_in_I17[15],data_in_I17[15],data_in_I17[15:0]};
assign in_17_Q = {data_in_Q17[15],data_in_Q17[15],data_in_Q17[15],data_in_Q17[15],data_in_Q17[15],data_in_Q17[15],data_in_Q17[15:0]};
assign in_18_I = {data_in_I18[15],data_in_I18[15],data_in_I18[15],data_in_I18[15],data_in_I18[15],data_in_I18[15],data_in_I18[15:0]};
assign in_18_Q = {data_in_Q18[15],data_in_Q18[15],data_in_Q18[15],data_in_Q18[15],data_in_Q18[15],data_in_Q18[15],data_in_Q18[15:0]};
assign in_19_I = {data_in_I19[15],data_in_I19[15],data_in_I19[15],data_in_I19[15],data_in_I19[15],data_in_I19[15],data_in_I19[15:0]};
assign in_19_Q = {data_in_Q19[15],data_in_Q19[15],data_in_Q19[15],data_in_Q19[15],data_in_Q19[15],data_in_Q19[15],data_in_Q19[15:0]};
assign in_20_I = {data_in_I20[15],data_in_I20[15],data_in_I20[15],data_in_I20[15],data_in_I20[15],data_in_I20[15],data_in_I20[15:0]};
assign in_20_Q = {data_in_Q20[15],data_in_Q20[15],data_in_Q20[15],data_in_Q20[15],data_in_Q20[15],data_in_Q20[15],data_in_Q20[15:0]};
assign in_21_I = {data_in_I21[15],data_in_I21[15],data_in_I21[15],data_in_I21[15],data_in_I21[15],data_in_I21[15],data_in_I21[15:0]};
assign in_21_Q = {data_in_Q21[15],data_in_Q21[15],data_in_Q21[15],data_in_Q21[15],data_in_Q21[15],data_in_Q21[15],data_in_Q21[15:0]}; 
assign in_22_I = {data_in_I22[15],data_in_I22[15],data_in_I22[15],data_in_I22[15],data_in_I22[15],data_in_I22[15],data_in_I22[15:0]};
assign in_22_Q = {data_in_Q22[15],data_in_Q22[15],data_in_Q22[15],data_in_Q22[15],data_in_Q22[15],data_in_Q22[15],data_in_Q22[15:0]};
assign in_23_I = {data_in_I23[15],data_in_I23[15],data_in_I23[15],data_in_I23[15],data_in_I23[15],data_in_I23[15],data_in_I23[15:0]};
assign in_23_Q = {data_in_Q23[15],data_in_Q23[15],data_in_Q23[15],data_in_Q23[15],data_in_Q23[15],data_in_Q23[15],data_in_Q23[15:0]};
assign in_24_I = {data_in_I24[15],data_in_I24[15],data_in_I24[15],data_in_I24[15],data_in_I24[15],data_in_I24[15],data_in_I24[15:0]};
assign in_24_Q = {data_in_Q24[15],data_in_Q24[15],data_in_Q24[15],data_in_Q24[15],data_in_Q24[15],data_in_Q24[15],data_in_Q24[15:0]};
assign in_25_I = {data_in_I25[15],data_in_I25[15],data_in_I25[15],data_in_I25[15],data_in_I25[15],data_in_I25[15],data_in_I25[15:0]};
assign in_25_Q = {data_in_Q25[15],data_in_Q25[15],data_in_Q25[15],data_in_Q25[15],data_in_Q25[15],data_in_Q25[15],data_in_Q25[15:0]};
assign in_26_I = {data_in_I26[15],data_in_I26[15],data_in_I26[15],data_in_I26[15],data_in_I26[15],data_in_I26[15],data_in_I26[15:0]};
assign in_26_Q = {data_in_Q26[15],data_in_Q26[15],data_in_Q26[15],data_in_Q26[15],data_in_Q26[15],data_in_Q26[15],data_in_Q26[15:0]};
assign in_27_I = {data_in_I27[15],data_in_I27[15],data_in_I27[15],data_in_I27[15],data_in_I27[15],data_in_I27[15],data_in_I27[15:0]};
assign in_27_Q = {data_in_Q27[15],data_in_Q27[15],data_in_Q27[15],data_in_Q27[15],data_in_Q27[15],data_in_Q27[15],data_in_Q27[15:0]};
assign in_28_I = {data_in_I28[15],data_in_I28[15],data_in_I28[15],data_in_I28[15],data_in_I28[15],data_in_I28[15],data_in_I28[15:0]};
assign in_28_Q = {data_in_Q28[15],data_in_Q28[15],data_in_Q28[15],data_in_Q28[15],data_in_Q28[15],data_in_Q28[15],data_in_Q28[15:0]}; 
assign in_29_I = {data_in_I29[15],data_in_I29[15],data_in_I29[15],data_in_I29[15],data_in_I29[15],data_in_I29[15],data_in_I29[15:0]};
assign in_29_Q = {data_in_Q29[15],data_in_Q29[15],data_in_Q29[15],data_in_Q29[15],data_in_Q29[15],data_in_Q29[15],data_in_Q29[15:0]};
assign in_30_I = {data_in_I30[15],data_in_I30[15],data_in_I30[15],data_in_I30[15],data_in_I30[15],data_in_I30[15],data_in_I30[15:0]};
assign in_30_Q = {data_in_Q30[15],data_in_Q30[15],data_in_Q30[15],data_in_Q30[15],data_in_Q30[15],data_in_Q30[15],data_in_Q30[15:0]};
assign in_31_I = {data_in_I31[15],data_in_I31[15],data_in_I31[15],data_in_I31[15],data_in_I31[15],data_in_I31[15],data_in_I31[15:0]};
assign in_31_Q = {data_in_Q31[15],data_in_Q31[15],data_in_Q31[15],data_in_Q31[15],data_in_Q31[15],data_in_Q31[15],data_in_Q31[15:0]};
assign in_32_I = {data_in_I32[15],data_in_I32[15],data_in_I32[15],data_in_I32[15],data_in_I32[15],data_in_I32[15],data_in_I32[15:0]};
assign in_32_Q = {data_in_Q32[15],data_in_Q32[15],data_in_Q32[15],data_in_Q32[15],data_in_Q32[15],data_in_Q32[15],data_in_Q32[15:0]};
assign in_33_I = {data_in_I33[15],data_in_I33[15],data_in_I33[15],data_in_I33[15],data_in_I33[15],data_in_I33[15],data_in_I33[15:0]};
assign in_33_Q = {data_in_Q33[15],data_in_Q33[15],data_in_Q33[15],data_in_Q33[15],data_in_Q33[15],data_in_Q33[15],data_in_Q33[15:0]};
assign in_34_I = {data_in_I34[15],data_in_I34[15],data_in_I34[15],data_in_I34[15],data_in_I34[15],data_in_I34[15],data_in_I34[15:0]};
assign in_34_Q = {data_in_Q34[15],data_in_Q34[15],data_in_Q34[15],data_in_Q34[15],data_in_Q34[15],data_in_Q34[15],data_in_Q34[15:0]};
assign in_35_I = {data_in_I35[15],data_in_I35[15],data_in_I35[15],data_in_I35[15],data_in_I35[15],data_in_I35[15],data_in_I35[15:0]};
assign in_35_Q = {data_in_Q35[15],data_in_Q35[15],data_in_Q35[15],data_in_Q35[15],data_in_Q35[15],data_in_Q35[15],data_in_Q35[15:0]}; 

wire data_in_valid_1;
assign data_in_valid_1 = data_in_valid;
reg [21:0]sum_1_35_I_1;
reg [21:0]sum_1_35_Q_1;
//    wire data_valid; 
reg data_valid_t;
always@(posedge clk)
begin
    if(data_in_valid_1)
    begin
    sum_1_35_I_1 <= (in_1_I+in_2_I)+(in_3_I+in_4_I)+(in_5_I+in_6_I)+(in_7_I+in_8_I)+(in_9_I+in_10_I)+(in_11_I+in_12_I)+(in_13_I+in_14_I)+(in_15_I+in_16_I)+(in_17_I+in_18_I)+(in_19_I+in_20_I)+(in_21_I+in_22_I)
                     +(in_23_I+in_24_I)+(in_25_I+in_26_I)+(in_27_I+in_28_I)+(in_29_I+in_30_I)+(in_31_I+in_32_I)+(in_33_I+in_34_I)+in_35_I;
    sum_1_35_Q_1 <= (in_1_Q+in_2_Q)+(in_3_Q+in_4_Q)+(in_5_Q+in_6_Q)+(in_7_Q+in_8_Q)+(in_9_Q+in_10_Q)+(in_11_Q+in_12_Q)+(in_13_Q+in_14_Q)+(in_15_Q+in_16_Q)+(in_17_Q+in_18_Q)+(in_19_Q+in_20_Q)+(in_21_Q+in_22_Q)
                     +(in_23_Q+in_24_Q)+(in_25_Q+in_26_Q)+(in_27_Q+in_28_Q)+(in_29_Q+in_30_Q)+(in_31_Q+in_32_Q)+(in_33_Q+in_34_Q)+in_35_Q;
    end

    data_valid_t <= data_in_valid_1;
end 

assign sum_1_35_I = sum_1_35_I_1;
assign sum_1_35_Q = sum_1_35_Q_1; 
assign data_out_valid = data_valid_t;    
    
endmodule
