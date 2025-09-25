`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/31 11:46:42
// Design Name: 
// Module Name: cut_ctl_top
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

// 智能数据截断控制器，用于将32位输入数据动态截断为16位输出（降低精度），同时提供溢出检测和保护机制
module cut_ctl_top
#(parameter LEN=32)

(   input clk,
    input [LEN-1:0]data_i,
    input [LEN-1:0]data_q,
    input in_valid,
    input [2:0]cut_ctl,
    
    output [15:0]data_out_i,
    output [15:0]data_out_q,
    output out_valid
    );
    
///////////////////////////////////////////////////////  
reg [15:0]positive = 16'h0000;
reg [15:0]negative = 16'hffff;
reg [15:0]data_out_i_t;
reg [15:0]data_out_q_t;
reg in_valid_t;
always@(posedge clk)
begin
    in_valid_t <= in_valid;
end 

always@(posedge clk)
begin
    case(cut_ctl)
        0:  begin
                 if(data_i[LEN-1:LEN-2] == positive[1:0] || data_i[LEN-1:LEN-2] == negative[1:0])  
                     data_out_i_t <= {data_i[LEN-1],data_i[LEN-3:LEN-17]}; 
                 else 
                     data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end 
        1:  begin
                if(data_i[LEN-1:LEN-3] == positive[2:0] || data_i[LEN-1:LEN-3] == negative[2:0])
                    data_out_i_t <= {data_i[LEN-1],data_i[LEN-4:LEN-18]};
                else
                    data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        2:  begin
                if(data_i[LEN-1:LEN-4] == positive[3:0] || data_i[LEN-1:LEN-4] == negative[3:0])
                    data_out_i_t <= {data_i[LEN-1],data_i[LEN-5:LEN-19]};
                else
                    data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        3:  begin
                if(data_i[LEN-1:LEN-5] == positive[4:0] || data_i[LEN-1:LEN-5] == negative[4:0])
                    data_out_i_t <= {data_i[LEN-1],data_i[LEN-6:LEN-20]};
                else
                    data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        4:  begin
                if(data_i[LEN-1:LEN-6] == positive[5:0] || data_i[LEN-1:LEN-6] == negative[5:0])
                    data_out_i_t <= {data_i[LEN-1],data_i[LEN-7:LEN-21]};
                else
                    data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        5:  begin
                if(data_i[LEN-1:LEN-7] == positive[6:0] || data_i[LEN-1:LEN-7] == negative[6:0])
                    data_out_i_t <= {data_i[LEN-1],data_i[LEN-8:LEN-22]};
                else
                    data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        6:  begin
                if(data_i[LEN-1:LEN-8] == positive[7:0] || data_i[LEN-1:LEN-8] == negative[7:0])
                    data_out_i_t <= {data_i[LEN-1],data_i[LEN-9:LEN-23]};
                else
                    data_out_i_t <= {data_i[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        default:    data_out_i_t <= {data_i[LEN-1:LEN-16]}; 
    endcase
end

always@(posedge clk)
begin
    case(cut_ctl)
        0:  begin
                 if(data_q[LEN-1:LEN-2] == positive[1:0] || data_q[LEN-1:LEN-2] == negative[1:0])  
                     data_out_q_t <= {data_q[LEN-1],data_q[LEN-3:LEN-17]}; 
                 else 
                     data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end 
        1:  begin
                if(data_q[LEN-1:LEN-3] == positive[2:0] || data_q[LEN-1:LEN-3] == negative[2:0])
                    data_out_q_t <= {data_q[LEN-1],data_q[LEN-4:LEN-18]};
                else
                    data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        2:  begin
                if(data_q[LEN-1:LEN-4] == positive[3:0] || data_q[LEN-1:LEN-4] == negative[3:0])
                    data_out_q_t <= {data_q[LEN-1],data_q[LEN-5:LEN-19]};
                else
                    data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        3:  begin
                if(data_q[LEN-1:LEN-5] == positive[4:0] || data_q[LEN-1:LEN-5] == negative[4:0])
                    data_out_q_t <= {data_q[LEN-1],data_q[LEN-6:LEN-20]};
                else
                    data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        4:  begin
                if(data_q[LEN-1:LEN-6] == positive[5:0] || data_q[LEN-1:LEN-6] == negative[5:0])
                    data_out_q_t <= {data_q[LEN-1],data_q[LEN-7:LEN-21]};
                else
                    data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        5:  begin
                if(data_q[LEN-1:LEN-7] == positive[6:0] || data_q[LEN-1:LEN-7] == negative[6:0])
                    data_out_q_t <= {data_q[LEN-1],data_q[LEN-8:LEN-22]};
                else
                    data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        6:  begin
                if(data_q[LEN-1:LEN-8] == positive[7:0] || data_q[LEN-1:LEN-8] == negative[7:0])
                    data_out_q_t <= {data_q[LEN-1],data_q[LEN-9:LEN-23]};
                else
                    data_out_q_t <= {data_q[LEN-1]} ? 16'h8000 : 16'h7fff;
            end
        default:    data_out_q_t <= {data_q[LEN-1:LEN-16]}; 
    endcase
end

//////////////////////////////////////
assign data_out_q = data_out_q_t;
assign data_out_i = data_out_i_t;
assign out_valid = in_valid_t;

endmodule
