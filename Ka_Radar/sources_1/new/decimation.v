`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/10 18:04:11
// Design Name: 
// Module Name: decimation
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


module decimation(
    input clk_120m,
    input [15:0]data_ddc_I,
    input [15:0]data_ddc_Q,
  
    input rst_n,
    
    output [15:0]data_I,
    output [15:0]data_Q

    );
reg [1:0]cnt = 0;

    reg [15:0]data_I_1;
    reg [15:0]data_Q_1;
always@(posedge clk_120m)
begin
    if( !rst_n )
        cnt <= 0;
    else if(cnt < 2'd3)
        cnt <= cnt + 1;
    else
        cnt <= 0;
end

always@(posedge clk_120m)
begin
    if( !rst_n )
    begin
        data_I_1 <= 0;
        data_Q_1 <= 0;
    end
    else if(cnt == 2'd3)
    begin
        data_I_1 <= data_ddc_I;
        data_Q_1 <= data_ddc_Q;
    end
    else
    begin
        data_I_1 <= 0;
        data_Q_1 <= 0;
    end
end    
assign data_I = data_I_1; 
assign data_Q = data_Q_1; 
endmodule
