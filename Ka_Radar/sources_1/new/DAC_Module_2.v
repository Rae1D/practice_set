`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/15 09:26:36
// Design Name: 
// Module Name: DAC_Module_2
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


module DAC_Module_2(
    input                   clk,    rst,
    input                   DAC_PARM_SET,       // 参数设置脉冲
    
    output                  DAC_RESET_n,        // 复位
    output                  DAC_CS_n,           // 串行端口片选  
    output                  DAC_SPI_SCLK,       // SPI时钟
    output                  DAC_SPI_SDIO,       // SPI数据输入
    input                   DAC_SPI_SDO,        // SPI数据输出
    input                   DAC_IRQ_n          // 中断请求，开漏、低电平有效输出
);

    wire        [15:0]SPI_DATA_IN, SPI_DATA_IN_i;
    wire        SPI_Start, SPI_Start_i;
    
    wire        Serial_data;
    wire        Serial_clk;
    wire        Serial_data_en;
    
    wire        VIO_DAC_PARA_EN ;
    wire        [15:0]VIO_DAC_REG_01  ;
    wire        [15:0]VIO_DAC_REG_02  ;
    wire        [15:0]VIO_DAC_REG_03  ;
    wire        [15:0]VIO_DAC_REG_04  ;
    wire        [15:0]VIO_DAC_REG_05  ;
    wire        [15:0]VIO_DAC_REG_06  ;
    wire        [15:0]VIO_DAC_REG_07  ;
    wire        [15:0]VIO_DAC_REG_08  ;
    wire        [15:0]VIO_DAC_REG_09  ;
    wire        [15:0]VIO_DAC_REG_10  ;
    wire        [15:0]VIO_DAC_REG_11  ;
    wire        [15:0]VIO_DAC_REG_12  ;
    wire        [15:0]VIO_DAC_REG_13  ;
    wire        [15:0]VIO_DAC_REG_14  ;
    wire        [15:0]VIO_DAC_REG_15  ;
    wire        [15:0]VIO_DAC_REG_16  ;
    wire        [15:0]VIO_DAC_REG_17  ;
    wire        [15:0]VIO_DAC_REG_18  ;
    wire        [15:0]VIO_DAC_REG_19  ;
    wire        [15:0]VIO_DAC_REG_20  ;
    wire        [32:0]VIO_DAC_PARA_FTW;
    
    wire       PARM_SET;
    
    assign      DAC_RESET_n = (~rst) & (~VIO_DAC_PARA_EN) ;    
    assign      PARM_SET =  VIO_DAC_PARA_EN | DAC_PARM_SET ;
    
    DAC_RegConfig_2    DAC_RegConfig_Inst1(
        .clk                ( clk              ),
        .rst                ( rst              ),
        
        .DAC_PARA_EN        ( PARM_SET         ),
        .DAC_REG_01         ( VIO_DAC_REG_01   ),
        .DAC_REG_02         ( VIO_DAC_REG_02   ),
        .DAC_REG_03         ( VIO_DAC_REG_03   ),
        .DAC_REG_04         ( VIO_DAC_REG_04   ),
        .DAC_REG_05         ( VIO_DAC_REG_05   ),
        .DAC_REG_06         ( VIO_DAC_REG_06   ),
        .DAC_REG_07         ( VIO_DAC_REG_07   ),
        .DAC_REG_08         ( VIO_DAC_REG_08   ),
        .DAC_REG_09         ( VIO_DAC_REG_09   ),
        .DAC_REG_10         ( VIO_DAC_REG_10   ),
        .DAC_REG_11         ( VIO_DAC_REG_11   ),
        .DAC_REG_12         ( VIO_DAC_REG_12   ),
        .DAC_REG_13         ( VIO_DAC_REG_13   ),
        .DAC_REG_14         ( VIO_DAC_REG_14   ),
        .DAC_REG_15         ( VIO_DAC_REG_15   ),
        .DAC_REG_16         ( VIO_DAC_REG_16   ),
        .DAC_REG_17         ( VIO_DAC_REG_17   ),
        .DAC_REG_18         ( VIO_DAC_REG_18   ),
        .DAC_REG_19         ( VIO_DAC_REG_19   ),
        .DAC_REG_20         ( VIO_DAC_REG_20   ),
        .DAC_PARA_FTW       ( VIO_DAC_PARA_FTW ),   

        .SPI_Start          ( SPI_Start_i   ),
        .SPI_DATA_IN        ( SPI_DATA_IN_i )
     );
    
    assign  SPI_Start   = SPI_Start_i;
    assign  SPI_DATA_IN = {SPI_DATA_IN_i[0],SPI_DATA_IN_i[1],SPI_DATA_IN_i[2],SPI_DATA_IN_i[3],SPI_DATA_IN_i[4],SPI_DATA_IN_i[5],SPI_DATA_IN_i[6],SPI_DATA_IN_i[7],SPI_DATA_IN_i[8],SPI_DATA_IN_i[9],SPI_DATA_IN_i[10],SPI_DATA_IN_i[11],SPI_DATA_IN_i[12],SPI_DATA_IN_i[13],SPI_DATA_IN_i[14],SPI_DATA_IN_i[15]};
        
    P2S_WIDTH_RC_Module #
       (    .SHIFT_REG_WIDTH_MAX    (16),		    // 移位寄存器位宽：可适应低于 SHIFT_REG_WIDTH_MAX 位的并串转换
            .SYS_CLK_FREQ           (120000000),    // 模块的工作时钟频率：120MHz
            .SERIAL_CLK_FREQ        (1000000),	    // 并串转换输出的串行时钟频率：1MHz
            .P2S_PROTECT_INT        (1000)			// 当连续两次执行并串转换时，需要设定的保护时间间隔：time(ns) = P2S_PROTECT_INT * (1/SYS_CLK_FREQ) * 10^9 ns
       )
    P2S_WIDTH_RC_Module_inst (
        .rst              ( rst             ), 
        .clk              ( clk             ), 
        
        // user inerface
        .P2S_Start        ( SPI_Start       ), 		     //单时钟周期正脉冲，同步于clk
        .P2S_DATA_IN      ( SPI_DATA_IN     ),       //P2S_Start到来时，P2S_DATA_IN应稳定可靠
        .P2S_DATA_Width   ( 32'd16          ),         //实际数据位宽，P2S_Start到来时，P2S_DATA_Width应稳定可靠
        .P2S_BUSY         (                 ),             //并转串进程忙状态信号
        .P2S_Completed    (                 ),   //串行帧数据传输完成指示信号
        
        // Serial output 
        .Serial_data      ( Serial_data     ), 
        .Serial_clk       ( Serial_clk      ), 
        .Serial_data_en   ( Serial_data_en  )
    ); 
        
    assign          DAC_SPI_SCLK    = Serial_clk;
    assign          DAC_SPI_SDIO    = Serial_data;
    assign          DAC_CS_n        = ~Serial_data_en;
    
    VIO_DAC_REG_2 VIO_DAC_REG (
        .clk        ( clk ),                  // input wire clk
        
        .probe_out0 ( VIO_DAC_PARA_EN ),    // output wire [0 : 0] probe_out0
        .probe_out1 ( VIO_DAC_REG_01  ),    // output wire [15 : 0] probe_out1
        .probe_out2 ( VIO_DAC_REG_02  ),    // output wire [15 : 0] probe_out2
        .probe_out3 ( VIO_DAC_REG_03  ),    // output wire [15 : 0] probe_out3
        .probe_out4 ( VIO_DAC_REG_04  ),    // output wire [15 : 0] probe_out4
        .probe_out5 ( VIO_DAC_REG_05  ),    // output wire [15 : 0] probe_out5
        .probe_out6 ( VIO_DAC_REG_06  ),    // output wire [15 : 0] probe_out6
        .probe_out7 ( VIO_DAC_REG_07  ),    // output wire [15 : 0] probe_out7
        .probe_out8 ( VIO_DAC_REG_08  ),    // output wire [15 : 0] probe_out8
        .probe_out9 ( VIO_DAC_REG_09  ),    // output wire [15 : 0] probe_out9
        .probe_out10( VIO_DAC_REG_10  ),    // output wire [15 : 0] probe_out10
        .probe_out11( VIO_DAC_REG_11  ),    // output wire [15 : 0] probe_out11
        .probe_out12( VIO_DAC_REG_12  ),    // output wire [15 : 0] probe_out12
        .probe_out13( VIO_DAC_REG_13  ),    // output wire [15 : 0] probe_out13
        .probe_out14( VIO_DAC_REG_14  ),    // output wire [15 : 0] probe_out14
        .probe_out15( VIO_DAC_REG_15  ),    // output wire [15 : 0] probe_out15
        .probe_out16( VIO_DAC_REG_16  ),    // output wire [15 : 0] probe_out16
        .probe_out17( VIO_DAC_REG_17  ),    // output wire [15 : 0] probe_out17
        .probe_out18( VIO_DAC_REG_18  ),    // output wire [15 : 0] probe_out18
        .probe_out19( VIO_DAC_REG_19  ),    // output wire [15 : 0] probe_out19
        .probe_out20( VIO_DAC_REG_20  ),    // output wire [15 : 0] probe_out20
        .probe_out21( VIO_DAC_PARA_FTW)     // output wire [32 : 0] probe_out21
    );
    
endmodule
