`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/18 14:38:53
// Design Name: 
// Module Name: timing_gen
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


module timing_gen(
    input clk,                  //工作时钟
    input enable,               //工作使能
    input [7:0] mode_t,         // 工作模式
    
    input [15:0]fpga_gpio,
    
    output cpib,         //脉组起始
    output cpie,         //脉组结束
    output pri,          //触发脉冲
    output sync,          //模拟信号同步输出
    output fiber,
    output cpib_delay,
    output reg[31:0]pri_p_cnt,
    output reg[15:0]num_cpi,
    output [9:0] pri_num        //pri号

);
parameter clk_freq_cnt = 120000000, clk_1us_cnt = 120 ,clk_2us_cnt = 240 ,clk_0p1us_cnt = 12 ;
parameter pri_param1 = 513, pulse_w1 = 370; 
reg enable_r;
reg enable_rr;
reg enable_rrr;

reg [31:0] cpi_p_cnt ;
reg [31:0] pri_p_cnt ;
reg [15:0] cpie_w_cnt;// cpie 对应脉冲宽度计数器

reg pri_reg;
reg cpib_reg;
reg cpib_delay_reg;
reg cpie_reg;
reg sync_reg;
reg fiber_reg;
reg [8:0]tr_reg;
// 根据mode_t 对应不同的值
reg [31:0] cpib_e_p;  //当前脉组帧的CPIB到CPIE信号的时钟数 
reg [31:0] cpi_p;  // 两个相邻CPIB/E的时钟数，对应CPI周期
reg [31:0] pri_p;  // 两个相邻PRI的时钟数，对应PRI周期
reg [31:0] sync_delay;  // sync 相对于pri的延迟时钟
reg [9:0] pri_num_reg;
reg [7:0] mode_t_r;
//wire [9:0] sync_param;     //设置sync同步延时时间
wire [15:0] sync_param;     //设置sync同步延时时间
wire [31:0] idle;   //////cpie到下一个cpib空闲时间
reg [9:0]idle_t = 0;
//assign sync_param = 8'd150;
vio_sync vio_sync_inst (
  .clk(clk),                // input wire clk
  .probe_out0(sync_param),  // output wire [7 : 0] probe_out0
  .probe_out1(idle)  // output wire [7 : 0] probe_out0
);
//reg [9:0]idle= 10'd250;   //////cpie到下一个cpib空闲时间
always@(posedge clk)
begin
    enable_r   <= enable;
    enable_rr  <= enable_r;
    enable_rrr <= enable_rr;
    
    mode_t_r        <= mode_t;
    
if(fpga_gpio[7]) 
   begin 
    cpib_e_p      <= clk_1us_cnt*pri_param1*pulse_w1;
//    cpi_p         <= clk_1us_cnt*pri_param1*pulse_w1+clk_1us_cnt*idle;
    cpi_p         <= clk_1us_cnt*pri_param1*pulse_w1+clk_0p1us_cnt*idle;
    pri_p         <= clk_1us_cnt*pulse_w1;
    tr_reg        <= pulse_w1;
    sync_delay    <= clk_0p1us_cnt*sync_param;
    end
else 
   begin
    cpib_e_p      <= clk_1us_cnt*pri_param1*pulse_w1;
    cpi_p         <= clk_1us_cnt*pri_param1*pulse_w1+clk_1us_cnt*idle_t;
    pri_p         <= clk_1us_cnt*pulse_w1;
    tr_reg        <= pulse_w1;
    sync_delay    <= clk_0p1us_cnt*sync_param;
   end
end 

//cpi_p_cnt 在CPI内循环计数
 always@(posedge clk)
 begin
     if(enable_rrr) 
       if(cpi_p_cnt < cpi_p)
            cpi_p_cnt <= cpi_p_cnt + 1;
       else
            cpi_p_cnt <= 32'h1;
     else
         cpi_p_cnt <= 32'h0;
 end 
 // ****** 20210307
reg [15:0]num_cpi;
wire [15:0]test_num;
reg [15:0]test_num1;
vio_1 your_instance_name (
  .clk(clk),                // input wire clk
  .probe_out0(test_num)  // output wire [15 : 0] probe_out0
);

    

 always@(posedge clk)
 begin
 test_num1 <= test_num;
    if(cpi_p_cnt == 2)
    num_cpi <= num_cpi + 1;
    else if (num_cpi == test_num || (test_num1 != test_num))
    num_cpi <= 0;
    else
    num_cpi <= num_cpi;
 end
    




//pri_p_cnt 在PRI内循环计数
   always@(posedge clk)
 begin
     if(enable_rrr) 
       if(cpi_p_cnt == cpi_p)
            pri_p_cnt <= 32'd1;
       else
            if((pri_p_cnt < pri_p)&&(pri_p_cnt> 0))
                  pri_p_cnt <= pri_p_cnt + 1;
             else
//                if (cpi_p_cnt <= cpib_e_p)
                if (cpi_p_cnt < cpib_e_p)
                     pri_p_cnt <= 32'h1;
                else
                     pri_p_cnt <= 32'h0;        //cpi_p>cpib_e_p时(CPI有空闲时间)，pri_p_cnt为0
     else
         pri_p_cnt <= 32'h0;
 end   
 
     always@(posedge clk)
     begin
     // 生成cpib信号
//        if((cpi_p_cnt>0)&&(cpi_p_cnt<=clk_2us_cnt*50)) 
        if((cpi_p_cnt>0)&&(cpi_p_cnt<=clk_2us_cnt)) 
            cpib_reg <= 1'b1;
        else
            cpib_reg <= 1'b0;
            
   // 生成cpib_delay信号
           if((cpi_p_cnt>pri_p)&&(cpi_p_cnt<=clk_2us_cnt+pri_p)) 
               cpib_delay_reg <= 1'b1;
           else
               cpib_delay_reg <= 1'b0;
     // 生成cpie信号                                    
        if(cpi_p_cnt == cpib_e_p)    
            cpie_w_cnt <= 16'd1;
        else
            if((cpie_w_cnt>0)&&(cpie_w_cnt<clk_2us_cnt*50))                
                cpie_w_cnt  <= cpie_w_cnt + 16'd1;
            else
                cpie_w_cnt <= 16'd0;
           
        if((cpie_w_cnt>0)&&(cpie_w_cnt<=clk_2us_cnt*50)) 
              cpie_reg <= 1'b1;
        else
              cpie_reg <= 1'b0;       
         //生成pri信号
          if((pri_p_cnt>0)&&(pri_p_cnt<=clk_2us_cnt)) 
                  pri_reg <= 1'b1;
          else
                  pri_reg <= 1'b0;       
         
         //生成sync信号    
           if((pri_p_cnt>sync_delay)&&(pri_p_cnt<=(sync_delay + clk_2us_cnt))) 
                  sync_reg <= 1'b1;
           else
                  sync_reg <= 1'b0;             
                            
     end 
     //生成pti_num信号
     always@(posedge clk)
     begin 
         if (cpi_p_cnt == 32'h1)
            pri_num_reg <= 10'b1;
         else if (pri_p_cnt == 32'h1 )
            pri_num_reg <= pri_num_reg + 1'b1;
         else
            pri_num_reg <= pri_num_reg;
     end
     //生成光纤上行信号
//    always@(posedge clk)
//     begin
//         if(!enable_rrr )
//            fiber_reg <= 1'b0;
//         else 
//         begin  
//             if (pri_num_reg == 10'd1)
//             begin
//                if( (pri_p_cnt > (clk_1us_cnt * (tr_reg-20) ) )&&(pri_p_cnt<=(clk_1us_cnt * (tr_reg-18))))
//                    fiber_reg <= 1'b1;
//                else
//                    fiber_reg <= 1'b0;
//             end
//             else
//                 fiber_reg <= fiber_reg;
//          end
//     end

     always@(posedge clk)
     begin
        if((cpi_p_cnt> (cpi_p-clk_1us_cnt*20))&&(cpi_p_cnt<=(cpi_p-clk_1us_cnt*18))) 
            fiber_reg <= 1'b1;
        else
            fiber_reg <= 1'b0;
      end
            
            
            
assign     cpib   = cpib_reg;
assign     cpie   = cpie_reg;
assign     pri    = pri_reg;
assign     sync   = sync_reg;
assign     pri_num   = pri_num_reg;
assign     fiber   = fiber_reg;
assign     cpib_delay = cpib_reg;
    
endmodule

