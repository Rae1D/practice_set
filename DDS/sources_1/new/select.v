`timescale 1ns / 1ps
module select(
    input clk,  //10k
    input ctrl_dis,
    input [3:0] dis_the4,//理论值显示位
    input [3:0] dis_real4,//实际值显示位
    input [13:0] dis_all,
    input [7:0] p,  //4+4
    input [13:0] q,
    output reg [7:0] dis_dig,
    output reg [13:0] dis_num
    );
    always @(posedge clk)  
     begin
     case(ctrl_dis)
     0:begin    dis_dig<={dis_the4,dis_real4};  dis_num<=dis_all;end
     1:begin    dis_dig<=p; dis_num<=q;end
     default:begin    dis_dig<={dis_the4,dis_real4};  dis_num<=dis_all;end
     endcase
     end
endmodule
