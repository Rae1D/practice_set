`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 20:09:37
// Design Name: 
// Module Name: pre_pro_fiber_rx
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

//控制指令报文
module pre_pro_fiber_rx(
// 缓存ram读控制和状态指示
    input clk,   
    input[10:0] ram_addr_rx,
    output[15:0] ram_dout_rx,
    input ram_rd,    
    output reg [15:0] cmd_frame_length, //控制指令长度
    output reg cmd_valid,// 指令报文有效脉冲  目前只持续了一个时钟
    
    
    // 光纤接收数据接口
    input fiber_clk, 
    input enable,
    input [0:63]     fiber_rx_tdata,      
    input            fiber_rx_tvalid,       
    input[0:7]       fiber_rx_tkeep,        
    input            fiber_rx_tlast,         
    input            crc_pass_fail_n,         
    input            crc_valid        
       
    
    );
    
      
      reg [0:63] fiber_rx_tdata_reg  ;
      reg fiber_rx_tvalid_reg;
      reg fiber_rx_tlast_reg;
      reg [15:0] frame_cnt;
      reg enable_r;
      reg enable_rr;
      reg[15:0] frame_type;
      reg[15:0] frame_word_length;
      reg fiber_rx_tdata_ctrl_valid;
    
    
     
        always@(posedge fiber_clk)
        begin
         enable_r <= enable;
         enable_rr <= enable_r;
         fiber_rx_tdata_reg <= fiber_rx_tdata;
         fiber_rx_tvalid_reg <= fiber_rx_tvalid;
         fiber_rx_tlast_reg <= fiber_rx_tlast;
         if(enable_rr)
         begin
             if((fiber_rx_tdata_reg ==  64'hA5A5123401020304)&&(fiber_rx_tvalid_reg ==1'b1)) // 找到帧头开始计数
                 frame_cnt <= 16'd1;
             else if (fiber_rx_tvalid_reg ==1'b1 && frame_cnt > 0)
                 frame_cnt <= frame_cnt + 16'd1;
             
             if((frame_cnt == 16'd1)&&(fiber_rx_tvalid_reg ==1'b1))  // 判断 数据类型和帧长度
             begin
                 frame_type   <= fiber_rx_tdata_reg[0:15];
                 frame_word_length <= fiber_rx_tdata_reg[16:31];
                 if(fiber_rx_tdata_reg[0:15]==16'd1)
                     fiber_rx_tdata_ctrl_valid <= 1'b1;
                 else
                     fiber_rx_tdata_ctrl_valid <= 1'b0;
             end 
             else
             begin
                 if((fiber_rx_tlast_reg == 1'b1)&&(fiber_rx_tvalid_reg ==1'b1))
                      fiber_rx_tdata_ctrl_valid <= 1'b0;
                 else
                     fiber_rx_tdata_ctrl_valid <= fiber_rx_tdata_ctrl_valid;
             end
                    
          end 
         else
             begin
                 frame_cnt <= 16'd0;            
             end 
        end
        
        
        reg wea;
        reg enb;
        reg [12:0] addra;
        reg [10:0] addrb;
        reg [63:0] dina;  

        
        always@(posedge fiber_clk)
        begin
         wea   <= fiber_rx_tdata_ctrl_valid& fiber_rx_tvalid_reg;
         //dina  <= fiber_rx_tdata_reg;
         dina  <= {fiber_rx_tdata_reg[48:63],fiber_rx_tdata_reg[32:47],fiber_rx_tdata_reg[16:31],fiber_rx_tdata_reg[0:15]};
         addra <= frame_cnt-16'd2;
        end 
    
    blk_ram_64_16  blk_ram_64_16_inst(
      .clka(fiber_clk),    // input wire clka
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [7 : 0] addra
      .dina(dina),    // input wire [63 : 0] dina
      .clkb(clk),    // input wire clkb
      .enb(ram_rd),      // input wire enb
      .addrb(ram_addr_rx),  // input wire [9 : 0] addrb
      .doutb(ram_dout_rx)  // output wire [15 : 0] doutb
    );
    // 输出信号同步
    
    reg fiber_rx_tdata_ctrl_valid_r;
    reg fiber_rx_tdata_ctrl_valid_rr;
    reg[15:0] cmd_frame_length_r;
    reg[15:0] cmd_frame_length_rr;
      always@(posedge clk)
          begin          
            fiber_rx_tdata_ctrl_valid_r  <= fiber_rx_tdata_ctrl_valid;
            fiber_rx_tdata_ctrl_valid_rr <= fiber_rx_tdata_ctrl_valid_r;
            if((fiber_rx_tdata_ctrl_valid_rr == 1'b1)&&(fiber_rx_tdata_ctrl_valid_r == 1'b0)) // 下降沿有效
                cmd_valid <= 1'b1;
            else   
                cmd_valid <= 1'b0;
              
              
            cmd_frame_length_r <=   frame_word_length;
            cmd_frame_length_rr <=   cmd_frame_length_r;
            
            if(cmd_frame_length_r==cmd_frame_length_rr)
                cmd_frame_length <= cmd_frame_length_rr;
            else
                cmd_frame_length <= cmd_frame_length;
                
          end 
   
    
    
endmodule
