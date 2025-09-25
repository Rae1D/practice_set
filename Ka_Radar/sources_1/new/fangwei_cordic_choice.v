`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/13 16:48:22
// Design Name: 
// Module Name: fangwei_cordic_choice
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


module fangwei_cordic_choice(
input clk,
input c,
input phase_data,

output cormic_data_real,
output cormic_data_image
    );
        reg cormic_data_real_1;
    reg cormic_data_image_1;
  always@(posedge clk)                    
begin                                        
if(c == 7'd1)   
   begin                                     
   cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
 end
     else if (c == 7'd2)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd3)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd4)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd5)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd6)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd7)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd8)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd9)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd3)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd4)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd5)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd6)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd7)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd8)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd9)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd10)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd11)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd12)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd13)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd14)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd15)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd16)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd17)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd18)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd19)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd20)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd21)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd22)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd23)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd24)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd25)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd26)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd27)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd28)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd29)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd30)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd31)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd32)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd33)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd34)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd35)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd36)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd37)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd38)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd39)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd40)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd41)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd42)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd43)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd44)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else if (c == 7'd45)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd46)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd47)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
 else if (c == 7'd48)   
   begin                               
    cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;  
end 
else          
      begin                                  
   cormic_data_real_1 <=  16'b0000000000000000;    
   cormic_data_image_1<=  16'b0000000000000000;                              
   end    
   end  
  assign cormic_data_real = cormic_data_real_1;
  assign  cormic_data_image  =cormic_data_image_1;      
endmodule
