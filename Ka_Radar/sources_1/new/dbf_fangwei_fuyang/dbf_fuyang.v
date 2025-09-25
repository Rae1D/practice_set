`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 16:14:57
// Design Name: 
// Module Name: dbf_fuyang
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


module dbf_fuyang(
    input clk_120m,
    input [15:0] data_1_24_I,
    input [15:0] data_1_24_Q,
    input [15:0] data_25_48_I,
    input [15:0] data_25_48_Q,
    input data_in_valid,
    
    input [3:0]fpga_gpio,
    
    output [15:0]data_out_L_1_I,
    output [15:0]data_out_L_1_Q,
    output [15:0]data_out_L_2_I,
    output [15:0]data_out_L_2_Q,
    output [15:0]data_out_L_3_I,
    output [15:0]data_out_L_3_Q,
    output [15:0]data_out_L_4_I,
    output [15:0]data_out_L_4_Q,
    output [15:0]data_out_L_5_I,
    output [15:0]data_out_L_5_Q,
    output [15:0]data_out_L_6_I,
    output [15:0]data_out_L_6_Q,
    output [15:0]data_out_L_7_I,
    output [15:0]data_out_L_7_Q,
    output [15:0]data_out_L_8_I,
    output [15:0]data_out_L_8_Q,
    output [15:0]data_out_L_9_I,
    output [15:0]data_out_L_9_Q,
    output [15:0]data_out_L_10_I,
    output [15:0]data_out_L_10_Q,
    output [15:0]data_out_L_11_I,
    output [15:0]data_out_L_11_Q,
    output [15:0]data_out_L_12_I,
    output [15:0]data_out_L_12_Q,
    output [15:0]data_out_L_13_I,
    output [15:0]data_out_L_13_Q,
    output [15:0]data_out_L_14_I,
    output [15:0]data_out_L_14_Q,
    output [15:0]data_out_L_15_I,
    output [15:0]data_out_L_15_Q,
    output [15:0]data_out_L_16_I,
    output [15:0]data_out_L_16_Q,
    output [15:0]data_out_L_17_I,
    output [15:0]data_out_L_17_Q,
    output [15:0]data_out_L_18_I,
    output [15:0]data_out_L_18_Q,
    output [15:0]data_out_L_19_I,
    output [15:0]data_out_L_19_Q,
    output [15:0]data_out_L_20_I,
    output [15:0]data_out_L_20_Q,
    output [15:0]data_out_L_21_I,
    output [15:0]data_out_L_21_Q,
    output [15:0]data_out_L_22_I,
    output [15:0]data_out_L_22_Q,
    output [15:0]data_out_L_23_I,
    output [15:0]data_out_L_23_Q,
    output [15:0]data_out_L_24_I,
    output [15:0]data_out_L_24_Q,
    output [15:0]data_out_L_25_I,
    output [15:0]data_out_L_25_Q,
    output [15:0]data_out_L_26_I,
    output [15:0]data_out_L_26_Q,
    output [15:0]data_out_L_27_I,
    output [15:0]data_out_L_27_Q,
    output [15:0]data_out_L_28_I,
    output [15:0]data_out_L_28_Q,
    output [15:0]data_out_L_29_I,
    output [15:0]data_out_L_29_Q,
    output [15:0]data_out_L_30_I,
    output [15:0]data_out_L_30_Q,
    output [15:0]data_out_L_31_I,
    output [15:0]data_out_L_31_Q,
    output [15:0]data_out_L_32_I,
    output [15:0]data_out_L_32_Q,
    output [15:0]data_out_L_33_I,
    output [15:0]data_out_L_33_Q,
    output [15:0]data_out_L_34_I,
    output [15:0]data_out_L_34_Q,
    output [15:0]data_out_L_35_I,
    output [15:0]data_out_L_35_Q,
    output [15:0]data_out_L_36_I,
    output [15:0]data_out_L_36_Q,
    output [15:0]data_out_L_37_I,
    output [15:0]data_out_L_37_Q,
    output [15:0]data_out_L_38_I,
    output [15:0]data_out_L_38_Q,
    output [15:0]data_out_L_39_I,
    output [15:0]data_out_L_39_Q,
    output [15:0]data_out_L_40_I,
    output [15:0]data_out_L_40_Q,
    output [15:0]data_out_L_41_I,
    output [15:0]data_out_L_41_Q,
    output [15:0]data_out_L_42_I,
    output [15:0]data_out_L_42_Q,
    output [15:0]data_out_L_43_I,
    output [15:0]data_out_L_43_Q,
    output [15:0]data_out_L_44_I,
    output [15:0]data_out_L_44_Q,
    output [15:0]data_out_L_45_I,
    output [15:0]data_out_L_45_Q,
    output [15:0]data_out_L_46_I,
    output [15:0]data_out_L_46_Q,
    output [15:0]data_out_L_47_I,
    output [15:0]data_out_L_47_Q,
    output [15:0]data_out_L_48_I,
    output [15:0]data_out_L_48_Q,
    output [15:0]data_out_L_49_I,
    output [15:0]data_out_L_49_Q,
    output [15:0]data_out_L_50_I,
    output [15:0]data_out_L_50_Q,
    output [15:0]data_out_L_51_I,
    output [15:0]data_out_L_51_Q,
    output [15:0]data_out_L_52_I,
    output [15:0]data_out_L_52_Q,
    output [15:0]data_out_L_53_I,
    output [15:0]data_out_L_53_Q,
    output [15:0]data_out_L_54_I,
    output [15:0]data_out_L_54_Q,
    output [15:0]data_out_L_55_I,
    output [15:0]data_out_L_55_Q,
    output [15:0]data_out_L_56_I,
    output [15:0]data_out_L_56_Q,
    output [15:0]data_out_L_57_I,
    output [15:0]data_out_L_57_Q,
    output [15:0]data_out_L_58_I,
    output [15:0]data_out_L_58_Q,
    output [15:0]data_out_L_59_I,
    output [15:0]data_out_L_59_Q,
    output [15:0]data_out_L_60_I,
    output [15:0]data_out_L_60_Q,
    output [15:0]data_out_L_61_I,
    output [15:0]data_out_L_61_Q,
    output [15:0]data_out_L_62_I,
    output [15:0]data_out_L_62_Q,
    output [15:0]data_out_L_63_I,
    output [15:0]data_out_L_63_Q,
    output [15:0]data_out_L_64_I,
    output [15:0]data_out_L_64_Q,
    output [15:0]data_out_L_65_I,
    output [15:0]data_out_L_65_Q,
    output [15:0]data_out_L_66_I,
    output [15:0]data_out_L_66_Q,
    output [15:0]data_out_L_67_I,
    output [15:0]data_out_L_67_Q,
    output [15:0]data_out_L_68_I,
    output [15:0]data_out_L_68_Q,
    output [15:0]data_out_L_69_I,
    output [15:0]data_out_L_69_Q,
    output [15:0]data_out_L_70_I,
    output [15:0]data_out_L_70_Q,
    
    output [15:0]data_out_R_1_I,
    output [15:0]data_out_R_1_Q,
    output [15:0]data_out_R_2_I,
    output [15:0]data_out_R_2_Q,
    output [15:0]data_out_R_3_I,
    output [15:0]data_out_R_3_Q,
    output [15:0]data_out_R_4_I,
    output [15:0]data_out_R_4_Q,
    output [15:0]data_out_R_5_I,
    output [15:0]data_out_R_5_Q,
    output [15:0]data_out_R_6_I,
    output [15:0]data_out_R_6_Q,
    output [15:0]data_out_R_7_I,
    output [15:0]data_out_R_7_Q,
    output [15:0]data_out_R_8_I,
    output [15:0]data_out_R_8_Q,
    output [15:0]data_out_R_9_I,
    output [15:0]data_out_R_9_Q,
    output [15:0]data_out_R_10_I,
    output [15:0]data_out_R_10_Q,
    output [15:0]data_out_R_11_I,
    output [15:0]data_out_R_11_Q,
    output [15:0]data_out_R_12_I,
    output [15:0]data_out_R_12_Q,
    output [15:0]data_out_R_13_I,
    output [15:0]data_out_R_13_Q,
    output [15:0]data_out_R_14_I,
    output [15:0]data_out_R_14_Q,
    output [15:0]data_out_R_15_I,
    output [15:0]data_out_R_15_Q,
    output [15:0]data_out_R_16_I,
    output [15:0]data_out_R_16_Q,
    output [15:0]data_out_R_17_I,
    output [15:0]data_out_R_17_Q,
    output [15:0]data_out_R_18_I,
    output [15:0]data_out_R_18_Q,
    output [15:0]data_out_R_19_I,
    output [15:0]data_out_R_19_Q,
    output [15:0]data_out_R_20_I,
    output [15:0]data_out_R_20_Q,
    output [15:0]data_out_R_21_I,
    output [15:0]data_out_R_21_Q,
    output [15:0]data_out_R_22_I,
    output [15:0]data_out_R_22_Q,
    output [15:0]data_out_R_23_I,
    output [15:0]data_out_R_23_Q,
    output [15:0]data_out_R_24_I,
    output [15:0]data_out_R_24_Q,
    output [15:0]data_out_R_25_I,
    output [15:0]data_out_R_25_Q,
    output [15:0]data_out_R_26_I,
    output [15:0]data_out_R_26_Q,
    output [15:0]data_out_R_27_I,
    output [15:0]data_out_R_27_Q,
    output [15:0]data_out_R_28_I,
    output [15:0]data_out_R_28_Q,
    output [15:0]data_out_R_29_I,
    output [15:0]data_out_R_29_Q,
    output [15:0]data_out_R_30_I,
    output [15:0]data_out_R_30_Q,
    output [15:0]data_out_R_31_I,
    output [15:0]data_out_R_31_Q,
    output [15:0]data_out_R_32_I,
    output [15:0]data_out_R_32_Q,
    output [15:0]data_out_R_33_I,
    output [15:0]data_out_R_33_Q,
    output [15:0]data_out_R_34_I,
    output [15:0]data_out_R_34_Q,
    output [15:0]data_out_R_35_I,
    output [15:0]data_out_R_35_Q,
    output [15:0]data_out_R_36_I,
    output [15:0]data_out_R_36_Q,
    output [15:0]data_out_R_37_I,
    output [15:0]data_out_R_37_Q,
    output [15:0]data_out_R_38_I,
    output [15:0]data_out_R_38_Q,
    output [15:0]data_out_R_39_I,
    output [15:0]data_out_R_39_Q,
    output [15:0]data_out_R_40_I,
    output [15:0]data_out_R_40_Q,
    output [15:0]data_out_R_41_I,
    output [15:0]data_out_R_41_Q,
    output [15:0]data_out_R_42_I,
    output [15:0]data_out_R_42_Q,
    output [15:0]data_out_R_43_I,
    output [15:0]data_out_R_43_Q,
    output [15:0]data_out_R_44_I,
    output [15:0]data_out_R_44_Q,
    output [15:0]data_out_R_45_I,
    output [15:0]data_out_R_45_Q,
    output [15:0]data_out_R_46_I,
    output [15:0]data_out_R_46_Q,
    output [15:0]data_out_R_47_I,
    output [15:0]data_out_R_47_Q,
    output [15:0]data_out_R_48_I,
    output [15:0]data_out_R_48_Q,
    output [15:0]data_out_R_49_I,
    output [15:0]data_out_R_49_Q,
    output [15:0]data_out_R_50_I,
    output [15:0]data_out_R_50_Q,
    output [15:0]data_out_R_51_I,
    output [15:0]data_out_R_51_Q,
    output [15:0]data_out_R_52_I,
    output [15:0]data_out_R_52_Q,
    output [15:0]data_out_R_53_I,
    output [15:0]data_out_R_53_Q,
    output [15:0]data_out_R_54_I,
    output [15:0]data_out_R_54_Q,
    output [15:0]data_out_R_55_I,
    output [15:0]data_out_R_55_Q,
    output [15:0]data_out_R_56_I,
    output [15:0]data_out_R_56_Q,
    output [15:0]data_out_R_57_I,
    output [15:0]data_out_R_57_Q,
    output [15:0]data_out_R_58_I,
    output [15:0]data_out_R_58_Q,
    output [15:0]data_out_R_59_I,
    output [15:0]data_out_R_59_Q,
    output [15:0]data_out_R_60_I,
    output [15:0]data_out_R_60_Q,
    output [15:0]data_out_R_61_I,
    output [15:0]data_out_R_61_Q,
    output [15:0]data_out_R_62_I,
    output [15:0]data_out_R_62_Q,
    output [15:0]data_out_R_63_I,
    output [15:0]data_out_R_63_Q,
    output [15:0]data_out_R_64_I,
    output [15:0]data_out_R_64_Q,
    output [15:0]data_out_R_65_I,
    output [15:0]data_out_R_65_Q,
    output [15:0]data_out_R_66_I,
    output [15:0]data_out_R_66_Q,
    output [15:0]data_out_R_67_I,
    output [15:0]data_out_R_67_Q,
    output [15:0]data_out_R_68_I,
    output [15:0]data_out_R_68_Q,
    output [15:0]data_out_R_69_I,
    output [15:0]data_out_R_69_Q,
    output [15:0]data_out_R_70_I,
    output [15:0]data_out_R_70_Q,

    output data_out_valid   
    );
reg [15:0]ph_real_1   ;
reg [15:0]ph_real_2   ;
reg [15:0]ph_real_3   ;
reg [15:0]ph_real_4   ;
reg [15:0]ph_real_5   ;
reg [15:0]ph_real_6   ;
reg [15:0]ph_real_7   ;
reg [15:0]ph_real_8   ;
reg [15:0]ph_real_9   ;
reg [15:0]ph_real_10   ;
reg [15:0]ph_real_11   ;
reg [15:0]ph_real_12   ;
reg [15:0]ph_real_13   ;
reg [15:0]ph_real_14   ;
reg [15:0]ph_real_15  ;
reg [15:0]ph_real_16   ;
reg [15:0]ph_real_17   ;
reg [15:0]ph_real_18   ;
reg [15:0]ph_real_19   ;
reg [15:0]ph_real_20   ;
reg [15:0]ph_real_21   ;   
reg [15:0]ph_real_22   ;
reg [15:0]ph_real_23   ;
reg [15:0]ph_real_24   ;
reg [15:0]ph_real_25   ;
reg [15:0]ph_real_26   ;
reg [15:0]ph_real_27   ;
reg [15:0]ph_real_28   ;   
reg [15:0]ph_real_29    ;
reg [15:0]ph_real_30   ;
reg [15:0]ph_real_31   ;
reg [15:0]ph_real_32   ;
reg [15:0]ph_real_33   ;
reg [15:0]ph_real_34   ;
reg [15:0]ph_real_35   ;
reg [15:0]ph_real_36   ;
reg [15:0]ph_real_37   ;
reg [15:0]ph_real_38   ;
reg [15:0]ph_real_39   ;
reg [15:0]ph_real_40   ;
reg [15:0]ph_real_41   ;
reg [15:0]ph_real_42   ;
reg [15:0]ph_real_43  ;
reg [15:0]ph_real_44   ;
reg [15:0]ph_real_45   ;
reg [15:0]ph_real_46   ;
reg [15:0]ph_real_47   ;
reg [15:0]ph_real_48   ;
reg [15:0]ph_real_49   ;
reg [15:0]ph_real_50  ;
reg [15:0]ph_real_51   ;
reg [15:0]ph_real_52   ;
reg [15:0]ph_real_53   ;
reg [15:0]ph_real_54   ;
reg [15:0]ph_real_55   ;
reg [15:0]ph_real_56   ;
reg [15:0]ph_real_57  ;
reg [15:0]ph_real_58   ;
reg [15:0]ph_real_59   ;
reg [15:0]ph_real_60   ;
reg [15:0]ph_real_61   ;
reg [15:0]ph_real_62   ;
reg [15:0]ph_real_63   ;
reg [15:0]ph_real_64   ;
reg [15:0]ph_real_65   ;
reg [15:0]ph_real_66   ;
reg [15:0]ph_real_67   ;
reg [15:0]ph_real_68   ;
reg [15:0]ph_real_69   ;
reg [15:0]ph_real_70   ;
                 
reg[15:0]ph_image_1  ;
reg[15:0]ph_image_2  ;
reg[15:0]ph_image_3  ;
reg[15:0]ph_image_4  ;
reg[15:0]ph_image_5  ;
reg[15:0]ph_image_6  ;
reg[15:0]ph_image_7  ;
reg[15:0]ph_image_8  ;
reg[15:0]ph_image_9  ;
reg[15:0]ph_image_10 ;
reg[15:0]ph_image_11 ;
reg[15:0]ph_image_12 ;
reg[15:0]ph_image_13 ;
reg[15:0]ph_image_14 ;
reg[15:0]ph_image_15 ;
reg[15:0]ph_image_16 ;
reg[15:0]ph_image_17 ;
reg[15:0]ph_image_18 ;
reg[15:0]ph_image_19 ;
reg[15:0]ph_image_20 ;
reg[15:0]ph_image_21 ;
reg[15:0]ph_image_22 ;
reg[15:0]ph_image_23 ;
reg[15:0]ph_image_24 ;
reg[15:0]ph_image_25 ;
reg[15:0]ph_image_26 ;
reg[15:0]ph_image_27 ;
reg[15:0]ph_image_28 ;
reg[15:0]ph_image_29 ;
reg[15:0]ph_image_30 ;
reg[15:0]ph_image_31 ;
reg[15:0]ph_image_32 ;
reg[15:0]ph_image_33 ;
reg[15:0]ph_image_34 ;
reg[15:0]ph_image_35 ;
reg[15:0]ph_image_36 ;
reg[15:0]ph_image_37 ;
reg[15:0]ph_image_38 ;
reg[15:0]ph_image_39 ;
reg[15:0]ph_image_40 ;
reg[15:0]ph_image_41 ;
reg[15:0]ph_image_42 ;
reg[15:0]ph_image_43 ;
reg[15:0]ph_image_44 ;
reg[15:0]ph_image_45 ;
reg[15:0]ph_image_46 ;
reg[15:0]ph_image_47 ;
reg[15:0]ph_image_48 ;
reg[15:0]ph_image_49 ;
reg[15:0]ph_image_50 ;
reg[15:0]ph_image_51 ;
reg[15:0]ph_image_52 ;
reg[15:0]ph_image_53 ;
reg[15:0]ph_image_54 ;
reg[15:0]ph_image_55 ;
reg[15:0]ph_image_56 ;
reg[15:0]ph_image_57 ;
reg[15:0]ph_image_58 ;
reg[15:0]ph_image_59 ;
reg[15:0]ph_image_60 ;
reg[15:0]ph_image_61 ;
reg[15:0]ph_image_62 ;
reg[15:0]ph_image_63 ;
reg[15:0]ph_image_64 ;
reg[15:0]ph_image_65 ;
reg[15:0]ph_image_66 ;
reg[15:0]ph_image_67 ;
reg[15:0]ph_image_68 ;
reg[15:0]ph_image_69 ;
reg[15:0]ph_image_70 ;
   
    
    reg [15:0] A=16'h7fff;
    reg phase_data_valid = 1;
    wire [15:0]A_fy;
    wire [2:0]fy_cut_ctl ;  
    vio_fycut vio_fangwei_cut_1 (
  .clk(clk_120m),                // input wire clk
  .probe_out0(fy_cut_ctl)  // output wire [2 : 0] probe_out0
);
//    vio_fy fy (
//      .clk(clk_120m),                // input wire clk
//      .probe_out0(A_fy),  // output wire [15 : 0] probe_out0
//      .probe_out1(fy_cut_ctl)  // output wire [15 : 0] probe_out0
//    );
//    assign A=A_fy;
    
always@(posedge clk_120m)
begin
if(fpga_gpio == 4'b0000)   ///0.15業
   begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111111111110;
   ph_real_3 <=  16'b0011111111111010; 
   ph_real_4 <=  16'b0011111111110100;
   ph_real_5 <=  16'b0011111111101100;
   ph_real_6 <=  16'b0011111111100010;
   ph_real_7 <=  16'b0011111111010101;
   ph_real_8 <=  16'b0011111111000101;
   ph_real_9 <=  16'b0011111110110100;
   ph_real_10 <= 16'b0011111110100000;
   ph_real_11 <= 16'b0011111110001010;
   ph_real_12 <= 16'b0011111101110001;
   ph_real_13 <= 16'b0011111101010110;
   ph_real_14 <= 16'b0011111100111001;
   ph_real_15<=  16'b0011111100011001;
   ph_real_16<=  16'b0011111011110111;
   ph_real_17<=  16'b0011111011010011; 
   ph_real_18<=  16'b0011111010101100;
   ph_real_19<=  16'b0011111010000011;
   ph_real_20<=  16'b0011111001011000;
   ph_real_21<=  16'b0011111000101011;
   ph_real_22<=  16'b0011110111111011;
   ph_real_23<=  16'b0011110111001001;
   ph_real_24 <= 16'b0011110110010101;
   ph_real_25 <= 16'b0011110101011110;
   ph_real_26 <= 16'b0011110100100101;
   ph_real_27 <= 16'b0011110011101010;
   ph_real_28 <= 16'b0011110010101101;
   ph_real_29<=  16'b0011110001101101;
   ph_real_30<=  16'b0011110000101100;
   ph_real_31<=  16'b0011101111101000; 
   ph_real_32<=  16'b0011101110100010;
   ph_real_33<=  16'b0011101101011001;
   ph_real_34<=  16'b0011101100001111;
   ph_real_35<=  16'b0011101011000010;
   ph_real_36<=  16'b0011101001110011;
   ph_real_37<=  16'b0011101000100010;
   ph_real_38 <= 16'b0011100111001111;
   ph_real_39 <= 16'b0011100101111010;
   ph_real_40 <= 16'b0011100100100010;
   ph_real_41 <= 16'b0011100011001001;
   ph_real_42 <= 16'b0011100001101101;
   ph_real_43<=  16'b0011100000010000;
   ph_real_44<=  16'b0011011110110000;
   ph_real_45<=  16'b0011011101001110; 
   ph_real_46<=  16'b0011011011101010;
   ph_real_47<=  16'b0011011010000101;
   ph_real_48<=  16'b0011011000011101;
   ph_real_49<=  16'b0011010110110011;
   ph_real_50<=  16'b0011010101000111;
   ph_real_51<=  16'b0011010011011001;
   ph_real_52 <= 16'b0011010001101010;
   ph_real_53 <= 16'b0011001111111000;
   ph_real_54 <= 16'b0011001110000101;
   ph_real_55 <= 16'b0011001100001111;
   ph_real_56 <= 16'b0011001010011000;
   ph_real_57<=  16'b0011001000011111;
   ph_real_58<=  16'b0011000110100100;
   ph_real_59<=  16'b0011000100100111; 
   ph_real_60<=  16'b0011000010101000;
   ph_real_61<=  16'b0011000000101000;
   ph_real_62<=  16'b0010111110100110;
   ph_real_63<=  16'b0010111100100010;
   ph_real_64<=  16'b0010111010011100;
   ph_real_65<=  16'b0010111000010101;
   ph_real_66 <= 16'b0010110110001100;
   ph_real_67 <= 16'b0010110100000001;
   ph_real_68 <= 16'b0010110001110101;
   ph_real_69 <= 16'b0010101111100111;
   ph_real_70 <= 16'b0010101101010111;
 
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b0000000011000100;
   ph_image_3 <=  16'b0000000110001000; 
   ph_image_4 <=  16'b0000001001001100;
   ph_image_5 <=  16'b0000001100010000;
   ph_image_6 <=  16'b0000001111010100;
   ph_image_7 <=  16'b0000010010011000;
   ph_image_8 <=  16'b0000010101011100;
   ph_image_9 <=  16'b0000011000100000;
   ph_image_10 <= 16'b0000011011100011;
   ph_image_11 <= 16'b0000011110100110;
   ph_image_12 <= 16'b0000100001101001;
   ph_image_13 <= 16'b0000100100101011;
   ph_image_14 <= 16'b0000100111101101;
   ph_image_15<=  16'b0000101010101111;
   ph_image_16<=  16'b0000101101110000;
   ph_image_17<=  16'b0000110000110001; 
   ph_image_18<=  16'b0000110011110010;
   ph_image_19<=  16'b0000110110110010;
   ph_image_20<=  16'b0000111001110001;
   ph_image_21<=  16'b0000111100110000;
   ph_image_22<=  16'b0000111111101111;
   ph_image_23<=  16'b0001000010101101;
   ph_image_24 <= 16'b0001000101101010;
   ph_image_25 <= 16'b0001001000100110;
   ph_image_26 <= 16'b0001001011100010;
   ph_image_27 <= 16'b0001001110011110;
   ph_image_28 <= 16'b0001010001011000;
   ph_image_29<=  16'b0001010100010010;
   ph_image_30<=  16'b0001010111001011;
   ph_image_31<=  16'b0001011010000011; 
   ph_image_32<=  16'b0001011100111010;
   ph_image_33<=  16'b0001011111110001;
   ph_image_34<=  16'b0001100010100110;
   ph_image_35<=  16'b0001100101011011;
   ph_image_36<=  16'b0001101000001111;
   ph_image_37<=  16'b0001101011000010;
   ph_image_38 <= 16'b0001101101110100;
   ph_image_39 <= 16'b0001110000100100;
   ph_image_40 <= 16'b0001110011010100;
   ph_image_41 <= 16'b0001110110000011;
   ph_image_42 <= 16'b0001111000110001;
   ph_image_43<=  16'b0001111011011101;
   ph_image_44<=  16'b0001111110001000;
   ph_image_45<=  16'b0010000000110011; 
   ph_image_46<=  16'b0010000011011100;
   ph_image_47<=  16'b0010000110000100;
   ph_image_48<=  16'b0010001000101010;
   ph_image_49<=  16'b0010001011010000;
   ph_image_50<=  16'b0010001101110100;
   ph_image_51<=  16'b0010010000010110;
   ph_image_52 <= 16'b0010010010111000;
   ph_image_53 <= 16'b0010010101011000;
   ph_image_54 <= 16'b0010010111110111;
   ph_image_55 <= 16'b0010011010010100;
   ph_image_56 <= 16'b0010011100110000;
   ph_image_57<=  16'b0010011111001011;
   ph_image_58<=  16'b0010100001100100;
   ph_image_59<=  16'b0010100011111011; 
   ph_image_60<=  16'b0010100110010001;
   ph_image_61<=  16'b0010101000100110;
   ph_image_62<=  16'b0010101010111001;
   ph_image_63<=  16'b0010101101001010;
   ph_image_64<=  16'b0010101111011010;
   ph_image_65<=  16'b0010110001101000;
   ph_image_66 <= 16'b0010110011110100;
   ph_image_67 <= 16'b0010110101111111;
   ph_image_68 <= 16'b0010111000001001;
   ph_image_69 <= 16'b0010111010010000;
   ph_image_70 <= 16'b0010111100010110;
   
   end
   

   else if (fpga_gpio == 4'b0001)   //-0.15業
      begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111111111110;
   ph_real_3 <=  16'b0011111111111010; 
   ph_real_4 <=  16'b0011111111110100;
   ph_real_5 <=  16'b0011111111101100;
   ph_real_6 <=  16'b0011111111100010;
   ph_real_7 <=  16'b0011111111010101;
   ph_real_8 <=  16'b0011111111000101;
   ph_real_9 <=  16'b0011111110110100;
   ph_real_10 <= 16'b0011111110100000;
   ph_real_11 <= 16'b0011111110001010;
   ph_real_12 <= 16'b0011111101110001;
   ph_real_13 <= 16'b0011111101010110;
   ph_real_14 <= 16'b0011111100111001;
   ph_real_15<=  16'b0011111100011001;
   ph_real_16<=  16'b0011111011110111;
   ph_real_17<=  16'b0011111011010011; 
   ph_real_18<=  16'b0011111010101100;
   ph_real_19<=  16'b0011111010000011;
   ph_real_20<=  16'b0011111001011000;
   ph_real_21<=  16'b0011111000101011;
   ph_real_22<=  16'b0011110111111011;
   ph_real_23<=  16'b0011110111001001;
   ph_real_24 <= 16'b0011110110010101;
   ph_real_25 <= 16'b0011110101011110;
   ph_real_26 <= 16'b0011110100100101;
   ph_real_27 <= 16'b0011110011101010;
   ph_real_28 <= 16'b0011110010101101;
   ph_real_29<=  16'b0011110001101101;
   ph_real_30<=  16'b0011110000101100;
   ph_real_31<=  16'b0011101111101000; 
   ph_real_32<=  16'b0011101110100010;
   ph_real_33<=  16'b0011101101011001;
   ph_real_34<=  16'b0011101100001111;
   ph_real_35<=  16'b0011101011000010;
   ph_real_36<=  16'b0011101001110011;
   ph_real_37<=  16'b0011101000100010;
   ph_real_38 <= 16'b0011100111001111;
   ph_real_39 <= 16'b0011100101111010;
   ph_real_40 <= 16'b0011100100100010;
   ph_real_41 <= 16'b0011100011001001;
   ph_real_42 <= 16'b0011100001101101;
   ph_real_43<=  16'b0011100000010000;
   ph_real_44<=  16'b0011011110110000;
   ph_real_45<=  16'b0011011101001110; 
   ph_real_46<=  16'b0011011011101010;
   ph_real_47<=  16'b0011011010000101;
   ph_real_48<=  16'b0011011000011101;
   ph_real_49<=  16'b0011010110110011;
   ph_real_50<=  16'b0011010101000111;
   ph_real_51<=  16'b0011010011011001;
   ph_real_52 <= 16'b0011010001101010;
   ph_real_53 <= 16'b0011001111111000;
   ph_real_54 <= 16'b0011001110000101;
   ph_real_55 <= 16'b0011001100001111;
   ph_real_56 <= 16'b0011001010011000;
   ph_real_57<=  16'b0011001000011111;
   ph_real_58<=  16'b0011000110100100;
   ph_real_59<=  16'b0011000100100111; 
   ph_real_60<=  16'b0011000010101000;
   ph_real_61<=  16'b0011000000101000;
   ph_real_62<=  16'b0010111110100110;
   ph_real_63<=  16'b0010111100100010;
   ph_real_64<=  16'b0010111010011100;
   ph_real_65<=  16'b0010111000010101;
   ph_real_66 <= 16'b0010110110001100;
   ph_real_67 <= 16'b0010110100000001;
   ph_real_68 <= 16'b0010110001110101;
   ph_real_69 <= 16'b0010101111100111;
   ph_real_70 <= 16'b0010101101010111;
  
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b1111111100111100;
   ph_image_3 <=  16'b1111111001110111; 
   ph_image_4 <=  16'b1111110110110011;
   ph_image_5 <=  16'b1111110011101111;
   ph_image_6 <=  16'b1111110000101011;
   ph_image_7 <=  16'b1111101101100111;
   ph_image_8 <=  16'b1111101010100011;
   ph_image_9 <=  16'b1111100111100000;
   ph_image_10 <= 16'b1111100100011101;
   ph_image_11 <= 16'b1111100001011010;
   ph_image_12 <= 16'b1111011110010111;
   ph_image_13 <= 16'b1111011011010100;
   ph_image_14 <= 16'b1111011000010010;
   ph_image_15<=  16'b1111010101010000;
   ph_image_16<=  16'b1111010010001111;
   ph_image_17<=  16'b1111001111001110; 
   ph_image_18<=  16'b1111001100001110;
   ph_image_19<=  16'b1111001001001110;
   ph_image_20<=  16'b1111000110001110;
   ph_image_21<=  16'b1111000011001111;
   ph_image_22<=  16'b1111000000010001;
   ph_image_23<=  16'b1110111101010011;
   ph_image_24 <= 16'b1110111010010110;
   ph_image_25 <= 16'b1110110111011001;
   ph_image_26 <= 16'b1110110100011101;
   ph_image_27 <= 16'b1110110001100010;
   ph_image_28 <= 16'b1110101110100111;
   ph_image_29<=  16'b1110101011101110;
   ph_image_30<=  16'b1110101000110101;
   ph_image_31<=  16'b1110100101111101; 
   ph_image_32<=  16'b1110100011000101;
   ph_image_33<=  16'b1110100000001111;
   ph_image_34<=  16'b1110011101011001;
   ph_image_35<=  16'b1110011010100100;
   ph_image_36<=  16'b1110010111110001;
   ph_image_37<=  16'b1110010100111110;
   ph_image_38 <= 16'b1110010010001100;
   ph_image_39 <= 16'b1110001111011011;
   ph_image_40 <= 16'b1110001100101011;
   ph_image_41 <= 16'b1110001001111101;
   ph_image_42 <= 16'b1110000111001111;
   ph_image_43<=  16'b1110000100100010;
   ph_image_44<=  16'b1110000001110111;
   ph_image_45<=  16'b1101111111001101; 
   ph_image_46<=  16'b1101111100100100;
   ph_image_47<=  16'b1101111001111100;
   ph_image_48<=  16'b1101110111010101;
   ph_image_49<=  16'b1101110100110000;
   ph_image_50<=  16'b1101110010001100;
   ph_image_51<=  16'b1101101111101001;
   ph_image_52 <= 16'b1101101101001000;
   ph_image_53 <= 16'b1101101010100111;
   ph_image_54 <= 16'b1101101000001001;
   ph_image_55 <= 16'b1101100101101011;
   ph_image_56 <= 16'b1101100011001111;
   ph_image_57<=  16'b1101100000110101;
   ph_image_58<=  16'b1101011110011100;
   ph_image_59<=  16'b1101011100000100; 
   ph_image_60<=  16'b1101011001101110;
   ph_image_61<=  16'b1101010111011010;
   ph_image_62<=  16'b1101010101000111;
   ph_image_63<=  16'b1101010010110110;
   ph_image_64<=  16'b1101010000100110;
   ph_image_65<=  16'b1101001110011000;
   ph_image_66 <= 16'b1101001100001011;
   ph_image_67 <= 16'b1101001010000000;
   ph_image_68 <= 16'b1101000111110111;
   ph_image_69 <= 16'b1101000101101111;
   ph_image_70 <= 16'b1101000011101010;
   end
   else if (fpga_gpio == 4'b0010)   //0.45業
      begin
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111111110100;
   ph_real_3 <=  16'b0011111111010101; 
   ph_real_4 <=  16'b0011111110100000;
   ph_real_5 <=  16'b0011111101010110;
   ph_real_6 <=  16'b0011111011110111;
   ph_real_7 <=  16'b0011111010000011;
   ph_real_8 <=  16'b0011110111111011;
   ph_real_9 <=  16'b0011110101011110;
   ph_real_10 <= 16'b0011110010101101;
   ph_real_11 <= 16'b0011101111101000;
   ph_real_12 <= 16'b0011101100001111;
   ph_real_13 <= 16'b0011101000100010;
   ph_real_14 <= 16'b0011100100100010;
   ph_real_15<=  16'b0011100000010000;
   ph_real_16<=  16'b0011011011101010;
   ph_real_17<=  16'b0011010110110011; 
   ph_real_18<=  16'b0011010001101010;
   ph_real_19<=  16'b0011001100001111;
   ph_real_20<=  16'b0011000110100100;
   ph_real_21<=  16'b0011000000101000;
   ph_real_22<=  16'b0010111010011100;
   ph_real_23<=  16'b0010110100000001;
   ph_real_24 <= 16'b0010101101010111;
   ph_real_25 <= 16'b0010100110011111;
   ph_real_26 <= 16'b0010011111011001;
   ph_real_27 <= 16'b0010011000000101;
   ph_real_28 <= 16'b0010010000100101;
   ph_real_29<=  16'b0010001000111001;
   ph_real_30<=  16'b0010000001000010;
   ph_real_31<=  16'b0001111001000000; 
   ph_real_32<=  16'b0001110000110101;
   ph_real_33<=  16'b0001101000011111;
   ph_real_34<=  16'b0001100000000001;
   ph_real_35<=  16'b0001010111011100;
   ph_real_36<=  16'b0001001110101111;
   ph_real_37<=  16'b0001000101111011;
   ph_real_38 <= 16'b0000111101000010;
   ph_real_39 <= 16'b0000110100000011;
   ph_real_40 <= 16'b0000101011000001;
   ph_real_41 <= 16'b0000100001111011;
   ph_real_42 <= 16'b0000011000110010;
   ph_real_43<=  16'b0000001111100111;
   ph_real_44<=  16'b0000000110011010;
   ph_real_45<=  16'b1111111101001110; 
   ph_real_46<=  16'b1111110100000001;
   ph_real_47<=  16'b1111101010110101;
   ph_real_48<=  16'b1111100001101011;
   ph_real_49<=  16'b1111011000100100;
   ph_real_50<=  16'b1111001111100000;
   ph_real_51<=  16'b1111000110100000;
   ph_real_52 <= 16'b1110111101100100;
   ph_real_53 <= 16'b1110110100101110;
   ph_real_54 <= 16'b1110101011111111;
   ph_real_55 <= 16'b1110100011010110;
   ph_real_56 <= 16'b1110011010110101;
   ph_real_57<=  16'b1110010010011100;
   ph_real_58<=  16'b1110001010001101;
   ph_real_59<=  16'b1110000010000111; 
   ph_real_60<=  16'b1101111010001011;
   ph_real_61<=  16'b1101110010011011;
   ph_real_62<=  16'b1101101010110110;
   ph_real_63<=  16'b1101100011011110;
   ph_real_64<=  16'b1101011100010010;
   ph_real_65<=  16'b1101010101010100;
   ph_real_66 <= 16'b1101001110100101;
   ph_real_67 <= 16'b1101001000000100;
   ph_real_68 <= 16'b1101000001110010;
   ph_real_69 <= 16'b1100111011110000;
   ph_real_70 <= 16'b1100110101111110;
   
   ph_image_1 <=  16'b0000000000000000;   
   ph_image_2 <=  16'b0000001001001100;
   ph_image_3 <=  16'b0000010010011000; 
   ph_image_4 <=  16'b0000011011100011;
   ph_image_5 <=  16'b0000100100101011;
   ph_image_6 <=  16'b0000101101110000;
   ph_image_7 <=  16'b0000110110110010;
   ph_image_8 <=  16'b0000111111101111;
   ph_image_9 <=  16'b0001001000100110;
   ph_image_10 <= 16'b0001010001011000;
   ph_image_11 <= 16'b0001011010000011;
   ph_image_12 <= 16'b0001100010100110;
   ph_image_13 <= 16'b0001101011000010;
   ph_image_14 <= 16'b0001110011010100;
   ph_image_15<=  16'b0001111011011101;
   ph_image_16<=  16'b0010000011011100;
   ph_image_17<=  16'b0010001011010000; 
   ph_image_18<=  16'b0010010010111000;
   ph_image_19<=  16'b0010011010010100;
   ph_image_20<=  16'b0010100001100011;
   ph_image_21<=  16'b0010101000100110;
   ph_image_22<=  16'b0010101111011010;
   ph_image_23<=  16'b0010110101111111;
   ph_image_24 <= 16'b0010111100010110;
   ph_image_25 <= 16'b0011000010011101;
   ph_image_26 <= 16'b0011001000010100;
   ph_image_27 <= 16'b0011001101111010;
   ph_image_28 <= 16'b0011010011001111;
   ph_image_29<=  16'b0011011000010011;
   ph_image_30<=  16'b0011011101000101;
   ph_image_31<=  16'b0011100001100101; 
   ph_image_32<=  16'b0011100101110010;
   ph_image_33<=  16'b0011101001101100;
   ph_image_34<=  16'b0011101101010011;
   ph_image_35<=  16'b0011110000100110;
   ph_image_36<=  16'b0011110011100101;
   ph_image_37<=  16'b0011110110010000;
   ph_image_38 <= 16'b0011111000100110;
   ph_image_39 <= 16'b0011111010101001;
   ph_image_40 <= 16'b0011111100010110;
   ph_image_41 <= 16'b0011111101101111;
   ph_image_42 <= 16'b0011111110110010;
   ph_image_43<=  16'b0011111111100001;
   ph_image_44<=  16'b0011111111111010;
   ph_image_45<=  16'b0011111111111110; 
   ph_image_46<=  16'b0011111111101101;
   ph_image_47<=  16'b0011111111000111;
   ph_image_48<=  16'b0011111110001100;
   ph_image_49<=  16'b0011111100111011;
   ph_image_50<=  16'b0011111011010110;
   ph_image_51<=  16'b0011111001011100;
   ph_image_52 <= 16'b0011110111001110;
   ph_image_53 <= 16'b0011110100101011;
   ph_image_54 <= 16'b0011110001110011;
   ph_image_55 <= 16'b0011101110101000;
   ph_image_56 <= 16'b0011101011001001;
   ph_image_57<=  16'b0011100111010111;
   ph_image_58<=  16'b0011100011010001;
   ph_image_59<=  16'b0011011110111001; 
   ph_image_60<=  16'b0011011010001110;
   ph_image_61<=  16'b0011010101010001;
   ph_image_62<=  16'b0011010000000011;
   ph_image_63<=  16'b0011001010100011;
   ph_image_64<=  16'b0011000100110011;
   ph_image_65<=  16'b0010111110110010;
   ph_image_66 <= 16'b0010111000100010;
   ph_image_67 <= 16'b0010110010000010;
   ph_image_68 <= 16'b0010101011010011;
   ph_image_69 <= 16'b0010100100010111;
   ph_image_70 <= 16'b0010011101001100;
   end
   else if (fpga_gpio == 4'b0011)   //-0.45業
      begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111111110100;
   ph_real_3 <=  16'b0011111111010101; 
   ph_real_4 <=  16'b0011111110100000;
   ph_real_5 <=  16'b0011111101010110;
   ph_real_6 <=  16'b0011111011110111;
   ph_real_7 <=  16'b0011111010000011;
   ph_real_8 <=  16'b0011110111111011;
   ph_real_9 <=  16'b0011110101011110;
   ph_real_10 <= 16'b0011110010101101;
   ph_real_11 <= 16'b0011101111101000;
   ph_real_12 <= 16'b0011101100001111;
   ph_real_13 <= 16'b0011101000100010;
   ph_real_14 <= 16'b0011100100100010;
   ph_real_15<=  16'b0011100000010000;
   ph_real_16<=  16'b0011011011101010;
   ph_real_17<=  16'b0011010110110011; 
   ph_real_18<=  16'b0011010001101010;
   ph_real_19<=  16'b0011001100001111;
   ph_real_20<=  16'b0011000110100100;
   ph_real_21<=  16'b0011000000101000;
   ph_real_22<=  16'b0010111010011100;
   ph_real_23<=  16'b0010110100000001;
   ph_real_24 <= 16'b0010101101010111;
   ph_real_25 <= 16'b0010100110011111;
   ph_real_26 <= 16'b0010011111011001;
   ph_real_27 <= 16'b0010011000000101;
   ph_real_28 <= 16'b0010010000100101;
   ph_real_29<=  16'b0010001000111001;
   ph_real_30<=  16'b0010000001000010;
   ph_real_31<=  16'b0001111001000000; 
   ph_real_32<=  16'b0001110000110101;
   ph_real_33<=  16'b0001101000011111;
   ph_real_34<=  16'b0001100000000001;
   ph_real_35<=  16'b0001010111011100;
   ph_real_36<=  16'b0001001110101111;
   ph_real_37<=  16'b0001000101111011;
   ph_real_38 <= 16'b0000111101000010;
   ph_real_39 <= 16'b0000110100000011;
   ph_real_40 <= 16'b0000101011000001;
   ph_real_41 <= 16'b0000100001111011;
   ph_real_42 <= 16'b0000011000110010;
   ph_real_43<=  16'b0000001111100111;
   ph_real_44<=  16'b0000000110011010;
   ph_real_45<=  16'b1111111101001110; 
   ph_real_46<=  16'b1111110100000001;
   ph_real_47<=  16'b1111101010110101;
   ph_real_48<=  16'b1111100001101011;
   ph_real_49<=  16'b1111011000100100;
   ph_real_50<=  16'b1111001111100000;
   ph_real_51<=  16'b1111000110100000;
   ph_real_52 <= 16'b1110111101100100;
   ph_real_53 <= 16'b1110110100101110;
   ph_real_54 <= 16'b1110101011111111;
   ph_real_55 <= 16'b1110100011010110;
   ph_real_56 <= 16'b1110011010110101;
   ph_real_57<=  16'b1110010010011100;
   ph_real_58<=  16'b1110001010001101;
   ph_real_59<=  16'b1110000010000111; 
   ph_real_60<=  16'b1101111010001011;
   ph_real_61<=  16'b1101110010011011;
   ph_real_62<=  16'b1101101010110110;
   ph_real_63<=  16'b1101100011011110;
   ph_real_64<=  16'b1101011100010010;
   ph_real_65<=  16'b1101010101010100;
   ph_real_66 <= 16'b1101001110100101;
   ph_real_67 <= 16'b1101001000000100;
   ph_real_68 <= 16'b1101000001110010;
   ph_real_69 <= 16'b1100111011110000;
   ph_real_70 <= 16'b1100110101111110;
   
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b1111110110110011;
   ph_image_3 <=  16'b1111101101100111; 
   ph_image_4 <=  16'b1111100100011101;
   ph_image_5 <=  16'b1111011011010100;
   ph_image_6 <=  16'b1111010010001111;
   ph_image_7 <=  16'b1111001001001110;
   ph_image_8 <=  16'b1111000000010001;
   ph_image_9 <=  16'b1110110111011001;
   ph_image_10 <= 16'b1110101110101000;
   ph_image_11 <= 16'b1110100101111101;
   ph_image_12 <= 16'b1110011101011001;
   ph_image_13 <= 16'b1110010100111110;
   ph_image_14 <= 16'b1110001100101011;
   ph_image_15<=  16'b1110000100100010;
   ph_image_16<=  16'b1101111100100100;
   ph_image_17<=  16'b1101110100110000; 
   ph_image_18<=  16'b1101101101001000;
   ph_image_19<=  16'b1101100101101011;
   ph_image_20<=  16'b1101011110011100;
   ph_image_21<=  16'b1101010111011010;
   ph_image_22<=  16'b1101010000100110;
   ph_image_23<=  16'b1101001010000000;
   ph_image_24 <= 16'b1101000011101010;
   ph_image_25 <= 16'b1100111101100011;
   ph_image_26 <= 16'b1100110111101100;
   ph_image_27 <= 16'b1100110010000101;
   ph_image_28 <= 16'b1100101100110000;
   ph_image_29<=  16'b1100100111101100;
   ph_image_30<=  16'b1100100010111010;
   ph_image_31<=  16'b1100011110011011; 
   ph_image_32<=  16'b1100011010001110;
   ph_image_33<=  16'b1100010110010100;
   ph_image_34<=  16'b1100010010101101;
   ph_image_35<=  16'b1100001111011010;
   ph_image_36<=  16'b1100001100011011;
   ph_image_37<=  16'b1100001001110000;
   ph_image_38 <= 16'b1100000111011001;
   ph_image_39 <= 16'b1100000101010111;
   ph_image_40 <= 16'b1100000011101010;
   ph_image_41 <= 16'b1100000010010001;
   ph_image_42 <= 16'b1100000001001101;
   ph_image_43<=  16'b1100000000011111;
   ph_image_44<=  16'b1100000000000110;
   ph_image_45<=  16'b1100000000000001; 
   ph_image_46<=  16'b1100000000010010;
   ph_image_47<=  16'b1100000000111001;
   ph_image_48<=  16'b1100000001110100;
   ph_image_49<=  16'b1100000011000100;
   ph_image_50<=  16'b1100000100101001;
   ph_image_51<=  16'b1100000110100011;
   ph_image_52 <= 16'b1100001000110010;
   ph_image_53 <= 16'b1100001011010101;
   ph_image_54 <= 16'b1100001110001100;
   ph_image_55 <= 16'b1100010001010111;
   ph_image_56 <= 16'b1100010100110110;
   ph_image_57<=  16'b1100011000101001;
   ph_image_58<=  16'b1100011100101110;
   ph_image_59<=  16'b1100100001000111; 
   ph_image_60<=  16'b1100100101110001;
   ph_image_61<=  16'b1100101010101110;
   ph_image_62<=  16'b1100101111111101;
   ph_image_63<=  16'b1100110101011100;
   ph_image_64<=  16'b1100111011001101;
   ph_image_65<=  16'b1101000001001110;
   ph_image_66 <= 16'b1101000111011110;
   ph_image_67 <= 16'b1101001101111110;
   ph_image_68 <= 16'b1101010100101100;
   ph_image_69 <= 16'b1101011011101001;
   ph_image_70 <= 16'b1101100010110011;
   end
   else if (fpga_gpio == 4'b0100)   //1.5業
      begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111110001010;
   ph_real_3 <=  16'b0011111000101011; 
   ph_real_4 <=  16'b0011101111101000;
   ph_real_5 <=  16'b0011100011001001;
   ph_real_6 <=  16'b0011010011011010;
   ph_real_7 <=  16'b0011000000101001;
   ph_real_8 <=  16'b0010101011000111;
   ph_real_9 <=  16'b0010010011001000;
   ph_real_10 <= 16'b0001111001000010;
   ph_real_11 <= 16'b0001011101001101;
   ph_real_12 <= 16'b0001000000000010;
   ph_real_13 <= 16'b0000100001111101;
   ph_real_14 <= 16'b0000000011011001;
   ph_real_15<=  16'b1111100100110001;
   ph_real_16<=  16'b1111000110100011;
   ph_real_17<=  16'b1110101001001001; 
   ph_real_18<=  16'b1110001100111111;
   ph_real_19<=  16'b1101110010011110;
   ph_real_20<=  16'b1101011001111111;
   ph_real_21<=  16'b1101000011111001;
   ph_real_22<=  16'b1100110000011111;
   ph_real_23<=  16'b1100100000000011;
   ph_real_24 <= 16'b1100010010110110;
   ph_real_25 <= 16'b1100001001000001;
   ph_real_26 <= 16'b1100000010110000;
   ph_real_27 <= 16'b1100000000000110;
   ph_real_28 <= 16'b1100000001001000;
   ph_real_29<=  16'b1100000101110011;
   ph_real_30<=  16'b1100001110000100;
   ph_real_31<=  16'b1100011001110011; 
   ph_real_32<=  16'b1100101000110101;
   ph_real_33<=  16'b1100111010111101;
   ph_real_34<=  16'b1101001111111010;
   ph_real_35<=  16'b1101100111011000;
   ph_real_36<=  16'b1110000001000010;
   ph_real_37<=  16'b1110011100100000;
   ph_real_38 <= 16'b1110111001011010;
   ph_real_39 <= 16'b1111010111010101;
   ph_real_40 <= 16'b1111110101110101;
   ph_real_41 <= 16'b0000010100011110;
   ph_real_42 <= 16'b0000110010110101;
   ph_real_43<=  16'b0001010000011100;
   ph_real_44<=  16'b0001101100111011;
   ph_real_45<=  16'b0010000111110101; 
   ph_real_46<=  16'b0010100000110010;
   ph_real_47<=  16'b0010110111011100;
   ph_real_48<=  16'b0011001011011110;
   ph_real_49<=  16'b0011011100100101;
   ph_real_50<=  16'b0011101010100001;
   ph_real_51<=  16'b0011110101000111;
   ph_real_52 <= 16'b0011111100001011;
   ph_real_53 <= 16'b0011111111101000;
   ph_real_54 <= 16'b0011111111011010;
   ph_real_55 <= 16'b0011111011100010;
   ph_real_56 <= 16'b0011110100000100;
   ph_real_57<=  16'b0011101001000101;
   ph_real_58<=  16'b0011011010110000;
   ph_real_59<=  16'b0011001001010011; 
   ph_real_60<=  16'b0010110100111101;
   ph_real_61<=  16'b0010011110000001;
   ph_real_62<=  16'b0010000100110100;
   ph_real_63<=  16'b0001101001101101;
   ph_real_64<=  16'b0001001101000101;
   ph_real_65<=  16'b0000101111010110;
   ph_real_66 <= 16'b0000010000111100;
   ph_real_67 <= 16'b1111110010010011;
   ph_real_68 <= 16'b1111010011110101;
   ph_real_69 <= 16'b1110110110000001;
   ph_real_70 <= 16'b1110011001010000;
 
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b0000011110100110;
   ph_image_3 <=  16'b0000111100110000; 
   ph_image_4 <=  16'b0001011010000010;
   ph_image_5 <=  16'b0001110110000010;
   ph_image_6 <=  16'b0010010000010110;
   ph_image_7 <=  16'b0010101000100101;
   ph_image_8 <=  16'b0010111110011001;
   ph_image_9 <=  16'b0011010001011111;
   ph_image_10 <= 16'b0011100001100100;
   ph_image_11 <= 16'b0011101110011010;
   ph_image_12 <= 16'b0011110111110110;
   ph_image_13 <= 16'b0011111101101110;
   ph_image_14 <= 16'b0011111111111110;
   ph_image_15<=  16'b0011111110100010;
   ph_image_16<=  16'b0011111001011101;
   ph_image_17<=  16'b0011110000110011; 
   ph_image_18<=  16'b0011100100101100;
   ph_image_19<=  16'b0011010101010011;
   ph_image_20<=  16'b0011000010110111;
   ph_image_21<=  16'b0010101101100111;
   ph_image_22<=  16'b0010010101111001;
   ph_image_23<=  16'b0001111100000001;
   ph_image_24 <= 16'b0001100000010111;
   ph_image_25 <= 16'b0001000011010100;
   ph_image_26 <= 16'b0000100101010100;
   ph_image_27 <= 16'b0000000110110001;
   ph_image_28 <= 16'b1111101000001001;
   ph_image_29<=  16'b1111001001110111;
   ph_image_30<=  16'b1110101100010101;
   ph_image_31<=  16'b1110010000000001; 
   ph_image_32<=  16'b1101110101010100;
   ph_image_33<=  16'b1101011100100101;
   ph_image_34<=  16'b1101000110001101;
   ph_image_35<=  16'b1100110010011111;
   ph_image_36<=  16'b1100100001101110;
   ph_image_37<=  16'b1100010100001001;
   ph_image_38 <= 16'b1100001001111100;
   ph_image_39 <= 16'b1100000011010001;
   ph_image_40 <= 16'b1100000000001101;
   ph_image_41 <= 16'b1100000000110101;
   ph_image_42 <= 16'b1100000101000111;
   ph_image_43<=  16'b1100001100111111;
   ph_image_44<=  16'b1100011000010110;
   ph_image_45<=  16'b1100100111000001; 
   ph_image_46<=  16'b1100111000110100;
   ph_image_47<=  16'b1101001101011101;
   ph_image_48<=  16'b1101100100101010;
   ph_image_49<=  16'b1101111110000110;
   ph_image_50<=  16'b1110011001011001;
   ph_image_51<=  16'b1110110110001010;
   ph_image_52 <= 16'b1111010011111111;
   ph_image_53 <= 16'b1111110010011100;
   ph_image_54 <= 16'b0000010001000110;
   ph_image_55 <= 16'b0000101111100000;
   ph_image_56 <= 16'b0001001101001110;
   ph_image_57<=  16'b0001101001110110;
   ph_image_58<=  16'b0010000100111100;
   ph_image_59<=  16'b0010011110001000; 
   ph_image_60<=  16'b0010110101000100;
   ph_image_61<=  16'b0011001001011001;
   ph_image_62<=  16'b0011011010110101;
   ph_image_63<=  16'b0011101001001001;
   ph_image_64<=  16'b0011110100000111;
   ph_image_65<=  16'b0011111011100100;
   ph_image_66 <= 16'b0011111111011011;
   ph_image_67 <= 16'b0011111111100111;
   ph_image_68 <= 16'b0011111100001001;
   ph_image_69 <= 16'b0011110101000100;
   ph_image_70 <= 16'b0011101010011101;
   end
   else if (fpga_gpio == 4'b0101)   //-1.5業
      begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111110001010;
   ph_real_3 <=  16'b0011111000101011; 
   ph_real_4 <=  16'b0011101111101000;
   ph_real_5 <=  16'b0011100011001001;
   ph_real_6 <=  16'b0011010011011010;
   ph_real_7 <=  16'b0011000000101001;
   ph_real_8 <=  16'b0010101011000111;
   ph_real_9 <=  16'b0010010011001000;
   ph_real_10 <= 16'b0001111001000010;
   ph_real_11 <= 16'b0001011101001101;
   ph_real_12 <= 16'b0001000000000010;
   ph_real_13 <= 16'b0000100001111101;
   ph_real_14 <= 16'b0000000011011001;
   ph_real_15<=  16'b1111100100110001;
   ph_real_16<=  16'b1111000110100011;
   ph_real_17<=  16'b1110101001001001; 
   ph_real_18<=  16'b1110001100111111;
   ph_real_19<=  16'b1101110010011110;
   ph_real_20<=  16'b1101011001111111;
   ph_real_21<=  16'b1101000011111001;
   ph_real_22<=  16'b1100110000011111;
   ph_real_23<=  16'b1100100000000011;
   ph_real_24 <= 16'b1100010010110110;
   ph_real_25 <= 16'b1100001001000001;
   ph_real_26 <= 16'b1100000010110000;
   ph_real_27 <= 16'b1100000000000110;
   ph_real_28 <= 16'b1100000001001000;
   ph_real_29<=  16'b1100000101110011;
   ph_real_30<=  16'b1100001110000100;
   ph_real_31<=  16'b1100011001110011; 
   ph_real_32<=  16'b1100101000110101;
   ph_real_33<=  16'b1100111010111101;
   ph_real_34<=  16'b1101001111111010;
   ph_real_35<=  16'b1101100111011000;
   ph_real_36<=  16'b1110000001000010;
   ph_real_37<=  16'b1110011100100000;
   ph_real_38 <= 16'b1110111001011010;
   ph_real_39 <= 16'b1111010111010101;
   ph_real_40 <= 16'b1111110101110101;
   ph_real_41 <= 16'b0000010100011110;
   ph_real_42 <= 16'b0000110010110101;
   ph_real_43<=  16'b0001010000011100;
   ph_real_44<=  16'b0001101100111011;
   ph_real_45<=  16'b0010000111110101; 
   ph_real_46<=  16'b0010100000110010;
   ph_real_47<=  16'b0010110111011100;
   ph_real_48<=  16'b0011001011011110;
   ph_real_49<=  16'b0011011100100101;
   ph_real_50<=  16'b0011101010100001;
   ph_real_51<=  16'b0011110101000111;
   ph_real_52 <= 16'b0011111100001011;
   ph_real_53 <= 16'b0011111111101000;
   ph_real_54 <= 16'b0011111111011010;
   ph_real_55 <= 16'b0011111011100010;
   ph_real_56 <= 16'b0011110100000100;
   ph_real_57<=  16'b0011101001000101;
   ph_real_58<=  16'b0011011010110000;
   ph_real_59<=  16'b0011001001010011; 
   ph_real_60<=  16'b0010110100111101;
   ph_real_61<=  16'b0010011110000001;
   ph_real_62<=  16'b0010000100110100;
   ph_real_63<=  16'b0001101001101101;
   ph_real_64<=  16'b0001001101000101;
   ph_real_65<=  16'b0000101111010110;
   ph_real_66 <= 16'b0000010000111100;
   ph_real_67 <= 16'b1111110010010011;
   ph_real_68 <= 16'b1111010011110101;
   ph_real_69 <= 16'b1110110110000001;
   ph_real_70 <= 16'b1110011001010000;
   
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b1111100001011010;
   ph_image_3 <=  16'b1111000011010000; 
   ph_image_4 <=  16'b1110100101111101;
   ph_image_5 <=  16'b1110001001111101;
   ph_image_6 <=  16'b1101101111101010;
   ph_image_7 <=  16'b1101010111011011;
   ph_image_8 <=  16'b1101000001100111;
   ph_image_9 <=  16'b1100101110100001;
   ph_image_10 <= 16'b1100011110011100;
   ph_image_11 <= 16'b1100010001100101;
   ph_image_12 <= 16'b1100001000001010;
   ph_image_13 <= 16'b1100000010010001;
   ph_image_14 <= 16'b1100000000000010;
   ph_image_15<=  16'b1100000001011101;
   ph_image_16<=  16'b1100000110100011;
   ph_image_17<=  16'b1100001111001100; 
   ph_image_18<=  16'b1100011011010011;
   ph_image_19<=  16'b1100101010101100;
   ph_image_20<=  16'b1100111101001001;
   ph_image_21<=  16'b1101010010011000;
   ph_image_22<=  16'b1101101010000111;
   ph_image_23<=  16'b1110000011111111;
   ph_image_24 <= 16'b1110011111101001;
   ph_image_25 <= 16'b1110111100101011;
   ph_image_26 <= 16'b1111011010101100;
   ph_image_27 <= 16'b1111111001001110;
   ph_image_28 <= 16'b0000010111110110;
   ph_image_29<=  16'b0000110110001001;
   ph_image_30<=  16'b0001010011101010;
   ph_image_31<=  16'b0001101111111110; 
   ph_image_32<=  16'b0010001010101100;
   ph_image_33<=  16'b0010100011011010;
   ph_image_34<=  16'b0010111001110011;
   ph_image_35<=  16'b0011001101100000;
   ph_image_36<=  16'b0011011110010010;
   ph_image_37<=  16'b0011101011110111;
   ph_image_38 <= 16'b0011110110000100;
   ph_image_39 <= 16'b0011111100101111;
   ph_image_40 <= 16'b0011111111110010;
   ph_image_41 <= 16'b0011111111001011;
   ph_image_42 <= 16'b0011111010111001;
   ph_image_43<=  16'b0011110011000001;
   ph_image_44<=  16'b0011100111101010;
   ph_image_45<=  16'b0011011000111110; 
   ph_image_46<=  16'b0011000111001100;
   ph_image_47<=  16'b0010110010100010;
   ph_image_48<=  16'b0010011011010101;
   ph_image_49<=  16'b0010000001111001;
   ph_image_50<=  16'b0001100110100110;
   ph_image_51<=  16'b0001001001110101;
   ph_image_52 <= 16'b0000101100000000;
   ph_image_53 <= 16'b0000001101100011;
   ph_image_54 <= 16'b1111101110111010;
   ph_image_55 <= 16'b1111010000100000;
   ph_image_56 <= 16'b1110110010110010;
   ph_image_57<=  16'b1110010110001010;
   ph_image_58<=  16'b1101111011000011;
   ph_image_59<=  16'b1101100001110111; 
   ph_image_60<=  16'b1101001010111100;
   ph_image_61<=  16'b1100110110100110;
   ph_image_62<=  16'b1100100101001010;
   ph_image_63<=  16'b1100010110110111;
   ph_image_64<=  16'b1100001011111001;
   ph_image_65<=  16'b1100000100011011;
   ph_image_66 <= 16'b1100000000100100;
   ph_image_67 <= 16'b1100000000011000;
   ph_image_68 <= 16'b1100000011110110;
   ph_image_69 <= 16'b1100001010111100;
   ph_image_70 <= 16'b1100010101100010;
   end
   else if (fpga_gpio == 4'b0110)   //3.5業
      begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011110110000100;
   ph_real_3 <=  16'b0011011001000011; 
   ph_real_4 <=  16'b0010101011001100;
   ph_real_5 <=  16'b0001110000000100;
   ph_real_6 <=  16'b0000101100001111;
   ph_real_7 <=  16'b1111100100111111;
   ph_real_8 <=  16'b1110011111110101;
   ph_real_9 <=  16'b1101100010001000;
   ph_real_10 <= 16'b1100110000101011;
   ph_real_11 <= 16'b1100001111010011;
   ph_real_12 <= 16'b1100000000100110;
   ph_real_13 <= 16'b1100000101101101;
   ph_real_14 <= 16'b1100011110001111;
   ph_real_15<=  16'b1101001000010001;
   ph_real_16<=  16'b1110000000100100;
   ph_real_17<=  16'b1111000010101111; 
   ph_real_18<=  16'b0000001001101001;
   ph_real_19<=  16'b0001001111110101;
   ph_real_20<=  16'b0010001111110100;
   ph_real_21<=  16'b0011000100101001;
   ph_real_22<=  16'b0011101010001110;
   ph_real_23<=  16'b0011111101101000;
   ph_real_24 <= 16'b0011111101010111;
   ph_real_25 <= 16'b0011101001011100;
   ph_real_26 <= 16'b0011000011011010;
   ph_real_27 <= 16'b0010001110001110;
   ph_real_28 <= 16'b0001001110000001;
   ph_real_29<=  16'b0000000111101111;
   ph_real_30<=  16'b1111000000111000;
   ph_real_31<=  16'b1101111110111010; 
   ph_real_32<=  16'b1101000110111100;
   ph_real_33<=  16'b1100011101010110;
   ph_real_34<=  16'b1100000101010100;
   ph_real_35<=  16'b1100000000101111;
   ph_real_36<=  16'b1100001111111101;
   ph_real_37<=  16'b1100110001110011;
   ph_real_38 <= 16'b1101100011101001;
   ph_real_39 <= 16'b1110100001100110;
   ph_real_40 <= 16'b1111100110111001;
   ph_real_41 <= 16'b0000101110000111;
   ph_real_42 <= 16'b0001110001110001;
   ph_real_43<=  16'b0010101100100111;
   ph_real_44<=  16'b0011011010000011;
   ph_real_45<=  16'b0011110110100101; 
   ph_real_46<=  16'b0011111111111111;
   ph_real_47<=  16'b0011110101100001;
   ph_real_48<=  16'b0011011000000001;
   ph_real_49<=  16'b0010101001110001;
   ph_real_50<=  16'b0001101110010110;
   ph_real_51<=  16'b0000101010010111;
   ph_real_52 <= 16'b1111100011000110;
   ph_real_53 <= 16'b1110011110000100;
   ph_real_54 <= 16'b1101100000101000;
   ph_real_55 <= 16'b1100101111100100;
   ph_real_56 <= 16'b1100001110101010;
   ph_real_57<=  16'b1100000000011111;
   ph_real_58<=  16'b1100000110000111;
   ph_real_59<=  16'b1100011111001001; 
   ph_real_60<=  16'b1101001001100110;
   ph_real_61<=  16'b1110000010001110;
   ph_real_62<=  16'b1111000100100101;
   ph_real_63<=  16'b0000001011100011;
   ph_real_64<=  16'b0001010001101001;
   ph_real_65<=  16'b0010010001011001;
   ph_real_66 <= 16'b0011000101110111;
   ph_real_67 <= 16'b0011101010111111;
   ph_real_68 <= 16'b0011111101111000;
   ph_real_69 <= 16'b0011111101000101;
   ph_real_70 <= 16'b0011101000101001;
   
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b0001000110100110;
   ph_image_3 <=  16'b0010000111101110; 
   ph_image_4 <=  16'b0010111110010100;
   ph_image_5 <=  16'b0011100110001010;
   ph_image_6 <=  16'b0011111100001000;
   ph_image_7 <=  16'b0011111110100100;
   ph_image_8 <=  16'b0011101101001111;
   ph_image_9 <=  16'b0011001001100000;
   ph_image_10 <= 16'b0010010110001010;
   ph_image_11 <= 16'b0001010111001001;
   ph_image_12 <= 16'b0000010001011001;
   ph_image_13 <= 16'b1111001010010010;
   ph_image_14 <= 16'b1110000111010101;
   ph_image_15<=  16'b1101001101110000;
   ph_image_16<=  16'b1100100001111111;
   ph_image_17<=  16'b1100000111011101; 
   ph_image_18<=  16'b1100000000001100;
   ph_image_19<=  16'b1100001100110010;
   ph_image_20<=  16'b1100101100001110;
   ph_image_21<=  16'b1101011100000111;
   ph_image_22<=  16'b1110011000101100;
   ph_image_23<=  16'b1111011101010011;
   ph_image_24 <= 16'b0000100100100101;
   ph_image_25 <= 16'b0001101001000011;
   ph_image_26 <= 16'b0010100101010110;
   ph_image_27 <= 16'b0011010100110101;
   ph_image_28 <= 16'b0011110011110100;
   ph_image_29<=  16'b0011111111110111;
   ph_image_30<=  16'b0011111000000101;
   ph_image_31<=  16'b0011011101000011; 
   ph_image_32<=  16'b0010110000111000;
   ph_image_33<=  16'b0001110110111110;
   ph_image_34<=  16'b0000110011110110;
   ph_image_35<=  16'b1111101100101101;
   ph_image_36<=  16'b1110100111000011;
   ph_image_37<=  16'b1101101000010011;
   ph_image_38 <= 16'b1100110101010100;
   ph_image_39 <= 16'b1100010010000011;
   ph_image_40 <= 16'b1100000001010000;
   ph_image_41 <= 16'b1100000100001101;
   ph_image_42 <= 16'b1100011010101100;
   ph_image_43<=  16'b1101000010111101;
   ph_image_44<=  16'b1101111001111001;
   ph_image_45<=  16'b1110111011001111; 
   ph_image_46<=  16'b0000000001111010;
   ph_image_47<=  16'b0001001000011011;
   ph_image_48<=  16'b0010001001010101;
   ph_image_49<=  16'b0010111111100110;
   ph_image_50<=  16'b0011100110111111;
   ph_image_51<=  16'b0011111100011101;
   ph_image_52 <= 16'b0011111110010110;
   ph_image_53 <= 16'b0011101100100001;
   ph_image_54 <= 16'b0011001000010101;
   ph_image_55 <= 16'b0010010100100111;
   ph_image_56 <= 16'b0001010101010110;
   ph_image_57<=  16'b0000001111011111;
   ph_image_58<=  16'b1111001000011011;
   ph_image_59<=  16'b1110000101101010; 
   ph_image_60<=  16'b1101001100011000;
   ph_image_61<=  16'b1100100001000011;
   ph_image_62<=  16'b1100000111000000;
   ph_image_63<=  16'b1100000000010001;
   ph_image_64<=  16'b1100001101011000;
   ph_image_65<=  16'b1100101101010011;
   ph_image_66 <= 16'b1101011101100101;
   ph_image_67 <= 16'b1110011010011100;
   ph_image_68 <= 16'b1111011111001100;
   ph_image_69 <= 16'b0000100110011110;
   ph_image_70 <= 16'b0001101010110010;
   end
   else if (fpga_gpio== 4'b0111)   //-3.5業
      begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011110110000100;
   ph_real_3 <=  16'b0011011001000011; 
   ph_real_4 <=  16'b0010101011001100;
   ph_real_5 <=  16'b0001110000000100;
   ph_real_6 <=  16'b0000101100001111;
   ph_real_7 <=  16'b1111100100111111;
   ph_real_8 <=  16'b1110011111110101;
   ph_real_9 <=  16'b1101100010001000;
   ph_real_10 <= 16'b1100110000101011;
   ph_real_11 <= 16'b1100001111010011;
   ph_real_12 <= 16'b1100000000100110;
   ph_real_13 <= 16'b1100000101101101;
   ph_real_14 <= 16'b1100011110001111;
   ph_real_15<=  16'b1101001000010001;
   ph_real_16<=  16'b1110000000100100;
   ph_real_17<=  16'b1111000010101111; 
   ph_real_18<=  16'b0000001001101001;
   ph_real_19<=  16'b0001001111110101;
   ph_real_20<=  16'b0010001111110100;
   ph_real_21<=  16'b0011000100101001;
   ph_real_22<=  16'b0011101010001110;
   ph_real_23<=  16'b0011111101101000;
   ph_real_24 <= 16'b0011111101010111;
   ph_real_25 <= 16'b0011101001011100;
   ph_real_26 <= 16'b0011000011011010;
   ph_real_27 <= 16'b0010001110001110;
   ph_real_28 <= 16'b0001001110000001;
   ph_real_29<=  16'b0000000111101111;
   ph_real_30<=  16'b1111000000111000;
   ph_real_31<=  16'b1101111110111010; 
   ph_real_32<=  16'b1101000110111100;
   ph_real_33<=  16'b1100011101010110;
   ph_real_34<=  16'b1100000101010100;
   ph_real_35<=  16'b1100000000101111;
   ph_real_36<=  16'b1100001111111101;
   ph_real_37<=  16'b1100110001110011;
   ph_real_38 <= 16'b1101100011101001;
   ph_real_39 <= 16'b1110100001100110;
   ph_real_40 <= 16'b1111100110111001;
   ph_real_41 <= 16'b0000101110000111;
   ph_real_42 <= 16'b0001110001110001;
   ph_real_43<=  16'b0010101100100111;
   ph_real_44<=  16'b0011011010000011;
   ph_real_45<=  16'b0011110110100101; 
   ph_real_46<=  16'b0011111111111111;
   ph_real_47<=  16'b0011110101100001;
   ph_real_48<=  16'b0011011000000001;
   ph_real_49<=  16'b0010101001110001;
   ph_real_50<=  16'b0001101110010110;
   ph_real_51<=  16'b0000101010010111;
   ph_real_52 <= 16'b1111100011000110;
   ph_real_53 <= 16'b1110011110000100;
   ph_real_54 <= 16'b1101100000101000;
   ph_real_55 <= 16'b1100101111100100;
   ph_real_56 <= 16'b1100001110101010;
   ph_real_57<=  16'b1100000000011111;
   ph_real_58<=  16'b1100000110000111;
   ph_real_59<=  16'b1100011111001001; 
   ph_real_60<=  16'b1101001001100110;
   ph_real_61<=  16'b1110000010001110;
   ph_real_62<=  16'b1111000100100101;
   ph_real_63<=  16'b0000001011100011;
   ph_real_64<=  16'b0001010001101001;
   ph_real_65<=  16'b0010010001011001;
   ph_real_66 <= 16'b0011000101110111;
   ph_real_67 <= 16'b0011101010111111;
   ph_real_68 <= 16'b0011111101111000;
   ph_real_69 <= 16'b0011111101000101;
   ph_real_70 <= 16'b0011101000101001;
   
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b1110111001011001;
   ph_image_3 <=  16'b1101111000010001; 
   ph_image_4 <=  16'b1101000001101011;
   ph_image_5 <=  16'b1100011001110110;
   ph_image_6 <=  16'b1100000011110111;
   ph_image_7 <=  16'b1100000001011100;
   ph_image_8 <=  16'b1100010010110001;
   ph_image_9 <=  16'b1100110110011111;
   ph_image_10 <= 16'b1101101001110110;
   ph_image_11 <= 16'b1110101000110110;
   ph_image_12 <= 16'b1111101110100111;
   ph_image_13 <= 16'b0000110101101110;
   ph_image_14 <= 16'b0001111000101010;
   ph_image_15<=  16'b0010110010010000;
   ph_image_16<=  16'b0011011110000000;
   ph_image_17<=  16'b0011111000100011; 
   ph_image_18<=  16'b0011111111110011;
   ph_image_19<=  16'b0011110011001110;
   ph_image_20<=  16'b0011010011110001;
   ph_image_21<=  16'b0010100011111001;
   ph_image_22<=  16'b0001100111010011;
   ph_image_23<=  16'b0000100010101101;
   ph_image_24 <= 16'b1111011011011010;
   ph_image_25 <= 16'b1110010110111101;
   ph_image_26 <= 16'b1101011010101001;
   ph_image_27 <= 16'b1100101011001010;
   ph_image_28 <= 16'b1100001100001100;
   ph_image_29<=  16'b1100000000001000;
   ph_image_30<=  16'b1100000111111010;
   ph_image_31<=  16'b1100100010111100; 
   ph_image_32<=  16'b1101001111001000;
   ph_image_33<=  16'b1110001001000001;
   ph_image_34<=  16'b1111001100001001;
   ph_image_35<=  16'b0000010011010010;
   ph_image_36<=  16'b0001011000111100;
   ph_image_37<=  16'b0010010111101100;
   ph_image_38 <= 16'b0011001010101011;
   ph_image_39 <= 16'b0011101101111100;
   ph_image_40 <= 16'b0011111110110000;
   ph_image_41 <= 16'b0011111011110011;
   ph_image_42 <= 16'b0011100101010100;
   ph_image_43<=  16'b0010111101000010;
   ph_image_44<=  16'b0010000110000110;
   ph_image_45<=  16'b0001000100110000; 
   ph_image_46<=  16'b1111111110000110;
   ph_image_47<=  16'b1110110111100100;
   ph_image_48<=  16'b1101110110101010;
   ph_image_49<=  16'b1101000000011010;
   ph_image_50<=  16'b1100011001000001;
   ph_image_51<=  16'b1100000011100010;
   ph_image_52 <= 16'b1100000001101001;
   ph_image_53 <= 16'b1100010011011111;
   ph_image_54 <= 16'b1100110111101011;
   ph_image_55 <= 16'b1101101011011001;
   ph_image_56 <= 16'b1110101010101001;
   ph_image_57<=  16'b1111110000100001;
   ph_image_58<=  16'b0000110111100101;
   ph_image_59<=  16'b0001111010010110; 
   ph_image_60<=  16'b0010110011100111;
   ph_image_61<=  16'b0011011110111101;
   ph_image_62<=  16'b0011111001000000;
   ph_image_63<=  16'b0011111111101110;
   ph_image_64<=  16'b0011110010100111;
   ph_image_65<=  16'b0011010010101100;
   ph_image_66 <= 16'b0010100010011011;
   ph_image_67 <= 16'b0001100101100011;
   ph_image_68 <= 16'b0000100000110011;
   ph_image_69 <= 16'b1111011001100001;
   ph_image_70 <= 16'b1110010101001110;
   end
   
   else
         begin 
   ph_real_1 <=  16'b0011111111111111;
   ph_real_2 <=  16'b0011111111111111;
   ph_real_3 <=  16'b0011111111111111; 
   ph_real_4 <=  16'b0011111111111111;
   ph_real_5 <=  16'b0011111111111111;
   ph_real_6 <=  16'b0011111111111111;
   ph_real_7 <=  16'b0011111111111111;
   ph_real_8 <=  16'b0011111111111111;
   ph_real_9 <=  16'b0011111111111111;
   ph_real_10 <= 16'b0011111111111111;
   ph_real_11 <= 16'b0011111111111111;
   ph_real_12 <= 16'b0011111111111111;
   ph_real_13 <= 16'b0011111111111111;
   ph_real_14 <= 16'b0011111111111111;
   ph_real_15<=  16'b0011111111111111;
   ph_real_16<=  16'b0011111111111111;
   ph_real_17<=  16'b0011111111111111; 
   ph_real_18<=  16'b0011111111111111;
   ph_real_19<=  16'b0011111111111111;
   ph_real_20<=  16'b0011111111111111;
   ph_real_21<=  16'b0011111111111111;
   ph_real_22<=  16'b0011111111111111;
   ph_real_23<=  16'b0011111111111111;
   ph_real_24 <= 16'b0011111111111111;
   ph_real_25 <= 16'b0011111111111111;
   ph_real_26 <= 16'b0011111111111111;
   ph_real_27 <= 16'b0011111111111111;
   ph_real_28 <= 16'b0011111111111111;
   ph_real_29<=  16'b0011111111111111;
   ph_real_30<=  16'b0011111111111111;
   ph_real_31<=  16'b0011111111111111; 
   ph_real_32<=  16'b0011111111111111;
   ph_real_33<=  16'b0011111111111111;
   ph_real_34<=  16'b0011111111111111;
   ph_real_35<=  16'b0011111111111111;
   ph_real_36<=  16'b0011111111111111;
   ph_real_37<=  16'b0011111111111111;
   ph_real_38 <= 16'b0011111111111111;
   ph_real_39 <= 16'b0011111111111111;
   ph_real_40 <= 16'b0011111111111111;
   ph_real_41 <= 16'b0011111111111111;
   ph_real_42 <= 16'b0011111111111111;
   ph_real_43<=  16'b0011111111111111;
   ph_real_44<=  16'b0011111111111111;
   ph_real_45<=  16'b0011111111111111; 
   ph_real_46<=  16'b0011111111111111;
   ph_real_47<=  16'b0011111111111111;
   ph_real_48<=  16'b0011111111111111;
   ph_real_49<=  16'b0011111111111111;
   ph_real_50<=  16'b0011111111111111;
   ph_real_51<=  16'b0011111111111111;
   ph_real_52 <= 16'b0011111111111111;
   ph_real_53 <= 16'b0011111111111111;
   ph_real_54 <= 16'b0011111111111111;
   ph_real_55 <= 16'b0011111111111111;
   ph_real_56 <= 16'b0011111111111111;
   ph_real_57<=  16'b0011111111111111;
   ph_real_58<=  16'b0011111111111111;
   ph_real_59<=  16'b0011111111111111; 
   ph_real_60<=  16'b0011111111111111;
   ph_real_61<=  16'b0011111111111111;
   ph_real_62<=  16'b0011111111111111;
   ph_real_63<=  16'b0011111111111111;
   ph_real_64<=  16'b0011111111111111;
   ph_real_65<=  16'b0011111111111111;
   ph_real_66 <= 16'b0011111111111111;
   ph_real_67 <= 16'b0011111111111111;
   ph_real_68 <= 16'b0011111111111111;
   ph_real_69 <= 16'b0011111111111111;
   ph_real_70 <= 16'b0011111111111111;
   ph_image_1 <=  16'b0000000000000000;
   ph_image_2 <=  16'b0000000000000000;
   ph_image_3 <=  16'b0000000000000000;
   ph_image_4 <=  16'b0000000000000000;
   ph_image_5 <=  16'b0000000000000000;
   ph_image_6 <=  16'b0000000000000000;
   ph_image_7 <=  16'b0000000000000000;
   ph_image_8 <=  16'b0000000000000000;
   ph_image_9 <=  16'b0000000000000000;
   ph_image_10 <= 16'b0000000000000000;
   ph_image_11 <= 16'b0000000000000000;
   ph_image_12 <= 16'b0000000000000000;
   ph_image_13 <= 16'b0000000000000000;
   ph_image_14 <= 16'b0000000000000000;
   ph_image_15<=  16'b0000000000000000;
   ph_image_16<=  16'b0000000000000000;
   ph_image_17<=  16'b0000000000000000;
   ph_image_18<=  16'b0000000000000000;
   ph_image_19<=  16'b0000000000000000;
   ph_image_20<=  16'b0000000000000000;
   ph_image_21<=  16'b0000000000000000;
   ph_image_22<=  16'b0000000000000000;
   ph_image_23<=  16'b0000000000000000;
   ph_image_24 <= 16'b0000000000000000;
   ph_image_25 <= 16'b0000000000000000;
   ph_image_26 <= 16'b0000000000000000;
   ph_image_27 <= 16'b0000000000000000;
   ph_image_28 <= 16'b0000000000000000;
   ph_image_29<=  16'b0000000000000000;
   ph_image_30<=  16'b0000000000000000;
   ph_image_31<=  16'b0000000000000000;
   ph_image_32<=  16'b0000000000000000;
   ph_image_33<=  16'b0000000000000000;
   ph_image_34<=  16'b0000000000000000;
   ph_image_35<=  16'b0000000000000000;
   ph_image_36<=  16'b0000000000000000;
   ph_image_37<=  16'b0000000000000000;
   ph_image_38 <= 16'b0000000000000000;
   ph_image_39 <= 16'b0000000000000000;
   ph_image_40 <= 16'b0000000000000000;
   ph_image_41 <= 16'b0000000000000000;
   ph_image_42 <= 16'b0000000000000000;
   ph_image_43<=  16'b0000000000000000;
   ph_image_44<=  16'b0000000000000000;
   ph_image_45<=  16'b0000000000000000;
   ph_image_46<=  16'b0000000000000000;
   ph_image_47<=  16'b0000000000000000;
   ph_image_48<=  16'b0000000000000000;
   ph_image_49<=  16'b0000000000000000;
   ph_image_50<=  16'b0000000000000000;
   ph_image_51<=  16'b0000000000000000;
   ph_image_52 <= 16'b0000000000000000;
   ph_image_53 <= 16'b0000000000000000;
   ph_image_54 <= 16'b0000000000000000;
   ph_image_55 <= 16'b0000000000000000;
   ph_image_56 <= 16'b0000000000000000;
   ph_image_57<=  16'b0000000000000000;
   ph_image_58<=  16'b0000000000000000;
   ph_image_59<=  16'b0000000000000000;
   ph_image_60<=  16'b0000000000000000;
   ph_image_61<=  16'b0000000000000000;
   ph_image_62<=  16'b0000000000000000;
   ph_image_63<=  16'b0000000000000000;
   ph_image_64<=  16'b0000000000000000;
   ph_image_65<=  16'b0000000000000000;
   ph_image_66 <= 16'b0000000000000000;
   ph_image_67 <= 16'b0000000000000000;
   ph_image_68 <= 16'b0000000000000000;
   ph_image_69 <= 16'b0000000000000000;
   ph_image_70 <= 16'b0000000000000000;
end
end  



// dbf_phase_cordic dbf_phase_top_1(
//    .clk(clk_120m),
    
//    .phase_data_1  (phase_data_1 ),
//    .phase_data_2  (phase_data_2 ),
//    .phase_data_3  (phase_data_3 ),
//    .phase_data_4  (phase_data_4 ),
//    .phase_data_5  (phase_data_5 ),
//    .phase_data_6  (phase_data_6 ),
//    .phase_data_7  (phase_data_7 ),
//    .phase_data_8  (phase_data_8 ),
//    .phase_data_9  (phase_data_9 ),
//    .phase_data_10 (phase_data_10 ),
//    .phase_data_11 (phase_data_11 ),
//    .phase_data_12 (phase_data_12 ),
//    .phase_data_13 (phase_data_13 ),
//    .phase_data_14 (phase_data_14 ),
//    .phase_data_15 (phase_data_15 ),
//    .phase_data_16 (phase_data_16 ),
//    .phase_data_17 (phase_data_17 ),
//    .phase_data_18 (phase_data_18 ),
//    .phase_data_19 (phase_data_19 ),
//    .phase_data_20 (phase_data_20 ),
//    .phase_data_21 (phase_data_21 ),
//    .phase_data_22 (phase_data_22 ),
//    .phase_data_23 (phase_data_23 ),
//    .phase_data_24 (phase_data_24 ),
//    .phase_data_25 (phase_data_25 ),
//    .phase_data_26 (phase_data_26 ),
//    .phase_data_27 (phase_data_27 ),
//    .phase_data_28 (phase_data_28 ),
//    .phase_data_29 (phase_data_29 ),
//    .phase_data_30 (phase_data_30 ),
//    .phase_data_31 (phase_data_31 ),
//    .phase_data_32 (phase_data_32 ),
//    .phase_data_33 (phase_data_33 ),
//    .phase_data_34 (phase_data_34 ),
//    .phase_data_35 (phase_data_35 ),
//    .phase_data_36 (phase_data_36 ),
//    .phase_data_37 (phase_data_37 ),
//    .phase_data_38 (phase_data_38 ),
//    .phase_data_39 (phase_data_39 ),
//    .phase_data_40 (phase_data_40 ),
//    .phase_data_41 (phase_data_41 ),
//    .phase_data_42 (phase_data_42 ),
//    .phase_data_43 (phase_data_43 ),
//    .phase_data_44 (phase_data_44 ),
//    .phase_data_45 (phase_data_45 ),
//    .phase_data_46 (phase_data_46 ),
//    .phase_data_47 (phase_data_47 ),
//    .phase_data_48 (phase_data_48 ),
//    .phase_data_49 (phase_data_49 ),
//    .phase_data_50 (phase_data_50 ),
//    .phase_data_51 (phase_data_51 ),
//    .phase_data_52 (phase_data_52 ),
//    .phase_data_53 (phase_data_53 ),
//    .phase_data_54 (phase_data_54 ),
//    .phase_data_55 (phase_data_55 ),
//    .phase_data_56 (phase_data_56 ),
//    .phase_data_57 (phase_data_57 ),
//    .phase_data_58 (phase_data_58 ),
//    .phase_data_59 (phase_data_59 ),
//    .phase_data_60 (phase_data_60 ),
//    .phase_data_61 (phase_data_61 ),
//    .phase_data_62 (phase_data_62 ),
//    .phase_data_63 (phase_data_63 ),
//    .phase_data_64 (phase_data_64 ),
//    .phase_data_65 (phase_data_65 ),
//    .phase_data_66 (phase_data_66 ),
//    .phase_data_67 (phase_data_67 ),
//    .phase_data_68 (phase_data_68 ),
//    .phase_data_69 (phase_data_69 ),
//    .phase_data_70 (phase_data_70 ),
    
//    .phase_data_valid(phase_data_valid),
    
    
//    .ph_real_1  (ph_real_1  ),
//    .ph_real_2  (ph_real_2  ),
//    .ph_real_3  (ph_real_3  ),
//    .ph_real_4  (ph_real_4  ),
//    .ph_real_5  (ph_real_5  ),
//    .ph_real_6  (ph_real_6  ),
//    .ph_real_7  (ph_real_7  ),
//    .ph_real_8  (ph_real_8  ),
//    .ph_real_9  (ph_real_9  ),
//    .ph_real_10 (ph_real_10 ),
//    .ph_real_11 (ph_real_11 ),
//    .ph_real_12 (ph_real_12 ),
//    .ph_real_13 (ph_real_13 ),
//    .ph_real_14 (ph_real_14 ),
//    .ph_real_15 (ph_real_15 ),
//    .ph_real_16 (ph_real_16 ),
//    .ph_real_17 (ph_real_17 ),
//    .ph_real_18 (ph_real_18 ),
//    .ph_real_19 (ph_real_19 ),
//    .ph_real_20 (ph_real_20 ),
//    .ph_real_21 (ph_real_21 ),
//    .ph_real_22 (ph_real_22 ),
//    .ph_real_23 (ph_real_23 ),
//    .ph_real_24 (ph_real_24 ),
//    .ph_real_25 (ph_real_25 ),
//    .ph_real_26 (ph_real_26 ),
//    .ph_real_27 (ph_real_27 ),
//    .ph_real_28 (ph_real_28 ),
//    .ph_real_29 (ph_real_29 ),
//    .ph_real_30 (ph_real_30 ),
//    .ph_real_31 (ph_real_31 ),
//    .ph_real_32 (ph_real_32 ),
//    .ph_real_33 (ph_real_33 ),
//    .ph_real_34 (ph_real_34 ),
//    .ph_real_35 (ph_real_35 ),
//    .ph_real_36 (ph_real_36 ),
//    .ph_real_37 (ph_real_37 ),
//    .ph_real_38 (ph_real_38 ),
//    .ph_real_39 (ph_real_39 ),
//    .ph_real_40 (ph_real_40 ),
//    .ph_real_41 (ph_real_41 ),
//    .ph_real_42 (ph_real_42 ),
//    .ph_real_43 (ph_real_43 ),
//    .ph_real_44 (ph_real_44 ),
//    .ph_real_45 (ph_real_45 ),
//    .ph_real_46 (ph_real_46 ),
//    .ph_real_47 (ph_real_47 ),
//    .ph_real_48 (ph_real_48 ),
//    .ph_real_49 (ph_real_49 ),
//    .ph_real_50 (ph_real_50 ),
//    .ph_real_51 (ph_real_51 ),
//    .ph_real_52 (ph_real_52 ),
//    .ph_real_53 (ph_real_53 ),
//    .ph_real_54 (ph_real_54 ),
//    .ph_real_55 (ph_real_55 ),
//    .ph_real_56 (ph_real_56 ),
//    .ph_real_57 (ph_real_57 ),
//    .ph_real_58 (ph_real_58 ),
//    .ph_real_59 (ph_real_59 ),
//    .ph_real_60 (ph_real_60 ),
//    .ph_real_61 (ph_real_61 ),
//    .ph_real_62 (ph_real_62 ),
//    .ph_real_63 (ph_real_63 ),
//    .ph_real_64 (ph_real_64 ),
//    .ph_real_65 (ph_real_65 ),
//    .ph_real_66 (ph_real_66 ),
//    .ph_real_67 (ph_real_67 ),
//    .ph_real_68 (ph_real_68 ),
//    .ph_real_69 (ph_real_69 ),
//    .ph_real_70 (ph_real_70 ),
    
    
//    .ph_image_1  (ph_image_1  ),
//    .ph_image_2  (ph_image_2  ),
//    .ph_image_3  (ph_image_3  ),
//    .ph_image_4  (ph_image_4  ),
//    .ph_image_5  (ph_image_5  ),
//    .ph_image_6  (ph_image_6  ),
//    .ph_image_7  (ph_image_7  ),
//    .ph_image_8  (ph_image_8  ),
//    .ph_image_9  (ph_image_9  ),
//    .ph_image_10 (ph_image_10 ),
//    .ph_image_11 (ph_image_11 ),
//    .ph_image_12 (ph_image_12 ),
//    .ph_image_13 (ph_image_13 ),
//    .ph_image_14 (ph_image_14 ),
//    .ph_image_15 (ph_image_15 ),
//    .ph_image_16 (ph_image_16 ),
//    .ph_image_17 (ph_image_17 ),
//    .ph_image_18 (ph_image_18 ),
//    .ph_image_19 (ph_image_19 ),
//    .ph_image_20 (ph_image_20 ),
//    .ph_image_21 (ph_image_21 ),
//    .ph_image_22 (ph_image_22 ),
//    .ph_image_23 (ph_image_23 ),
//    .ph_image_24 (ph_image_24 ),
//    .ph_image_25 (ph_image_25 ),
//    .ph_image_26 (ph_image_26 ),
//    .ph_image_27 (ph_image_27 ),
//    .ph_image_28 (ph_image_28 ),
//    .ph_image_29 (ph_image_29 ),
//    .ph_image_30 (ph_image_30 ),
//    .ph_image_31 (ph_image_31 ),
//    .ph_image_32 (ph_image_32 ),
//    .ph_image_33 (ph_image_33 ),
//    .ph_image_34 (ph_image_34 ),
//    .ph_image_35 (ph_image_35 ),
//    .ph_image_36 (ph_image_36 ),
//    .ph_image_37 (ph_image_37 ),
//    .ph_image_38 (ph_image_38 ),
//    .ph_image_39 (ph_image_39 ),
//    .ph_image_40 (ph_image_40 ),
//    .ph_image_41 (ph_image_41 ),
//    .ph_image_42 (ph_image_42 ),
//    .ph_image_43 (ph_image_43 ),
//    .ph_image_44 (ph_image_44 ),
//    .ph_image_45 (ph_image_45 ),
//    .ph_image_46 (ph_image_46 ),
//    .ph_image_47 (ph_image_47 ),
//    .ph_image_48 (ph_image_48 ),
//    .ph_image_49 (ph_image_49 ),
//    .ph_image_50 (ph_image_50 ),
//    .ph_image_51 (ph_image_51 ),
//    .ph_image_52 (ph_image_52 ),
//    .ph_image_53 (ph_image_53 ),
//    .ph_image_54 (ph_image_54 ),
//    .ph_image_55 (ph_image_55 ),
//    .ph_image_56 (ph_image_56 ),
//    .ph_image_57 (ph_image_57 ),
//    .ph_image_58 (ph_image_58 ),
//    .ph_image_59 (ph_image_59 ),
//    .ph_image_60 (ph_image_60 ),
//    .ph_image_61 (ph_image_61 ),
//    .ph_image_62 (ph_image_62 ),
//    .ph_image_63 (ph_image_63 ),
//    .ph_image_64 (ph_image_64 ),
//    .ph_image_65 (ph_image_65 ),
//    .ph_image_66 (ph_image_66 ),
//    .ph_image_67 (ph_image_67 ),
//    .ph_image_68 (ph_image_68 ),
//    .ph_image_69 (ph_image_69 ),
//    .ph_image_70 (ph_image_70 )
//    );
   

fuyang70  fuyang_L(
    .clk(clk_120m),
    .dataI(data_1_24_I),
    .dataQ(data_1_24_Q),
    .data_in_valid(data_in_valid),
    .fy_cut_ctl(fy_cut_ctl),   
    
    .A(A),
    .ph_real_1  (ph_real_1  ),
    .ph_real_2  (ph_real_2  ),
    .ph_real_3  (ph_real_3  ),
    .ph_real_4  (ph_real_4  ),
    .ph_real_5  (ph_real_5  ),
    .ph_real_6  (ph_real_6  ),
    .ph_real_7  (ph_real_7  ),
    .ph_real_8  (ph_real_8  ),
    .ph_real_9  (ph_real_9  ),
    .ph_real_10 (ph_real_10 ),
    .ph_real_11 (ph_real_11 ),
    .ph_real_12 (ph_real_12 ),
    .ph_real_13 (ph_real_13 ),
    .ph_real_14 (ph_real_14 ),
    .ph_real_15 (ph_real_15 ),
    .ph_real_16 (ph_real_16 ),
    .ph_real_17 (ph_real_17 ),
    .ph_real_18 (ph_real_18 ),
    .ph_real_19 (ph_real_19 ),
    .ph_real_20 (ph_real_20 ),
    .ph_real_21 (ph_real_21 ),
    .ph_real_22 (ph_real_22 ),
    .ph_real_23 (ph_real_23 ),
    .ph_real_24 (ph_real_24 ),
    .ph_real_25 (ph_real_25 ),
    .ph_real_26 (ph_real_26 ),
    .ph_real_27 (ph_real_27 ),
    .ph_real_28 (ph_real_28 ),
    .ph_real_29 (ph_real_29 ),
    .ph_real_30 (ph_real_30 ),
    .ph_real_31 (ph_real_31 ),
    .ph_real_32 (ph_real_32 ),
    .ph_real_33 (ph_real_33 ),
    .ph_real_34 (ph_real_34 ),
    .ph_real_35 (ph_real_35 ),
    .ph_real_36 (ph_real_36 ),
    .ph_real_37 (ph_real_37 ),
    .ph_real_38 (ph_real_38 ),
    .ph_real_39 (ph_real_39 ),
    .ph_real_40 (ph_real_40 ),
    .ph_real_41 (ph_real_41 ),
    .ph_real_42 (ph_real_42 ),
    .ph_real_43 (ph_real_43 ),
    .ph_real_44 (ph_real_44 ),
    .ph_real_45 (ph_real_45 ),
    .ph_real_46 (ph_real_46 ),
    .ph_real_47 (ph_real_47 ),
    .ph_real_48 (ph_real_48 ),
    .ph_real_49 (ph_real_49 ),
    .ph_real_50 (ph_real_50 ),
    .ph_real_51 (ph_real_51 ),
    .ph_real_52 (ph_real_52 ),
    .ph_real_53 (ph_real_53 ),
    .ph_real_54 (ph_real_54 ),
    .ph_real_55 (ph_real_55 ),
    .ph_real_56 (ph_real_56 ),
    .ph_real_57 (ph_real_57 ),
    .ph_real_58 (ph_real_58 ),
    .ph_real_59 (ph_real_59 ),
    .ph_real_60 (ph_real_60 ),
    .ph_real_61 (ph_real_61 ),
    .ph_real_62 (ph_real_62 ),
    .ph_real_63 (ph_real_63 ),
    .ph_real_64 (ph_real_64 ),
    .ph_real_65 (ph_real_65 ),
    .ph_real_66 (ph_real_66 ),
    .ph_real_67 (ph_real_67 ),
    .ph_real_68 (ph_real_68 ),
    .ph_real_69 (ph_real_69 ),
    .ph_real_70 (ph_real_70 ),
    
    
    .ph_image_1  (ph_image_1  ),
    .ph_image_2  (ph_image_2  ),
    .ph_image_3  (ph_image_3  ),
    .ph_image_4  (ph_image_4  ),
    .ph_image_5  (ph_image_5  ),
    .ph_image_6  (ph_image_6  ),
    .ph_image_7  (ph_image_7  ),
    .ph_image_8  (ph_image_8  ),
    .ph_image_9  (ph_image_9  ),
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
    .ph_image_35 (ph_image_35 ),
    .ph_image_36 (ph_image_36 ),
    .ph_image_37 (ph_image_37 ),
    .ph_image_38 (ph_image_38 ),
    .ph_image_39 (ph_image_39 ),
    .ph_image_40 (ph_image_40 ),
    .ph_image_41 (ph_image_41 ),
    .ph_image_42 (ph_image_42 ),
    .ph_image_43 (ph_image_43 ),
    .ph_image_44 (ph_image_44 ),
    .ph_image_45 (ph_image_45 ),
    .ph_image_46 (ph_image_46 ),
    .ph_image_47 (ph_image_47 ),
    .ph_image_48 (ph_image_48 ),
    .ph_image_49 (ph_image_49 ),
    .ph_image_50 (ph_image_50 ),
    .ph_image_51 (ph_image_51 ),
    .ph_image_52 (ph_image_52 ),
    .ph_image_53 (ph_image_53 ),
    .ph_image_54 (ph_image_54 ),
    .ph_image_55 (ph_image_55 ),
    .ph_image_56 (ph_image_56 ),
    .ph_image_57 (ph_image_57 ),
    .ph_image_58 (ph_image_58 ),
    .ph_image_59 (ph_image_59 ),
    .ph_image_60 (ph_image_60 ),
    .ph_image_61 (ph_image_61 ),
    .ph_image_62 (ph_image_62 ),
    .ph_image_63 (ph_image_63 ),
    .ph_image_64 (ph_image_64 ),
    .ph_image_65 (ph_image_65 ),
    .ph_image_66 (ph_image_66 ),
    .ph_image_67 (ph_image_67 ),
    .ph_image_68 (ph_image_68 ),
    .ph_image_69 (ph_image_69 ),
    .ph_image_70 (ph_image_70 ),
    
    .phase_data_valid(phase_data_valid),
    
    .data_out_I_1(data_out_L_1_I),
    .data_out_Q_1(data_out_L_1_Q),
    .data_out_I_2(data_out_L_2_I),
    .data_out_Q_2(data_out_L_2_Q),
    .data_out_I_3(data_out_L_3_I),
    .data_out_Q_3(data_out_L_3_Q),
    .data_out_I_4(data_out_L_4_I),
    .data_out_Q_4(data_out_L_4_Q),
    .data_out_I_5(data_out_L_5_I),
    .data_out_Q_5(data_out_L_5_Q),
    .data_out_I_6(data_out_L_6_I),
    .data_out_Q_6(data_out_L_6_Q),
    .data_out_I_7(data_out_L_7_I),
    .data_out_Q_7(data_out_L_7_Q),
    .data_out_I_8(data_out_L_8_I),
    .data_out_Q_8(data_out_L_8_Q),
    .data_out_I_9(data_out_L_9_I),
    .data_out_Q_9(data_out_L_9_Q),
    .data_out_I_10(data_out_L_10_I),
    .data_out_Q_10(data_out_L_10_Q),
    .data_out_I_11(data_out_L_11_I),
    .data_out_Q_11(data_out_L_11_Q),
    .data_out_I_12(data_out_L_12_I),
    .data_out_Q_12(data_out_L_12_Q),
    .data_out_I_13(data_out_L_13_I),
    .data_out_Q_13(data_out_L_13_Q),
    .data_out_I_14(data_out_L_14_I),
    .data_out_Q_14(data_out_L_14_Q),
    .data_out_I_15(data_out_L_15_I),
    .data_out_Q_15(data_out_L_15_Q),
    .data_out_I_16(data_out_L_16_I),
    .data_out_Q_16(data_out_L_16_Q),
    .data_out_I_17(data_out_L_17_I),
    .data_out_Q_17(data_out_L_17_Q),
    .data_out_I_18(data_out_L_18_I),
    .data_out_Q_18(data_out_L_18_Q),
    .data_out_I_19(data_out_L_19_I),
    .data_out_Q_19(data_out_L_19_Q),
    .data_out_I_20(data_out_L_20_I),
    .data_out_Q_20(data_out_L_20_Q),
    .data_out_I_21(data_out_L_21_I),
    .data_out_Q_21(data_out_L_21_Q),
    .data_out_I_22(data_out_L_22_I),
    .data_out_Q_22(data_out_L_22_Q),
    .data_out_I_23(data_out_L_23_I),
    .data_out_Q_23(data_out_L_23_Q),
    .data_out_I_24(data_out_L_24_I),
    .data_out_Q_24(data_out_L_24_Q),
    .data_out_I_25(data_out_L_25_I),
    .data_out_Q_25(data_out_L_25_Q),
    .data_out_I_26(data_out_L_26_I),
    .data_out_Q_26(data_out_L_26_Q),
    .data_out_I_27(data_out_L_27_I),
    .data_out_Q_27(data_out_L_27_Q),
    .data_out_I_28(data_out_L_28_I),
    .data_out_Q_28(data_out_L_28_Q),
    .data_out_I_29(data_out_L_29_I),
    .data_out_Q_29(data_out_L_29_Q),
    .data_out_I_30(data_out_L_30_I),
    .data_out_Q_30(data_out_L_30_Q),
    .data_out_I_31(data_out_L_31_I),
    .data_out_Q_31(data_out_L_31_Q),
    .data_out_I_32(data_out_L_32_I),
    .data_out_Q_32(data_out_L_32_Q),
    .data_out_I_33(data_out_L_33_I),
    .data_out_Q_33(data_out_L_33_Q),
    .data_out_I_34(data_out_L_34_I),
    .data_out_Q_34(data_out_L_34_Q),
    .data_out_I_35(data_out_L_35_I),
    .data_out_Q_35(data_out_L_35_Q),
    .data_out_I_36(data_out_L_36_I),
    .data_out_Q_36(data_out_L_36_Q),
    .data_out_I_37(data_out_L_37_I),
    .data_out_Q_37(data_out_L_37_Q),
    .data_out_I_38(data_out_L_38_I),
    .data_out_Q_38(data_out_L_38_Q),
    .data_out_I_39(data_out_L_39_I),
    .data_out_Q_39(data_out_L_39_Q),
    .data_out_I_40(data_out_L_40_I),
    .data_out_Q_40(data_out_L_40_Q),
    .data_out_I_41(data_out_L_41_I),
    .data_out_Q_41(data_out_L_41_Q),
    .data_out_I_42(data_out_L_42_I),
    .data_out_Q_42(data_out_L_42_Q),
    .data_out_I_43(data_out_L_43_I),
    .data_out_Q_43(data_out_L_43_Q),
    .data_out_I_44(data_out_L_44_I),
    .data_out_Q_44(data_out_L_44_Q),
    .data_out_I_45(data_out_L_45_I),
    .data_out_Q_45(data_out_L_45_Q),
    .data_out_I_46(data_out_L_46_I),
    .data_out_Q_46(data_out_L_46_Q),
    .data_out_I_47(data_out_L_47_I),
    .data_out_Q_47(data_out_L_47_Q),
    .data_out_I_48(data_out_L_48_I),
    .data_out_Q_48(data_out_L_48_Q),
    .data_out_I_49(data_out_L_49_I),
    .data_out_Q_49(data_out_L_49_Q),
    .data_out_I_50(data_out_L_50_I),
    .data_out_Q_50(data_out_L_50_Q),
    .data_out_I_51(data_out_L_51_I),
    .data_out_Q_51(data_out_L_51_Q),
    .data_out_I_52(data_out_L_52_I),
    .data_out_Q_52(data_out_L_52_Q),
    .data_out_I_53(data_out_L_53_I),
    .data_out_Q_53(data_out_L_53_Q),
    .data_out_I_54(data_out_L_54_I),
    .data_out_Q_54(data_out_L_54_Q),
    .data_out_I_55(data_out_L_55_I),
    .data_out_Q_55(data_out_L_55_Q),
    .data_out_I_56(data_out_L_56_I),
    .data_out_Q_56(data_out_L_56_Q),
    .data_out_I_57(data_out_L_57_I),
    .data_out_Q_57(data_out_L_57_Q),
    .data_out_I_58(data_out_L_58_I),
    .data_out_Q_58(data_out_L_58_Q),
    .data_out_I_59(data_out_L_59_I),
    .data_out_Q_59(data_out_L_59_Q),
    .data_out_I_60(data_out_L_60_I),
    .data_out_Q_60(data_out_L_60_Q),
    .data_out_I_61(data_out_L_61_I),
    .data_out_Q_61(data_out_L_61_Q),
    .data_out_I_62(data_out_L_62_I),
    .data_out_Q_62(data_out_L_62_Q),
    .data_out_I_63(data_out_L_63_I),
    .data_out_Q_63(data_out_L_63_Q),
    .data_out_I_64(data_out_L_64_I),
    .data_out_Q_64(data_out_L_64_Q),
    .data_out_I_65(data_out_L_65_I),
    .data_out_Q_65(data_out_L_65_Q),
    .data_out_I_66(data_out_L_66_I),
    .data_out_Q_66(data_out_L_66_Q),
    .data_out_I_67(data_out_L_67_I),
    .data_out_Q_67(data_out_L_67_Q),
    .data_out_I_68(data_out_L_68_I),
    .data_out_Q_68(data_out_L_68_Q),
    .data_out_I_69(data_out_L_69_I),
    .data_out_Q_69(data_out_L_69_Q),
    .data_out_I_70(data_out_L_70_I),
    .data_out_Q_70(data_out_L_70_Q),
    .data_out_valid(data_out_valid)  
    );

fuyang70  fuyang_R(
    .clk(clk_120m),
    .dataI(data_25_48_I),
    .dataQ(data_25_48_Q),
    .data_in_valid(data_in_valid),
    .fy_cut_ctl(fy_cut_ctl),   
    
    .A(A),
   .ph_real_1  (ph_real_1  ),
    .ph_real_2  (ph_real_2  ),
    .ph_real_3  (ph_real_3  ),
    .ph_real_4  (ph_real_4  ),
    .ph_real_5  (ph_real_5  ),
    .ph_real_6  (ph_real_6  ),
    .ph_real_7  (ph_real_7  ),
    .ph_real_8  (ph_real_8  ),
    .ph_real_9  (ph_real_9  ),
    .ph_real_10 (ph_real_10 ),
    .ph_real_11 (ph_real_11 ),
    .ph_real_12 (ph_real_12 ),
    .ph_real_13 (ph_real_13 ),
    .ph_real_14 (ph_real_14 ),
    .ph_real_15 (ph_real_15 ),
    .ph_real_16 (ph_real_16 ),
    .ph_real_17 (ph_real_17 ),
    .ph_real_18 (ph_real_18 ),
    .ph_real_19 (ph_real_19 ),
    .ph_real_20 (ph_real_20 ),
    .ph_real_21 (ph_real_21 ),
    .ph_real_22 (ph_real_22 ),
    .ph_real_23 (ph_real_23 ),
    .ph_real_24 (ph_real_24 ),
    .ph_real_25 (ph_real_25 ),
    .ph_real_26 (ph_real_26 ),
    .ph_real_27 (ph_real_27 ),
    .ph_real_28 (ph_real_28 ),
    .ph_real_29 (ph_real_29 ),
    .ph_real_30 (ph_real_30 ),
    .ph_real_31 (ph_real_31 ),
    .ph_real_32 (ph_real_32 ),
    .ph_real_33 (ph_real_33 ),
    .ph_real_34 (ph_real_34 ),
    .ph_real_35 (ph_real_35 ),
    .ph_real_36 (ph_real_36 ),
    .ph_real_37 (ph_real_37 ),
    .ph_real_38 (ph_real_38 ),
    .ph_real_39 (ph_real_39 ),
    .ph_real_40 (ph_real_40 ),
    .ph_real_41 (ph_real_41 ),
    .ph_real_42 (ph_real_42 ),
    .ph_real_43 (ph_real_43 ),
    .ph_real_44 (ph_real_44 ),
    .ph_real_45 (ph_real_45 ),
    .ph_real_46 (ph_real_46 ),
    .ph_real_47 (ph_real_47 ),
    .ph_real_48 (ph_real_48 ),
    .ph_real_49 (ph_real_49 ),
    .ph_real_50 (ph_real_50 ),
    .ph_real_51 (ph_real_51 ),
    .ph_real_52 (ph_real_52 ),
    .ph_real_53 (ph_real_53 ),
    .ph_real_54 (ph_real_54 ),
    .ph_real_55 (ph_real_55 ),
    .ph_real_56 (ph_real_56 ),
    .ph_real_57 (ph_real_57 ),
    .ph_real_58 (ph_real_58 ),
    .ph_real_59 (ph_real_59 ),
    .ph_real_60 (ph_real_60 ),
    .ph_real_61 (ph_real_61 ),
    .ph_real_62 (ph_real_62 ),
    .ph_real_63 (ph_real_63 ),
    .ph_real_64 (ph_real_64 ),
    .ph_real_65 (ph_real_65 ),
    .ph_real_66 (ph_real_66 ),
    .ph_real_67 (ph_real_67 ),
    .ph_real_68 (ph_real_68 ),
    .ph_real_69 (ph_real_69 ),
    .ph_real_70 (ph_real_70 ),
    
    
    .ph_image_1  (ph_image_1  ),
    .ph_image_2  (ph_image_2  ),
    .ph_image_3  (ph_image_3  ),
    .ph_image_4  (ph_image_4  ),
    .ph_image_5  (ph_image_5  ),
    .ph_image_6  (ph_image_6  ),
    .ph_image_7  (ph_image_7  ),
    .ph_image_8  (ph_image_8  ),
    .ph_image_9  (ph_image_9  ),
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
    .ph_image_35 (ph_image_35 ),
    .ph_image_36 (ph_image_36 ),
    .ph_image_37 (ph_image_37 ),
    .ph_image_38 (ph_image_38 ),
    .ph_image_39 (ph_image_39 ),
    .ph_image_40 (ph_image_40 ),
    .ph_image_41 (ph_image_41 ),
    .ph_image_42 (ph_image_42 ),
    .ph_image_43 (ph_image_43 ),
    .ph_image_44 (ph_image_44 ),
    .ph_image_45 (ph_image_45 ),
    .ph_image_46 (ph_image_46 ),
    .ph_image_47 (ph_image_47 ),
    .ph_image_48 (ph_image_48 ),
    .ph_image_49 (ph_image_49 ),
    .ph_image_50 (ph_image_50 ),
    .ph_image_51 (ph_image_51 ),
    .ph_image_52 (ph_image_52 ),
    .ph_image_53 (ph_image_53 ),
    .ph_image_54 (ph_image_54 ),
    .ph_image_55 (ph_image_55 ),
    .ph_image_56 (ph_image_56 ),
    .ph_image_57 (ph_image_57 ),
    .ph_image_58 (ph_image_58 ),
    .ph_image_59 (ph_image_59 ),
    .ph_image_60 (ph_image_60 ),
    .ph_image_61 (ph_image_61 ),
    .ph_image_62 (ph_image_62 ),
    .ph_image_63 (ph_image_63 ),
    .ph_image_64 (ph_image_64 ),
    .ph_image_65 (ph_image_65 ),
    .ph_image_66 (ph_image_66 ),
    .ph_image_67 (ph_image_67 ),
    .ph_image_68 (ph_image_68 ),
    .ph_image_69 (ph_image_69 ),
    .ph_image_70 (ph_image_70 ),
    
    .phase_data_valid(phase_data_valid),
    
    .data_out_I_1(data_out_R_1_I),
    .data_out_Q_1(data_out_R_1_Q),
    .data_out_I_2(data_out_R_2_I),
    .data_out_Q_2(data_out_R_2_Q),
    .data_out_I_3(data_out_R_3_I),
    .data_out_Q_3(data_out_R_3_Q),
    .data_out_I_4(data_out_R_4_I),
    .data_out_Q_4(data_out_R_4_Q),
    .data_out_I_5(data_out_R_5_I),
    .data_out_Q_5(data_out_R_5_Q),
    .data_out_I_6(data_out_R_6_I),
    .data_out_Q_6(data_out_R_6_Q),
    .data_out_I_7(data_out_R_7_I),
    .data_out_Q_7(data_out_R_7_Q),
    .data_out_I_8(data_out_R_8_I),
    .data_out_Q_8(data_out_R_8_Q),
    .data_out_I_9(data_out_R_9_I),
    .data_out_Q_9(data_out_R_9_Q),
    .data_out_I_10(data_out_R_10_I),
    .data_out_Q_10(data_out_R_10_Q),
    .data_out_I_11(data_out_R_11_I),
    .data_out_Q_11(data_out_R_11_Q),
    .data_out_I_12(data_out_R_12_I),
    .data_out_Q_12(data_out_R_12_Q),
    .data_out_I_13(data_out_R_13_I),
    .data_out_Q_13(data_out_R_13_Q),
    .data_out_I_14(data_out_R_14_I),
    .data_out_Q_14(data_out_R_14_Q),
    .data_out_I_15(data_out_R_15_I),
    .data_out_Q_15(data_out_R_15_Q),
    .data_out_I_16(data_out_R_16_I),
    .data_out_Q_16(data_out_R_16_Q),
    .data_out_I_17(data_out_R_17_I),
    .data_out_Q_17(data_out_R_17_Q),
    .data_out_I_18(data_out_R_18_I),
    .data_out_Q_18(data_out_R_18_Q),
    .data_out_I_19(data_out_R_19_I),
    .data_out_Q_19(data_out_R_19_Q),
    .data_out_I_20(data_out_R_20_I),
    .data_out_Q_20(data_out_R_20_Q),
    .data_out_I_21(data_out_R_21_I),
    .data_out_Q_21(data_out_R_21_Q),
    .data_out_I_22(data_out_R_22_I),
    .data_out_Q_22(data_out_R_22_Q),
    .data_out_I_23(data_out_R_23_I),
    .data_out_Q_23(data_out_R_23_Q),
    .data_out_I_24(data_out_R_24_I),
    .data_out_Q_24(data_out_R_24_Q),
    .data_out_I_25(data_out_R_25_I),
    .data_out_Q_25(data_out_R_25_Q),
    .data_out_I_26(data_out_R_26_I),
    .data_out_Q_26(data_out_R_26_Q),
    .data_out_I_27(data_out_R_27_I),
    .data_out_Q_27(data_out_R_27_Q),
    .data_out_I_28(data_out_R_28_I),
    .data_out_Q_28(data_out_R_28_Q),
    .data_out_I_29(data_out_R_29_I),
    .data_out_Q_29(data_out_R_29_Q),
    .data_out_I_30(data_out_R_30_I),
    .data_out_Q_30(data_out_R_30_Q),
    .data_out_I_31(data_out_R_31_I),
    .data_out_Q_31(data_out_R_31_Q),
    .data_out_I_32(data_out_R_32_I),
    .data_out_Q_32(data_out_R_32_Q),
    .data_out_I_33(data_out_R_33_I),
    .data_out_Q_33(data_out_R_33_Q),
    .data_out_I_34(data_out_R_34_I),
    .data_out_Q_34(data_out_R_34_Q),
    .data_out_I_35(data_out_R_35_I),
    .data_out_Q_35(data_out_R_35_Q),
    .data_out_I_36(data_out_R_36_I),
    .data_out_Q_36(data_out_R_36_Q),
    .data_out_I_37(data_out_R_37_I),
    .data_out_Q_37(data_out_R_37_Q),
    .data_out_I_38(data_out_R_38_I),
    .data_out_Q_38(data_out_R_38_Q),
    .data_out_I_39(data_out_R_39_I),
    .data_out_Q_39(data_out_R_39_Q),
    .data_out_I_40(data_out_R_40_I),
    .data_out_Q_40(data_out_R_40_Q),
    .data_out_I_41(data_out_R_41_I),
    .data_out_Q_41(data_out_R_41_Q),
    .data_out_I_42(data_out_R_42_I),
    .data_out_Q_42(data_out_R_42_Q),
    .data_out_I_43(data_out_R_43_I),
    .data_out_Q_43(data_out_R_43_Q),
    .data_out_I_44(data_out_R_44_I),
    .data_out_Q_44(data_out_R_44_Q),
    .data_out_I_45(data_out_R_45_I),
    .data_out_Q_45(data_out_R_45_Q),
    .data_out_I_46(data_out_R_46_I),
    .data_out_Q_46(data_out_R_46_Q),
    .data_out_I_47(data_out_R_47_I),
    .data_out_Q_47(data_out_R_47_Q),
    .data_out_I_48(data_out_R_48_I),
    .data_out_Q_48(data_out_R_48_Q),
    .data_out_I_49(data_out_R_49_I),
    .data_out_Q_49(data_out_R_49_Q),
    .data_out_I_50(data_out_R_50_I),
    .data_out_Q_50(data_out_R_50_Q),
    .data_out_I_51(data_out_R_51_I),
    .data_out_Q_51(data_out_R_51_Q),
    .data_out_I_52(data_out_R_52_I),
    .data_out_Q_52(data_out_R_52_Q),
    .data_out_I_53(data_out_R_53_I),
    .data_out_Q_53(data_out_R_53_Q),
    .data_out_I_54(data_out_R_54_I),
    .data_out_Q_54(data_out_R_54_Q),
    .data_out_I_55(data_out_R_55_I),
    .data_out_Q_55(data_out_R_55_Q),
    .data_out_I_56(data_out_R_56_I),
    .data_out_Q_56(data_out_R_56_Q),
    .data_out_I_57(data_out_R_57_I),
    .data_out_Q_57(data_out_R_57_Q),
    .data_out_I_58(data_out_R_58_I),
    .data_out_Q_58(data_out_R_58_Q),
    .data_out_I_59(data_out_R_59_I),
    .data_out_Q_59(data_out_R_59_Q),
    .data_out_I_60(data_out_R_60_I),
    .data_out_Q_60(data_out_R_60_Q),
    .data_out_I_61(data_out_R_61_I),
    .data_out_Q_61(data_out_R_61_Q),
    .data_out_I_62(data_out_R_62_I),
    .data_out_Q_62(data_out_R_62_Q),
    .data_out_I_63(data_out_R_63_I),
    .data_out_Q_63(data_out_R_63_Q),
    .data_out_I_64(data_out_R_64_I),
    .data_out_Q_64(data_out_R_64_Q),
    .data_out_I_65(data_out_R_65_I),
    .data_out_Q_65(data_out_R_65_Q),
    .data_out_I_66(data_out_R_66_I),
    .data_out_Q_66(data_out_R_66_Q),
    .data_out_I_67(data_out_R_67_I),
    .data_out_Q_67(data_out_R_67_Q),
    .data_out_I_68(data_out_R_68_I),
    .data_out_Q_68(data_out_R_68_Q),
    .data_out_I_69(data_out_R_69_I),
    .data_out_Q_69(data_out_R_69_Q),
    .data_out_I_70(data_out_R_70_I),
    .data_out_Q_70(data_out_R_70_Q),
    .data_out_valid()  
    );
    
    
//    ila_fy ft_t (
//        .clk(clk_120m), // input wire clk
    
    
//        .probe0 (data_out_L_1_I), // input wire [15:0]  probe0  
//        .probe1 (data_out_L_1_Q), // input wire [15:0]  probe1 
//        .probe2 (data_out_L_2_I), // input wire [15:0]  probe2 
//        .probe3 (data_out_L_2_Q), // input wire [15:0]  probe3 
//        .probe4 (data_out_L_3_I), // input wire [15:0]  probe4 
//        .probe5 (data_out_L_3_Q), // input wire [15:0]  probe5 
//        .probe6 (data_out_L_4_I), // input wire [15:0]  probe6 
//        .probe7 (data_out_L_4_Q), // input wire [15:0]  probe7 
//        .probe8 (data_out_L_5_I), // input wire [15:0]  probe8 
//        .probe9 (data_out_L_5_Q), // input wire [15:0]  probe9 
//        .probe10(data_out_L_6_I), // input wire [15:0]  probe10 
//        .probe11(data_out_L_6_Q), // input wire [15:0]  probe11 
//        .probe12(data_out_L_7_I), // input wire [15:0]  probe12 
//        .probe13(data_out_L_7_Q), // input wire [15:0]  probe13 
//        .probe14(data_out_L_8_I), // input wire [15:0]  probe14 
//        .probe15(data_out_L_8_Q), // input wire [15:0]  probe15 
//        .probe16(data_out_L_9_I), // input wire [15:0]  probe16 
//        .probe17(data_out_L_9_Q), // input wire [15:0]  probe17 
//        .probe18(data_out_L_10_I), // input wire [15:0]  probe18 
//        .probe19(data_out_L_10_Q), // input wire [15:0]  probe19 
//        .probe20(data_out_L_11_I), // input wire [15:0]  probe20 
//        .probe21(data_out_L_11_Q), // input wire [15:0]  probe21 
//        .probe22(data_out_L_12_I), // input wire [15:0]  probe22 
//        .probe23(data_out_L_12_Q), // input wire [15:0]  probe23 
//        .probe24(data_out_L_13_I), // input wire [15:0]  probe24 
//        .probe25(data_out_L_13_Q), // input wire [15:0]  probe25 
//        .probe26(data_out_L_14_I), // input wire [15:0]  probe26 
//        .probe27(data_out_L_14_Q), // input wire [15:0]  probe27 
//        .probe28(data_out_R_1_I), // input wire [15:0]  probe28 
//        .probe29(data_out_R_1_Q), // input wire [15:0]  probe29 
//        .probe30(data_out_R_2_I), // input wire [15:0]  probe30 
//        .probe31(data_out_R_2_Q), // input wire [15:0]  probe31 
//        .probe32(data_out_R_3_I), // input wire [15:0]  probe32 
//        .probe33(data_out_R_3_Q), // input wire [15:0]  probe33 
//        .probe34(data_out_R_4_I), // input wire [15:0]  probe34 
//        .probe35(data_out_R_4_Q), // input wire [15:0]  probe35 
//        .probe36(data_out_R_5_I), // input wire [15:0]  probe36 
//        .probe37(data_out_R_5_Q), // input wire [15:0]  probe37 
//        .probe38(data_out_R_6_I), // input wire [15:0]  probe38 
//        .probe39(data_out_R_6_Q), // input wire [15:0]  probe39 
//        .probe40(data_out_R_7_I), // input wire [15:0]  probe40 
//        .probe41(data_out_R_7_Q), // input wire [15:0]  probe41 
//        .probe42(data_out_R_8_I), // input wire [15:0]  probe42 
//        .probe43(data_out_R_8_Q), // input wire [15:0]  probe43 
//        .probe44(data_out_R_9_I), // input wire [15:0]  probe44 
//        .probe45(data_out_R_9_Q), // input wire [15:0]  probe45 
//        .probe46(data_out_R_10_I), // input wire [15:0]  probe46 
//        .probe47(data_out_R_10_Q), // input wire [15:0]  probe47 
//        .probe48(data_out_R_11_I), // input wire [15:0]  probe48 
//        .probe49(data_out_R_11_Q), // input wire [15:0]  probe49 
//        .probe50(data_out_R_12_I), // input wire [15:0]  probe50 
//        .probe51(data_out_R_12_Q), // input wire [15:0]  probe51 
//        .probe52(data_out_R_13_I), // input wire [15:0]  probe52 
//        .probe53(data_out_R_13_Q), // input wire [15:0]  probe53 
//        .probe54(data_out_R_14_I), // input wire [15:0]  probe54 
//        .probe55(data_out_R_14_Q) // input wire [15:0]  probe55
//    );
//ila_5 fy_tt (
//        .clk(clk_120m), // input wire clk
    
    
//        .probe0(data_1_16_I), // input wire [15:0]  probe0  
//        .probe1(data_1_16_Q), // input wire [15:0]  probe1 
//        .probe2(data_17_32_I), // input wire [15:0]  probe2 
//        .probe3(data_17_32_Q), // input wire [15:0]  probe3 
//        .probe4(data_in_valid), // input wire [0:0]  probe4 
//        .probe5(fpga_gpio), // input wire [15:0]  probe5 
//        .probe6(data_out_valid), // input wire [0:0]  probe6 
//        .probe7(A), // input wire [15:0]  probe7 
//        .probe8(phase_data_2), // input wire [15:0]  probe8 
//        .probe9(data_out_L_1_I), // input wire [15:0]  probe9 
//        .probe10(data_out_L_2_I), // input wire [15:0]  probe10 
//        .probe11(data_out_L_1_Q), // input wire [15:0]  probe11 
//        .probe12(data_out_L_2_Q) // input wire [15:0]  probe12
//    );

//ila_fy_datain ila_fy_datain_1 (
//	.clk(clk_120m), // input wire clk


//	.probe0(data_1_24_I), // input wire [15:0]  probe0  
//	.probe1(data_1_24_Q), // input wire [15:0]  probe1 
//	.probe2(data_25_48_I), // input wire [15:0]  probe2 
//	.probe3(data_25_48_Q) // input wire [15:0]  probe3
//);    
//ila_fy_enable_signal ila_fy_enable_signal_1 (
//	.clk(clk_120m), // input wire clk


//	.probe0(fpga_gpio), // input wire [7:0]  probe0  
//	.probe1(A), // input wire [15:0]  probe1 
//	.probe2(data_in_valid), // input wire [0:0]  probe2 
//	.probe3(data_out_valid) // input wire [0:0]  probe3
//);
//ila_fy_data_out_l ila_fy_data_out_l_1 (
//	.clk(clk_120m), // input wire clk


//	.probe0(data_out_L_1_I), // input wire [15:0]  probe0  
//	.probe1(data_out_L_1_Q), // input wire [15:0]  probe1 
//	.probe2(data_out_L_2_I), // input wire [15:0]  probe2 
//	.probe3(data_out_L_2_Q), // input wire [15:0]  probe3 
//	.probe4(data_out_L_3_I), // input wire [15:0]  probe4 
//	.probe5(data_out_L_3_Q), // input wire [15:0]  probe5 
//	.probe6(data_out_L_4_I), // input wire [15:0]  probe6 
//	.probe7(data_out_L_4_Q), // input wire [15:0]  probe7 
//	.probe8(data_out_L_5_I), // input wire [15:0]  probe8 
//	.probe9(data_out_L_5_Q), // input wire [15:0]  probe9 
//	.probe10(data_out_L_10_I), // input wire [15:0]  probe10 
//	.probe11(data_out_L_10_Q), // input wire [15:0]  probe11 
//	.probe12(data_out_L_11_I), // input wire [15:0]  probe12 
//	.probe13(data_out_L_11_Q), // input wire [15:0]  probe13 
//	.probe14(data_out_L_12_I), // input wire [15:0]  probe14 
//	.probe15(data_out_L_12_Q), // input wire [15:0]  probe15 
//	.probe16(data_out_L_13_I), // input wire [15:0]  probe16 
//	.probe17(data_out_L_13_Q), // input wire [15:0]  probe17 
//	.probe18(data_out_L_14_I), // input wire [15:0]  probe18 
//	.probe19(data_out_L_14_Q), // input wire [15:0]  probe19 
//	.probe20(data_out_L_15_I), // input wire [15:0]  probe20 
//	.probe21(data_out_L_15_Q), // input wire [15:0]  probe21 
//	.probe22(data_out_L_16_I), // input wire [15:0]  probe22 
//	.probe23(data_out_L_16_Q), // input wire [15:0]  probe23 
//	.probe24(data_out_L_17_I), // input wire [15:0]  probe24 
//	.probe25(data_out_L_17_Q), // input wire [15:0]  probe25 
//	.probe26(data_out_L_18_I), // input wire [15:0]  probe26 
//	.probe27(data_out_L_18_Q), // input wire [15:0]  probe27 
//	.probe28(data_out_L_19_I), // input wire [15:0]  probe28 
//	.probe29(data_out_L_19_Q), // input wire [15:0]  probe29 
//	.probe30(data_out_L_20_I), // input wire [15:0]  probe30 
//	.probe31(data_out_L_20_Q), // input wire [15:0]  probe31 
//	.probe32(data_out_L_21_I), // input wire [15:0]  probe32 
//	.probe33(data_out_L_21_Q), // input wire [15:0]  probe33 
//	.probe34(data_out_L_22_I), // input wire [15:0]  probe34 
//	.probe35(data_out_L_22_Q), // input wire [15:0]  probe35 
//	.probe36(data_out_L_23_I), // input wire [15:0]  probe36 
//	.probe37(data_out_L_23_Q), // input wire [15:0]  probe37 
//	.probe38(data_out_L_23_Q), // input wire [15:0]  probe38 
//	.probe39(data_out_L_23_Q), // input wire [15:0]  probe39 
//	.probe40(data_out_L_23_Q), // input wire [15:0]  probe40 
//	.probe41(data_out_L_23_Q), // input wire [15:0]  probe41 
//	.probe42(data_out_L_23_Q), // input wire [15:0]  probe42 
//	.probe43(data_out_L_23_Q), // input wire [15:0]  probe43 
//	.probe44(data_out_L_23_Q), // input wire [15:0]  probe44 
//	.probe45(data_out_L_23_Q), // input wire [15:0]  probe45 
//	.probe46(data_out_L_23_Q), // input wire [15:0]  probe46 
//	.probe47(data_out_L_23_Q) // input wire [15:0]  probe47
//);
//ila_fy_data_out_l ila_fy_data_out_R_1 (
//	.clk(clk_120m), // input wire clk


//	.probe0(data_out_R_1_I), // input wire [15:0]  probe0  
//	.probe1(data_out_R_1_Q), // input wire [15:0]  probe1 
//	.probe2(data_out_R_2_I), // input wire [15:0]  probe2 
//	.probe3(data_out_R_2_Q), // input wire [15:0]  probe3 
//	.probe4(data_out_R_3_I), // input wire [15:0]  probe4 
//	.probe5(data_out_R_3_Q), // input wire [15:0]  probe5 
//	.probe6(data_out_R_4_I), // input wire [15:0]  probe6 
//	.probe7(data_out_R_4_Q), // input wire [15:0]  probe7 
//	.probe8(data_out_R_5_I), // input wire [15:0]  probe8 
//	.probe9(data_out_R_5_Q), // input wire [15:0]  probe9 
//	.probe10(data_out_R_10_I), // input wire [15:0]  probe10 
//	.probe11(data_out_R_10_Q), // input wire [15:0]  probe11 
//	.probe12(data_out_R_11_I), // input wire [15:0]  probe12 
//	.probe13(data_out_R_11_Q), // input wire [15:0]  probe13 
//	.probe14(data_out_R_12_I), // input wire [15:0]  probe14 
//	.probe15(data_out_R_12_Q), // input wire [15:0]  probe15 
//	.probe16(data_out_R_13_I), // input wire [15:0]  probe16 
//	.probe17(data_out_R_13_Q), // input wire [15:0]  probe17 
//	.probe18(data_out_R_14_I), // input wire [15:0]  probe18 
//	.probe19(data_out_R_14_Q), // input wire [15:0]  probe19 
//	.probe20(data_out_R_15_I), // input wire [15:0]  probe20 
//	.probe21(data_out_R_15_Q), // input wire [15:0]  probe21 
//	.probe22(data_out_R_16_I), // input wire [15:0]  probe22 
//	.probe23(data_out_R_16_Q), // input wire [15:0]  probe23 
//	.probe24(data_out_R_17_I), // input wire [15:0]  probe24 
//	.probe25(data_out_R_17_Q), // input wire [15:0]  probe25 
//	.probe26(data_out_R_18_I), // input wire [15:0]  probe26 
//	.probe27(data_out_R_18_Q), // input wire [15:0]  probe27 
//	.probe28(data_out_R_19_I), // input wire [15:0]  probe28 
//	.probe29(data_out_R_19_Q), // input wire [15:0]  probe29 
//	.probe30(data_out_R_20_I), // input wire [15:0]  probe30 
//	.probe31(data_out_R_20_Q), // input wire [15:0]  probe31 
//	.probe32(data_out_R_21_I), // input wire [15:0]  probe32 
//	.probe33(data_out_R_21_Q), // input wire [15:0]  probe33 
//	.probe34(data_out_R_22_I), // input wire [15:0]  probe34 
//	.probe35(data_out_R_22_Q), // input wire [15:0]  probe35 
//	.probe36(data_out_R_23_I), // input wire [15:0]  probe36 
//	.probe37(data_out_R_23_Q), // input wire [15:0]  probe37 
//	.probe38(data_out_R_23_Q), // input wire [15:0]  probe38 
//	.probe39(data_out_R_23_Q), // input wire [15:0]  probe39 
//	.probe40(data_out_R_23_Q), // input wire [15:0]  probe40 
//	.probe41(data_out_R_23_Q), // input wire [15:0]  probe41 
//	.probe42(data_out_R_23_Q), // input wire [15:0]  probe42 
//	.probe43(data_out_R_23_Q), // input wire [15:0]  probe43 
//	.probe44(data_out_R_23_Q), // input wire [15:0]  probe44 
//	.probe45(data_out_R_23_Q), // input wire [15:0]  probe45 
//	.probe46(data_out_R_23_Q), // input wire [15:0]  probe46 
//	.probe47(data_out_R_23_Q) // input wire [15:0]  probe47
//);
//ila_phasedata ila_phasedata_real (
//	.clk(clk_120m), // input wire clk


//	.probe0(ph_real_1), // input wire [15:0]  probe0  
//	.probe1(ph_real_2), // input wire [15:0]  probe1 
//	.probe2(ph_real_3), // input wire [15:0]  probe2 
//	.probe3(ph_real_4), // input wire [15:0]  probe3 
//	.probe4(ph_real_5), // input wire [15:0]  probe4 
//	.probe5(ph_real_6), // input wire [15:0]  probe5 
//	.probe6(ph_real_7), // input wire [15:0]  probe6 
//	.probe7(ph_real_8), // input wire [15:0]  probe7 
//	.probe8(ph_real_9), // input wire [15:0]  probe8 
//	.probe9(ph_real_9), // input wire [15:0]  probe9 
//	.probe10(ph_real_10), // input wire [15:0]  probe10 
//	.probe11(ph_real_11), // input wire [15:0]  probe11 
//	.probe12(ph_real_12), // input wire [15:0]  probe12 
//	.probe13(ph_real_13), // input wire [15:0]  probe13 
//	.probe14(ph_real_14), // input wire [15:0]  probe14 
//	.probe15(ph_real_15), // input wire [15:0]  probe15 
//	.probe16(ph_real_16), // input wire [15:0]  probe16 
//	.probe17(ph_real_17), // input wire [15:0]  probe17 
//	.probe18(ph_real_18), // input wire [15:0]  probe18 
//	.probe19(ph_real_19), // input wire [15:0]  probe19 
//	.probe20(ph_real_20), // input wire [15:0]  probe20 
//	.probe21(ph_real_21), // input wire [15:0]  probe21 
//	.probe22(ph_real_22), // input wire [15:0]  probe22 
//	.probe23(ph_real_23), // input wire [15:0]  probe23 
//	.probe24(ph_real_24), // input wire [15:0]  probe24 
//	.probe25(ph_real_25), // input wire [15:0]  probe25 
//	.probe26(ph_real_26), // input wire [15:0]  probe26 
//	.probe27(ph_real_27), // input wire [15:0]  probe27 
//	.probe28(ph_real_28), // input wire [15:0]  probe28 
//	.probe29(ph_real_29), // input wire [15:0]  probe29 
//	.probe30(ph_real_30), // input wire [15:0]  probe30 
//	.probe31(ph_real_31), // input wire [15:0]  probe31 
//	.probe32(ph_real_32), // input wire [15:0]  probe32 
//	.probe33(ph_real_33), // input wire [15:0]  probe33 
//	.probe34(ph_real_34), // input wire [15:0]  probe34 
//	.probe35(ph_real_35), // input wire [15:0]  probe35 
//	.probe36(ph_real_36), // input wire [15:0]  probe36 
//	.probe37(ph_real_37), // input wire [15:0]  probe37 
//	.probe38(ph_real_38), // input wire [15:0]  probe38 
//	.probe39(ph_real_39), // input wire [15:0]  probe39 
//	.probe40(ph_real_40), // input wire [15:0]  probe40 
//	.probe41(ph_real_41), // input wire [15:0]  probe41 
//	.probe42(ph_real_42), // input wire [15:0]  probe42 
//	.probe43(ph_real_43), // input wire [15:0]  probe43 
//	.probe44(ph_real_44), // input wire [15:0]  probe44 
//	.probe45(ph_real_45), // input wire [15:0]  probe45 
//	.probe46(ph_real_46), // input wire [15:0]  probe46 
//	.probe47(ph_real_47) // input wire [15:0]  probe47 
// );
 
// ila_phasedata ila_phasedata_image (
//	.clk(clk_120m), // input wire clk


//	.probe0(ph_image_1), // input wire [15:0]  probe0  
//	.probe1(ph_image_2), // input wire [15:0]  probe1 
//	.probe2(ph_image_3), // input wire [15:0]  probe2 
//	.probe3(ph_image_4), // input wire [15:0]  probe3 
//	.probe4(ph_image_5), // input wire [15:0]  probe4 
//	.probe5(ph_image_6), // input wire [15:0]  probe5 
//	.probe6(ph_image_7), // input wire [15:0]  probe6 
//	.probe7(ph_image_8), // input wire [15:0]  probe7 
//	.probe8(ph_image_9), // input wire [15:0]  probe8 
//	.probe9(ph_image_9), // input wire [15:0]  probe9 
//	.probe10(ph_image_10), // input wire [15:0]  probe10 
//	.probe11(ph_image_11), // input wire [15:0]  probe11 
//	.probe12(ph_image_12), // input wire [15:0]  probe12 
//	.probe13(ph_image_13), // input wire [15:0]  probe13 
//	.probe14(ph_image_14), // input wire [15:0]  probe14 
//	.probe15(ph_image_15), // input wire [15:0]  probe15 
//	.probe16(ph_image_16), // input wire [15:0]  probe16 
//	.probe17(ph_image_17), // input wire [15:0]  probe17 
//	.probe18(ph_image_18), // input wire [15:0]  probe18 
//	.probe19(ph_image_19), // input wire [15:0]  probe19 
//	.probe20(ph_image_20), // input wire [15:0]  probe20 
//	.probe21(ph_image_21), // input wire [15:0]  probe21 
//	.probe22(ph_image_22), // input wire [15:0]  probe22 
//	.probe23(ph_image_23), // input wire [15:0]  probe23 
//	.probe24(ph_image_24), // input wire [15:0]  probe24 
//	.probe25(ph_image_25), // input wire [15:0]  probe25 
//	.probe26(ph_image_26), // input wire [15:0]  probe26 
//	.probe27(ph_image_27), // input wire [15:0]  probe27 
//	.probe28(ph_image_28), // input wire [15:0]  probe28 
//	.probe29(ph_image_29), // input wire [15:0]  probe29 
//	.probe30(ph_image_30), // input wire [15:0]  probe30 
//	.probe31(ph_image_31), // input wire [15:0]  probe31 
//	.probe32(ph_image_32), // input wire [15:0]  probe32 
//	.probe33(ph_image_33), // input wire [15:0]  probe33 
//	.probe34(ph_image_34), // input wire [15:0]  probe34 
//	.probe35(ph_image_35), // input wire [15:0]  probe35 
//	.probe36(ph_image_36), // input wire [15:0]  probe36 
//	.probe37(ph_image_37), // input wire [15:0]  probe37 
//	.probe38(ph_image_38), // input wire [15:0]  probe38 
//	.probe39(ph_image_39), // input wire [15:0]  probe39 
//	.probe40(ph_image_40), // input wire [15:0]  probe40 
//	.probe41(ph_image_41), // input wire [15:0]  probe41 
//	.probe42(ph_image_42), // input wire [15:0]  probe42 
//	.probe43(ph_image_43), // input wire [15:0]  probe43 
//	.probe44(ph_image_44), // input wire [15:0]  probe44 
//	.probe45(ph_image_45), // input wire [15:0]  probe45 
//	.probe46(ph_image_46), // input wire [15:0]  probe46 
//	.probe47(ph_image_47) // input wire [15:0]  probe47 
// );
    
endmodule
