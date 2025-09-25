`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:37 01/25/2018 
// Design Name: 
// Module Name:    ADC_Single_CH 
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
module ADC_Single_CH(
input IO_RESET,
input CLK_IN,
input CLK_DIV_IN,

input AP,BP,
input AN,BN,

input [4:0]IN_DELAY_TAP_IN,
output wire [4:0]IN_DELAY_TAP_OUT,

output wire [15:0]adc_data_out

    );












wire [7:0]adc_A,adc_B;


// ----- ADC data RX ----- //
// -- ADC CH1 -- //
AD_RX_IP  
  #(.sys_w( 1) ,
    .dev_w( 8) )
AD_RX_IP_inst1
   (.ISERDES_RST(IO_RESET),
  // From the system into the device
    .DATA_IN_FROM_PINS_P(AP), //Input pins
    .DATA_IN_FROM_PINS_N(AN), //Input pins
    .DATA_IN_TO_DEVICE(adc_A), //Output pins

    .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN),  // Dynamically loadable delay tap value for input delay
    .IN_DELAY_TAP_OUT(IN_DELAY_TAP_OUT), // Delay tap value for monitoring input delay
	 
    .CLK_IN(CLK_IN),        // Fast clock input from PLL/MMCM
    .CLK_DIV_IN(CLK_DIV_IN)//,    // Slow clock input from PLL/MMCM
);
AD_RX_IP  
  #(.sys_w( 1) ,
    .dev_w( 8) )
AD_RX_IP_inst11
   (.ISERDES_RST(IO_RESET),
  // From the system into the device
    .DATA_IN_FROM_PINS_P(BP), //Input pins
    .DATA_IN_FROM_PINS_N(BN), //Input pins
    .DATA_IN_TO_DEVICE(adc_B), //Output pins

    .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN),  // Dynamically loadable delay tap value for input delay
    .IN_DELAY_TAP_OUT(), // Delay tap value for monitoring input delay
	 
    .CLK_IN(CLK_IN),        // Fast clock input from PLL/MMCM
    .CLK_DIV_IN(CLK_DIV_IN)//,    // Slow clock input from PLL/MMCM
);

//////////////////////////////////////////////////////////////

reg [15:0]adc_data,adc_data_r1,adc_data_r2;

always@(posedge CLK_DIV_IN)
begin
	
	adc_data <= {adc_B[0],adc_B[1],adc_B[2],adc_B[3],adc_B[4],adc_B[5],adc_B[6],adc_B[7],adc_A[0],adc_A[1],adc_A[2],adc_A[3],adc_A[4],adc_A[5],adc_A[6],adc_A[7]};
	
	adc_data_r1 <= adc_data;
	
	adc_data_r2 <= adc_data_r1;
	
end

assign adc_data_out = adc_data_r2;

endmodule
