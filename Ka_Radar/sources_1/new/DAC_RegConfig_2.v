`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/15 09:27:41
// Design Name: 
// Module Name: DAC_RegConfig_2
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


module DAC_RegConfig_2(
 input                   clk,  rst,
    
    input                   DAC_PARA_EN,
    
    input                   [15:0]DAC_REG_01,
    input                   [15:0]DAC_REG_02,
    input                   [15:0]DAC_REG_03,
    input                   [15:0]DAC_REG_04,
    input                   [15:0]DAC_REG_05,
    input                   [15:0]DAC_REG_06,
    input                   [15:0]DAC_REG_07,
    input                   [15:0]DAC_REG_08,
    input                   [15:0]DAC_REG_09,
    input                   [15:0]DAC_REG_10,
    input                   [15:0]DAC_REG_11,
    input                   [15:0]DAC_REG_12,
    input                   [15:0]DAC_REG_13,
    input                   [15:0]DAC_REG_14,
    input                   [15:0]DAC_REG_15,
    input                   [15:0]DAC_REG_16,
    input                   [15:0]DAC_REG_17,
    input                   [15:0]DAC_REG_18,
    input                   [15:0]DAC_REG_19,
    input                   [15:0]DAC_REG_20,
    input                   [32:0]DAC_PARA_FTW,         
    
    output                        SPI_Start,
    output                  [15:0]SPI_DATA_IN
);

reg         rst_r1,rst_r2;
wire        Updata_Para;

assign      Updata_Para = rst | DAC_PARA_EN;

wire        Update_rise, Update_fall;
WidePulse_RiseFall_Gen  Rise_Gen_Parm_Done (.clk(clk),  .wide_pulse_in(Updata_Para),  .rise(Update_rise), .fall(Update_fall) );

// DAC 寄存器参数
// ---------------------------- 1'd0:写 -- Addr -- Data -------- //
reg          [15:0]REG_RST_SET   = {1'b0,   7'h00,   8'h20};     // 复位
reg          [15:0]REG_RST_CLR   = {1'b0,   7'h00,   8'h00};     // 清复位

reg          [15:0]REG_FTW_01    = {1'b0,   7'h30,   8'h00};     // 配置FTW低位
reg          [15:0]REG_FTW_02    = {1'b0,   7'h31,   8'h00};     // 配置FTW
reg          [15:0]REG_FTW_03    = {1'b0,   7'h32,   8'h00};     // 配置FTW
//reg          [15:0]REG_FTW_04    = {1'b0,   7'h33,   8'hE0};     // 配置FTW高位
reg          [15:0]REG_FTW_04    = {1'b0,   7'h33,   8'h80};     // 配置FTW高位   ---sdl change
reg          [15:0]REG_FTW_UP01  = {1'b0,   7'h36,   8'h01};     // 更新FTW
reg          [15:0]REG_FTW_UP00  = {1'b0,   7'h36,   8'h00};     // 更新FTW

reg          [7:0] state;
parameter   [31:0]DLY_TIME      =  32'd10000;   // 
parameter   [31:0]SET_TIME      =  32'd200000000;   // 复位等待1~2秒
parameter   [7:0] STT_IDLE      =  8'd0;        // 空闲
parameter   [7:0] STT_RST_SET   =  8'd1;        // 复位
parameter   [7:0] STT_RST_CLR   =  8'd2;        // 清复位

parameter   [7:0]STT_REG_01     = 8'd11;
parameter   [7:0]STT_REG_02     = 8'd12;
parameter   [7:0]STT_REG_03     = 8'd13;
parameter   [7:0]STT_REG_04     = 8'd14;
parameter   [7:0]STT_REG_05     = 8'd15;
parameter   [7:0]STT_REG_06     = 8'd16;
parameter   [7:0]STT_REG_07     = 8'd17;
parameter   [7:0]STT_REG_08     = 8'd18;
parameter   [7:0]STT_REG_09     = 8'd19;
parameter   [7:0]STT_REG_10     = 8'd20;
parameter   [7:0]STT_REG_11     = 8'd21;
parameter   [7:0]STT_REG_12     = 8'd22;
parameter   [7:0]STT_REG_13     = 8'd23;
parameter   [7:0]STT_REG_14     = 8'd24;
parameter   [7:0]STT_REG_15     = 8'd25;
parameter   [7:0]STT_REG_16     = 8'd26;
parameter   [7:0]STT_REG_17     = 8'd27;
parameter   [7:0]STT_REG_18     = 8'd28;
parameter   [7:0]STT_REG_19     = 8'd29;
parameter   [7:0]STT_REG_20     = 8'd30;

parameter   [7:0]STT_FTW_01     =  8'd201;        // 配置FTW低位
parameter   [7:0]STT_FTW_02     =  8'd202;        // 
parameter   [7:0]STT_FTW_03     =  8'd203;        // 
parameter   [7:0]STT_FTW_04     =  8'd204;        // 配置FTW高位
parameter   [7:0]STT_FTW_UP01   =  8'd205;        // 更新FTW
parameter   [7:0]STT_FTW_UP00   =  8'd206;        // 更新FTW
parameter   [7:0]STT_END        =  8'd207;        // 配置结束，状态不再跳转

reg          [31:0]stt_time;
reg          spi_start;
reg          [15:0]spi_data;

reg          [15:0]REG_01,REG_02,REG_03,REG_04,REG_05,REG_06,REG_07,REG_08,REG_09,REG_10;
reg          [15:0]REG_11,REG_12,REG_13,REG_14,REG_15,REG_16,REG_17,REG_18,REG_19,REG_20;

// 产生模块复位信号
always@(posedge clk)
begin
    rst_r1 <= rst;   
     
    if(Updata_Para )
        rst_r2 <= 1'b1;
    else
        rst_r2 <= 1'b0;    
end

// 下降沿更新参数
always@(posedge clk)
begin
    if(rst_r2)begin
        REG_RST_SET     <= {1'b0,   7'h00,   8'h20};     // 复位       
        REG_RST_CLR     <= {1'b0,   7'h00,   8'h00};     // 清复位  
        
        REG_01          <= 16'h0000;       REG_11          <= 16'h0ACF;
        REG_02          <= 16'h0000;       REG_12          <= 16'h0AA0;
        REG_03          <= 16'h0000;       REG_13          <= 16'h10C8;
        REG_04          <= 16'h0000;       REG_14          <= 16'h1704;
        REG_05          <= 16'h40E0;       REG_15          <= 16'h1802;
        REG_06          <= 16'h4101;       REG_16          <= 16'h1800;
        REG_07          <= 16'h44CD;       REG_17          <= 16'h1B64;
        REG_08          <= 16'h4501;       REG_18          <= 16'h1C00;
        REG_09          <= 16'h0CD1;       REG_19          <= 16'h1D00;
        REG_10          <= 16'h0DD6;       REG_20          <= 16'h1E48;
        
        REG_FTW_01      <= {1'b0,   7'h30,   8'h00};     // 配置FTW低位  
        REG_FTW_02      <= {1'b0,   7'h31,   8'h00};     // 配置FTW    
        REG_FTW_03      <= {1'b0,   7'h32,   8'h00};     // 配置FTW    
    //    REG_FTW_04      <= {1'b0,   7'h33,   8'hE0};     // 配置FTW高位  
        REG_FTW_04      <= {1'b0,   7'h33,   8'h80};     // 配置FTW高位   // sdl change
        REG_FTW_UP01    <= {1'b0,   7'h36,   8'h01};     // 更新FTW    
        REG_FTW_UP00    <= {1'b0,   7'h36,   8'h00};     // 更新FTW    
        
    end else begin
    
        if(Update_fall)begin
            REG_RST_SET   <= { 1'b0,   7'h00,   8'h20};     // 复位       
            REG_RST_CLR   <= { 1'b0,   7'h00,   8'h00};     // 清复位      
                                                                 
            REG_01        <= DAC_REG_01;        REG_11        <= DAC_REG_11;
            REG_02        <= DAC_REG_02;        REG_12        <= DAC_REG_12;
            REG_03        <= DAC_REG_03;        REG_13        <= DAC_REG_13;
            REG_04        <= DAC_REG_04;        REG_14        <= DAC_REG_14;
            REG_05        <= DAC_REG_05;        REG_15        <= DAC_REG_15;
            REG_06        <= DAC_REG_06;        REG_16        <= DAC_REG_16;
            REG_07        <= DAC_REG_07;        REG_17        <= DAC_REG_17;
            REG_08        <= DAC_REG_08;        REG_18        <= DAC_REG_18;
            REG_09        <= DAC_REG_09;        REG_19        <= DAC_REG_19;
            REG_10        <= DAC_REG_10;        REG_20        <= DAC_REG_20;
                            
            REG_FTW_01    <= { DAC_PARA_FTW[32],   7'h30,   DAC_PARA_FTW[7:0]  };     // 配置FTW低位  
            REG_FTW_02    <= { DAC_PARA_FTW[32],   7'h31,   DAC_PARA_FTW[15:8] };     // 配置FTW    
            REG_FTW_03    <= { DAC_PARA_FTW[32],   7'h32,   DAC_PARA_FTW[23:16]};     // 配置FTW    
            REG_FTW_04    <= { DAC_PARA_FTW[32],   7'h33,   DAC_PARA_FTW[31:24]};     // 配置FTW高位  
            
            REG_FTW_UP01  <= { 1'b0,   7'h36,   8'h01};     // 更新FTW    
            REG_FTW_UP00  <= { 1'b0,   7'h36,   8'h00};     // 更新FTW    
        end
        
    end
end


always@(posedge clk)
begin
    if(rst_r2)begin
        stt_time    <= 32'd0;
        spi_start   <= 1'b0;
        spi_data    <= 15'd0;
        state       <= STT_IDLE;
    end
    else begin
        case(state)
//////////// 空闲 -> 复位 ////////////////////////
        STT_IDLE : begin      
            if(stt_time<DLY_TIME)begin
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_RST_SET;
            end
        end
////////////////// 复位 -> 清复位 ////////////////
        STT_RST_SET : begin    
            if(stt_time<SET_TIME)begin          // 等待2秒
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_RST_CLR;
            end            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_RST_SET;
            end else begin
                spi_start <= 1'b0;
                spi_data  <= spi_data;
            end
        end
                      
///////////////// 配置NCO -> 更新FTW ///////////////////////////
        STT_RST_CLR : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_01;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_RST_CLR;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
/////////////////////////////////////////////////////////////////////////////////////
        STT_REG_01 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_02;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_01;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
        
        STT_REG_02 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_03;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_02;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_03 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_04;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_03;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_04 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_05;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_04;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_05 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_06;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_05;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_06 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_07;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_06;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_07 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_08;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_07;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_08 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_09;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_08;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_09 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_10;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_09;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_10 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_11;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_10;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_11 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_12;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_11;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_12 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_13;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_12;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_13 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_14;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_13;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_14 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_15;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_14;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_15 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_16;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_15;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_16 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_17;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_16;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_17 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_18;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_17;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_18 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_19;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_18;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_19 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_REG_20;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_19;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

        STT_REG_20 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_FTW_01;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_20;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end

/////////////////////////////////////////////////////////////////////////////////////
        STT_FTW_01 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_FTW_02;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_FTW_01;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
        
        STT_FTW_02 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_FTW_03;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_FTW_02;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
        
        STT_FTW_03 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_FTW_04;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_FTW_03;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
        
        STT_FTW_04 : begin      
            if(stt_time<DLY_TIME)begin            
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_FTW_UP01;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_FTW_04;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
             
        STT_FTW_UP01 : begin
            if(stt_time<DLY_TIME)begin
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_FTW_UP00;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_FTW_UP01;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
        STT_FTW_UP00 : begin
            if(stt_time<DLY_TIME)begin
                stt_time    <= stt_time + 32'd1;
                state       <= state;
            end else begin
                stt_time    <= 32'd0;
                state       <= STT_END;
            end
            
            if(stt_time==32'd1)begin
                spi_start   <= 1'b1;
                spi_data    <= REG_FTW_UP00;
            end else begin
                spi_start   <= 1'b0;
                spi_data    <= spi_data;
            end
        end
        STT_END : begin
            stt_time    <= 32'd0;
            spi_start   <= 1'b0;
            spi_data    <= 32'd0;
            state       <= STT_END;
        end
        default : begin
            stt_time    <= 32'd0;
            spi_start   <= 1'b0;
            spi_data    <= 32'd0;
            state       <= STT_IDLE;
        end
        endcase
    end
end

assign  SPI_Start   = spi_start;
assign  SPI_DATA_IN = spi_data;
   
endmodule

