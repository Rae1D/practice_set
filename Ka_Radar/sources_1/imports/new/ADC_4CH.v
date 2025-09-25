`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:30 01/25/2018 
// Design Name: 
// Module Name:    ADC_4CH 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ADC_4CH(
input IO_RESET,
input CLK_IN,CLK_DIV_IN,
// ADC Data
input CH1_AP,CH1_BP,CH2_AP,CH2_BP,CH3_AP,CH3_BP,CH4_AP,CH4_BP,
input CH1_AN,CH1_BN,CH2_AN,CH2_BN,CH3_AN,CH3_BN,CH4_AN,CH4_BN,

input [4:0]IN_DELAY_TAP_IN,
output wire [4:0]IN_DELAY_TAP_OUT,

output wire [15:0]CH1_DATA,CH2_DATA,CH3_DATA,CH4_DATA

    );




// CH1
ADC_Single_CH  ADC_Single_CH1_inst (
    .IO_RESET(IO_RESET), 
    .CLK_IN(CLK_IN), 
    .CLK_DIV_IN(CLK_DIV_IN), 
	 
    .AP(CH1_AP), .BP(CH1_BP),
    .AN(CH1_AN), .BN(CH1_BN), 
	 
    .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN), 
    .IN_DELAY_TAP_OUT(IN_DELAY_TAP_OUT), 
	 
    .adc_data_out(CH1_DATA)
    );

// CH2
ADC_Single_CH  ADC_Single_CH2_inst (
    .IO_RESET(IO_RESET), 
    .CLK_IN(CLK_IN), 
    .CLK_DIV_IN(CLK_DIV_IN), 
	 
    .AP(CH2_AP), .BP(CH2_BP),
    .AN(CH2_AN), .BN(CH2_BN), 
	 
    .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN), 
    .IN_DELAY_TAP_OUT(), 
	 
    .adc_data_out(CH2_DATA)
    );

// CH3
ADC_Single_CH  ADC_Single_CH3_inst (
    .IO_RESET(IO_RESET), 
    .CLK_IN(CLK_IN), 
    .CLK_DIV_IN(CLK_DIV_IN), 
	 
    .AP(CH3_AP), .BP(CH3_BP),
    .AN(CH3_AN), .BN(CH3_BN), 
	 
    .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN), 
    .IN_DELAY_TAP_OUT(), 
	 
    .adc_data_out(CH3_DATA)
    );

// CH4
ADC_Single_CH  ADC_Single_CH4_inst (
    .IO_RESET(IO_RESET), 
    .CLK_IN(CLK_IN), 
    .CLK_DIV_IN(CLK_DIV_IN), 
	 
    .AP(CH4_AP), .BP(CH4_BP),
    .AN(CH4_AN), .BN(CH4_BN), 
	 
    .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN), 
    .IN_DELAY_TAP_OUT(), 
	 
    .adc_data_out(CH4_DATA)
    );





endmodule
