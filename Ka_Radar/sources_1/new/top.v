`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/09 20:58:26
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

//---------CLK----------//
    input GTXQ0_P,
    input GTXQ0_N,
    input GTXQ0_P2,
    input GTXQ0_N2,
      
    input CLK_200M_P,
    input CLK_200M_N,
    input FPGA_REFCLK1_P,
    input FPGA_REFCLK1_N,
    input ADC01_DCO_P,
    input ADC01_DCO_N,
    input ADC01_FCO_P,
    input ADC01_FCO_N,
//---------AD-----------//
    input CH01_AP,CH01_BP,CH02_AP,CH02_BP,CH03_AP,CH03_BP,CH04_AP,CH04_BP,
    input CH01_AN,CH01_BN,CH02_AN,CH02_BN,CH03_AN,CH03_BN,CH04_AN,CH04_BN,
    
    output ADC01_CSB,ADC01_SDIO,ADC01_SCLK,ADC01_PDWN,ADC01_SYNC,
//---------CTLSignal----------//
    output CPIB,
    output CPIE,
//    output FPGA_nRESET,
    output FPGA_SYNC,
    output PRI_O,
//    output [7:0]FPGA_TEST,
    
    output FPGA_LED0,
    output FPGA_LED1,
    output FPGA_LED2,
    output FPGA_LED3,
//---------GPIO----------//
//     inout [20:0]FPGA_IO,
//     input FPGA_PPS_1s,
//---------EMIF----------//
//     input DSP_EMIFCE1,     //CE1用于片?串口模块中的FIFO（后续要将串口模块中的FIFO移植到EMIF模块中）
//     input DSP_EMIFCE2,     //CE2用于片?EMIF模块中的双口RAM
//     input DSP_EMIFWE,
//     input DSP_EMIFOE,
//     input DSP_EMIFRNW,
//     input [23:0] DSP_EMIFA,
//     inout [15:0] DSP_EMIFD,
//---------UART----------//
//     input FPGA_UARTRXD0,
//     output FPGA_UARTTXD0,
//     input FPGA_UARTRXD1,
//     output FPGA_UARTTXD1,
//     input FPGA_UARTRXD2,
//     output FPGA_UARTTXD2,
//     input FPGA_UARTRXD3,
//     output FPGA_UARTTXD3,
//     input FPGA_UARTRXD4,
//     output FPGA_UARTTXD4,
//     output RS485_DIR,
//     output FPGA_RS485_DIR,
// GTX Reference Clock Interface
//     input GTXQ0_P,
//     input GTXQ0_N,
//         input                   SYSCLK_P,
//         input                   SYSCLK_N,
     
     
// GTX Serial I/O
//     output fiber_tx_dis,
      input[3:0]  RXP,
      input[3:0]  RXN,
      
//      output[3:0] TXP,
//      output[3:0] TXN,
      
      input[3:0]  RXP_2,
      input[3:0]  RXN_2,
      
//      output[3:0] TXP_2,
//      output[3:0] TXN_2,

      output [1:0] tx_dis,
      output cpib_delay,
      output cpie_delay,
//      output pri,

    inout [15:0]FPGA_IO,
    output [7:0]FPGA_TEST,
    
    output      DAC_RESET_n,        // 复位
    output      DAC_CS_n,           // 串行端口片选  
    output      DAC_SPI_SCLK,       // SPI时钟
    output      DAC_SPI_SDIO,       // SPI数据输入
    input       DAC_SPI_SDO,        // SPI数据输出
    input       DAC_IRQ_n,          // 中断请求，开漏、低电平有效输出
    output      DAC_DACLKP, DAC_DACLKN,     // DAC采用FPGA输出的720MHz时钟
    output      DAC_DCIP, DAC_DCIN,         // 数据时钟
    output      DAC_FRMP, DAC_FRMN,         // 帧
    output      [15:0]DAC_DP, DAC_DN,       // 数据位
    
    output      DAC_CS_n2 ,
    output      DAC_RESET_n2,        // 复位   
    output      DAC_SPI_SCLK2,       // SPI时钟
    output      DAC_SPI_SDIO2,       // SPI数据输入
    input       DAC_SPI_SDO2,        // SPI数据输出
    input       DAC_IRQ_n2,          // 中断请求，开漏、低电平有效输出
    output      DAC_DACLKP2, DAC_DACLKN2,     // DAC采用FPGA输出的720MHz时钟
    output      DAC_DCIP2, DAC_DCIN2 ,        // 数据时钟
         output      DAC_FRMP2, DAC_FRMN2,
     output      [15:0]DAC_DP2, DAC_DN2       // 数据位

    );
wire [15:0]dbf_1_add_I;
wire [15:0]dbf_1_add_Q;
wire [15:0]dbf_1_fw_sub_I;
wire [15:0]dbf_1_fw_sub_Q;
wire [15:0]dbf_1_fy_sub_I;
wire [15:0]dbf_1_fy_sub_Q;
wire data_out_1_valid;   
//---------Initial----------//
wire init_en;
wire FPGA_EN;
wire FPGA_nRESET;

//----------TimingCtl----------//
wire cpib;
wire cpie;
wire pri;
wire sync;
wire fiber;
wire [9:0]pri_num;
//----------AD_DA----------//
wire clk_120m;
wire clk_200m;
wire clk_100m;
wire clk_480m;
wire clk_ad_120m;
wire clk_ad_480m;

wire locked;
wire locked_ref;

wire [15:0]CH01_DATA_OUT;
wire [15:0]CH02_DATA_OUT;
wire [15:0]CH03_DATA_OUT;
wire [15:0]CH04_DATA_OUT;
//----------DDC_TOP----------//
wire [15:0]ddc_data_in;
wire [15:0]ddc_data_in_1;
reg [7:0]FPGA_MOD;
wire [1:0]ad_mode;

wire [15:0]data_ddc_I;
wire [15:0]data_ddc_Q;
wire data_out_ddc_valid;
    
    
// clk_120m clk_REFclk
//  (
//   // Clock out ports
//   .clk_out1(clk_120m),     // output clk_out1
//   .clk_out2(clk_480m),     // output clk_out2
//   // Status and control signals
//   .reset(1'b0), // input reset
//   .locked(locked_ref),       // output locked
//  // Clock in ports
//   .clk_in1_p(FPGA_REFCLK1_P),    // input clk_in1_p
//   .clk_in1_n(FPGA_REFCLK1_N));    // input clk_in1_n   
    
//  clk_200m clk_200m_inst
//   (
//    // Clock out ports
//    .clk_out1(clk_100m),     // output clk_out1
////    .clk_out2(clk_200m),     // output clk_out2
//    // Status and control signals
//    .reset(1'b0), // input reset
//    .locked(locked_200m),       // output locked
//   // Clock in ports
//    .clk_in1_p(CLK_200M_P),    // input clk_in1_p
//    .clk_in1_n(CLK_200M_N));    // input clk_in1_n
  clk_200m clk_200m_inst
   (
    // Clock out ports
    .clk_out1(clk_100m),     // output clk_out1
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(locked_200m),       // output locked
   // Clock in ports
    .clk_in1(clk_200m));      // input clk_in1
///////////////////////////////Initial//////////////////////////////////////
init_FPGA init_FPGA_inst(
    .clk_200m(clk_200m),
    .locked(locked),
    .gpio_3(1'b1),
    .gpio_2(1'b1),
    .FPGA_nRESET(FPGA_nRESET),
    .init_en(init_en),
    .FPGA_EN(FPGA_EN)
);
///////////////////////////////TimingCtl//////////////////////////////////////   
wire [31:0]pri_p_cnt;
wire [15:0]num_cpi; 
timing_gen timing_gen_inst(
       .clk(clk_ad_120m),                  //工作时钟
       .enable(FPGA_nRESET),               //工作使能
       .fpga_gpio(FPGA_IO),
       .mode_t(),         // 工作模式             /////////////////////********************
       .cpib(cpib),         //脉组起始
       .cpie(cpie),         //脉组结束
       .pri(pri),          //触发脉冲
       .sync(sync),          //模拟信号同步输出
       .fiber(fiber),
       .cpib_delay(cpib_delay),
       .pri_p_cnt(pri_p_cnt),
       .num_cpi(num_cpi),
       .pri_num(pri_num)        //pri号
);

assign CPIB = cpib;
assign CPIE = cpie;
assign cpie_delay = cpie;
assign FPGA_SYNC = sync;
assign PRI_O = pri;

assign   FPGA_TEST[0] = locked_ref;
assign   FPGA_TEST[1] = locked;
assign   FPGA_TEST[2] = pri;
assign   FPGA_TEST[3] = sync;
assign   FPGA_TEST[4] = fiber;
assign   FPGA_TEST[5] = cpib;//暂时接使能信号 CPIB延迟400us有效
assign   FPGA_TEST[6] = cpie;
assign   FPGA_TEST[7] = locked;
////////////////////////////////////////////////////////////////
reg [31:0]cnt;
reg led_1s;
//always@(posedge clk_120m) 
//begin
//    if(!locked_ref)
//      cnt <= 0 ;
//    else if (cnt <= 120000000)
//      cnt <= cnt+1 ;
//    else  cnt <= 0 ;
//end 
//always@(posedge clk_120m) 
//begin
//    if(cnt <= 60000000)
//      led_1s <= 0;
//     else  led_1s <= 1 ;
//end 

assign FPGA_LED0 = led_1s;
//assign FPGA_LED1 = CHANNEL_UP;
assign FPGA_LED2 = cpib;
assign FPGA_LED3 = 1;
///////////////////////////////////
ila_time ila_time_inst (
	.clk(clk_ad_120m),     
	.probe0(cpib),        // input wire [0:0]  probe0
	.probe1(cpie),        // input wire [0:0]  probe1
	.probe2(pri),         // input wire [0:0]  probe2
	.probe3(sync),   // input wire [0:0]  probe3
	.probe4(pri_num),     // input wire [9:0]  probe4
	.probe5(fiber)       // input wire [0:0]  probe5 
//	.probe6(Nr)       // input wire [15:0]  probe5 
);
///////////////////////////////AD_DA////////////////////////////////////////
ad_test ad_inst(
   .clk_200m_p(CLK_200M_P),
   .clk_200m_n(CLK_200M_N),
//   .FPGA_REFCLK1_P(FPGA_REFCLK1_P),
//   .FPGA_REFCLK1_N(FPGA_REFCLK1_N),
   .ADC01_DCO_P(ADC01_DCO_P),
   .ADC01_DCO_N(ADC01_DCO_N),
   .ADC01_FCO_P(ADC01_FCO_P),
   .ADC01_FCO_N(ADC01_FCO_N),
   .CH01_AP(CH01_AP),
   .CH01_BP(CH01_BP),
   .CH02_AP(CH02_AP),
   .CH02_BP(CH02_BP),
   .CH03_AP(CH03_AP),
   .CH03_BP(CH03_BP),
   .CH04_AP(CH04_AP),
   .CH04_BP(CH04_BP),
   .CH01_AN(CH01_AN),
   .CH01_BN(CH01_BN),
   .CH02_AN(CH02_AN),
   .CH02_BN(CH02_BN),
   .CH03_AN(CH03_AN),
   .CH03_BN(CH03_BN),
   .CH04_AN(CH04_AN),
   .CH04_BN(CH04_BN),

   .ADC01_CSB(ADC01_CSB),
   .ADC01_SDIO(ADC01_SDIO),
   .ADC01_SCLK(ADC01_SCLK),
   .ADC01_PDWN(ADC01_PDWN),
   .ADC01_SYNC(ADC01_SYNC),
   .ad_fco_120m(clk_ad_120m),
   .ad_dco_480m(clk_ad_480m),
   .clk_200m(clk_200m),
//   .clk_100m(clk_100m),
   .ad_lock(locked),
   .CH01_DATA_OUT(CH01_DATA_OUT),
   .CH02_DATA_OUT(CH02_DATA_OUT),
   .CH03_DATA_OUT(CH03_DATA_OUT),
   .CH04_DATA_OUT(CH04_DATA_OUT)
);

wire [7:0]fpga_mode;
reg cpi_t;
wire [2:0]dbf_cut_ctl;
vio_mode fpga_mode_test (                  ////ad_mode控制ad输出哪个通道至ddc     fpga_mode控制fpga工作模式（信号源）
  .clk(clk_ad_120m),                // input wire clk
  .probe_out0(fpga_mode),  // output wire [7 : 0] probe_out0
  .probe_out1(ad_mode),  // output wire [7 : 0] probe_out0
  .probe_out2(dbf_cut_ctl)  // output wire [7 : 0] probe_out0
);
 //////////fpga_mode为01--单频    02--6us30M    03--30us30M    04--组合脉冲

assign ddc_data_in_1 = (ad_mode == 2'b00)? CH01_DATA_OUT :      
                     (ad_mode == 2'b01)? CH02_DATA_OUT :
                     (ad_mode == 2'b10)? CH03_DATA_OUT :CH04_DATA_OUT;
wire cpi_dsel;                  
vio_2 your_instance_name (
  .clk(clk_ad_120m),                // input wire clk
  .probe_out0(cpi_dsel)  // output wire [0 : 0] probe_out0
);
assign ddc_data_in = (num_cpi == 1 || cpi_dsel)?ddc_data_in_1 : 16'b0;     
             
always@(posedge clk_ad_120m)       ///vio控制fpga工作模式  在CPIB触发时更新
begin
    if(!FPGA_nRESET)
        cpi_t <= 1'b0;
    else
        cpi_t <= cpib;
end
always@(posedge clk_ad_120m)
begin
    if(!FPGA_nRESET)
        FPGA_MOD <= 8'h01;
    else if(cpi_t == 0 && cpib ==1 )
        FPGA_MOD <= fpga_mode;
    else 
        FPGA_MOD <= FPGA_MOD;
end                    
                     
///////////////////////////////// DDC_TOP///////////////////////////////////////    
ddc ddc_inst(                                          //////圆阵工装 Nr、ram_addrb 暂时没有
     .clk_ddc(clk_ad_120m),           ////ADC采样速率120M
//     .clk_sim(clk_120m),           ////120M
//     .clk_data(clk_120m),
     .FPGA_MOD(FPGA_MOD),
     .reset_n(FPGA_nRESET),//全局复位
     .data_in(ddc_data_in),//输入数据,工装使用通道1
     .ddc_en(1'b1),
     .data_ddc_I(data_ddc_I),
     .data_ddc_Q(data_ddc_Q),
     .data_out_valid(data_out_ddc_valid)
);




wire [15:0]fw_out_1_24_I;
wire [15:0]fw_out_1_24_Q;
wire [15:0]fw_out_25_48_I;
wire [15:0]fw_out_25_48_Q;
wire fw_out_valid;

wire fy_out_valid;
wire [15:0]fy_out_L_1_I;
wire [15:0]fy_out_L_1_Q;
wire [15:0]fy_out_L_2_I;
wire [15:0]fy_out_L_2_Q;
wire [15:0]fy_out_L_3_I;
wire [15:0]fy_out_L_3_Q;
wire [15:0]fy_out_L_4_I;
wire [15:0]fy_out_L_4_Q;
wire [15:0]fy_out_L_5_I;
wire [15:0]fy_out_L_5_Q;
wire [15:0]fy_out_L_6_I;
wire [15:0]fy_out_L_6_Q;
wire [15:0]fy_out_L_7_I;
wire [15:0]fy_out_L_7_Q;
wire [15:0]fy_out_L_8_I;
wire [15:0]fy_out_L_8_Q;
wire [15:0]fy_out_L_9_I;
wire [15:0]fy_out_L_9_Q;
wire [15:0]fy_out_L_10_I;
wire [15:0]fy_out_L_10_Q;
wire [15:0]fy_out_L_11_I;
wire [15:0]fy_out_L_11_Q;
wire [15:0]fy_out_L_12_I;
wire [15:0]fy_out_L_12_Q;
wire [15:0]fy_out_L_13_I;
wire [15:0]fy_out_L_13_Q;
wire [15:0]fy_out_L_14_I;
wire [15:0]fy_out_L_14_Q;
wire [15:0]fy_out_L_15_I;
wire [15:0]fy_out_L_15_Q;
wire [15:0]fy_out_L_16_I;
wire [15:0]fy_out_L_16_Q;
wire [15:0]fy_out_L_17_I;
wire [15:0]fy_out_L_17_Q;
wire [15:0]fy_out_L_18_I;
wire [15:0]fy_out_L_18_Q;
wire [15:0]fy_out_L_19_I;
wire [15:0]fy_out_L_19_Q;
wire [15:0]fy_out_L_20_I;
wire [15:0]fy_out_L_20_Q;
wire [15:0]fy_out_L_21_I;
wire [15:0]fy_out_L_21_Q;
wire [15:0]fy_out_L_22_I;
wire [15:0]fy_out_L_22_Q;
wire [15:0]fy_out_L_23_I;
wire [15:0]fy_out_L_23_Q;
wire [15:0]fy_out_L_24_I;
wire [15:0]fy_out_L_24_Q;
wire [15:0]fy_out_L_25_I;
wire [15:0]fy_out_L_25_Q;
wire [15:0]fy_out_L_26_I;
wire [15:0]fy_out_L_26_Q;
wire [15:0]fy_out_L_27_I;
wire [15:0]fy_out_L_27_Q;
wire [15:0]fy_out_L_28_I;
wire [15:0]fy_out_L_28_Q;
wire [15:0]fy_out_L_29_I;
wire [15:0]fy_out_L_29_Q;
wire [15:0]fy_out_L_30_I;
wire [15:0]fy_out_L_30_Q;
wire [15:0]fy_out_L_31_I;
wire [15:0]fy_out_L_31_Q;
wire [15:0]fy_out_L_32_I;
wire [15:0]fy_out_L_32_Q;
wire [15:0]fy_out_L_33_I;
wire [15:0]fy_out_L_33_Q;
wire [15:0]fy_out_L_34_I;
wire [15:0]fy_out_L_34_Q;
wire [15:0]fy_out_L_35_I;
wire [15:0]fy_out_L_35_Q;
wire [15:0]fy_out_L_36_I;
wire [15:0]fy_out_L_36_Q;
wire [15:0]fy_out_L_37_I;
wire [15:0]fy_out_L_37_Q;
wire [15:0]fy_out_L_38_I;
wire [15:0]fy_out_L_38_Q;
wire [15:0]fy_out_L_39_I;
wire [15:0]fy_out_L_39_Q;
wire [15:0]fy_out_L_40_I;
wire [15:0]fy_out_L_40_Q;
wire [15:0]fy_out_L_41_I;
wire [15:0]fy_out_L_41_Q;
wire [15:0]fy_out_L_42_I;
wire [15:0]fy_out_L_42_Q;
wire [15:0]fy_out_L_43_I;
wire [15:0]fy_out_L_43_Q;
wire [15:0]fy_out_L_44_I;
wire [15:0]fy_out_L_44_Q;
wire [15:0]fy_out_L_45_I;
wire [15:0]fy_out_L_45_Q;
wire [15:0]fy_out_L_46_I;
wire [15:0]fy_out_L_46_Q;
wire [15:0]fy_out_L_47_I;
wire [15:0]fy_out_L_47_Q;
wire [15:0]fy_out_L_48_I;
wire [15:0]fy_out_L_48_Q;
wire [15:0]fy_out_L_49_I;
wire [15:0]fy_out_L_49_Q;
wire [15:0]fy_out_L_50_I;
wire [15:0]fy_out_L_50_Q;
wire [15:0]fy_out_L_51_I;
wire [15:0]fy_out_L_51_Q;
wire [15:0]fy_out_L_52_I;
wire [15:0]fy_out_L_52_Q;
wire [15:0]fy_out_L_53_I;
wire [15:0]fy_out_L_53_Q;
wire [15:0]fy_out_L_54_I;
wire [15:0]fy_out_L_54_Q;
wire [15:0]fy_out_L_55_I;
wire [15:0]fy_out_L_55_Q;
wire [15:0]fy_out_L_56_I;
wire [15:0]fy_out_L_56_Q;
wire [15:0]fy_out_L_57_I;
wire [15:0]fy_out_L_57_Q;
wire [15:0]fy_out_L_58_I;
wire [15:0]fy_out_L_58_Q;
wire [15:0]fy_out_L_59_I;
wire [15:0]fy_out_L_59_Q;
wire [15:0]fy_out_L_60_I;
wire [15:0]fy_out_L_60_Q;
wire [15:0]fy_out_L_61_I;
wire [15:0]fy_out_L_61_Q;
wire [15:0]fy_out_L_62_I;
wire [15:0]fy_out_L_62_Q;
wire [15:0]fy_out_L_63_I;
wire [15:0]fy_out_L_63_Q;
wire [15:0]fy_out_L_64_I;
wire [15:0]fy_out_L_64_Q;
wire [15:0]fy_out_L_65_I;
wire [15:0]fy_out_L_65_Q;
wire [15:0]fy_out_L_66_I;
wire [15:0]fy_out_L_66_Q;
wire [15:0]fy_out_L_67_I;
wire [15:0]fy_out_L_67_Q;
wire [15:0]fy_out_L_68_I;
wire [15:0]fy_out_L_68_Q;
wire [15:0]fy_out_L_69_I;
wire [15:0]fy_out_L_69_Q;
wire [15:0]fy_out_L_70_I;
wire [15:0]fy_out_L_70_Q;




wire [15:0]fy_out_R_1_I;
wire [15:0]fy_out_R_1_Q;
wire [15:0]fy_out_R_2_I;
wire [15:0]fy_out_R_2_Q;
wire [15:0]fy_out_R_3_I;
wire [15:0]fy_out_R_3_Q;
wire [15:0]fy_out_R_4_I;
wire [15:0]fy_out_R_4_Q;
wire [15:0]fy_out_R_5_I;
wire [15:0]fy_out_R_5_Q;
wire [15:0]fy_out_R_6_I;
wire [15:0]fy_out_R_6_Q;
wire [15:0]fy_out_R_7_I;
wire [15:0]fy_out_R_7_Q;
wire [15:0]fy_out_R_8_I;
wire [15:0]fy_out_R_8_Q;
wire [15:0]fy_out_R_9_I;
wire [15:0]fy_out_R_9_Q;
wire [15:0]fy_out_R_10_I;
wire [15:0]fy_out_R_10_Q;
wire [15:0]fy_out_R_11_I;
wire [15:0]fy_out_R_11_Q;
wire [15:0]fy_out_R_12_I;
wire [15:0]fy_out_R_12_Q;
wire [15:0]fy_out_R_13_I;
wire [15:0]fy_out_R_13_Q;
wire [15:0]fy_out_R_14_I;
wire [15:0]fy_out_R_14_Q;
wire [15:0]fy_out_R_15_I;
wire [15:0]fy_out_R_15_Q;
wire [15:0]fy_out_R_16_I;
wire [15:0]fy_out_R_16_Q;
wire [15:0]fy_out_R_17_I;
wire [15:0]fy_out_R_17_Q;
wire [15:0]fy_out_R_18_I;
wire [15:0]fy_out_R_18_Q;
wire [15:0]fy_out_R_19_I;
wire [15:0]fy_out_R_19_Q;
wire [15:0]fy_out_R_20_I;
wire [15:0]fy_out_R_20_Q;
wire [15:0]fy_out_R_21_I;
wire [15:0]fy_out_R_21_Q;
wire [15:0]fy_out_R_22_I;
wire [15:0]fy_out_R_22_Q;
wire [15:0]fy_out_R_23_I;
wire [15:0]fy_out_R_23_Q;
wire [15:0]fy_out_R_24_I;
wire [15:0]fy_out_R_24_Q;
wire [15:0]fy_out_R_25_I;
wire [15:0]fy_out_R_25_Q;
wire [15:0]fy_out_R_26_I;
wire [15:0]fy_out_R_26_Q;
wire [15:0]fy_out_R_27_I;
wire [15:0]fy_out_R_27_Q;
wire [15:0]fy_out_R_28_I;
wire [15:0]fy_out_R_28_Q;
wire [15:0]fy_out_R_29_I;
wire [15:0]fy_out_R_29_Q;
wire [15:0]fy_out_R_30_I;
wire [15:0]fy_out_R_30_Q;
wire [15:0]fy_out_R_31_I;
wire [15:0]fy_out_R_31_Q;
wire [15:0]fy_out_R_32_I;
wire [15:0]fy_out_R_32_Q;
wire [15:0]fy_out_R_33_I;
wire [15:0]fy_out_R_33_Q;
wire [15:0]fy_out_R_34_I;
wire [15:0]fy_out_R_34_Q;
wire [15:0]fy_out_R_35_I;
wire [15:0]fy_out_R_35_Q;
wire [15:0]fy_out_R_36_I;
wire [15:0]fy_out_R_36_Q;
wire [15:0]fy_out_R_37_I;
wire [15:0]fy_out_R_37_Q;
wire [15:0]fy_out_R_38_I;
wire [15:0]fy_out_R_38_Q;
wire [15:0]fy_out_R_39_I;
wire [15:0]fy_out_R_39_Q;
wire [15:0]fy_out_R_40_I;
wire [15:0]fy_out_R_40_Q;
wire [15:0]fy_out_R_41_I;
wire [15:0]fy_out_R_41_Q;
wire [15:0]fy_out_R_42_I;
wire [15:0]fy_out_R_42_Q;
wire [15:0]fy_out_R_43_I;
wire [15:0]fy_out_R_43_Q;
wire [15:0]fy_out_R_44_I;
wire [15:0]fy_out_R_44_Q;
wire [15:0]fy_out_R_45_I;
wire [15:0]fy_out_R_45_Q;
wire [15:0]fy_out_R_46_I;
wire [15:0]fy_out_R_46_Q;
wire [15:0]fy_out_R_47_I;
wire [15:0]fy_out_R_47_Q;
wire [15:0]fy_out_R_48_I;
wire [15:0]fy_out_R_48_Q;
wire [15:0]fy_out_R_49_I;
wire [15:0]fy_out_R_49_Q;
wire [15:0]fy_out_R_50_I;
wire [15:0]fy_out_R_50_Q;
wire [15:0]fy_out_R_51_I;
wire [15:0]fy_out_R_51_Q;
wire [15:0]fy_out_R_52_I;
wire [15:0]fy_out_R_52_Q;
wire [15:0]fy_out_R_53_I;
wire [15:0]fy_out_R_53_Q;
wire [15:0]fy_out_R_54_I;
wire [15:0]fy_out_R_54_Q;
wire [15:0]fy_out_R_55_I;
wire [15:0]fy_out_R_55_Q;
wire [15:0]fy_out_R_56_I;
wire [15:0]fy_out_R_56_Q;
wire [15:0]fy_out_R_57_I;
wire [15:0]fy_out_R_57_Q;
wire [15:0]fy_out_R_58_I;
wire [15:0]fy_out_R_58_Q;
wire [15:0]fy_out_R_59_I;
wire [15:0]fy_out_R_59_Q;
wire [15:0]fy_out_R_60_I;
wire [15:0]fy_out_R_60_Q;
wire [15:0]fy_out_R_61_I;
wire [15:0]fy_out_R_61_Q;
wire [15:0]fy_out_R_62_I;
wire [15:0]fy_out_R_62_Q;
wire [15:0]fy_out_R_63_I;
wire [15:0]fy_out_R_63_Q;
wire [15:0]fy_out_R_64_I;
wire [15:0]fy_out_R_64_Q;
wire [15:0]fy_out_R_65_I;
wire [15:0]fy_out_R_65_Q;
wire [15:0]fy_out_R_66_I;
wire [15:0]fy_out_R_66_Q;
wire [15:0]fy_out_R_67_I;
wire [15:0]fy_out_R_67_Q;
wire [15:0]fy_out_R_68_I;
wire [15:0]fy_out_R_68_Q;
wire [15:0]fy_out_R_69_I;
wire [15:0]fy_out_R_69_Q;
wire [15:0]fy_out_R_70_I;
wire [15:0]fy_out_R_70_Q;

wire [3:0] fgpagpiofw;
wire [3:0] fgpagpiofy;
vio_fpgagpio vio_fpgagpio_1 (
  .clk(clk_ad_120m),                // input wire clk
  .probe_out0(fgpagpiofw),  // output wire [3 : 0] probe_out0
  .probe_out1(fgpagpiofy)  // output wire [3 : 0] probe_out1
);

///////////////////////////////////dbf-方位俯仰幅相加权///////////////////////////////////////    
 dbf_fangwei fangwei_inst(
     .clk_120m(clk_ad_120m),
     .dataI(data_ddc_I),
     .dataQ(data_ddc_Q),
     .data_in_valid(data_out_ddc_valid),
   
     .fpga_gpio(fgpagpiofw),
   
     .add_out_1_24_I (fw_out_1_24_I ),
     .add_out_1_24_Q (fw_out_1_24_Q ),
     .add_out_25_48_I(fw_out_25_48_I),
     .add_out_25_48_Q(fw_out_25_48_Q),
     .data_out_valid(fw_out_valid)
    );


//    ila_fangwei ila_fangwei_1 (
//	.clk(clk_ad_120m), // input wire clk


//	.probe0(fw_out_1_24_I), // input wire [15:0]  probe0  
//	.probe1(fw_out_1_24_Q), // input wire [15:0]  probe1 
//	.probe2(fw_out_25_48_I), // input wire [15:0]  probe2 
//	.probe3(fw_out_25_48_Q) // input wire [15:0]  probe3
//);

    
dbf_fuyang fuyang_inst(
        .clk_120m(clk_ad_120m),
        .data_1_24_I(fw_out_1_24_I),
        .data_1_24_Q(fw_out_1_24_Q),
        .data_25_48_I(fw_out_25_48_I),
        .data_25_48_Q(fw_out_25_48_Q),
        .data_in_valid(fw_out_valid),
        
        .fpga_gpio(fgpagpiofy),

        .data_out_L_1_I(fy_out_L_1_I),
        .data_out_L_1_Q(fy_out_L_1_Q),
        .data_out_L_2_I(fy_out_L_2_I),
        .data_out_L_2_Q(fy_out_L_2_Q),
        .data_out_L_3_I(fy_out_L_3_I),
        .data_out_L_3_Q(fy_out_L_3_Q),
        .data_out_L_4_I(fy_out_L_4_I),
        .data_out_L_4_Q(fy_out_L_4_Q),
        .data_out_L_5_I(fy_out_L_5_I),
        .data_out_L_5_Q(fy_out_L_5_Q),
        .data_out_L_6_I(fy_out_L_6_I),
        .data_out_L_6_Q(fy_out_L_6_Q),
        .data_out_L_7_I(fy_out_L_7_I),
        .data_out_L_7_Q(fy_out_L_7_Q),
        .data_out_L_8_I(fy_out_L_8_I),
        .data_out_L_8_Q(fy_out_L_8_Q),
        .data_out_L_9_I(fy_out_L_9_I),
        .data_out_L_9_Q(fy_out_L_9_Q),
        .data_out_L_10_I(fy_out_L_10_I),
        .data_out_L_10_Q(fy_out_L_10_Q),
        .data_out_L_11_I(fy_out_L_11_I),
        .data_out_L_11_Q(fy_out_L_11_Q),
        .data_out_L_12_I(fy_out_L_12_I),
        .data_out_L_12_Q(fy_out_L_12_Q),
        .data_out_L_13_I(fy_out_L_13_I),
        .data_out_L_13_Q(fy_out_L_13_Q),
        .data_out_L_14_I(fy_out_L_14_I),
        .data_out_L_14_Q(fy_out_L_14_Q),
        .data_out_L_15_I(fy_out_L_15_I),
        .data_out_L_15_Q(fy_out_L_15_Q),
        .data_out_L_16_I(fy_out_L_16_I),
        .data_out_L_16_Q(fy_out_L_16_Q),
        .data_out_L_17_I(fy_out_L_17_I),
        .data_out_L_17_Q(fy_out_L_17_Q),
        .data_out_L_18_I(fy_out_L_18_I),
        .data_out_L_18_Q(fy_out_L_18_Q),
        .data_out_L_19_I(fy_out_L_19_I),
        .data_out_L_19_Q(fy_out_L_19_Q),
        .data_out_L_20_I(fy_out_L_20_I),
        .data_out_L_20_Q(fy_out_L_20_Q),
        .data_out_L_21_I(fy_out_L_21_I),
        .data_out_L_21_Q(fy_out_L_21_Q),
        .data_out_L_22_I(fy_out_L_22_I),
        .data_out_L_22_Q(fy_out_L_22_Q),
        .data_out_L_23_I(fy_out_L_23_I),
        .data_out_L_23_Q(fy_out_L_23_Q),
        .data_out_L_24_I(fy_out_L_24_I),
        .data_out_L_24_Q(fy_out_L_24_Q),
        .data_out_L_25_I(fy_out_L_25_I),
        .data_out_L_25_Q(fy_out_L_25_Q),
        .data_out_L_26_I(fy_out_L_26_I),
        .data_out_L_26_Q(fy_out_L_26_Q),
        .data_out_L_27_I(fy_out_L_27_I),
        .data_out_L_27_Q(fy_out_L_27_Q),
        .data_out_L_28_I(fy_out_L_28_I),
        .data_out_L_28_Q(fy_out_L_28_Q),
        .data_out_L_29_I(fy_out_L_29_I),
        .data_out_L_29_Q(fy_out_L_29_Q),
        .data_out_L_30_I(fy_out_L_30_I),
        .data_out_L_30_Q(fy_out_L_30_Q),
        .data_out_L_31_I(fy_out_L_31_I),
        .data_out_L_31_Q(fy_out_L_31_Q),
        .data_out_L_32_I(fy_out_L_32_I),
        .data_out_L_32_Q(fy_out_L_32_Q),
        .data_out_L_33_I(fy_out_L_33_I),
        .data_out_L_33_Q(fy_out_L_33_Q),
        .data_out_L_34_I(fy_out_L_34_I),
        .data_out_L_34_Q(fy_out_L_34_Q),
        .data_out_L_35_I(fy_out_L_35_I),
        .data_out_L_35_Q(fy_out_L_35_Q),
        .data_out_L_36_I(fy_out_L_36_I),
        .data_out_L_36_Q(fy_out_L_36_Q),
        .data_out_L_37_I(fy_out_L_37_I),
        .data_out_L_37_Q(fy_out_L_37_Q),
        .data_out_L_38_I(fy_out_L_38_I),
        .data_out_L_38_Q(fy_out_L_38_Q),
        .data_out_L_39_I(fy_out_L_39_I),
        .data_out_L_39_Q(fy_out_L_39_Q),
        .data_out_L_40_I(fy_out_L_40_I),
        .data_out_L_40_Q(fy_out_L_40_Q),
        .data_out_L_41_I(fy_out_L_41_I),
        .data_out_L_41_Q(fy_out_L_41_Q),
        .data_out_L_42_I(fy_out_L_42_I),
        .data_out_L_42_Q(fy_out_L_42_Q),
        .data_out_L_43_I(fy_out_L_43_I),
        .data_out_L_43_Q(fy_out_L_43_Q),
        .data_out_L_44_I(fy_out_L_44_I),
        .data_out_L_44_Q(fy_out_L_44_Q),
        .data_out_L_45_I(fy_out_L_45_I),
        .data_out_L_45_Q(fy_out_L_45_Q),
        .data_out_L_46_I(fy_out_L_46_I),
        .data_out_L_46_Q(fy_out_L_46_Q),
        .data_out_L_47_I(fy_out_L_47_I),
        .data_out_L_47_Q(fy_out_L_47_Q),
        .data_out_L_48_I(fy_out_L_48_I),
        .data_out_L_48_Q(fy_out_L_48_Q),
        .data_out_L_49_I(fy_out_L_49_I),
        .data_out_L_49_Q(fy_out_L_49_Q),
        .data_out_L_50_I(fy_out_L_50_I),
        .data_out_L_50_Q(fy_out_L_50_Q),
        .data_out_L_51_I(fy_out_L_51_I),
        .data_out_L_51_Q(fy_out_L_51_Q),
        .data_out_L_52_I(fy_out_L_52_I),
        .data_out_L_52_Q(fy_out_L_52_Q),
        .data_out_L_53_I(fy_out_L_53_I),
        .data_out_L_53_Q(fy_out_L_53_Q),
        .data_out_L_54_I(fy_out_L_54_I),
        .data_out_L_54_Q(fy_out_L_54_Q),
        .data_out_L_55_I(fy_out_L_55_I),
        .data_out_L_55_Q(fy_out_L_55_Q),
        .data_out_L_56_I(fy_out_L_56_I),
        .data_out_L_56_Q(fy_out_L_56_Q),
        .data_out_L_57_I(fy_out_L_57_I),
        .data_out_L_57_Q(fy_out_L_57_Q),
        .data_out_L_58_I(fy_out_L_58_I),
        .data_out_L_58_Q(fy_out_L_58_Q),
        .data_out_L_59_I(fy_out_L_59_I),
        .data_out_L_59_Q(fy_out_L_59_Q),
        .data_out_L_60_I(fy_out_L_60_I),
        .data_out_L_60_Q(fy_out_L_60_Q),
        .data_out_L_61_I(fy_out_L_61_I),
        .data_out_L_61_Q(fy_out_L_61_Q),
        .data_out_L_62_I(fy_out_L_62_I),
        .data_out_L_62_Q(fy_out_L_62_Q),
        .data_out_L_63_I(fy_out_L_63_I),
        .data_out_L_63_Q(fy_out_L_63_Q),
        .data_out_L_64_I(fy_out_L_64_I),
        .data_out_L_64_Q(fy_out_L_64_Q),
        .data_out_L_65_I(fy_out_L_65_I),
        .data_out_L_65_Q(fy_out_L_65_Q),
        .data_out_L_66_I(fy_out_L_66_I),
        .data_out_L_66_Q(fy_out_L_66_Q),
        .data_out_L_67_I(fy_out_L_67_I),
        .data_out_L_67_Q(fy_out_L_67_Q),
        .data_out_L_68_I(fy_out_L_68_I),
        .data_out_L_68_Q(fy_out_L_68_Q),
        .data_out_L_69_I(fy_out_L_69_I),
        .data_out_L_69_Q(fy_out_L_69_Q),
        .data_out_L_70_I(fy_out_L_70_I),
        .data_out_L_70_Q(fy_out_L_70_Q),
        
        .data_out_R_1_I(fy_out_R_1_I),
        .data_out_R_1_Q(fy_out_R_1_Q),
        .data_out_R_2_I(fy_out_R_2_I),
        .data_out_R_2_Q(fy_out_R_2_Q),
        .data_out_R_3_I(fy_out_R_3_I),
        .data_out_R_3_Q(fy_out_R_3_Q),
        .data_out_R_4_I(fy_out_R_4_I),
        .data_out_R_4_Q(fy_out_R_4_Q),
        .data_out_R_5_I(fy_out_R_5_I),
        .data_out_R_5_Q(fy_out_R_5_Q),
        .data_out_R_6_I(fy_out_R_6_I),
        .data_out_R_6_Q(fy_out_R_6_Q),
        .data_out_R_7_I(fy_out_R_7_I),
        .data_out_R_7_Q(fy_out_R_7_Q),
        .data_out_R_8_I(fy_out_R_8_I),
        .data_out_R_8_Q(fy_out_R_8_Q),
        .data_out_R_9_I(fy_out_R_9_I),
        .data_out_R_9_Q(fy_out_R_9_Q),
        .data_out_R_10_I(fy_out_R_10_I),
        .data_out_R_10_Q(fy_out_R_10_Q),
        .data_out_R_11_I(fy_out_R_11_I),
        .data_out_R_11_Q(fy_out_R_11_Q),
        .data_out_R_12_I(fy_out_R_12_I),
        .data_out_R_12_Q(fy_out_R_12_Q),
        .data_out_R_13_I(fy_out_R_13_I),
        .data_out_R_13_Q(fy_out_R_13_Q),
        .data_out_R_14_I(fy_out_R_14_I),
        .data_out_R_14_Q(fy_out_R_14_Q),
        .data_out_R_15_I(fy_out_R_15_I),
        .data_out_R_15_Q(fy_out_R_15_Q),
        .data_out_R_16_I(fy_out_R_16_I),
        .data_out_R_16_Q(fy_out_R_16_Q),
        .data_out_R_17_I(fy_out_R_17_I),
        .data_out_R_17_Q(fy_out_R_17_Q),
        .data_out_R_18_I(fy_out_R_18_I),
        .data_out_R_18_Q(fy_out_R_18_Q),
        .data_out_R_19_I(fy_out_R_19_I),
        .data_out_R_19_Q(fy_out_R_19_Q),
        .data_out_R_20_I(fy_out_R_20_I),
        .data_out_R_20_Q(fy_out_R_20_Q),
        .data_out_R_21_I(fy_out_R_21_I),
        .data_out_R_21_Q(fy_out_R_21_Q),
        .data_out_R_22_I(fy_out_R_22_I),
        .data_out_R_22_Q(fy_out_R_22_Q),
        .data_out_R_23_I(fy_out_R_23_I),
        .data_out_R_23_Q(fy_out_R_23_Q),
        .data_out_R_24_I(fy_out_R_24_I),
        .data_out_R_24_Q(fy_out_R_24_Q),
        .data_out_R_25_I(fy_out_R_25_I),
        .data_out_R_25_Q(fy_out_R_25_Q),
        .data_out_R_26_I(fy_out_R_26_I),
        .data_out_R_26_Q(fy_out_R_26_Q),
        .data_out_R_27_I(fy_out_R_27_I),
        .data_out_R_27_Q(fy_out_R_27_Q),
        .data_out_R_28_I(fy_out_R_28_I),
        .data_out_R_28_Q(fy_out_R_28_Q),
        .data_out_R_29_I(fy_out_R_29_I),
        .data_out_R_29_Q(fy_out_R_29_Q),
        .data_out_R_30_I(fy_out_R_30_I),
        .data_out_R_30_Q(fy_out_R_30_Q),
        .data_out_R_31_I(fy_out_R_31_I),
        .data_out_R_31_Q(fy_out_R_31_Q),
        .data_out_R_32_I(fy_out_R_32_I),
        .data_out_R_32_Q(fy_out_R_32_Q),
        .data_out_R_33_I(fy_out_R_33_I),
        .data_out_R_33_Q(fy_out_R_33_Q),
        .data_out_R_34_I(fy_out_R_34_I),
        .data_out_R_34_Q(fy_out_R_34_Q),
        .data_out_R_35_I(fy_out_R_35_I),
        .data_out_R_35_Q(fy_out_R_35_Q),
        .data_out_R_36_I(fy_out_R_36_I),
        .data_out_R_36_Q(fy_out_R_36_Q),
        .data_out_R_37_I(fy_out_R_37_I),
        .data_out_R_37_Q(fy_out_R_37_Q),
        .data_out_R_38_I(fy_out_R_38_I),
        .data_out_R_38_Q(fy_out_R_38_Q),
        .data_out_R_39_I(fy_out_R_39_I),
        .data_out_R_39_Q(fy_out_R_39_Q),
        .data_out_R_40_I(fy_out_R_40_I),
        .data_out_R_40_Q(fy_out_R_40_Q),
        .data_out_R_41_I(fy_out_R_41_I),
        .data_out_R_41_Q(fy_out_R_41_Q),
        .data_out_R_42_I(fy_out_R_42_I),
        .data_out_R_42_Q(fy_out_R_42_Q),
        .data_out_R_43_I(fy_out_R_43_I),
        .data_out_R_43_Q(fy_out_R_43_Q),
        .data_out_R_44_I(fy_out_R_44_I),
        .data_out_R_44_Q(fy_out_R_44_Q),
        .data_out_R_45_I(fy_out_R_45_I),
        .data_out_R_45_Q(fy_out_R_45_Q),
        .data_out_R_46_I(fy_out_R_46_I),
        .data_out_R_46_Q(fy_out_R_46_Q),
        .data_out_R_47_I(fy_out_R_47_I),
        .data_out_R_47_Q(fy_out_R_47_Q),
        .data_out_R_48_I(fy_out_R_48_I),
        .data_out_R_48_Q(fy_out_R_48_Q),
        .data_out_R_49_I(fy_out_R_49_I),
        .data_out_R_49_Q(fy_out_R_49_Q),
        .data_out_R_50_I(fy_out_R_50_I),
        .data_out_R_50_Q(fy_out_R_50_Q),
        .data_out_R_51_I(fy_out_R_51_I),
        .data_out_R_51_Q(fy_out_R_51_Q),
        .data_out_R_52_I(fy_out_R_52_I),
        .data_out_R_52_Q(fy_out_R_52_Q),
        .data_out_R_53_I(fy_out_R_53_I),
        .data_out_R_53_Q(fy_out_R_53_Q),
        .data_out_R_54_I(fy_out_R_54_I),
        .data_out_R_54_Q(fy_out_R_54_Q),
        .data_out_R_55_I(fy_out_R_55_I),
        .data_out_R_55_Q(fy_out_R_55_Q),
        .data_out_R_56_I(fy_out_R_56_I),
        .data_out_R_56_Q(fy_out_R_56_Q),
        .data_out_R_57_I(fy_out_R_57_I),
        .data_out_R_57_Q(fy_out_R_57_Q),
        .data_out_R_58_I(fy_out_R_58_I),
        .data_out_R_58_Q(fy_out_R_58_Q),
        .data_out_R_59_I(fy_out_R_59_I),
        .data_out_R_59_Q(fy_out_R_59_Q),
        .data_out_R_60_I(fy_out_R_60_I),
        .data_out_R_60_Q(fy_out_R_60_Q),
        .data_out_R_61_I(fy_out_R_61_I),
        .data_out_R_61_Q(fy_out_R_61_Q),
        .data_out_R_62_I(fy_out_R_62_I),
        .data_out_R_62_Q(fy_out_R_62_Q),
        .data_out_R_63_I(fy_out_R_63_I),
        .data_out_R_63_Q(fy_out_R_63_Q),
        .data_out_R_64_I(fy_out_R_64_I),
        .data_out_R_64_Q(fy_out_R_64_Q),
        .data_out_R_65_I(fy_out_R_65_I),
        .data_out_R_65_Q(fy_out_R_65_Q),
        .data_out_R_66_I(fy_out_R_66_I),
        .data_out_R_66_Q(fy_out_R_66_Q),
        .data_out_R_67_I(fy_out_R_67_I),
        .data_out_R_67_Q(fy_out_R_67_Q),
        .data_out_R_68_I(fy_out_R_68_I),
        .data_out_R_68_Q(fy_out_R_68_Q),
        .data_out_R_69_I(fy_out_R_69_I),
        .data_out_R_69_Q(fy_out_R_69_Q),
        .data_out_R_70_I(fy_out_R_70_I),
        .data_out_R_70_Q(fy_out_R_70_Q),
    
        .data_out_valid(fy_out_valid)   
        );
        
       
////////////////////////////////////////////////////////////////////////////////
wire [15:0]Nr;
wire [15:0]frame_out;
wire [9:0]fiber_addra;
wire [127:0]dina_L1; 
wire [127:0]dina_L2; 
wire [127:0]dina_L3; 
wire [127:0]dina_L4; 
wire [127:0]dina_R1; 
wire [127:0]dina_R2; 
wire [127:0]dina_R3; 
wire [127:0]dina_R4; 

wire [13:0]fiber_addrb;
wire data_out_valid;
wire data_ram_wr;
wire fibertx_en;
 
 


wire [1:0]probe_out0;
wire [9:0]cmd_frame_length;
wire cmd_valid;
wire ram_rd;
wire [9:0]ram_addr_rx;



//////////////////////////////////////////
ila_0 ila_ddc (
	.clk(clk_ad_120m), // input wire clk


	.probe0(CH01_DATA_OUT), // input wire [15:0]  probe0  
	.probe1(data_ddc_I), // input wire [31:0]  probe1 
	.probe2(data_ddc_Q), // input wire [31:0]  probe2
    .probe3(CH02_DATA_OUT), // input wire [15:0]  probe0
    .probe4(CH03_DATA_OUT), // input wire [15:0]  probe0
    .probe5(CH04_DATA_OUT), // input wire [15:0]  probe0
    .probe6(locked),
    .probe7(FPGA_nRESET),
    .probe8(init_en),
    .probe9(data_out_ddc_valid),
    .probe10(FPGA_MOD),
    .probe11(locked_ref),
	.probe12(fw_out_1_24_I ), // input wire [15:0]  probe12 
	.probe13(fw_out_1_24_Q ), // input wire [15:0]  probe13 
	.probe14(fw_out_25_48_I), // input wire [15:0]  probe14 
	.probe15(fw_out_25_48_Q) // input wire [15:0]  probe15 

);
    wire [15:0]add_L_1_35_I ;  
    wire [15:0]add_L_1_35_Q ;  
    wire [15:0]add_R_1_35_I ;  
    wire [15:0]add_R_1_35_Q ;  
    wire [15:0]add_L_36_70_I;  
    wire [15:0]add_L_36_70_Q;  
    wire [15:0]add_R_36_70_I;  
    wire [15:0]add_R_36_70_Q;  
      wire adddataout_valid;                           
add_zizhen add_zizhen_1(
    .clk(clk_ad_120m),
    
    
    .data_in_valid(fy_out_valid),
     .data_in_L_1_I(fy_out_L_1_I),         
     .data_in_L_1_Q(fy_out_L_1_Q),         
     .data_in_L_2_I(fy_out_L_2_I),         
     .data_in_L_2_Q(fy_out_L_2_Q),         
     .data_in_L_3_I(fy_out_L_3_I),         
     .data_in_L_3_Q(fy_out_L_3_Q),         
     .data_in_L_4_I(fy_out_L_4_I),         
     .data_in_L_4_Q(fy_out_L_4_Q),         
     .data_in_L_5_I(fy_out_L_5_I),         
     .data_in_L_5_Q(fy_out_L_5_Q),         
     .data_in_L_6_I(fy_out_L_6_I),         
     .data_in_L_6_Q(fy_out_L_6_Q),         
     .data_in_L_7_I(fy_out_L_7_I),         
     .data_in_L_7_Q(fy_out_L_7_Q),         
     .data_in_L_8_I(fy_out_L_8_I),         
     .data_in_L_8_Q(fy_out_L_8_Q),         
     .data_in_L_9_I(fy_out_L_9_I),         
     .data_in_L_9_Q(fy_out_L_9_Q),         
     .data_in_L_10_I(fy_out_L_10_I),       
     .data_in_L_10_Q(fy_out_L_10_Q),       
     .data_in_L_11_I(fy_out_L_11_I),       
     .data_in_L_11_Q(fy_out_L_11_Q),       
     .data_in_L_12_I(fy_out_L_12_I),       
     .data_in_L_12_Q(fy_out_L_12_Q),       
     .data_in_L_13_I(fy_out_L_13_I),       
     .data_in_L_13_Q(fy_out_L_13_Q),       
     .data_in_L_14_I(fy_out_L_14_I),       
     .data_in_L_14_Q(fy_out_L_14_Q),       
     .data_in_L_15_I(fy_out_L_15_I),       
     .data_in_L_15_Q(fy_out_L_15_Q),       
     .data_in_L_16_I(fy_out_L_16_I),       
     .data_in_L_16_Q(fy_out_L_16_Q),       
     .data_in_L_17_I(fy_out_L_17_I),       
     .data_in_L_17_Q(fy_out_L_17_Q),       
     .data_in_L_18_I(fy_out_L_18_I),       
     .data_in_L_18_Q(fy_out_L_18_Q),       
     .data_in_L_19_I(fy_out_L_19_I),       
     .data_in_L_19_Q(fy_out_L_19_Q),       
     .data_in_L_20_I(fy_out_L_20_I),       
     .data_in_L_20_Q(fy_out_L_20_Q),       
     .data_in_L_21_I(fy_out_L_21_I),       
     .data_in_L_21_Q(fy_out_L_21_Q),       
     .data_in_L_22_I(fy_out_L_22_I),       
     .data_in_L_22_Q(fy_out_L_22_Q),       
     .data_in_L_23_I(fy_out_L_23_I),       
     .data_in_L_23_Q(fy_out_L_23_Q),       
     .data_in_L_24_I(fy_out_L_24_I),       
     .data_in_L_24_Q(fy_out_L_24_Q),       
     .data_in_L_25_I(fy_out_L_25_I),       
     .data_in_L_25_Q(fy_out_L_25_Q),       
     .data_in_L_26_I(fy_out_L_26_I),       
     .data_in_L_26_Q(fy_out_L_26_Q),       
     .data_in_L_27_I(fy_out_L_27_I),       
     .data_in_L_27_Q(fy_out_L_27_Q),       
     .data_in_L_28_I(fy_out_L_28_I),       
     .data_in_L_28_Q(fy_out_L_28_Q),       
     .data_in_L_29_I(fy_out_L_29_I),       
     .data_in_L_29_Q(fy_out_L_29_Q),       
     .data_in_L_30_I(fy_out_L_30_I),       
     .data_in_L_30_Q(fy_out_L_30_Q),       
     .data_in_L_31_I(fy_out_L_31_I),       
     .data_in_L_31_Q(fy_out_L_31_Q),       
     .data_in_L_32_I(fy_out_L_32_I),       
     .data_in_L_32_Q(fy_out_L_32_Q),       
     .data_in_L_33_I(fy_out_L_33_I),       
     .data_in_L_33_Q(fy_out_L_33_Q),       
     .data_in_L_34_I(fy_out_L_34_I),       
     .data_in_L_34_Q(fy_out_L_34_Q),       
     .data_in_L_35_I(fy_out_L_35_I),       
     .data_in_L_35_Q(fy_out_L_35_Q),       
     .data_in_L_36_I(fy_out_L_36_I),       
     .data_in_L_36_Q(fy_out_L_36_Q),       
     .data_in_L_37_I(fy_out_L_37_I),       
     .data_in_L_37_Q(fy_out_L_37_Q),       
     .data_in_L_38_I(fy_out_L_38_I),       
     .data_in_L_38_Q(fy_out_L_38_Q),       
     .data_in_L_39_I(fy_out_L_39_I),       
     .data_in_L_39_Q(fy_out_L_39_Q),       
     .data_in_L_40_I(fy_out_L_40_I),       
     .data_in_L_40_Q(fy_out_L_40_Q),       
     .data_in_L_41_I(fy_out_L_41_I),       
     .data_in_L_41_Q(fy_out_L_41_Q),       
     .data_in_L_42_I(fy_out_L_42_I),       
     .data_in_L_42_Q(fy_out_L_42_Q),       
     .data_in_L_43_I(fy_out_L_43_I),       
     .data_in_L_43_Q(fy_out_L_43_Q),       
     .data_in_L_44_I(fy_out_L_44_I),       
     .data_in_L_44_Q(fy_out_L_44_Q),       
     .data_in_L_45_I(fy_out_L_45_I),       
     .data_in_L_45_Q(fy_out_L_45_Q),       
     .data_in_L_46_I(fy_out_L_46_I),       
     .data_in_L_46_Q(fy_out_L_46_Q),       
     .data_in_L_47_I(fy_out_L_47_I),       
     .data_in_L_47_Q(fy_out_L_47_Q),       
     .data_in_L_48_I(fy_out_L_48_I),       
     .data_in_L_48_Q(fy_out_L_48_Q),       
     .data_in_L_49_I(fy_out_L_49_I),       
     .data_in_L_49_Q(fy_out_L_49_Q),       
     .data_in_L_50_I(fy_out_L_50_I),       
     .data_in_L_50_Q(fy_out_L_50_Q),       
     .data_in_L_51_I(fy_out_L_51_I),       
     .data_in_L_51_Q(fy_out_L_51_Q),       
     .data_in_L_52_I(fy_out_L_52_I),       
     .data_in_L_52_Q(fy_out_L_52_Q),       
     .data_in_L_53_I(fy_out_L_53_I),       
     .data_in_L_53_Q(fy_out_L_53_Q),       
     .data_in_L_54_I(fy_out_L_54_I),       
     .data_in_L_54_Q(fy_out_L_54_Q),       
     .data_in_L_55_I(fy_out_L_55_I),       
     .data_in_L_55_Q(fy_out_L_55_Q),       
     .data_in_L_56_I(fy_out_L_56_I),       
     .data_in_L_56_Q(fy_out_L_56_Q),       
     .data_in_L_57_I(fy_out_L_57_I),       
     .data_in_L_57_Q(fy_out_L_57_Q),       
     .data_in_L_58_I(fy_out_L_58_I),       
     .data_in_L_58_Q(fy_out_L_58_Q),       
     .data_in_L_59_I(fy_out_L_59_I),       
     .data_in_L_59_Q(fy_out_L_59_Q),       
     .data_in_L_60_I(fy_out_L_60_I),       
     .data_in_L_60_Q(fy_out_L_60_Q),       
     .data_in_L_61_I(fy_out_L_61_I),       
     .data_in_L_61_Q(fy_out_L_61_Q),       
     .data_in_L_62_I(fy_out_L_62_I),       
     .data_in_L_62_Q(fy_out_L_62_Q),       
     .data_in_L_63_I(fy_out_L_63_I),       
     .data_in_L_63_Q(fy_out_L_63_Q),       
     .data_in_L_64_I(fy_out_L_64_I),       
     .data_in_L_64_Q(fy_out_L_64_Q),       
     .data_in_L_65_I(fy_out_L_65_I),       
     .data_in_L_65_Q(fy_out_L_65_Q),       
     .data_in_L_66_I(fy_out_L_66_I),       
     .data_in_L_66_Q(fy_out_L_66_Q),       
     .data_in_L_67_I(fy_out_L_67_I),       
     .data_in_L_67_Q(fy_out_L_67_Q),       
     .data_in_L_68_I(fy_out_L_68_I),       
     .data_in_L_68_Q(fy_out_L_68_Q),       
     .data_in_L_69_I(fy_out_L_69_I),       
     .data_in_L_69_Q(fy_out_L_69_Q),       
     .data_in_L_70_I(fy_out_L_70_I),       
     .data_in_L_70_Q(fy_out_L_70_Q),       
                                           
     .data_in_R_1_I(fy_out_R_1_I),         
     .data_in_R_1_Q(fy_out_R_1_Q),         
     .data_in_R_2_I(fy_out_R_2_I),         
     .data_in_R_2_Q(fy_out_R_2_Q),         
     .data_in_R_3_I(fy_out_R_3_I),         
     .data_in_R_3_Q(fy_out_R_3_Q),         
     .data_in_R_4_I(fy_out_R_4_I),         
     .data_in_R_4_Q(fy_out_R_4_Q),         
     .data_in_R_5_I(fy_out_R_5_I),         
     .data_in_R_5_Q(fy_out_R_5_Q),         
     .data_in_R_6_I(fy_out_R_6_I),         
     .data_in_R_6_Q(fy_out_R_6_Q),         
     .data_in_R_7_I(fy_out_R_7_I),         
     .data_in_R_7_Q(fy_out_R_7_Q),         
     .data_in_R_8_I(fy_out_R_8_I),         
     .data_in_R_8_Q(fy_out_R_8_Q),         
     .data_in_R_9_I(fy_out_R_9_I),         
     .data_in_R_9_Q(fy_out_R_9_Q),         
     .data_in_R_10_I(fy_out_R_10_I),       
     .data_in_R_10_Q(fy_out_R_10_Q),       
     .data_in_R_11_I(fy_out_R_11_I),       
     .data_in_R_11_Q(fy_out_R_11_Q),       
     .data_in_R_12_I(fy_out_R_12_I),       
     .data_in_R_12_Q(fy_out_R_12_Q),       
     .data_in_R_13_I(fy_out_R_13_I),       
     .data_in_R_13_Q(fy_out_R_13_Q),       
     .data_in_R_14_I(fy_out_R_14_I),       
     .data_in_R_14_Q(fy_out_R_14_Q),       
     .data_in_R_15_I(fy_out_R_15_I),       
     .data_in_R_15_Q(fy_out_R_15_Q),       
     .data_in_R_16_I(fy_out_R_16_I),       
     .data_in_R_16_Q(fy_out_R_16_Q),       
     .data_in_R_17_I(fy_out_R_17_I),       
     .data_in_R_17_Q(fy_out_R_17_Q),       
     .data_in_R_18_I(fy_out_R_18_I),       
     .data_in_R_18_Q(fy_out_R_18_Q),       
     .data_in_R_19_I(fy_out_R_19_I),       
     .data_in_R_19_Q(fy_out_R_19_Q),       
     .data_in_R_20_I(fy_out_R_20_I),       
     .data_in_R_20_Q(fy_out_R_20_Q),       
     .data_in_R_21_I(fy_out_R_21_I),       
     .data_in_R_21_Q(fy_out_R_21_Q),       
     .data_in_R_22_I(fy_out_R_22_I),       
     .data_in_R_22_Q(fy_out_R_22_Q),       
     .data_in_R_23_I(fy_out_R_23_I),       
     .data_in_R_23_Q(fy_out_R_23_Q),       
     .data_in_R_24_I(fy_out_R_24_I),       
     .data_in_R_24_Q(fy_out_R_24_Q),       
     .data_in_R_25_I(fy_out_R_25_I),       
     .data_in_R_25_Q(fy_out_R_25_Q),       
     .data_in_R_26_I(fy_out_R_26_I),       
     .data_in_R_26_Q(fy_out_R_26_Q),       
     .data_in_R_27_I(fy_out_R_27_I),       
     .data_in_R_27_Q(fy_out_R_27_Q),       
     .data_in_R_28_I(fy_out_R_28_I),       
     .data_in_R_28_Q(fy_out_R_28_Q),       
     .data_in_R_29_I(fy_out_R_29_I),       
     .data_in_R_29_Q(fy_out_R_29_Q),       
     .data_in_R_30_I(fy_out_R_30_I),       
     .data_in_R_30_Q(fy_out_R_30_Q),       
     .data_in_R_31_I(fy_out_R_31_I),       
     .data_in_R_31_Q(fy_out_R_31_Q),       
     .data_in_R_32_I(fy_out_R_32_I),       
     .data_in_R_32_Q(fy_out_R_32_Q),       
     .data_in_R_33_I(fy_out_R_33_I),       
     .data_in_R_33_Q(fy_out_R_33_Q),       
     .data_in_R_34_I(fy_out_R_34_I),       
     .data_in_R_34_Q(fy_out_R_34_Q),       
     .data_in_R_35_I(fy_out_R_35_I),       
     .data_in_R_35_Q(fy_out_R_35_Q),       
     .data_in_R_36_I(fy_out_R_36_I),       
     .data_in_R_36_Q(fy_out_R_36_Q),       
     .data_in_R_37_I(fy_out_R_37_I),       
     .data_in_R_37_Q(fy_out_R_37_Q),       
     .data_in_R_38_I(fy_out_R_38_I),       
     .data_in_R_38_Q(fy_out_R_38_Q),       
     .data_in_R_39_I(fy_out_R_39_I),       
     .data_in_R_39_Q(fy_out_R_39_Q),       
     .data_in_R_40_I(fy_out_R_40_I),       
     .data_in_R_40_Q(fy_out_R_40_Q),       
     .data_in_R_41_I(fy_out_R_41_I),       
     .data_in_R_41_Q(fy_out_R_41_Q),       
     .data_in_R_42_I(fy_out_R_42_I),       
     .data_in_R_42_Q(fy_out_R_42_Q),       
     .data_in_R_43_I(fy_out_R_43_I),       
     .data_in_R_43_Q(fy_out_R_43_Q),       
     .data_in_R_44_I(fy_out_R_44_I),       
     .data_in_R_44_Q(fy_out_R_44_Q),       
     .data_in_R_45_I(fy_out_R_45_I),       
     .data_in_R_45_Q(fy_out_R_45_Q),       
     .data_in_R_46_I(fy_out_R_46_I),       
     .data_in_R_46_Q(fy_out_R_46_Q),       
     .data_in_R_47_I(fy_out_R_47_I),       
     .data_in_R_47_Q(fy_out_R_47_Q),       
     .data_in_R_48_I(fy_out_R_48_I),       
     .data_in_R_48_Q(fy_out_R_48_Q),       
     .data_in_R_49_I(fy_out_R_49_I),       
     .data_in_R_49_Q(fy_out_R_49_Q),       
     .data_in_R_50_I(fy_out_R_50_I),       
     .data_in_R_50_Q(fy_out_R_50_Q),       
     .data_in_R_51_I(fy_out_R_51_I),       
     .data_in_R_51_Q(fy_out_R_51_Q),       
     .data_in_R_52_I(fy_out_R_52_I),       
     .data_in_R_52_Q(fy_out_R_52_Q),       
     .data_in_R_53_I(fy_out_R_53_I),       
     .data_in_R_53_Q(fy_out_R_53_Q),       
     .data_in_R_54_I(fy_out_R_54_I),       
     .data_in_R_54_Q(fy_out_R_54_Q),       
     .data_in_R_55_I(fy_out_R_55_I),       
     .data_in_R_55_Q(fy_out_R_55_Q),       
     .data_in_R_56_I(fy_out_R_56_I),       
     .data_in_R_56_Q(fy_out_R_56_Q),       
     .data_in_R_57_I(fy_out_R_57_I),       
     .data_in_R_57_Q(fy_out_R_57_Q),       
     .data_in_R_58_I(fy_out_R_58_I),       
     .data_in_R_58_Q(fy_out_R_58_Q),       
     .data_in_R_59_I(fy_out_R_59_I),       
     .data_in_R_59_Q(fy_out_R_59_Q),       
     .data_in_R_60_I(fy_out_R_60_I),       
     .data_in_R_60_Q(fy_out_R_60_Q),       
     .data_in_R_61_I(fy_out_R_61_I),       
     .data_in_R_61_Q(fy_out_R_61_Q),       
     .data_in_R_62_I(fy_out_R_62_I),       
     .data_in_R_62_Q(fy_out_R_62_Q),       
     .data_in_R_63_I(fy_out_R_63_I),       
     .data_in_R_63_Q(fy_out_R_63_Q),       
     .data_in_R_64_I(fy_out_R_64_I),       
     .data_in_R_64_Q(fy_out_R_64_Q),       
     .data_in_R_65_I(fy_out_R_65_I),       
     .data_in_R_65_Q(fy_out_R_65_Q),       
     .data_in_R_66_I(fy_out_R_66_I),       
     .data_in_R_66_Q(fy_out_R_66_Q),       
     .data_in_R_67_I(fy_out_R_67_I),       
     .data_in_R_67_Q(fy_out_R_67_Q),       
     .data_in_R_68_I(fy_out_R_68_I),       
     .data_in_R_68_Q(fy_out_R_68_Q),       
     .data_in_R_69_I(fy_out_R_69_I),       
     .data_in_R_69_Q(fy_out_R_69_Q),       
     .data_in_R_70_I(fy_out_R_70_I),       
     .data_in_R_70_Q(fy_out_R_70_Q),       


   .add_L_1_35_I (add_L_1_35_I ) ,
   .add_L_1_35_Q (add_L_1_35_Q ) ,
   .add_R_1_35_I (add_R_1_35_I ) ,
   .add_R_1_35_Q (add_R_1_35_Q ) ,
   .add_L_36_70_I(add_L_36_70_I)  ,
   .add_L_36_70_Q(add_L_36_70_Q)  ,
   .add_R_36_70_I(add_R_36_70_I)  ,
   .add_R_36_70_Q(add_R_36_70_Q)  ,
    .dataout_valid(adddataout_valid)
    );


////////////////////////////////////////////////////////////////////////////////
wire [15:0]duc_1;
wire [15:0]duc_2 ;
wire [15:0]duc_3 ;
wire [15:0]duc_4 ;  
wire  duc_out_valid;   
duc duc_inst(
.clk_duc     (clk_ad_120m),
 .FPGA_nRESET(FPGA_nRESET),
.add_L_1_35_I (add_L_1_35_I ),
.add_L_1_35_Q (add_L_1_35_Q ),
.add_R_1_35_I (add_R_1_35_I ),
.add_R_1_35_Q (add_R_1_35_Q ),
.add_L_36_70_I(add_L_36_70_I),
.add_L_36_70_Q(add_L_36_70_Q),
.add_R_36_70_I(add_R_36_70_I),
.add_R_36_70_Q(add_R_36_70_Q),
.duc_v_in_valid(1'b1),

.duc_1(duc_1),
.duc_2(duc_2),
.duc_3(duc_3),
.duc_4(duc_4),
.duc_out_valid(duc_out_valid) 
);

    ila_1 ila_all (
	.clk(clk_ad_120m), // input wire clk


	.probe0(add_L_1_35_I ), // input wire [15:0]  probe0  
	.probe1(add_L_1_35_Q ), // input wire [15:0]  probe1 
	.probe2(add_R_1_35_I ), // input wire [15:0]  probe2 
	.probe3(add_R_1_35_Q ), // input wire [15:0]  probe3 
	.probe4(add_L_36_70_I), // input wire [15:0]  probe4 
	.probe5(add_L_36_70_Q), // input wire [15:0]  probe5 
	.probe6(add_R_36_70_I), // input wire [15:0]  probe6 
	.probe7(add_R_36_70_Q), // input wire [15:0]  probe7 
	.probe8 (duc_1 ), // input wire [15:0]  probe8 
	.probe9 (duc_2 ), // input wire [15:0]  probe9 
	.probe10(duc_3), // input wire [15:0]  probe10 
	.probe11(duc_4) // input wire [15:0]  probe11
);
    wire            DAC_CLK_120M  ;
        wire            dac_set  ;
        wire DAC_RST;
/////////////////////////DAC_CLOCK//////////////////////////////////////////////
CLK_Module              CLK_Module_Inst (
      
        .V7_REF_DAC_CLKP    ( FPGA_REFCLK1_P   ), 
        .V7_REF_DAC_CLKN    ( FPGA_REFCLK1_N   ),
        .DAC_CLK_120M       ( DAC_CLK_120M      ),
        .DAC_CLKP           ( DAC_DACLKP        ),
        .DAC_CLKN           ( DAC_DACLKN        ),
        .DCI_CLKP           ( DAC_DCIP          ),     
        .DCI_CLKN           ( DAC_DCIN          ),  
        .DAC_CLKP2           ( DAC_DACLKP2        ),
        .DAC_CLKN2           ( DAC_DACLKN2        ),
       .DCI_CLKP2           ( DAC_DCIP2          ),     
        .DCI_CLKN2           ( DAC_DCIN2          ),  
        
        .dac_set            ( dac_set           ),      // DAC参数设置        
        .SYS_RST            ( DAC_RST           ));    
//////////// ---- DAC 输出 --- /////////////////////////////////////////////////////
    DAC_Out DAC_Out_Inst(
        .clk                ( DAC_CLK_120M  ),
        .rst                ( DAC_RST       ),
        .SW_RF              (1'b1),  // 开辐射后，DAC有输出
        .DDS_I_OUT          ( 16'd10      ),
       // .DDS_Q_OUT          ( DDS_Q_OUT     ),
        .DDS_Q_OUT          ( 16'd10      ),   /// sdl change 
        .DAC_DATA_I         ( duc_1   ),
        .DAC_DATA_Q         ( duc_2   ),
        .DAC_DP             ( DAC_DP        ), 
        .DAC_DN             ( DAC_DN        ));

///////////// ---- DAC配置 ---- /////////////  
    DAC_Module DAC_Module_Inst(
        .clk                ( DAC_CLK_120M  ),
        .rst                ( DAC_RST       ),
        
        .DAC_PARM_SET       ( dac_set       ),      // DAC参数设置
        .DAC_RESET_n        ( DAC_RESET_n   ),      // 复位
        .DAC_CS_n           ( DAC_CS_n      ),      // 串行端口片选  
        .DAC_SPI_SCLK       ( DAC_SPI_SCLK  ),      // SPI时钟输入
        .DAC_SPI_SDIO       ( DAC_SPI_SDIO  ),      // SPI数据输入
        .DAC_SPI_SDO        ( DAC_SPI_SDO   ),      // SPI数据输出
        .DAC_IRQ_n          ( DAC_IRQ_n     )      // 中断请求，开漏、低电平有效输出
    );

    
//////////// ---- DAC2 输出 --- /////////////////////////////////////////////////////
    DAC_Out DAC_Out_Inst_2(
        .clk                ( DAC_CLK_120M  ),
        .rst                ( DAC_RST       ),
        .SW_RF              (1'b1),  // 开辐射后，DAC有输出
        .DDS_I_OUT          ( 16'd10     ),
       // .DDS_Q_OUT          ( DDS_Q_OUT     ),
        .DDS_Q_OUT          ( 16'd10      ),   /// sdl change 
        .DAC_DATA_I         ( duc_3   ),
        .DAC_DATA_Q         ( duc_4   ),
        .DAC_DP             ( DAC_DP2        ), 
        .DAC_DN             ( DAC_DN2        ));

///////////// ---- DAC2配置 ---- /////////////  
    DAC_Module_2 DAC_Module_Inst_2(
        .clk                ( DAC_CLK_120M  ),
        .rst                ( DAC_RST      ),
        
        .DAC_PARM_SET       ( dac_set       ),      // DAC参数设置
        .DAC_RESET_n        ( DAC_RESET_n2_2   ),      // 复位
        .DAC_CS_n           ( DAC_CS_n2      ),      // 串行端口片选  
        .DAC_SPI_SCLK       ( DAC_SPI_SCLK2_2  ),      // SPI时钟输入
        .DAC_SPI_SDIO       ( DAC_SPI_SDIO2  ),      // SPI数据输入
        .DAC_SPI_SDO        ( DAC_SPI_SDO2   ),      // SPI数据输出
        .DAC_IRQ_n          ( DAC_IRQ_n2     )      // 中断请求，开漏、低电平有效输出
    );   
    
        
  assign   DAC_RESET_n2 =  DAC_RESET_n;
  assign   DAC_SPI_SCLK2 =  DAC_SPI_SCLK;
     
    reg frame;
reg [15:0] cnt;
always@(posedge DAC_CLK_120M)
begin

    if(DAC_RST )
        frame <= 1'b1;
    else if(cnt==2)
        frame <= 1'b0; 
        else
        frame = 0;   
end

always@(posedge DAC_CLK_120M)
begin

    if(DAC_RST )
        cnt <= 16'b1;
    else if (cnt<16'd3)
        cnt <= cnt+1;    
        else
        cnt=0;
end


assign DAC_FRMN2 =frame;
assign DAC_FRMP2 =frame;
assign DAC_FRMN =frame;
assign DAC_FRMP =frame;
endmodule


