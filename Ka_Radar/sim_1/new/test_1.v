`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/18 15:17:05
// Design Name: 
// Module Name: test_1
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


module test_1( );
    reg  clk;         
    reg  enable;      
    reg  [7:0] mode_t;
    
    wire cpib;         
    wire cpie;         
    wire pri;          
    wire sync;         
    wire fiber;        
    wire [9:0] pri_num;
    
    wire [31:0] cpi_p_cnt; 
    wire [31:0] pri_p_cnt; 
    wire [15:0] cpie_w_cnt;
    wire [31:0] cpib_e_p;  
    wire [31:0] cpi_p;     
    wire [31:0] pri_p;     
    wire [31:0] sync_delay;
    wire [8:0]tr_reg;
    
    
    timing_gen tt(
       .clk(clk),              
       .enable(enable),            
       .mode_t(mode_t),      
                      
       .cpib(cpib),              
       .cpie(cpie),              
       .pri(pri),              
       .sync(sync),              
       .fiber(fiber),             
       .pri_num(pri_num),     
                       
       .cpi_p_cnt(cpi_p_cnt),  
       .pri_p_cnt(pri_p_cnt),  
       .cpie_w_cnt(cpie_w_cnt), 
       .cpib_e_p(cpib_e_p),   
       .cpi_p(cpi_p),      
       .pri_p(pri_p),      
       .sync_delay(sync_delay),
       .tr_reg(tr_reg)      

    );     
    
    initial 
      begin
         clk = 0;
         enable = 0;
         mode_t = 1;
         #100;
         enable = 1;
      end
      
     always #1 clk = ~clk; 
   

endmodule
