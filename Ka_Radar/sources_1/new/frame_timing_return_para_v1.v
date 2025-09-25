`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/05 00:02:53
// Design Name: 
// Module Name: frame_ddc_data_v1
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


module frame_timing_return_para_v1(
  input  clk,//
  input  enable,
  input  frame_en,
  input [15:0]  frame_word_length,//报文长度  
// ram 读控制
  output reg data_ram_rd ,
  output reg [8:0] data_ram_addr, 
  input [63:0] data_ram_dout,
 // 组帧输出
  output reg[0:63] data_frame,
  output reg data_frame_valid,
  output reg data_frame_last   // 帧尾指示

    );
    
    reg [15:0] frame_type = 16'h0002;    
    reg [15:0] frame_length ;    
    reg [15:0] frame_dst_addr = 16'h0000;
    reg [15:0] frame_src_addr = 16'h0000;
    reg[15:0] frame_cnt ;
    reg[63:0] data_ram_dout_reg ;
    reg frame_en_r;
    reg frame_en_rr;
    reg frame_en_rrr;
    reg enable_r;
    reg enable_rr;
  
    
        
    always@(posedge clk)
       begin
        frame_en_r  <= frame_en;
        frame_en_rr <= frame_en_r;
        frame_en_rrr <= frame_en_rr;
              
        enable_r <= enable;
        enable_rr <= enable_r;
        
        if(enable_rr==1'b1) 
             begin
                  data_ram_dout_reg <= data_ram_dout;                         
                if((frame_en_rrr==1'b0)&&(frame_en_rr==1'b1)) // 在frame_en上升沿的时候对frame_cnt 清零
                begin
                    frame_cnt <= 16'd1;
                    if(frame_word_length[1:0]==0)
                        frame_length <=  frame_word_length[15:2];
                    else    
                        frame_length <= frame_word_length[15:2]+1;
                 end    
                else
                    if((frame_cnt>0)&&(frame_cnt <=frame_length))
                       frame_cnt <= frame_cnt + 1;
                    else
                       frame_cnt <= 16'd0; 
               //
                 //当数据有效的时候
                  if((frame_cnt == 16'd1))   
                   begin 
                       data_frame  <= 64'hA5A5123401020304;  
                       data_frame_valid <= 1'b1; 
                       data_frame_last <= 1'b0;  
                   end
                  else if((frame_cnt == 16'd2))    
                  begin 
                      data_frame  <= {frame_type,{frame_word_length - 16'h4} ,frame_dst_addr,frame_src_addr}; 
                      data_frame_valid <= 1'b1;
                      data_frame_last <= 1'b0; 
                  end  
                  else if((frame_cnt>2)&&(frame_cnt <=frame_length))    
                  begin 
     
                     data_frame  <= data_ram_dout; 
                     data_frame_valid <= 1'b1; 
                     if(frame_cnt == frame_length)
                       data_frame_last <= 1'b1; 
                     else
                       data_frame_last <= 1'b0; 
                                                                       
                  end 
                  else   
                        begin 
                            data_frame  <=64'h0; 
                            data_frame_valid <= 1'b0; 
                            data_frame_last <= 1'b0;  
                        end  
                  if((frame_cnt>0)&&(frame_cnt<=frame_length)) 
                  begin
                      data_ram_rd   <= 1'b1;
                      data_ram_addr <= frame_cnt - 1 ;
                  end
                  else
                  begin
                      data_ram_rd <= 1'b0;    
                      data_ram_addr <= 8'h0;
                  end     
                 
                
            end 
         else
             begin
                     frame_cnt    <= 16'd0;
                     data_ram_rd <= 1'b0;
                     data_ram_addr <= 11'd0;
                     data_frame   <=64'h0;
                     data_frame_valid <= 1'b0;
                     data_frame_last  <= 1'b0;
             end       
       end 
        
        
    endmodule