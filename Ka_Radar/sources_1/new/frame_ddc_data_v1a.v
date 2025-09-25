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


module frame_ddc_data_v1a(
  input  clk,//光纤用户时钟
  input  enable,//组帧使能
  input  pri,
  input [15:0]  data_length,//1个PRI存储的数据长度  
// ram 读控制
  output reg data_ram_rd ,
  output reg [13:0] data_ram_addr, 
  input [127:0] data_ram_dout,
 // 组帧输出
  output reg[0:63] data_frame,
  output reg data_frame_valid,
  output reg data_frame_last   // 帧尾指示

    );
    
    reg [15:0] frame_type = 16'h0001;    
    (* MARK_DEBUG="true" *) reg [15:0] frame_length ;    
    reg [15:0] frame_dst_addr = 16'h0000;
    reg [15:0] frame_src_addr = 16'h0000;
    (* MARK_DEBUG="true" *) reg[15:0] frame_cnt ;
    reg pri_r;
    reg pri_rr;
     (* MARK_DEBUG="true" *)reg pri_rrr;
    reg enable_r;
     (* MARK_DEBUG="true" *)reg enable_rr;
    (* MARK_DEBUG="true" *)reg[15:0] data_1_I_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_1_Q_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_2_I_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_2_Q_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_3_I_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_3_Q_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_4_I_r; 
    (* MARK_DEBUG="true" *)reg[15:0] data_4_Q_r; 
    
    
    reg [15:0] data_length_r=370*30;
    reg [15:0] data_length_rr=370*30;       
    always@(posedge clk)
       begin
        pri_r  <= pri;
        pri_rr <= pri_r;
        pri_rrr <= pri_rr;
        if(enable==1'b1) 
             begin

                 data_1_I_r    <= data_ram_dout[127:112];      
                 data_1_Q_r    <= data_ram_dout[111:96];
                 data_2_I_r    <= data_ram_dout[95:80];
                 data_2_Q_r    <= data_ram_dout[79:64];
                 data_3_I_r    <= data_ram_dout[63:48];      
                 data_3_Q_r    <= data_ram_dout[47:32];
                 data_4_I_r    <= data_ram_dout[31:16];
                 data_4_Q_r    <= data_ram_dout[15:0];
                            
                            
                if((pri_rrr==1'b0)&&(pri_rr==1'b1)) // 在pri上升沿的时候对frame_cnt 清零
                begin
                    frame_cnt <= 16'd1;
                   
                   // data_length_r <=  data_length;
                    data_length_rr <=  data_length;
                end 
                else
                    if((frame_cnt>0)&&(frame_cnt <({data_length_rr[14:0],1'b0}+16'd4)))
                       frame_cnt <= frame_cnt + 1;
                    else
                       frame_cnt <= 16'd0; 
               //
                 //当数据有效的时候
                  if((frame_cnt == 16'd2))   
                   begin 
                       data_frame  <= 64'hA5A5123401020304;  
                       data_frame_valid <= 1'b1; 
                       frame_length <= data_length_rr ;
                       data_frame_last <= 1'b0;  
                   end
                  else if((frame_cnt == 16'd3))    
                  begin 
                      data_frame  <= {frame_type, frame_length,frame_dst_addr,frame_src_addr}; 
                      data_frame_valid <= 1'b1;
                      data_frame_last <= 1'b0; 
                  end  
                  else if((frame_cnt>3)&&(frame_cnt <({data_length_rr[14:0],1'b0}+16'd4)))    
                  begin 
                      if(frame_cnt[0]== 2'b0)
                       begin
                          data_frame  <= {data_1_I_r,data_1_Q_r,data_2_I_r,data_2_Q_r}; 
                          data_frame_valid <= 1'b1; 
                          data_frame_last <= 1'b0;  
                       end            
                        else  if(frame_cnt[0]== 2'b1)
                             begin
                                data_frame  <= {data_3_I_r,data_3_Q_r,data_4_I_r,data_4_Q_r}; ; 
                                 data_frame_valid <= 1'b1; 
                                 if(frame_cnt ==({data_length_rr[14:0],1'b0}+16'd3))
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
                  end 
                  else   
                        begin 
                            data_frame  <=64'h0; 
                            data_frame_valid <= 1'b0; 
                            data_frame_last <= 1'b0;  
                        end  
                  if(frame_cnt[0] == 1'b1) 
                  begin
                      data_ram_rd   <= 1'b1;
                      data_ram_addr <= frame_cnt[14:1];
                  end
                  else
                  begin
                      data_ram_rd <= 1'b0;    
                      data_ram_addr <= data_ram_addr;
                  end     
                 
                
            end 
         else
             begin
                     frame_cnt    <= 16'd0;
                     data_ram_rd <= 1'b0;
                     data_ram_addr <= 14'd0;
                     data_frame   <=64'h0;
                     data_frame_valid <= 1'b0;
                     data_frame_last  <= 1'b0;
             end       
       end 
        
        
    endmodule