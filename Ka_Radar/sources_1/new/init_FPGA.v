`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/18 15:56:21
// Design Name: 
// Module Name: init_FPGA
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


module init_FPGA(
    input  clk_200m,
    input  locked,
    input  gpio_3,
    input  gpio_2,
    output FPGA_nRESET,
    output init_en,
    output FPGA_EN
    
);

reg [19:0]cnt_1ms;
always@(posedge clk_200m)
begin
if(!locked || !gpio_3)
begin
    cnt_1ms <= 0;
end
else if(cnt_1ms < 20'd200000)               
//else if(cnt_1ms < 20'd200)
begin
    cnt_1ms <= cnt_1ms +1;
end
else
begin    
    cnt_1ms <= 1;
end
end

reg [15:0]cnt_3000ms;
always@(posedge clk_200m) 
begin
if(!locked || !gpio_3)
begin
    cnt_3000ms <= 0;
end
else if(cnt_3000ms < 16'd3000 && cnt_1ms == 20'd1)
begin
    cnt_3000ms <= cnt_3000ms +1;
end
else if(cnt_3000ms == 16'd3000)
begin    
    cnt_3000ms <= 16'd7000;
end
else 
    cnt_3000ms <= cnt_3000ms;
//    else     cnt_3000ms <= 16'd7000;
    
    
end

//////////////////////////////FPGA_Reset/////////////////////////////////////////
reg rst_n;    
always@(posedge clk_200m)
begin
if(!locked || !gpio_3)
begin
    rst_n <= 0;
end
else if(cnt_3000ms <= 16'd3000)         
begin
    rst_n <= 0;
end
else
    rst_n <= 1;
end
assign FPGA_nRESET = rst_n;
//////////////////////////////init_en/////////////////////////////////////////
reg init_en_reg;
always@(posedge clk_200m)
begin
if(!locked || !gpio_3)
begin
    init_en_reg <= 0;
end
else
    //if(cnt_6200ms > 200 && cnt_6200ms <= 16'd6200) //初始化时间为6s（0321版本）
    if(cnt_3000ms > 200 && cnt_3000ms <= 16'd2200) //2初始化时间设置为2s（0325版本）
        init_en_reg <= 1;
    else
        init_en_reg <= 0;
end
assign init_en = init_en_reg;
////////////////////////signal 'FPGA_EN' (wait for 'gpio_2')/////////////////////
reg work_en_temp;
always@(posedge clk_200m)
begin
if(!rst_n)
begin
    work_en_temp <= 0;
end
else if((!init_en) && (gpio_2))
    begin
        work_en_temp <= 1;
    end
    else
    begin
        work_en_temp <= 0;
    end
end
assign FPGA_EN = work_en_temp;





//ila_init ila_init_inst(
//    .clk(clk_200m),
//    .probe0(init_en),
//    .probe1(gpio_2),
//    .probe2(gpio_3),
//    .probe3(FPGA_EN),
//    .probe4(rst_n),
//    .probe5(locked)
//);

endmodule
