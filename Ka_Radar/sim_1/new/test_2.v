`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/18 16:04:54
// Design Name: 
// Module Name: test_2
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


module test_2( );
   reg  clk_200m;        
   reg  locked;          
   reg  gpio_3;          
   reg  gpio_2;          
   wire FPGA_nRESET;     
   wire init_en;         
   wire FPGA_EN;         
 
   wire [19:0]cnt_1ms;   
   wire [15:0]cnt_6200ms;
   
   init_FPGA  ttt(
       .clk_200m(clk_200m),        
       .locked(locked),        
       .gpio_3(gpio_3),        
       .gpio_2(gpio_2),        
       .FPGA_nRESET(FPGA_nRESET),     
       .init_en(init_en),         
       .FPGA_EN(FPGA_EN),         
                     
       .cnt_1ms(cnt_1ms),  
       .cnt_6200ms(cnt_6200ms)
   );
   
   initial 
     begin 
       clk_200m = 0;
       locked = 0;
       gpio_3 = 0;
       gpio_2 = 0;
       #100;
      locked = 1;
       #100;
       gpio_3 = 1;
       gpio_2 = 1;
       #30000000;
       gpio_3 = 0;
       gpio_2 = 0;
       #1000;
       gpio_3 = 1;
       gpio_2 = 1;      
       end
     
     always #10 clk_200m = ~clk_200m;  
       
endmodule
