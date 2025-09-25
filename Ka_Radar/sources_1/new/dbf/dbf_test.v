`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/26 10:05:06
// Design Name: 
// Module Name: dbf_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 一个方向角度dbf解调模块-----时钟30M--120M
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dbf_test(
    input clk,

    input [2:0]dbf_cut_ctl,
    input data_in_valid,
    input [15:0]data_in_L_1_I,
    input [15:0]data_in_L_1_Q,
    input [15:0]data_in_L_2_I,
    input [15:0]data_in_L_2_Q,
    input [15:0]data_in_L_3_I,
    input [15:0]data_in_L_3_Q,
    input [15:0]data_in_L_4_I,
    input [15:0]data_in_L_4_Q,
    input [15:0]data_in_L_5_I,
    input [15:0]data_in_L_5_Q,
    input [15:0]data_in_L_6_I,
    input [15:0]data_in_L_6_Q,
    input [15:0]data_in_L_7_I,
    input [15:0]data_in_L_7_Q,
    input [15:0]data_in_L_8_I,
    input [15:0]data_in_L_8_Q,
    input [15:0]data_in_L_9_I,
    input [15:0]data_in_L_9_Q,
    input [15:0]data_in_L_10_I,
    input [15:0]data_in_L_10_Q,
    input [15:0]data_in_L_11_I,
    input [15:0]data_in_L_11_Q,
    input [15:0]data_in_L_12_I,
    input [15:0]data_in_L_12_Q,
    input [15:0]data_in_L_13_I,
    input [15:0]data_in_L_13_Q,
    input [15:0]data_in_L_14_I,
    input [15:0]data_in_L_14_Q,
    input [15:0]data_in_L_15_I,
    input [15:0]data_in_L_15_Q,
    input [15:0]data_in_L_16_I,
    input [15:0]data_in_L_16_Q,
    input [15:0]data_in_L_17_I,
    input [15:0]data_in_L_17_Q,
    input [15:0]data_in_L_18_I,
    input [15:0]data_in_L_18_Q,
    input [15:0]data_in_L_19_I,
    input [15:0]data_in_L_19_Q,
    input [15:0]data_in_L_20_I,
    input [15:0]data_in_L_20_Q,
    input [15:0]data_in_L_21_I,
    input [15:0]data_in_L_21_Q,
    input [15:0]data_in_L_22_I,
    input [15:0]data_in_L_22_Q,
    input [15:0]data_in_L_23_I,
    input [15:0]data_in_L_23_Q,
    input [15:0]data_in_L_24_I,
    input [15:0]data_in_L_24_Q,
    input [15:0]data_in_L_25_I,
    input [15:0]data_in_L_25_Q,
    input [15:0]data_in_L_26_I,
    input [15:0]data_in_L_26_Q,
    input [15:0]data_in_L_27_I,
    input [15:0]data_in_L_27_Q,
    input [15:0]data_in_L_28_I,
    input [15:0]data_in_L_28_Q,
    input [15:0]data_in_L_29_I,
    input [15:0]data_in_L_29_Q,
    input [15:0]data_in_L_30_I,
    input [15:0]data_in_L_30_Q,
    input [15:0]data_in_L_31_I,
    input [15:0]data_in_L_31_Q,
    input [15:0]data_in_L_32_I,
    input [15:0]data_in_L_32_Q,
    input [15:0]data_in_L_33_I,
    input [15:0]data_in_L_33_Q,
    input [15:0]data_in_L_34_I,
    input [15:0]data_in_L_34_Q,
    input [15:0]data_in_L_35_I,
    input [15:0]data_in_L_35_Q,
    input [15:0]data_in_L_36_I,
    input [15:0]data_in_L_36_Q,
    input [15:0]data_in_L_37_I,
    input [15:0]data_in_L_37_Q,
    input [15:0]data_in_L_38_I,
    input [15:0]data_in_L_38_Q,
    input [15:0]data_in_L_39_I,
    input [15:0]data_in_L_39_Q,
    input [15:0]data_in_L_40_I,
    input [15:0]data_in_L_40_Q,
    input [15:0]data_in_L_41_I,
    input [15:0]data_in_L_41_Q,
    input [15:0]data_in_L_42_I,
    input [15:0]data_in_L_42_Q,
    input [15:0]data_in_L_43_I,
    input [15:0]data_in_L_43_Q,
    input [15:0]data_in_L_44_I,
    input [15:0]data_in_L_44_Q,
    input [15:0]data_in_L_45_I,
    input [15:0]data_in_L_45_Q,
    input [15:0]data_in_L_46_I,
    input [15:0]data_in_L_46_Q,
    input [15:0]data_in_L_47_I,
    input [15:0]data_in_L_47_Q,
    input [15:0]data_in_L_48_I,
    input [15:0]data_in_L_48_Q,
    input [15:0]data_in_L_49_I,
    input [15:0]data_in_L_49_Q,
    input [15:0]data_in_L_50_I,
    input [15:0]data_in_L_50_Q,
    input [15:0]data_in_L_51_I,
    input [15:0]data_in_L_51_Q,
    input [15:0]data_in_L_52_I,
    input [15:0]data_in_L_52_Q,
    input [15:0]data_in_L_53_I,
    input [15:0]data_in_L_53_Q,
    input [15:0]data_in_L_54_I,
    input [15:0]data_in_L_54_Q,
    input [15:0]data_in_L_55_I,
    input [15:0]data_in_L_55_Q,
    input [15:0]data_in_L_56_I,
    input [15:0]data_in_L_56_Q,
    input [15:0]data_in_L_57_I,
    input [15:0]data_in_L_57_Q,
    input [15:0]data_in_L_58_I,
    input [15:0]data_in_L_58_Q,
    input [15:0]data_in_L_59_I,
    input [15:0]data_in_L_59_Q,
    input [15:0]data_in_L_60_I,
    input [15:0]data_in_L_60_Q,
    input [15:0]data_in_L_61_I,
    input [15:0]data_in_L_61_Q,
    input [15:0]data_in_L_62_I,
    input [15:0]data_in_L_62_Q,
    input [15:0]data_in_L_63_I,
    input [15:0]data_in_L_63_Q,
    input [15:0]data_in_L_64_I,
    input [15:0]data_in_L_64_Q,
    input [15:0]data_in_L_65_I,
    input [15:0]data_in_L_65_Q,
    input [15:0]data_in_L_66_I,
    input [15:0]data_in_L_66_Q,
    input [15:0]data_in_L_67_I,
    input [15:0]data_in_L_67_Q,
    input [15:0]data_in_L_68_I,
    input [15:0]data_in_L_68_Q,
    input [15:0]data_in_L_69_I,
    input [15:0]data_in_L_69_Q,
    input [15:0]data_in_L_70_I,
    input [15:0]data_in_L_70_Q,
    
    input [15:0]data_in_R_1_I,
    input [15:0]data_in_R_1_Q,
    input [15:0]data_in_R_2_I,
    input [15:0]data_in_R_2_Q,
    input [15:0]data_in_R_3_I,
    input [15:0]data_in_R_3_Q,
    input [15:0]data_in_R_4_I,
    input [15:0]data_in_R_4_Q,
    input [15:0]data_in_R_5_I,
    input [15:0]data_in_R_5_Q,
    input [15:0]data_in_R_6_I,
    input [15:0]data_in_R_6_Q,
    input [15:0]data_in_R_7_I,
    input [15:0]data_in_R_7_Q,
    input [15:0]data_in_R_8_I,
    input [15:0]data_in_R_8_Q,
    input [15:0]data_in_R_9_I,
    input [15:0]data_in_R_9_Q,
    input [15:0]data_in_R_10_I,
    input [15:0]data_in_R_10_Q,
    input [15:0]data_in_R_11_I,
    input [15:0]data_in_R_11_Q,
    input [15:0]data_in_R_12_I,
    input [15:0]data_in_R_12_Q,
    input [15:0]data_in_R_13_I,
    input [15:0]data_in_R_13_Q,
    input [15:0]data_in_R_14_I,
    input [15:0]data_in_R_14_Q,
    input [15:0]data_in_R_15_I,
    input [15:0]data_in_R_15_Q,
    input [15:0]data_in_R_16_I,
    input [15:0]data_in_R_16_Q,
    input [15:0]data_in_R_17_I,
    input [15:0]data_in_R_17_Q,
    input [15:0]data_in_R_18_I,
    input [15:0]data_in_R_18_Q,
    input [15:0]data_in_R_19_I,
    input [15:0]data_in_R_19_Q,
    input [15:0]data_in_R_20_I,
    input [15:0]data_in_R_20_Q,
    input [15:0]data_in_R_21_I,
    input [15:0]data_in_R_21_Q,
    input [15:0]data_in_R_22_I,
    input [15:0]data_in_R_22_Q,
    input [15:0]data_in_R_23_I,
    input [15:0]data_in_R_23_Q,
    input [15:0]data_in_R_24_I,
    input [15:0]data_in_R_24_Q,
    input [15:0]data_in_R_25_I,
    input [15:0]data_in_R_25_Q,
    input [15:0]data_in_R_26_I,
    input [15:0]data_in_R_26_Q,
    input [15:0]data_in_R_27_I,
    input [15:0]data_in_R_27_Q,
    input [15:0]data_in_R_28_I,
    input [15:0]data_in_R_28_Q,
    input [15:0]data_in_R_29_I,
    input [15:0]data_in_R_29_Q,
    input [15:0]data_in_R_30_I,
    input [15:0]data_in_R_30_Q,
    input [15:0]data_in_R_31_I,
    input [15:0]data_in_R_31_Q,
    input [15:0]data_in_R_32_I,
    input [15:0]data_in_R_32_Q,
    input [15:0]data_in_R_33_I,
    input [15:0]data_in_R_33_Q,
    input [15:0]data_in_R_34_I,
    input [15:0]data_in_R_34_Q,
    input [15:0]data_in_R_35_I,
    input [15:0]data_in_R_35_Q,
    input [15:0]data_in_R_36_I,
    input [15:0]data_in_R_36_Q,
    input [15:0]data_in_R_37_I,
    input [15:0]data_in_R_37_Q,
    input [15:0]data_in_R_38_I,
    input [15:0]data_in_R_38_Q,
    input [15:0]data_in_R_39_I,
    input [15:0]data_in_R_39_Q,
    input [15:0]data_in_R_40_I,
    input [15:0]data_in_R_40_Q,
    input [15:0]data_in_R_41_I,
    input [15:0]data_in_R_41_Q,
    input [15:0]data_in_R_42_I,
    input [15:0]data_in_R_42_Q,
    input [15:0]data_in_R_43_I,
    input [15:0]data_in_R_43_Q,
    input [15:0]data_in_R_44_I,
    input [15:0]data_in_R_44_Q,
    input [15:0]data_in_R_45_I,
    input [15:0]data_in_R_45_Q,
    input [15:0]data_in_R_46_I,
    input [15:0]data_in_R_46_Q,
    input [15:0]data_in_R_47_I,
    input [15:0]data_in_R_47_Q,
    input [15:0]data_in_R_48_I,
    input [15:0]data_in_R_48_Q,
    input [15:0]data_in_R_49_I,
    input [15:0]data_in_R_49_Q,
    input [15:0]data_in_R_50_I,
    input [15:0]data_in_R_50_Q,
    input [15:0]data_in_R_51_I,
    input [15:0]data_in_R_51_Q,
    input [15:0]data_in_R_52_I,
    input [15:0]data_in_R_52_Q,
    input [15:0]data_in_R_53_I,
    input [15:0]data_in_R_53_Q,
    input [15:0]data_in_R_54_I,
    input [15:0]data_in_R_54_Q,
    input [15:0]data_in_R_55_I,
    input [15:0]data_in_R_55_Q,
    input [15:0]data_in_R_56_I,
    input [15:0]data_in_R_56_Q,
    input [15:0]data_in_R_57_I,
    input [15:0]data_in_R_57_Q,
    input [15:0]data_in_R_58_I,
    input [15:0]data_in_R_58_Q,
    input [15:0]data_in_R_59_I,
    input [15:0]data_in_R_59_Q,
    input [15:0]data_in_R_60_I,
    input [15:0]data_in_R_60_Q,
    input [15:0]data_in_R_61_I,
    input [15:0]data_in_R_61_Q,
    input [15:0]data_in_R_62_I,
    input [15:0]data_in_R_62_Q,
    input [15:0]data_in_R_63_I,
    input [15:0]data_in_R_63_Q,
    input [15:0]data_in_R_64_I,
    input [15:0]data_in_R_64_Q,
    input [15:0]data_in_R_65_I,
    input [15:0]data_in_R_65_Q,
    input [15:0]data_in_R_66_I,
    input [15:0]data_in_R_66_Q,
    input [15:0]data_in_R_67_I,
    input [15:0]data_in_R_67_Q,
    input [15:0]data_in_R_68_I,
    input [15:0]data_in_R_68_Q,
    input [15:0]data_in_R_69_I,
    input [15:0]data_in_R_69_Q,
    input [15:0]data_in_R_70_I,
    input [15:0]data_in_R_70_Q,
    
    input phase_data_valid,
    input [15:0]phase_data_1 ,
    input [15:0]phase_data_2 ,
    input [15:0]phase_data_3 ,
    input [15:0]phase_data_4 ,
    input [15:0]phase_data_5 ,
    input [15:0]phase_data_6 ,
    input [15:0]phase_data_7 ,
    input [15:0]phase_data_8 ,
    input [15:0]phase_data_9 ,
    input [15:0]phase_data_10,
    input [15:0]phase_data_11,
    input [15:0]phase_data_12,
    input [15:0]phase_data_13,
    input [15:0]phase_data_14,
    input [15:0]phase_data_15 ,
    input [15:0]phase_data_16 ,
    input [15:0]phase_data_17 ,
    input [15:0]phase_data_18 ,
    input [15:0]phase_data_19 ,
    input [15:0]phase_data_20 ,
    input [15:0]phase_data_21 ,
    input [15:0]phase_data_22 ,
    input [15:0]phase_data_23 ,
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
    input [15:0]phase_data_36,
    input [15:0]phase_data_37,
    input [15:0]phase_data_38,
    input [15:0]phase_data_39,
    input [15:0]phase_data_40,
    input [15:0]phase_data_41,
    input [15:0]phase_data_42,
    input [15:0]phase_data_43,
    input [15:0]phase_data_44,
    input [15:0]phase_data_45,
    input [15:0]phase_data_46,
    input [15:0]phase_data_47,
    input [15:0]phase_data_48,
    input [15:0]phase_data_49,
    input [15:0]phase_data_50 ,
    input [15:0]phase_data_51 ,
    input [15:0]phase_data_52 ,
    input [15:0]phase_data_53 ,
    input [15:0]phase_data_54 ,
    input [15:0]phase_data_55 ,
    input [15:0]phase_data_56 ,
    input [15:0]phase_data_57 ,
    input [15:0]phase_data_58 ,
    input [15:0]phase_data_59,
    input [15:0]phase_data_60,
    input [15:0]phase_data_61,
    input [15:0]phase_data_62,
    input [15:0]phase_data_63,
    input [15:0]phase_data_64,
    input [15:0]phase_data_65,
    input [15:0]phase_data_66,
    input [15:0]phase_data_67,
    input [15:0]phase_data_68,
    input [15:0]phase_data_69,
    input [15:0]phase_data_70,
    
    input [15:0]phase_data_1_im ,
    input [15:0]phase_data_2_im ,
    input [15:0]phase_data_3_im ,
    input [15:0]phase_data_4_im ,
    input [15:0]phase_data_5_im ,
    input [15:0]phase_data_6_im ,
    input [15:0]phase_data_7_im ,
    input [15:0]phase_data_8_im ,
    input [15:0]phase_data_9_im ,
    input [15:0]phase_data_10_im,
    input [15:0]phase_data_11_im,
    input [15:0]phase_data_12_im,
    input [15:0]phase_data_13_im,
    input [15:0]phase_data_14_im,
    input [15:0]phase_data_15_im ,
    input [15:0]phase_data_16_im ,
    input [15:0]phase_data_17_im ,
    input [15:0]phase_data_18_im ,
    input [15:0]phase_data_19_im ,
    input [15:0]phase_data_20_im ,
    input [15:0]phase_data_21_im ,
    input [15:0]phase_data_22_im ,
    input [15:0]phase_data_23_im ,
    input [15:0]phase_data_24_im,
    input [15:0]phase_data_25_im,
    input [15:0]phase_data_26_im,
    input [15:0]phase_data_27_im,
    input [15:0]phase_data_28_im,
    input [15:0]phase_data_29_im ,
    input [15:0]phase_data_30_im ,
    input [15:0]phase_data_31_im ,
    input [15:0]phase_data_32_im ,
    input [15:0]phase_data_33_im ,
    input [15:0]phase_data_34_im ,
    input [15:0]phase_data_35_im ,
    input [15:0]phase_data_36_im ,
    input [15:0]phase_data_37_im ,
    input [15:0]phase_data_38_im ,
    input [15:0]phase_data_39_im ,
    input [15:0]phase_data_40_im ,
    input [15:0]phase_data_41_im ,
    input [15:0]phase_data_42_im ,
    input [15:0]phase_data_43_im ,
    input [15:0]phase_data_44_im ,
    input [15:0]phase_data_45_im,
    input [15:0]phase_data_46_im,
    input [15:0]phase_data_47_im,
    input [15:0]phase_data_48_im,
    input [15:0]phase_data_49_im,
    input [15:0]phase_data_50_im ,
    input [15:0]phase_data_51_im ,
    input [15:0]phase_data_52_im ,
    input [15:0]phase_data_53_im ,
    input [15:0]phase_data_54_im ,
    input [15:0]phase_data_55_im ,
    input [15:0]phase_data_56_im ,
    input [15:0]phase_data_57_im ,
    input [15:0]phase_data_58_im ,
    input [15:0]phase_data_59_im,
    input [15:0]phase_data_60_im,
    input [15:0]phase_data_61_im,
    input [15:0]phase_data_62_im,
    input [15:0]phase_data_63_im,
    input [15:0]phase_data_64_im ,
    input [15:0]phase_data_65_im ,
    input [15:0]phase_data_66_im ,
    input [15:0]phase_data_67_im ,
    input [15:0]phase_data_68_im ,
    input [15:0]phase_data_69_im ,
    input [15:0]phase_data_70_im ,

    output [15:0]dbf_add_I,
    output [15:0]dbf_add_Q,
    output [15:0]dbf_fw_sub_I,
    output [15:0]dbf_fw_sub_Q,
    output [15:0]dbf_fy_sub_I,
    output [15:0]dbf_fy_sub_Q,
    output data_out_valid ,  
    output [15:0] dbfadd_L_1_35_I ,
    output [15:0] dbfadd_L_1_35_Q ,
    output [15:0] dbfadd_L_36_70_Q,
    output [15:0] dbfadd_L_36_70_I,
    output [15:0] dbfadd_R_1_35_I ,
    output [15:0] dbfadd_R_1_35_Q ,
    output [15:0] dbfadd_R_36_70_I,
    output [15:0] dbfadd_R_36_70_Q
  

    );
    wire [15:0] A1;
    wire [15:0] A2;
    wire [15:0] A3;
    wire [15:0] A4;
    wire [15:0] A5;
    wire [15:0] A6;
    wire [15:0] A7;
    wire [15:0] A8;
    wire [15:0] A9;
    wire [15:0] A10;
    wire [15:0] A11;
    wire [15:0] A12;
    wire [15:0] A13;
    wire [15:0] A14;
    wire [15:0] A15;
    wire [15:0] A16;
    wire [15:0] A17;
    wire [15:0] A18;
    wire [15:0] A19;
    wire [15:0] A20;
    wire [15:0] A21;
    wire [15:0] A22;
    wire [15:0] A23;
    wire [15:0] A24;
    wire [15:0] A25;
    wire [15:0] A26;
    wire [15:0] A27;
    wire [15:0] A28;
    wire [15:0] A29;
    wire [15:0] A30;
    wire [15:0] A31;
    wire [15:0] A32;
    wire [15:0] A33;
    wire [15:0] A34;
    wire [15:0] A35;
    wire [15:0] A36;
    wire [15:0] A37;
    wire [15:0] A38;
    wire [15:0] A39;
    wire [15:0] A40;
    wire [15:0] A41;
    wire [15:0] A42;
    wire [15:0] A43;
    wire [15:0] A44;
    wire [15:0] A45;
    wire [15:0] A46;
    wire [15:0] A47;
    wire [15:0] A48;
    wire [15:0] A49;
    wire [15:0] A50;
    wire [15:0] A51;
    wire [15:0] A52;
    wire [15:0] A53;
    wire [15:0] A54;
    wire [15:0] A55;
    wire [15:0] A56;
    wire [15:0] A57;
    wire [15:0] A58;
    wire [15:0] A59;
    wire [15:0] A60;
    wire [15:0] A61;
    wire [15:0] A62;
    wire [15:0] A63;
    wire [15:0] A64;
    wire [15:0] A65;
    wire [15:0] A66;
    wire [15:0] A67;
    wire [15:0] A68;
    wire [15:0] A69;
    wire [15:0] A70;
//////////////////////////////////DBF控制////////////////////////////////////////////////          
//wire [2:0]dbf_cut_ctl;
//wire [15:0]dbf_A_ctl;
//wire [3:0]dbf_phase_ctl;

//vio_dbf_cut dbf_cut (
//  .clk(clk),                // wire wire clk
//  .probe_out0(dbf_cut_ctl),  // output wire [2 : 0] probe_out0
//  .probe_out1(dbf_A_ctl),  // output wire [15 : 0] probe_out1
//  .probe_out2(dbf_phase_ctl)  // output wire [3 : 0] probe_out2
//);
//reg [2:0]dbf_cut_ctl=0;
reg [15:0]dbf_A_ctl=16'h7fff;

assign A1 = dbf_A_ctl;
assign A2 = dbf_A_ctl;
assign A3 = dbf_A_ctl;
assign A4 = dbf_A_ctl;
assign A5 = dbf_A_ctl;
assign A6 = dbf_A_ctl;
assign A7 = dbf_A_ctl;
assign A8 = dbf_A_ctl;
assign A9 = dbf_A_ctl;
assign A10 = dbf_A_ctl;
assign A11 = dbf_A_ctl;
assign A12 = dbf_A_ctl;
assign A13 = dbf_A_ctl;
assign A14 = dbf_A_ctl;
assign A15 = dbf_A_ctl;
assign A16 = dbf_A_ctl;
assign A17 = dbf_A_ctl;
assign A18 = dbf_A_ctl;
assign A19 = dbf_A_ctl;
assign A20 = dbf_A_ctl;
assign A21 = dbf_A_ctl;
assign A22 = dbf_A_ctl;
assign A23 = dbf_A_ctl;
assign A24 = dbf_A_ctl;
assign A25 = dbf_A_ctl;
assign A26 = dbf_A_ctl;
assign A27 = dbf_A_ctl;
assign A28 = dbf_A_ctl;
assign A29 = dbf_A_ctl;
assign A30 = dbf_A_ctl;
assign A31 = dbf_A_ctl;
assign A32 = dbf_A_ctl;
assign A33 = dbf_A_ctl;
assign A34 = dbf_A_ctl;
assign A35 = dbf_A_ctl;
assign A36 = dbf_A_ctl;
assign A37 = dbf_A_ctl;
assign A38 = dbf_A_ctl;
assign A39 = dbf_A_ctl;
assign A40 = dbf_A_ctl;
assign A41 = dbf_A_ctl;
assign A42 = dbf_A_ctl;
assign A43 = dbf_A_ctl;
assign A44 = dbf_A_ctl;
assign A45 = dbf_A_ctl;
assign A46 = dbf_A_ctl;
assign A47 = dbf_A_ctl;
assign A48 = dbf_A_ctl;
assign A49 = dbf_A_ctl;
assign A50 = dbf_A_ctl;
assign A51 = dbf_A_ctl;
assign A52 = dbf_A_ctl;
assign A53 = dbf_A_ctl;
assign A54 = dbf_A_ctl;
assign A55 = dbf_A_ctl;
assign A56 = dbf_A_ctl;
assign A57 = dbf_A_ctl;
assign A58 = dbf_A_ctl;
assign A59 = dbf_A_ctl;
assign A60 = dbf_A_ctl;
assign A61 = dbf_A_ctl;
assign A62 = dbf_A_ctl;
assign A63 = dbf_A_ctl;
assign A64 = dbf_A_ctl;
assign A65 = dbf_A_ctl;
assign A66 = dbf_A_ctl;
assign A67 = dbf_A_ctl;
assign A68 = dbf_A_ctl;
assign A69 = dbf_A_ctl;
assign A70 = dbf_A_ctl;
//////////////////////////////////////////////////////////////////
wire [15:0]ph_real_1  ;
wire [15:0]ph_real_2  ;
wire [15:0]ph_real_3  ;
wire [15:0]ph_real_4  ;
wire [15:0]ph_real_5  ;
wire [15:0]ph_real_6  ;
wire [15:0]ph_real_7  ;
wire [15:0]ph_real_8  ;
wire [15:0]ph_real_9  ;
wire [15:0]ph_real_10 ;
wire [15:0]ph_real_11 ;
wire [15:0]ph_real_12 ;
wire [15:0]ph_real_13 ;
wire [15:0]ph_real_14 ;
wire [15:0]ph_real_15 ;
wire [15:0]ph_real_16  ;
wire [15:0]ph_real_17  ;
wire [15:0]ph_real_18  ;
wire [15:0]ph_real_19 ;
wire [15:0]ph_real_20 ;
wire [15:0]ph_real_21 ;
wire [15:0]ph_real_22 ;
wire [15:0]ph_real_23 ;
wire [15:0]ph_real_24 ;
wire [15:0]ph_real_25 ;
wire [15:0]ph_real_26 ;
wire [15:0]ph_real_27 ;
wire [15:0]ph_real_28 ;
wire [15:0]ph_real_29 ;
wire [15:0]ph_real_30 ;
wire [15:0]ph_real_31 ;
wire [15:0]ph_real_32 ;
wire [15:0]ph_real_33 ;
wire [15:0]ph_real_34 ;
wire [15:0]ph_real_35 ;
wire [15:0]ph_real_36;
wire [15:0]ph_real_37;
wire [15:0]ph_real_38;
wire [15:0]ph_real_39;
wire [15:0]ph_real_40;
wire [15:0]ph_real_41;
wire [15:0]ph_real_42;
wire [15:0]ph_real_43;
wire [15:0]ph_real_44;
wire [15:0]ph_real_45;
wire [15:0]ph_real_46;
wire [15:0]ph_real_47;
wire [15:0]ph_real_48;
wire [15:0]ph_real_49;
wire [15:0]ph_real_50;
wire [15:0]ph_real_51 ;
wire [15:0]ph_real_52 ;
wire [15:0]ph_real_53 ;
wire [15:0]ph_real_54;
wire [15:0]ph_real_55;
wire [15:0]ph_real_56;
wire [15:0]ph_real_57;
wire [15:0]ph_real_58;
wire [15:0]ph_real_59;
wire [15:0]ph_real_60;
wire [15:0]ph_real_61;
wire [15:0]ph_real_62;
wire [15:0]ph_real_63;
wire [15:0]ph_real_64;
wire [15:0]ph_real_65;
wire [15:0]ph_real_66;
wire [15:0]ph_real_67;
wire [15:0]ph_real_68;
wire [15:0]ph_real_69;
wire [15:0]ph_real_70;

wire [15:0]ph_image_1 ;
wire [15:0]ph_image_2 ;
wire [15:0]ph_image_3 ;
wire [15:0]ph_image_4 ;
wire [15:0]ph_image_5 ;
wire [15:0]ph_image_6 ;
wire [15:0]ph_image_7 ;
wire [15:0]ph_image_8 ;
wire [15:0]ph_image_9 ;
wire [15:0]ph_image_10;
wire [15:0]ph_image_11;
wire [15:0]ph_image_12;
wire [15:0]ph_image_13;
wire [15:0]ph_image_14;
wire [15:0]ph_image_15;
wire [15:0]ph_image_16;
wire [15:0]ph_image_17;
wire [15:0]ph_image_18;
wire [15:0]ph_image_19;
wire [15:0]ph_image_20;
wire [15:0]ph_image_21;
wire [15:0]ph_image_22;
wire [15:0]ph_image_23;
wire [15:0]ph_image_24;
wire [15:0]ph_image_25;
wire [15:0]ph_image_26;
wire [15:0]ph_image_27;
wire [15:0]ph_image_28;
wire [15:0]ph_image_29;
wire [15:0]ph_image_30;
wire [15:0]ph_image_31;
wire [15:0]ph_image_32;
wire [15:0]ph_image_33;
wire [15:0]ph_image_34;
wire [15:0]ph_image_35;
wire [15:0]ph_image_36;
wire [15:0]ph_image_37;
wire [15:0]ph_image_38;
wire [15:0]ph_image_39;
wire [15:0]ph_image_40;
wire [15:0]ph_image_41;
wire [15:0]ph_image_42;
wire [15:0]ph_image_43;
wire [15:0]ph_image_44;
wire [15:0]ph_image_45;
wire [15:0]ph_image_46;
wire [15:0]ph_image_47;
wire [15:0]ph_image_48;
wire [15:0]ph_image_49;
wire [15:0]ph_image_50;
wire [15:0]ph_image_51;
wire [15:0]ph_image_52;
wire [15:0]ph_image_53;
wire [15:0]ph_image_54;
wire [15:0]ph_image_55;
wire [15:0]ph_image_56;
wire [15:0]ph_image_57;
wire [15:0]ph_image_58;
wire [15:0]ph_image_59;
wire [15:0]ph_image_60;
wire [15:0]ph_image_61;
wire [15:0]ph_image_62;
wire [15:0]ph_image_63;
wire [15:0]ph_image_64;
wire [15:0]ph_image_65;
wire [15:0]ph_image_66;
wire [15:0]ph_image_67;
wire [15:0]ph_image_68;
wire [15:0]ph_image_69;
wire [15:0]ph_image_70;
/////////////////////////////////////////////////
 dbf_phase_top dbf_phase_top_1(
    .clk(clk),
    
    .phase_data_1 (phase_data_1 ),
    .phase_data_2 (phase_data_2 ),
    .phase_data_3 (phase_data_3 ),
    .phase_data_4 (phase_data_4 ),
    .phase_data_5 (phase_data_5 ),
    .phase_data_6 (phase_data_6 ),
    .phase_data_7 (phase_data_7 ),
    .phase_data_8 (phase_data_8 ),
    .phase_data_9 (phase_data_9 ),
    .phase_data_10 (phase_data_10 ),
    .phase_data_11 (phase_data_11 ),
    .phase_data_12 (phase_data_12 ),
    .phase_data_13 (phase_data_13 ),
    .phase_data_14(phase_data_14 ),
    .phase_data_15(phase_data_15 ),
    .phase_data_16(phase_data_16 ),
    .phase_data_17(phase_data_17 ),
    .phase_data_18(phase_data_18 ),
    .phase_data_19(phase_data_19 ),
    .phase_data_20(phase_data_20 ),
    .phase_data_21(phase_data_21 ),
    .phase_data_22(phase_data_22 ),
    .phase_data_23(phase_data_23 ),
    .phase_data_24(phase_data_24 ),
    .phase_data_25(phase_data_25),
    .phase_data_26(phase_data_26),
    .phase_data_27(phase_data_27),
    .phase_data_28(phase_data_28),
    .phase_data_29(phase_data_29),
    .phase_data_30(phase_data_30),
    .phase_data_31(phase_data_31 ),
    .phase_data_32(phase_data_32 ),
    .phase_data_33(phase_data_33),
    .phase_data_34(phase_data_34),
    .phase_data_35(phase_data_35),
    
    .phase_data_1_im (phase_data_1_im ),
    .phase_data_2_im (phase_data_2_im ),
    .phase_data_3_im (phase_data_3_im ),
    .phase_data_4_im (phase_data_4_im ),
    .phase_data_5_im (phase_data_5_im ),
    .phase_data_6_im (phase_data_6_im ),
    .phase_data_7_im (phase_data_7_im ),
    .phase_data_8_im (phase_data_8_im ),
    .phase_data_9_im (phase_data_9_im ),
    .phase_data_10_im (phase_data_10_im ),
    .phase_data_11_im (phase_data_11_im ),
    .phase_data_12_im (phase_data_12_im ),
    .phase_data_13_im (phase_data_13_im ),
    .phase_data_14_im (phase_data_14_im ),
    .phase_data_15_im (phase_data_15_im ),
    .phase_data_16_im (phase_data_16_im ),
    .phase_data_17_im (phase_data_17_im ),
    .phase_data_18_im (phase_data_18_im ),
    .phase_data_19_im (phase_data_19_im ),
    .phase_data_20_im (phase_data_20_im ),
    .phase_data_21_im (phase_data_21_im ),
    .phase_data_22_im (phase_data_22_im ),
    .phase_data_23_im (phase_data_23_im ),
    .phase_data_24_im (phase_data_24_im ),
    .phase_data_25_im (phase_data_25_im ),
    .phase_data_26_im (phase_data_26_im ),
    .phase_data_27_im (phase_data_27_im ),
    .phase_data_28_im (phase_data_28_im ),
    .phase_data_29_im (phase_data_29_im ),
    .phase_data_30_im (phase_data_30_im ),
    .phase_data_31_im (phase_data_31_im ),
    .phase_data_32_im (phase_data_32_im ),
    .phase_data_33_im (phase_data_33_im ),
    .phase_data_34_im (phase_data_34_im ),
    .phase_data_35_im (phase_data_35_im ),
    .phase_data_valid(phase_data_valid),
   
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4),
    .A5(A5),
    .A6(A6),
    .A7(A7),
    .A8(A8),
    .A9(A9),
    .A10(A10),
    .A11(A11),
    .A12(A12),
    .A13(A13),
    .A14(A14),
    .A15(A15),
    .A16(A16),
    .A17(A17),
    .A18(A18),
    .A19(A19),
    .A20(A20),
    .A21(A21),
    .A22(A22),
    .A23(A23),
    .A24(A24),
    .A25(A25),
    .A26(A26),
    .A27(A27),
    .A28(A28),
    .A29(A29),
    .A30(A30),
    .A31(A31),
    .A32(A32),
    .A33(A33),
    .A34(A34),
    .A35(A35),
    
    .ph_real_1  (ph_real_1  ),
    .ph_real_2  (ph_real_2  ),
    .ph_real_3  (ph_real_3  ),
    .ph_real_4  (ph_real_4  ),
    .ph_real_5  (ph_real_5  ),
    .ph_real_6  (ph_real_6  ),
    .ph_real_7  (ph_real_7  ),
    .ph_real_8  (ph_real_8  ),
    .ph_real_9  (ph_real_9  ),
    .ph_real_10  (ph_real_10  ),
    .ph_real_11  (ph_real_11  ),
    .ph_real_12  (ph_real_12  ),
    .ph_real_13  (ph_real_13  ),
    .ph_real_14  (ph_real_14  ),
    .ph_real_15  (ph_real_15  ),
    .ph_real_16  (ph_real_16  ),
    .ph_real_17  (ph_real_17  ),
    .ph_real_18  (ph_real_18  ),
    .ph_real_19  (ph_real_19  ),
    .ph_real_20  (ph_real_20  ),
    .ph_real_21  (ph_real_21  ),
    .ph_real_22  (ph_real_22  ),
    .ph_real_23  (ph_real_23  ),
    .ph_real_24  (ph_real_24  ),
    .ph_real_25  (ph_real_25  ),
    .ph_real_26  (ph_real_26  ),
    .ph_real_27  (ph_real_27 ),
    .ph_real_28  (ph_real_28  ),
    .ph_real_29  (ph_real_29  ),
    .ph_real_30  (ph_real_30  ),
    .ph_real_31  (ph_real_31  ),
    .ph_real_32  (ph_real_32  ),
    .ph_real_33  (ph_real_33  ),
    .ph_real_34  (ph_real_34  ),
    .ph_real_35  (ph_real_35  ),

    
    .ph_image_1 (ph_image_1 ),
    .ph_image_2 (ph_image_2 ),
    .ph_image_3 (ph_image_3 ),
    .ph_image_4 (ph_image_4 ),
    .ph_image_5 (ph_image_5 ),
    .ph_image_6 (ph_image_6 ),
    .ph_image_7 (ph_image_7 ),
    .ph_image_8 (ph_image_8 ),
    .ph_image_9 (ph_image_9 ),
    .ph_image_10 (ph_image_10 ),
    .ph_image_11 (ph_image_11 ),
    .ph_image_12 (ph_image_12 ),
    .ph_image_13 (ph_image_13 ),
    .ph_image_14 (ph_image_14 ),
    .ph_image_15 (ph_image_15 ),
    .ph_image_16 (ph_image_16 ),
    .ph_image_17 (ph_image_17 ),
    .ph_image_18 (ph_image_18 ),
    .ph_image_19 (ph_image_19 ),
    .ph_image_20 (ph_image_20 ),
    .ph_image_21 (ph_image_21 ),
    .ph_image_22 (ph_image_22 ),
    .ph_image_23 (ph_image_23 ),
    .ph_image_24 (ph_image_24 ),
    .ph_image_25 (ph_image_25 ),
    .ph_image_26 (ph_image_26 ),
    .ph_image_27 (ph_image_27 ),
    .ph_image_28 (ph_image_28 ),
    .ph_image_29 (ph_image_29 ),
    .ph_image_30 (ph_image_30 ),
    .ph_image_31 (ph_image_31 ),
    .ph_image_32 (ph_image_32 ),
    .ph_image_33 (ph_image_33 ),
    .ph_image_34 (ph_image_34 ),
    .ph_image_35 (ph_image_35 )   

    );
    
 dbf_phase_top dbf_phase_top_2(
    .clk(clk),
    
    .phase_data_1 (phase_data_36 ),
    .phase_data_2 (phase_data_37 ),
    .phase_data_3 (phase_data_38),
    .phase_data_4 (phase_data_39 ),
    .phase_data_5 (phase_data_40 ),
    .phase_data_6 (phase_data_41 ),
    .phase_data_7 (phase_data_42 ),
    .phase_data_8 (phase_data_43 ),
    .phase_data_9 (phase_data_44 ),
    .phase_data_10 (phase_data_45 ),
    .phase_data_11 (phase_data_46 ),
    .phase_data_12 (phase_data_47 ),
    .phase_data_13 (phase_data_48 ),
    .phase_data_14(phase_data_49 ),
    .phase_data_15(phase_data_50 ),
    .phase_data_16(phase_data_51 ),
    .phase_data_17(phase_data_52 ),
    .phase_data_18(phase_data_53 ),
    .phase_data_19(phase_data_54 ),
    .phase_data_20(phase_data_55 ),
    .phase_data_21(phase_data_56 ),
    .phase_data_22(phase_data_57 ),
    .phase_data_23(phase_data_58 ),
    .phase_data_24(phase_data_59 ),
    .phase_data_25(phase_data_60),
    .phase_data_26(phase_data_61),
    .phase_data_27(phase_data_62),
    .phase_data_28(phase_data_63),
    .phase_data_29(phase_data_64),
    .phase_data_30(phase_data_65),
    .phase_data_31(phase_data_66 ),
    .phase_data_32(phase_data_67 ),
    .phase_data_33(phase_data_68),
    .phase_data_34(phase_data_69),
    .phase_data_35(phase_data_70),
    
    .phase_data_1_im (phase_data_36_im ),
    .phase_data_2_im (phase_data_37_im ),
    .phase_data_3_im (phase_data_38_im ),
    .phase_data_4_im (phase_data_39_im ),
    .phase_data_5_im (phase_data_40_im ),
    .phase_data_6_im (phase_data_41_im ),
    .phase_data_7_im (phase_data_42_im ),
    .phase_data_8_im (phase_data_43_im ),
    .phase_data_9_im (phase_data_44_im ),
    .phase_data_10_im (phase_data_45_im ),
    .phase_data_11_im (phase_data_46_im ),
    .phase_data_12_im (phase_data_47_im ),
    .phase_data_13_im (phase_data_48_im ),
    .phase_data_14_im (phase_data_49_im ),
    .phase_data_15_im (phase_data_50_im ),
    .phase_data_16_im (phase_data_51_im ),
    .phase_data_17_im (phase_data_52_im ),
    .phase_data_18_im (phase_data_53_im ),
    .phase_data_19_im (phase_data_54_im ),
    .phase_data_20_im (phase_data_55_im ),
    .phase_data_21_im (phase_data_56_im ),
    .phase_data_22_im (phase_data_57_im ),
    .phase_data_23_im (phase_data_58_im ),
    .phase_data_24_im (phase_data_59_im ),
    .phase_data_25_im (phase_data_60_im ),
    .phase_data_26_im (phase_data_61_im ),
    .phase_data_27_im (phase_data_62_im ),
    .phase_data_28_im (phase_data_63_im ),
    .phase_data_29_im (phase_data_64_im ),
    .phase_data_30_im (phase_data_65_im ),
    .phase_data_31_im (phase_data_66_im ),
    .phase_data_32_im (phase_data_67_im ),
    .phase_data_33_im (phase_data_68_im ),
    .phase_data_34_im (phase_data_69_im ),
    .phase_data_35_im (phase_data_70_im ),
    .phase_data_valid(phase_data_valid),
   
    .A1(A36),
    .A2(A37),
    .A3(A38),
    .A4(A39),
    .A5(A40),
    .A6(A41),
    .A7(A42),
    .A8(A43),
    .A9(A44),
    .A10(A45),
    .A11(A46),
    .A12(A47),
    .A13(A48),
    .A14(A49),
    .A15(A50),
    .A16(A51),
    .A17(A52),
    .A18(A53),
    .A19(A54),
    .A20(A55),
    .A21(A56),
    .A22(A57),
    .A23(A58),
    .A24(A59),
    .A25(A60),
    .A26(A61),
    .A27(A62),
    .A28(A63),
    .A29(A64),
    .A30(A65),
    .A31(A66),
    .A32(A67),
    .A33(A68),
    .A34(A69),
    .A35(A70),
    
    .ph_real_1   (ph_real_36),
    .ph_real_2   (ph_real_37),
    .ph_real_3   (ph_real_38),
    .ph_real_4   (ph_real_39),
    .ph_real_5   (ph_real_40),
    .ph_real_6   (ph_real_41),
    .ph_real_7   (ph_real_42),
    .ph_real_8   (ph_real_43),
    .ph_real_9   (ph_real_44),
    .ph_real_10  (ph_real_45 ),
    .ph_real_11  (ph_real_46 ),
    .ph_real_12  (ph_real_47 ),
    .ph_real_13  (ph_real_48 ),
    .ph_real_14  (ph_real_49 ),
    .ph_real_15  (ph_real_50 ),
    .ph_real_16  (ph_real_51 ),
    .ph_real_17  (ph_real_52 ),
    .ph_real_18  (ph_real_53 ),
    .ph_real_19  (ph_real_54 ),
    .ph_real_20  (ph_real_55 ),
    .ph_real_21  (ph_real_56 ),
    .ph_real_22  (ph_real_57 ),
    .ph_real_23  (ph_real_58 ),
    .ph_real_24  (ph_real_59 ),
    .ph_real_25  (ph_real_60 ),
    .ph_real_26  (ph_real_61 ),
    .ph_real_27  (ph_real_62),
    .ph_real_28  (ph_real_63 ),
    .ph_real_29  (ph_real_64 ),
    .ph_real_30  (ph_real_65 ),
    .ph_real_31  (ph_real_66 ),
    .ph_real_32  (ph_real_67 ),
    .ph_real_33  (ph_real_68 ),
    .ph_real_34  (ph_real_69 ),
    .ph_real_35  (ph_real_70 ),

    
    .ph_image_1  (ph_image_36 ),
    .ph_image_2  (ph_image_37 ),
    .ph_image_3  (ph_image_38 ),
    .ph_image_4  (ph_image_39 ),
    .ph_image_5  (ph_image_40 ),
    .ph_image_6  (ph_image_41 ),
    .ph_image_7  (ph_image_42 ),
    .ph_image_8  (ph_image_43 ),
    .ph_image_9  (ph_image_44 ),
    .ph_image_10 (ph_image_45 ),
    .ph_image_11 (ph_image_46 ),
    .ph_image_12 (ph_image_47 ),
    .ph_image_13 (ph_image_48 ),
    .ph_image_14 (ph_image_49 ),
    .ph_image_15 (ph_image_50 ),
    .ph_image_16 (ph_image_51 ),
    .ph_image_17 (ph_image_52 ),
    .ph_image_18 (ph_image_53 ),
    .ph_image_19 (ph_image_54 ),
    .ph_image_20 (ph_image_55 ),
    .ph_image_21 (ph_image_56 ),
    .ph_image_22 (ph_image_57 ),
    .ph_image_23 (ph_image_58 ),
    .ph_image_24 (ph_image_59 ),
    .ph_image_25 (ph_image_60 ),
    .ph_image_26 (ph_image_61 ),
    .ph_image_27 (ph_image_62 ),
    .ph_image_28 (ph_image_63 ),
    .ph_image_29 (ph_image_64 ),
    .ph_image_30 (ph_image_65 ),
    .ph_image_31 (ph_image_66 ),
    .ph_image_32 (ph_image_67 ),
    .ph_image_33 (ph_image_68 ),
    .ph_image_34 (ph_image_69 ),
    .ph_image_35 (ph_image_70 )   

    );
/////////////////////////////////////////////////////////////////////////////////////////    
    wire [23:0]add_L_1_35_I;
    wire [23:0]add_L_1_35_Q;
    wire [23:0]add_L_36_70_I;
    wire [23:0]add_L_36_70_Q;
    wire [23:0]add_R_1_35_I;
    wire [23:0]add_R_1_35_Q;
    wire [23:0]add_R_36_70_I;
    wire [23:0]add_R_36_70_Q;
    wire data_valid;  
//    ila_dbf_add ila_dbf_add_1 (
//	.clk(clk), // input wire clk


//	.probe0(add_L_1_35_I), // input wire [20:0]  probe0  
//	.probe1(add_L_1_35_Q), // input wire [20:0]  probe1 
//	.probe2(add_L_36_70_I), // input wire [20:0]  probe2 
//	.probe3(add_L_36_70_Q), // input wire [20:0]  probe3 
//	.probe4(add_R_1_35_I), // input wire [20:0]  probe4 
//	.probe5(add_R_1_35_Q), // input wire [20:0]  probe5 
//	.probe6(add_R_36_70_I), // input wire [20:0]  probe6 
//	.probe7(add_R_36_70_Q) // input wire [20:0]  probe7
//);
fuyang35_1  fuyang_L_1(
    .clk(clk),
    .data_in_I1(data_in_L_1_I),
    .data_in_Q1(data_in_L_1_Q),
    .data_in_I2(data_in_L_2_I),
    .data_in_Q2(data_in_L_2_Q),
    .data_in_I3(data_in_L_3_I),
    .data_in_Q3(data_in_L_3_Q),
    .data_in_I4(data_in_L_4_I),
    .data_in_Q4(data_in_L_4_Q),
    .data_in_I5(data_in_L_5_I),
    .data_in_Q5(data_in_L_5_Q),
    .data_in_I6(data_in_L_6_I),
    .data_in_Q6(data_in_L_6_Q),
    .data_in_I7(data_in_L_7_I),
    .data_in_Q7(data_in_L_7_Q),
    .data_in_I8(data_in_L_8_I),
    .data_in_Q8(data_in_L_8_Q),
    .data_in_I9(data_in_L_9_I),
    .data_in_Q9(data_in_L_9_Q),
    .data_in_I10(data_in_L_10_I),
    .data_in_Q10(data_in_L_10_Q),
    .data_in_I11(data_in_L_11_I),
    .data_in_Q11(data_in_L_11_Q),
    .data_in_I12(data_in_L_12_I),
    .data_in_Q12(data_in_L_12_Q),
    .data_in_I13(data_in_L_13_I),
    .data_in_Q13(data_in_L_13_Q),
    .data_in_I14(data_in_L_14_I),
    .data_in_Q14(data_in_L_14_Q),
    .data_in_I15(data_in_L_15_I),
    .data_in_Q15(data_in_L_15_Q),
    .data_in_I16(data_in_L_16_I),
    .data_in_Q16(data_in_L_16_Q),
    .data_in_I17(data_in_L_17_I),
    .data_in_Q17(data_in_L_17_Q),
    .data_in_I18(data_in_L_18_I),
    .data_in_Q18(data_in_L_18_Q),
    .data_in_I19(data_in_L_19_I),
    .data_in_Q19(data_in_L_19_Q),
    .data_in_I20(data_in_L_20_I),
    .data_in_Q20(data_in_L_20_Q),
    .data_in_I21(data_in_L_21_I),
    .data_in_Q21(data_in_L_21_Q),
    .data_in_I22(data_in_L_22_I),
    .data_in_Q22(data_in_L_22_Q),
    .data_in_I23(data_in_L_23_I),
    .data_in_Q23(data_in_L_23_Q),
    .data_in_I24(data_in_L_24_I),
    .data_in_Q24(data_in_L_24_Q),
    .data_in_I25(data_in_L_25_I),
    .data_in_Q25(data_in_L_25_Q),
    .data_in_I26(data_in_L_26_I),
    .data_in_Q26(data_in_L_26_Q),
    .data_in_I27(data_in_L_27_I),
    .data_in_Q27(data_in_L_27_Q),
    .data_in_I28(data_in_L_28_I),
    .data_in_Q28(data_in_L_28_Q),
    .data_in_I29(data_in_L_29_I),
    .data_in_Q29(data_in_L_29_Q),
    .data_in_I30(data_in_L_30_I),
    .data_in_Q30(data_in_L_30_Q),
    .data_in_I31(data_in_L_31_I),
    .data_in_Q31(data_in_L_31_Q),
    .data_in_I32(data_in_L_32_I),
    .data_in_Q32(data_in_L_32_Q),
    .data_in_I33(data_in_L_33_I),
    .data_in_Q33(data_in_L_33_Q),
    .data_in_I34(data_in_L_34_I),
    .data_in_Q34(data_in_L_34_Q),
    .data_in_I35(data_in_L_35_I),
    .data_in_Q35(data_in_L_35_Q),
    
    .data_in_valid(data_in_valid),
    
    .ph_real_1   (ph_real_1  ),
    .ph_real_2   (ph_real_2  ),
    .ph_real_3   (ph_real_3  ),
    .ph_real_4   (ph_real_4  ),
    .ph_real_5   (ph_real_5  ),
    .ph_real_6   (ph_real_6  ),
    .ph_real_7   (ph_real_7  ),
    .ph_real_8   (ph_real_8  ),
    .ph_real_9   (ph_real_9  ),
    .ph_real_10  (ph_real_10 ),
    .ph_real_11  (ph_real_11 ),
    .ph_real_12  (ph_real_12 ),
    .ph_real_13  (ph_real_13 ),
    .ph_real_14  (ph_real_14 ),
    .ph_real_15  (ph_real_15 ),
    .ph_real_16  (ph_real_16 ),
    .ph_real_17  (ph_real_17 ),
    .ph_real_18  (ph_real_18 ),
    .ph_real_19  (ph_real_19 ),
    .ph_real_20  (ph_real_20 ),
    .ph_real_21  (ph_real_21 ),
    .ph_real_22  (ph_real_22 ),
    .ph_real_23  (ph_real_23 ),
    .ph_real_24  (ph_real_24 ),
    .ph_real_25  (ph_real_25 ),
    .ph_real_26  (ph_real_26 ),
    .ph_real_27  (ph_real_27 ),
    .ph_real_28  (ph_real_28 ),
    .ph_real_29  (ph_real_29 ),
    .ph_real_30  (ph_real_30 ),
    .ph_real_31  (ph_real_31 ),
    .ph_real_32  (ph_real_32 ),
    .ph_real_33  (ph_real_33 ),
    .ph_real_34  (ph_real_34 ),
    .ph_real_35  (ph_real_35 ),
    
    .ph_image_1  (ph_image_1 ),
    .ph_image_2  (ph_image_2 ),
    .ph_image_3  (ph_image_3 ),
    .ph_image_4  (ph_image_4 ),
    .ph_image_5  (ph_image_5 ),
    .ph_image_6  (ph_image_6 ),
    .ph_image_7  (ph_image_7 ),
    .ph_image_8  (ph_image_8 ),
    .ph_image_9  (ph_image_9 ),
    .ph_image_10 (ph_image_10),
    .ph_image_11 (ph_image_11),
    .ph_image_12 (ph_image_12),
    .ph_image_13 (ph_image_13),
    .ph_image_14 (ph_image_14),
    .ph_image_15 (ph_image_15),
    .ph_image_16 (ph_image_16),
    .ph_image_17 (ph_image_17),
    .ph_image_18 (ph_image_18),
    .ph_image_19 (ph_image_19),
    .ph_image_20 (ph_image_20),
    .ph_image_21 (ph_image_21),
    .ph_image_22 (ph_image_22),
    .ph_image_23 (ph_image_23),
    .ph_image_24 (ph_image_24),
    .ph_image_25 (ph_image_25),
    .ph_image_26 (ph_image_26),
    .ph_image_27 (ph_image_27),
    .ph_image_28 (ph_image_28),
    .ph_image_29 (ph_image_29),
    .ph_image_30 (ph_image_30),
    .ph_image_31 (ph_image_31),
    .ph_image_32 (ph_image_32),
    .ph_image_33 (ph_image_33),
    .ph_image_34 (ph_image_34),
    .ph_image_35 (ph_image_35),

    .sum_1_35_I(add_L_1_35_I),
    .sum_1_35_Q(add_L_1_35_Q),
    .data_out_valid(data_valid)  
    );
    
    fuyang35_1  fuyang_L_2(
    .clk(clk),
    .data_in_I1(data_in_L_36_I),
    .data_in_Q1(data_in_L_36_Q),
    .data_in_I2(data_in_L_37_I),
    .data_in_Q2(data_in_L_37_Q),
    .data_in_I3(data_in_L_38_I),
    .data_in_Q3(data_in_L_38_Q),
    .data_in_I4(data_in_L_39_I),
    .data_in_Q4(data_in_L_39_Q),
    .data_in_I5(data_in_L_40_I),
    .data_in_Q5(data_in_L_40_Q),
    .data_in_I6(data_in_L_41_I),
    .data_in_Q6(data_in_L_41_Q),
    .data_in_I7(data_in_L_42_I),
    .data_in_Q7(data_in_L_42_Q),
    .data_in_I8(data_in_L_43_I),
    .data_in_Q8(data_in_L_43_Q),
    .data_in_I9(data_in_L_44_I),
    .data_in_Q9(data_in_L_44_Q),
    .data_in_I10(data_in_L_45_I),
    .data_in_Q10(data_in_L_45_Q),
    .data_in_I11(data_in_L_46_I),
    .data_in_Q11(data_in_L_46_Q),
    .data_in_I12(data_in_L_47_I),
    .data_in_Q12(data_in_L_47_Q),
    .data_in_I13(data_in_L_48_I),
    .data_in_Q13(data_in_L_48_Q),
    .data_in_I14(data_in_L_49_I),
    .data_in_Q14(data_in_L_49_Q),
    .data_in_I15(data_in_L_50_I),
    .data_in_Q15(data_in_L_50_Q),
    .data_in_I16(data_in_L_51_I),
    .data_in_Q16(data_in_L_51_Q),
    .data_in_I17(data_in_L_52_I),
    .data_in_Q17(data_in_L_52_Q),
    .data_in_I18(data_in_L_53_I),
    .data_in_Q18(data_in_L_53_Q),
    .data_in_I19(data_in_L_54_I),
    .data_in_Q19(data_in_L_54_Q),
    .data_in_I20(data_in_L_55_I),
    .data_in_Q20(data_in_L_55_Q),
    .data_in_I21(data_in_L_56_I),
    .data_in_Q21(data_in_L_56_Q),
    .data_in_I22(data_in_L_57_I),
    .data_in_Q22(data_in_L_57_Q),
    .data_in_I23(data_in_L_58_I),
    .data_in_Q23(data_in_L_58_Q),
    .data_in_I24(data_in_L_59_I),
    .data_in_Q24(data_in_L_59_Q),
    .data_in_I25(data_in_L_60_I),
    .data_in_Q25(data_in_L_60_Q),
    .data_in_I26(data_in_L_61_I),
    .data_in_Q26(data_in_L_61_Q),
    .data_in_I27(data_in_L_62_I),
    .data_in_Q27(data_in_L_62_Q),
    .data_in_I28(data_in_L_63_I),
    .data_in_Q28(data_in_L_63_Q),
    .data_in_I29(data_in_L_64_I),
    .data_in_Q29(data_in_L_64_Q),
    .data_in_I30(data_in_L_65_I),
    .data_in_Q30(data_in_L_65_Q),
    .data_in_I31(data_in_L_66_I),
    .data_in_Q31(data_in_L_66_Q),
    .data_in_I32(data_in_L_67_I),
    .data_in_Q32(data_in_L_67_Q),
    .data_in_I33(data_in_L_68_I),
    .data_in_Q33(data_in_L_68_Q),
    .data_in_I34(data_in_L_69_I),
    .data_in_Q34(data_in_L_69_Q),
    .data_in_I35(data_in_L_70_I),
    .data_in_Q35(data_in_L_70_Q),
    
    .data_in_valid(data_in_valid),
    
    .ph_real_1   (ph_real_36 ),
    .ph_real_2   (ph_real_37 ),
    .ph_real_3   (ph_real_38 ),
    .ph_real_4   (ph_real_39 ),
    .ph_real_5   (ph_real_40 ),
    .ph_real_6   (ph_real_41 ),
    .ph_real_7   (ph_real_42 ),
    .ph_real_8   (ph_real_43 ),
    .ph_real_9   (ph_real_44 ),
    .ph_real_10  (ph_real_45 ),
    .ph_real_11  (ph_real_46 ),
    .ph_real_12  (ph_real_47 ),
    .ph_real_13  (ph_real_48 ),
    .ph_real_14  (ph_real_49 ),
    .ph_real_15  (ph_real_50 ),
    .ph_real_16  (ph_real_51 ),
    .ph_real_17  (ph_real_52 ),
    .ph_real_18  (ph_real_53 ),
    .ph_real_19  (ph_real_54 ),
    .ph_real_20  (ph_real_55 ),
    .ph_real_21  (ph_real_56 ),
    .ph_real_22  (ph_real_57 ),
    .ph_real_23  (ph_real_58 ),
    .ph_real_24  (ph_real_59 ),
    .ph_real_25  (ph_real_60 ),
    .ph_real_26  (ph_real_61 ),
    .ph_real_27  (ph_real_62 ),
    .ph_real_28  (ph_real_63 ),
    .ph_real_29  (ph_real_64 ),
    .ph_real_30  (ph_real_65 ),
    .ph_real_31  (ph_real_66 ),
    .ph_real_32  (ph_real_67 ),
    .ph_real_33  (ph_real_68 ),
    .ph_real_34  (ph_real_69 ),
    .ph_real_35  (ph_real_70 ),
    
    .ph_image_1  (ph_image_36 ),
    .ph_image_2  (ph_image_37 ),
    .ph_image_3  (ph_image_38 ),
    .ph_image_4  (ph_image_39 ),
    .ph_image_5  (ph_image_40 ),
    .ph_image_6  (ph_image_41 ),
    .ph_image_7  (ph_image_42 ),
    .ph_image_8  (ph_image_43 ),
    .ph_image_9  (ph_image_44 ),
    .ph_image_10 (ph_image_45),
    .ph_image_11 (ph_image_46),
    .ph_image_12 (ph_image_47),
    .ph_image_13 (ph_image_48),
    .ph_image_14 (ph_image_49),
    .ph_image_15 (ph_image_50),
    .ph_image_16 (ph_image_51),
    .ph_image_17 (ph_image_52),
    .ph_image_18 (ph_image_53),
    .ph_image_19 (ph_image_54),
    .ph_image_20 (ph_image_55),
    .ph_image_21 (ph_image_56),
    .ph_image_22 (ph_image_57),
    .ph_image_23 (ph_image_58),
    .ph_image_24 (ph_image_59),
    .ph_image_25 (ph_image_60),
    .ph_image_26 (ph_image_61),
    .ph_image_27 (ph_image_62),
    .ph_image_28 (ph_image_63),
    .ph_image_29 (ph_image_64),
    .ph_image_30 (ph_image_65),
    .ph_image_31 (ph_image_66),
    .ph_image_32 (ph_image_67),
    .ph_image_33 (ph_image_68),
    .ph_image_34 (ph_image_69),
    .ph_image_35 (ph_image_70),

    .sum_1_35_I(add_L_36_70_I),
    .sum_1_35_Q(add_L_36_70_Q),
    .data_out_valid()  
    );
    fuyang35_1  fuyang_R_1(
    .clk(clk),
    .data_in_I1(data_in_R_1_I),
    .data_in_Q1(data_in_R_1_Q),
    .data_in_I2(data_in_R_2_I),
    .data_in_Q2(data_in_R_2_Q),
    .data_in_I3(data_in_R_3_I),
    .data_in_Q3(data_in_R_3_Q),
    .data_in_I4(data_in_R_4_I),
    .data_in_Q4(data_in_R_4_Q),
    .data_in_I5(data_in_R_5_I),
    .data_in_Q5(data_in_R_5_Q),
    .data_in_I6(data_in_R_6_I),
    .data_in_Q6(data_in_R_6_Q),
    .data_in_I7(data_in_R_7_I),
    .data_in_Q7(data_in_R_7_Q),
    .data_in_I8(data_in_R_8_I),
    .data_in_Q8(data_in_R_8_Q),
    .data_in_I9(data_in_R_9_I),
    .data_in_Q9(data_in_R_9_Q),
    .data_in_I10(data_in_R_10_I),
    .data_in_Q10(data_in_R_10_Q),
    .data_in_I11(data_in_R_11_I),
    .data_in_Q11(data_in_R_11_Q),
    .data_in_I12(data_in_R_12_I),
    .data_in_Q12(data_in_R_12_Q),
    .data_in_I13(data_in_R_13_I),
    .data_in_Q13(data_in_R_13_Q),
    .data_in_I14(data_in_R_14_I),
    .data_in_Q14(data_in_R_14_Q),
    .data_in_I15(data_in_R_15_I),
    .data_in_Q15(data_in_R_15_Q),
    .data_in_I16(data_in_R_16_I),
    .data_in_Q16(data_in_R_16_Q),
    .data_in_I17(data_in_R_17_I),
    .data_in_Q17(data_in_R_17_Q),
    .data_in_I18(data_in_R_18_I),
    .data_in_Q18(data_in_R_18_Q),
    .data_in_I19(data_in_R_19_I),
    .data_in_Q19(data_in_R_19_Q),
    .data_in_I20(data_in_R_20_I),
    .data_in_Q20(data_in_R_20_Q),
    .data_in_I21(data_in_R_21_I),
    .data_in_Q21(data_in_R_21_Q),
    .data_in_I22(data_in_R_22_I),
    .data_in_Q22(data_in_R_22_Q),
    .data_in_I23(data_in_R_23_I),
    .data_in_Q23(data_in_R_23_Q),
    .data_in_I24(data_in_R_24_I),
    .data_in_Q24(data_in_R_24_Q),
    .data_in_I25(data_in_R_25_I),
    .data_in_Q25(data_in_R_25_Q),
    .data_in_I26(data_in_R_26_I),
    .data_in_Q26(data_in_R_26_Q),
    .data_in_I27(data_in_R_27_I),
    .data_in_Q27(data_in_R_27_Q),
    .data_in_I28(data_in_R_28_I),
    .data_in_Q28(data_in_R_28_Q),
    .data_in_I29(data_in_R_29_I),
    .data_in_Q29(data_in_R_29_Q),
    .data_in_I30(data_in_R_30_I),
    .data_in_Q30(data_in_R_30_Q),
    .data_in_I31(data_in_R_31_I),
    .data_in_Q31(data_in_R_31_Q),
    .data_in_I32(data_in_R_32_I),
    .data_in_Q32(data_in_R_32_Q),
    .data_in_I33(data_in_R_33_I),
    .data_in_Q33(data_in_R_33_Q),
    .data_in_I34(data_in_R_34_I),
    .data_in_Q34(data_in_R_34_Q),
    .data_in_I35(data_in_R_35_I),
    .data_in_Q35(data_in_R_35_Q),
    
    .data_in_valid(data_in_valid),
    
    .ph_real_1   (ph_real_1  ),
    .ph_real_2   (ph_real_2  ),
    .ph_real_3   (ph_real_3  ),
    .ph_real_4   (ph_real_4  ),
    .ph_real_5   (ph_real_5  ),
    .ph_real_6   (ph_real_6  ),
    .ph_real_7   (ph_real_7  ),
    .ph_real_8   (ph_real_8  ),
    .ph_real_9   (ph_real_9  ),
    .ph_real_10  (ph_real_10 ),
    .ph_real_11  (ph_real_11 ),
    .ph_real_12  (ph_real_12 ),
    .ph_real_13  (ph_real_13 ),
    .ph_real_14  (ph_real_14 ),
    .ph_real_15  (ph_real_15 ),
    .ph_real_16  (ph_real_16 ),
    .ph_real_17  (ph_real_17 ),
    .ph_real_18  (ph_real_18 ),
    .ph_real_19  (ph_real_19 ),
    .ph_real_20  (ph_real_20 ),
    .ph_real_21  (ph_real_21 ),
    .ph_real_22  (ph_real_22 ),
    .ph_real_23  (ph_real_23 ),
    .ph_real_24  (ph_real_24 ),
    .ph_real_25  (ph_real_25 ),
    .ph_real_26  (ph_real_26 ),
    .ph_real_27  (ph_real_27 ),
    .ph_real_28  (ph_real_28 ),
    .ph_real_29  (ph_real_29 ),
    .ph_real_30  (ph_real_30 ),
    .ph_real_31  (ph_real_31 ),
    .ph_real_32  (ph_real_32 ),
    .ph_real_33  (ph_real_33 ),
    .ph_real_34  (ph_real_34 ),
    .ph_real_35  (ph_real_35 ),
    
    .ph_image_1  (ph_image_1 ),
    .ph_image_2  (ph_image_2 ),
    .ph_image_3  (ph_image_3 ),
    .ph_image_4  (ph_image_4 ),
    .ph_image_5  (ph_image_5 ),
    .ph_image_6  (ph_image_6 ),
    .ph_image_7  (ph_image_7 ),
    .ph_image_8  (ph_image_8 ),
    .ph_image_9  (ph_image_9 ),
    .ph_image_10 (ph_image_10),
    .ph_image_11 (ph_image_11),
    .ph_image_12 (ph_image_12),
    .ph_image_13 (ph_image_13),
    .ph_image_14 (ph_image_14),
    .ph_image_15 (ph_image_15),
    .ph_image_16 (ph_image_16),
    .ph_image_17 (ph_image_17),
    .ph_image_18 (ph_image_18),
    .ph_image_19 (ph_image_19),
    .ph_image_20 (ph_image_20),
    .ph_image_21 (ph_image_21),
    .ph_image_22 (ph_image_22),
    .ph_image_23 (ph_image_23),
    .ph_image_24 (ph_image_24),
    .ph_image_25 (ph_image_25),
    .ph_image_26 (ph_image_26),
    .ph_image_27 (ph_image_27),
    .ph_image_28 (ph_image_28),
    .ph_image_29 (ph_image_29),
    .ph_image_30 (ph_image_30),
    .ph_image_31 (ph_image_31),
    .ph_image_32 (ph_image_32),
    .ph_image_33 (ph_image_33),
    .ph_image_34 (ph_image_34),
    .ph_image_35 (ph_image_35),

    .sum_1_35_I(add_R_1_35_I),
    .sum_1_35_Q(add_R_1_35_Q),
    .data_out_valid()  
    );

 fuyang35_1  fuyang_R_2(
    .clk(clk),
    .data_in_I1(data_in_R_36_I),
    .data_in_Q1(data_in_R_36_Q),
    .data_in_I2(data_in_R_37_I),
    .data_in_Q2(data_in_R_37_Q),
    .data_in_I3(data_in_R_38_I),
    .data_in_Q3(data_in_R_38_Q),
    .data_in_I4(data_in_R_39_I),
    .data_in_Q4(data_in_R_39_Q),
    .data_in_I5(data_in_R_40_I),
    .data_in_Q5(data_in_R_40_Q),
    .data_in_I6(data_in_R_41_I),
    .data_in_Q6(data_in_R_41_Q),
    .data_in_I7(data_in_R_42_I),
    .data_in_Q7(data_in_R_42_Q),
    .data_in_I8 (data_in_R_43_I),
    .data_in_Q8 (data_in_R_43_Q),
    .data_in_I9 (data_in_R_44_I),
    .data_in_Q9 (data_in_R_44_Q),
    .data_in_I10(data_in_R_45_I),
    .data_in_Q10(data_in_R_45_Q),
    .data_in_I11(data_in_R_46_I),
    .data_in_Q11(data_in_R_46_Q),
    .data_in_I12(data_in_R_47_I),
    .data_in_Q12(data_in_R_47_Q),
    .data_in_I13(data_in_R_48_I),
    .data_in_Q13(data_in_R_48_Q),
    .data_in_I14(data_in_R_49_I),
    .data_in_Q14(data_in_R_49_Q),
    .data_in_I15(data_in_R_50_I),
    .data_in_Q15(data_in_R_50_Q),
    .data_in_I16(data_in_R_51_I),
    .data_in_Q16(data_in_R_51_Q),
    .data_in_I17(data_in_R_52_I),
    .data_in_Q17(data_in_R_52_Q),
    .data_in_I18(data_in_R_53_I),
    .data_in_Q18(data_in_R_53_Q),
    .data_in_I19(data_in_R_54_I),
    .data_in_Q19(data_in_R_54_Q),
    .data_in_I20(data_in_R_55_I),
    .data_in_Q20(data_in_R_55_Q),
    .data_in_I21(data_in_R_56_I),
    .data_in_Q21(data_in_R_56_Q),
    .data_in_I22(data_in_R_57_I),
    .data_in_Q22(data_in_R_57_Q),
    .data_in_I23(data_in_R_58_I),
    .data_in_Q23(data_in_R_58_Q),
    .data_in_I24(data_in_R_59_I),
    .data_in_Q24(data_in_R_59_Q),
    .data_in_I25(data_in_R_60_I),
    .data_in_Q25(data_in_R_60_Q),
    .data_in_I26(data_in_R_61_I),
    .data_in_Q26(data_in_R_61_Q),
    .data_in_I27(data_in_R_62_I),
    .data_in_Q27(data_in_R_62_Q),
    .data_in_I28(data_in_R_63_I),
    .data_in_Q28(data_in_R_63_Q),
    .data_in_I29(data_in_R_64_I),
    .data_in_Q29(data_in_R_64_Q),
    .data_in_I30(data_in_R_65_I),
    .data_in_Q30(data_in_R_65_Q),
    .data_in_I31(data_in_R_66_I),
    .data_in_Q31(data_in_R_66_Q),
    .data_in_I32(data_in_R_67_I),
    .data_in_Q32(data_in_R_67_Q),
    .data_in_I33(data_in_R_68_I),
    .data_in_Q33(data_in_R_68_Q),
    .data_in_I34(data_in_R_69_I),
    .data_in_Q34(data_in_R_69_Q),
    .data_in_I35(data_in_R_70_I),
    .data_in_Q35(data_in_R_70_Q),
    
    .data_in_valid(data_in_valid),
    
    .ph_real_1   (ph_real_36 ),
    .ph_real_2   (ph_real_37 ),
    .ph_real_3   (ph_real_38 ),
    .ph_real_4   (ph_real_39 ),
    .ph_real_5   (ph_real_40 ),
    .ph_real_6   (ph_real_41 ),
    .ph_real_7   (ph_real_42 ),
    .ph_real_8   (ph_real_43 ),
    .ph_real_9   (ph_real_44 ),
    .ph_real_10  (ph_real_45 ),
    .ph_real_11  (ph_real_46 ),
    .ph_real_12  (ph_real_47 ),
    .ph_real_13  (ph_real_48 ),
    .ph_real_14  (ph_real_49 ),
    .ph_real_15  (ph_real_50 ),
    .ph_real_16  (ph_real_51 ),
    .ph_real_17  (ph_real_52 ),
    .ph_real_18  (ph_real_53 ),
    .ph_real_19  (ph_real_54 ),
    .ph_real_20  (ph_real_55 ),
    .ph_real_21  (ph_real_56 ),
    .ph_real_22  (ph_real_57 ),
    .ph_real_23  (ph_real_58 ),
    .ph_real_24  (ph_real_59 ),
    .ph_real_25  (ph_real_60 ),
    .ph_real_26  (ph_real_61 ),
    .ph_real_27  (ph_real_62 ),
    .ph_real_28  (ph_real_63 ),
    .ph_real_29  (ph_real_64 ),
    .ph_real_30  (ph_real_65 ),
    .ph_real_31  (ph_real_66 ),
    .ph_real_32  (ph_real_67 ),
    .ph_real_33  (ph_real_68 ),
    .ph_real_34  (ph_real_69 ),
    .ph_real_35  (ph_real_70 ),
    
    .ph_image_1  (ph_image_36 ),
    .ph_image_2  (ph_image_37 ),
    .ph_image_3  (ph_image_38 ),
    .ph_image_4  (ph_image_39 ),
    .ph_image_5  (ph_image_40 ),
    .ph_image_6  (ph_image_41 ),
    .ph_image_7  (ph_image_42 ),
    .ph_image_8  (ph_image_43 ),
    .ph_image_9  (ph_image_44 ),
    .ph_image_10 (ph_image_45),
    .ph_image_11 (ph_image_46),
    .ph_image_12 (ph_image_47),
    .ph_image_13 (ph_image_48),
    .ph_image_14 (ph_image_49),
    .ph_image_15 (ph_image_50),
    .ph_image_16 (ph_image_51),
    .ph_image_17 (ph_image_52),
    .ph_image_18 (ph_image_53),
    .ph_image_19 (ph_image_54),
    .ph_image_20 (ph_image_55),
    .ph_image_21 (ph_image_56),
    .ph_image_22 (ph_image_57),
    .ph_image_23 (ph_image_58),
    .ph_image_24 (ph_image_59),
    .ph_image_25 (ph_image_60),
    .ph_image_26 (ph_image_61),
    .ph_image_27 (ph_image_62),
    .ph_image_28 (ph_image_63),
    .ph_image_29 (ph_image_64),
    .ph_image_30 (ph_image_65),
    .ph_image_31 (ph_image_66),
    .ph_image_32 (ph_image_67),
    .ph_image_33 (ph_image_68),
    .ph_image_34 (ph_image_69),
    .ph_image_35 (ph_image_70),

    .sum_1_35_I(add_R_36_70_I),
    .sum_1_35_Q(add_R_36_70_Q),
    .data_out_valid()  
    );



    

reg [23:0] data_add_I;
reg [23:0] data_add_Q;
reg [23:0] data_fw_sub_I;
reg [23:0] data_fw_sub_Q;
reg [23:0] data_fy_sub_I;
reg [23:0] data_fy_sub_Q;
reg data_valid_t;
wire data_valid_tt;
   
always@(posedge clk)
begin
    if(data_valid)
    begin
    data_add_I <= (add_L_1_35_I+add_R_1_35_I)+(add_L_36_70_I+add_R_36_70_I);
    data_add_Q <= (add_L_1_35_Q+add_R_1_35_Q)+(add_L_36_70_Q+add_R_36_70_Q);
    
    data_fw_sub_I <= (add_L_1_35_I+add_L_36_70_I) - (add_R_1_35_I+add_R_36_70_I);
    data_fw_sub_Q <= (add_L_1_35_Q+add_L_36_70_Q) - (add_R_1_35_Q+add_R_36_70_Q);
    
    data_fy_sub_I <= (add_L_1_35_I+add_R_1_35_I) - (add_L_36_70_I+add_R_36_70_I);
    data_fy_sub_Q <= (add_L_1_35_Q+add_R_1_35_Q) - (add_L_36_70_Q+add_R_36_70_Q);
    end
    
    data_valid_t <= data_valid;
end 
//ila_dbf_long ila_dbf_long_1 (
//	.clk(clk), // input wire clk


//	.probe0(data_add_I), // input wire [23:0]  probe0  
//	.probe1(data_add_Q), // input wire [23:0]  probe1 
//	.probe2(data_fw_sub_I), // input wire [23:0]  probe2 
//	.probe3(data_fw_sub_Q), // input wire [23:0]  probe3 
//	.probe4(data_fy_sub_I), // input wire [23:0]  probe4 
//	.probe5(data_fy_sub_Q) // input wire [23:0]  probe5
//);

///////////////////截位/////////////
//wire [2:0]dbf_cut_ctl;
wire [15:0] data_add_I_1;
wire [15:0] data_add_Q_1;
wire [15:0] data_fw_sub_I_1;
wire [15:0] data_fw_sub_Q_1;
wire [15:0] data_fy_sub_I_1;
wire [15:0] data_fy_sub_Q_1;

wire[15:0]add_L_1_35_I_1  ;
wire[15:0]add_R_1_35_I_1  ;
wire[15:0]add_L_36_70_I_1 ;
wire[15:0]add_R_36_70_I_1 ;
wire[15:0]add_L_1_35_Q_1  ;
wire[15:0]add_R_1_35_Q_1  ;
wire[15:0]add_L_36_70_Q_1 ;
wire[15:0]add_R_36_70_Q_1 ;
cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_1(
    .clk(clk),
    .data_i(data_add_I),
    .data_q(data_add_Q),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(data_add_I_1),
    .data_out_q(data_add_Q_1),
    .out_valid(data_valid_tt)
    );
    
cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_2(
    .clk(clk),
    .data_i(data_fw_sub_I),
    .data_q(data_fw_sub_Q),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(data_fw_sub_I_1),
    .data_out_q(data_fw_sub_Q_1),
    .out_valid()
    );
    
cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_3(
    .clk(clk),
    .data_i(data_fy_sub_I),
    .data_q(data_fy_sub_Q),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(data_fy_sub_I_1),
    .data_out_q(data_fy_sub_Q_1),
    .out_valid()
    );
////////////////////////////////////////////////////
cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_4(
    .clk(clk),
    .data_i(add_L_1_35_I),
    .data_q(add_R_1_35_I),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(add_L_1_35_I_1),
    .data_out_q(add_R_1_35_I_1),
    .out_valid()
    );
    
cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_5(
    .clk(clk),
    .data_i(add_L_1_35_Q),
    .data_q(add_R_1_35_Q),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(add_L_1_35_Q_1),
    .data_out_q(add_R_1_35_Q_1),
    .out_valid()
    );
    
cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_6(
    .clk(clk),
    .data_i(add_L_36_70_I),
    .data_q(add_R_36_70_I),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(add_L_36_70_I_1),
    .data_out_q(add_R_36_70_I_1),
    .out_valid()
    );
    cut_ctl_top_dbf  #(.LEN(24))
                 dbf_cut_7(
    .clk(clk),
    .data_i(add_L_36_70_Q),
    .data_q(add_R_36_70_Q),
    .in_valid(data_valid_t),
    .cut_ctl(dbf_cut_ctl),
    
    .data_out_i(add_L_36_70_Q_1),
    .data_out_q(add_R_36_70_Q_1),
    .out_valid()
    );

assign data_out_valid = data_valid_tt;
assign dbf_add_I = data_add_I_1; 
assign dbf_add_Q = data_add_Q_1; 
assign dbf_fw_sub_I = data_fw_sub_I_1; 
assign dbf_fw_sub_Q = data_fw_sub_Q_1; 
assign dbf_fy_sub_I = data_fy_sub_I_1; 
assign dbf_fy_sub_Q = data_fy_sub_Q_1; 


assign dbfadd_L_1_35_I= add_L_1_35_I_1; 
assign dbfadd_L_1_35_Q= add_L_1_35_Q_1; 
assign dbfadd_L_36_70_Q = add_L_36_70_Q_1; 
assign dbfadd_L_36_70_I = add_L_36_70_I_1; 
assign dbfadd_R_1_35_I= add_R_1_35_I_1; 
assign dbfadd_R_1_35_Q= add_R_1_35_Q_1; 
assign dbfadd_R_36_70_I = add_R_36_70_I_1; 
assign dbfadd_R_36_70_Q = add_R_36_70_Q_1; 
 ila_test_def ila_test_def_1 (
	.clk(clk), // input wire clk


	.probe0(add_L_1_35_I_1), // input wire [23:0]  probe0  
	.probe1(add_R_1_35_I_1), // input wire [23:0]  probe1 
	.probe2(add_L_36_70_I_1), // input wire [23:0]  probe2 
	.probe3(add_R_36_70_I_1), // input wire [23:0]  probe3 
	.probe4(add_L_1_35_Q_1), // input wire [23:0]  probe4 
	.probe5(add_R_1_35_Q_1), // input wire [23:0]  probe5 
	.probe6(add_L_36_70_Q_1), // input wire [23:0]  probe6 
	.probe7(add_R_36_70_Q_1), // input wire [23:0]  probe7 
	.probe8(data_add_I), // input wire [23:0]  probe8 
	.probe9(data_add_Q), // input wire [23:0]  probe9 
	.probe10(data_fw_sub_I), // input wire [23:0]  probe10 
	.probe11(data_fw_sub_Q), // input wire [23:0]  probe11 
	.probe12(data_fy_sub_I), // input wire [23:0]  probe12 
	.probe13(data_fy_sub_Q) // input wire [23:0]  probe13
);   
endmodule
