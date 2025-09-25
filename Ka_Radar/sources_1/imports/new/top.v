`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/08 10:26:53
// Design Name: 
// Module Name: top
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


module top(
input IO_RST,
input ADCLK_400M,ADCLK_100M,
//  input FPGA_REFCLK1_P,FPGA_REFCLK1_N,
// ADC Data
input CH01_AP,CH01_BP,CH02_AP,CH02_BP,CH03_AP,CH03_BP,CH04_AP,CH04_BP,
input CH01_AN,CH01_BN,CH02_AN,CH02_BN,CH03_AN,CH03_BN,CH04_AN,CH04_BN,

input [4:0]DLY_TAP_IN_ADC01_DATA,
output wire [4:0]IN_DELAY_TAP_OUT,

output wire [15:0]CH01_DATA_OUT,CH02_DATA_OUT,CH03_DATA_OUT,CH04_DATA_OUT


    );
    
    // - - - - - - - - -  ADC1 - - - - - - - - -  //
    ADC_4CH  ADC1_4CH_inst (
        .IO_RESET(IO_RST), 
        .CLK_IN(ADCLK_400M),      // Fast clock 来自PLL  ：  400MHz
        .CLK_DIV_IN(ADCLK_100M),   // Low clock 来自PLL  ：  100MHz
         // CH1
        .CH1_AP(CH01_AP), .CH1_BP(CH01_BP), 
        .CH1_AN(CH01_AN), .CH1_BN(CH01_BN), 
         // CH2
        .CH2_AP(CH02_AP), .CH2_BP(CH02_BP),
        .CH2_AN(CH02_AN), .CH2_BN(CH02_BN),
         // CH3
        .CH3_AP(CH03_AP), .CH3_BP(CH03_BP),
        .CH3_AN(CH03_AN), .CH3_BN(CH03_BN),
         // CH4
        .CH4_AP(CH04_AP), .CH4_BP(CH04_BP),
        .CH4_AN(CH04_AN), .CH4_BN(CH04_BN),
    
        .IN_DELAY_TAP_IN(DLY_TAP_IN_ADC01_DATA), 
        .IN_DELAY_TAP_OUT(), 
         
        .CH1_DATA(CH01_DATA_OUT), 
        .CH2_DATA(CH02_DATA_OUT), 
        .CH3_DATA(CH03_DATA_OUT), 
        .CH4_DATA(CH04_DATA_OUT)
        );
endmodule
