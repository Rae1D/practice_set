`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/08 20:41:01
// Design Name: 
// Module Name: ad_test
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


module ad_test(
     input clk_200m_p,
     input clk_200m_n,
//     input FPGA_REFCLK1_P,
//     input FPGA_REFCLK1_N, 
     input ADC01_DCO_P,
     input ADC01_DCO_N,
     input ADC01_FCO_P,
     input ADC01_FCO_N,
     
     input CH01_AP,CH01_BP,CH02_AP,CH02_BP,CH03_AP,CH03_BP,CH04_AP,CH04_BP,
     input CH01_AN,CH01_BN,CH02_AN,CH02_BN,CH03_AN,CH03_BN,CH04_AN,CH04_BN,
     
     output ADC01_CSB,ADC01_SDIO,ADC01_SCLK,ADC01_PDWN,ADC01_SYNC,
     output ad_fco_120m,
     output ad_dco_480m,
     output clk_200m,
//     output clk_100m,
     output ad_lock,
     output [15:0]CH01_DATA_OUT,
     output [15:0]CH02_DATA_OUT,
     output [15:0]CH03_DATA_OUT,
     output [15:0]CH04_DATA_OUT
    );
    
//   (* MARK_DEBUG="true" *) wire [15:0] CH01_DATA_OUT;
//   (* MARK_DEBUG="true" *) wire [15:0] CH02_DATA_OUT;
//   (* MARK_DEBUG="true" *) wire [15:0] CH03_DATA_OUT;
//   (* MARK_DEBUG="true" *) wire [15:0] CH04_DATA_OUT;
//   (* MARK_DEBUG="true" *) wire ad_lock;
   

wire clk_120m;
//wire clk_200m;
wire clk_480m;
//wire ad_dco_480m;
//wire ad_fco_120m;


   
   
// wire ADC01_CSB;
// wire ADC01_SDIO;
// wire ADC01_SCLK;
 
 assign ADC01_CSB=1;
 assign ADC01_SDIO=1;
 assign ADC01_SCLK=0;
 assign ADC01_PDWN=0;
   
   // (* IODELAY_GROUP = <iodelay_group_name> *) // Specifies group name for associated IDELAYs/ODELAYs and IDELAYCTRL
  
    IBUFDS #(
       .DIFF_TERM("FALSE"),       // Differential Termination
       .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
       .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
    ) IBUFDS_inst_1 (
       .O(clk_200m),  // Buffer output
       .I(clk_200m_p),  // Diff_p buffer input (connect directly to top-level port)
       .IB(clk_200m_n) // Diff_n buffer input (connect directly to top-level port)
    );
    
    
    
  IDELAYCTRL IDELAYCTRL_inst (
        .RDY(),       // 1-bit output: Ready output
        .REFCLK(clk_200m), // 1-bit input: Reference clock input
        .RST(1'b0)        // 1-bit input: Active high reset input
     );
  

   
              
      clk_ad_0 clk_fpga_inst
     (
      // Clock out ports
      .clk_out1(ad_fco_120m),     // output clk_out1
      .clk_out2(ad_dco_480m),     // output clk_out2
      // Status and control signals
      .reset(1'b0), // input reset
      .locked(ad_lock),       // output locked
     // Clock in ports
      .clk_in1_p(ADC01_FCO_P),    // input clk_in1_p
      .clk_in1_n(ADC01_FCO_N));    // input clk_in1_n


// reg ad_locked_1 = 1;
// reg [31:0]cnt_ad_rst=32'd1;
// reg [15:0]cnt_100us=0;
// always@(posedge ad_fco_120m)      //ad_fco_120m有效（开机）后1s在复位持续100us
// begin
//   if(cnt_ad_rst>=1 && cnt_ad_rst<=32'd120000000)
//    cnt_ad_rst<=cnt_ad_rst+1;
//    else
//    cnt_ad_rst<=0;   
// end  
 
// always@(posedge ad_fco_120m) 
// begin
//    if(cnt_ad_rst==32'd120000000)
//     cnt_100us <=1;
//   else  if(cnt_100us>=1 && cnt_100us<=12000)begin
//    cnt_100us <= cnt_100us+1;
//    ad_locked_1 <= 0;
//    end
//    else
//    begin
//    cnt_100us<=0;
//    ad_locked_1<=1;
//    end
// end  
// assign ad_lock = ad_locked_1;

wire [5:0]IN_DELAY_TAP_IN;
assign IN_DELAY_TAP_IN = 5'h17;
wire [5:0]IN_DELAY_TAP_OUT;
//wire probe_out0;

//vio_0 ad_vio (              /////////调相位、控制ad复位
//  .clk(ad_fco_120m),                // input wire clk
//  .probe_in0(IN_DELAY_TAP_OUT),    // input wire [4 : 0] probe_in0
//  .probe_out0(probe_out0),  // output wire [0 : 0] probe_out0
//  .probe_out1(IN_DELAY_TAP_IN)  // output wire [4 : 0] probe_out1
//);
      
       // - - - - - - - - -  ADC1 - - - - - - - - -  //
         ADC_4CH  ADC1_4CH_inst (
             .IO_RESET(~ad_lock), 
             .CLK_IN(ad_dco_480m),      // Fast clock 来自PLL  ：  400MHz
             .CLK_DIV_IN(ad_fco_120m),   // Low clock 来自PLL  ：  100MHz
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
         
             .IN_DELAY_TAP_IN(IN_DELAY_TAP_IN), 
             .IN_DELAY_TAP_OUT(IN_DELAY_TAP_OUT), 
              
             .CH1_DATA(CH01_DATA_OUT), 
             .CH2_DATA(CH02_DATA_OUT), 
             .CH3_DATA(CH03_DATA_OUT), 
             .CH4_DATA(CH04_DATA_OUT)
             );
             
   
endmodule
