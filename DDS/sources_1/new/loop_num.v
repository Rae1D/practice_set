`timescale 1ns / 1ps

module loop_num(
    input clk,
    output reg[7:0] p,  //4+4
   output reg [13:0] q  //7+7
   );
   
   reg clk_div_1;
   reg clk_div_2;
   parameter div_1=13'd5000;
   parameter div_2=27'd5000_0000;
   reg [15:0] cnt1=0;  //分频计数
   reg [33:0] cnt2=0;
   
   initial begin
   clk_div_1<=0;
   clk_div_2<=0;
   end
   //10kHz 信号输出
   always @(posedge clk)
   begin
    if(cnt1>=div_1)
    begin
    cnt1<=0;
    clk_div_1<=~clk_div_1;
    end 
    else
    begin
    cnt1<=cnt1+1;
    end
    end
    //1Hz 信号输出 
    always @(posedge clk)
     begin
     if(cnt2>=div_2)
     begin
     cnt2<=0;
     clk_div_2<=~clk_div_2;
     end 
     else
     begin
     cnt2<=cnt2+1;
     end
     end
      
   reg[7:0] p0=8'b1000_0000;
   reg[7:0] p1=8'b0100_0000;
   reg[7:0] p2=8'b0010_0000;
   reg[7:0] p3=8'b0001_0000;
   reg[7:0] p4=8'b0000_1000;
   reg[7:0] p5=8'b0000_0100;
   reg[7:0] p6=8'b0000_0010;
   reg[7:0] p7=8'b0000_0001;
 
   reg[2:0] sel=0;    //选择哪一位显示
//  parameter div1=50000;  //分频数

//  parameter div2=100000000; 
   
always@(posedge clk_div_1) //显示
    begin
        sel=sel+1;          
   end
   
   always@(posedge clk_div_2) //显示，循环右移
    begin
//                        cnt2<=0;
    p0<=p1;
    p1<=p2;
    p2<=p3;
    p3<=p4;
    p4<=p5;
    p5<=p6;
    p6<=p7;
    p7<=p0;           
                 
   end
   
   always@(posedge clk_div_1)
   begin
       case(sel)
       0:begin q<=14'b1011111_1011111;    p<=p0;    end//6 
       1:begin q<=14'b1111111_1111111;    p<=p1;    end//8 
       2:begin q<=14'b1111110_1111110;    p<=p2;    end//0 
       3:begin q<=14'b0110000_0110000;    p<=p3;     end //1 
       4:begin q<=14'b0110000_0110000;    p<=p4;     end //1 
       5:begin q<=14'b1111110_1111110;    p<=p5;     end //0
       6:begin q<=14'b1111110_1111110;    p<=p6;     end //0
       7:begin q<=14'b1101101_1101101;    p<=p7;     end //2
       default:begin   q<=14'b0000000_0000000;  p<=0000_0000;    end
       endcase
   end
endmodule
