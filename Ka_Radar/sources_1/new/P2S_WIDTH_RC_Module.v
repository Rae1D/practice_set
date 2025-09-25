`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/09 14:34:46
// Design Name: 
// Module Name: P2S_WIDTH_RC_Module
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


module P2S_WIDTH_RC_Module
  #(
    parameter SHIFT_REG_WIDTH_MAX = 64,	// 移位寄存器位宽：可适应低于 SHIFT_REG_WIDTH_MAX 位的并串转换
    parameter SYS_CLK_FREQ = 100000000,	// 模块的工作时钟频率
    parameter SERIAL_CLK_FREQ = 1000000,	// 并串转换输出的串行时钟频率
    parameter P2S_PROTECT_INT = 100			// 当连续两次执行并串转换时，需要设定的保护时间间隔：time(ns) = P2S_PROTECT_INT * (1/SYS_CLK_FREQ) * 10^9 ns
   )
	(
	input rst, 
	input clk,
	
	// user inerface
	input P2S_Start,  									//单时钟周期正脉冲，同步于clk
	input [SHIFT_REG_WIDTH_MAX-1:0]P2S_DATA_IN,	//P2S_Start到来时，P2S_DATA_IN应稳定可靠
	input [31:0]P2S_DATA_Width,						//实际数据位宽，P2S_Start到来时，P2S_DATA_Width应稳定可靠
	output wire P2S_BUSY,								//并转串进程忙状态信号
	output wire P2S_Completed,							//并转串传输完成指示信号，--> 单周期正脉冲
	
	// Serial output 
	output wire Serial_data,
	output wire Serial_clk,
	output wire Serial_data_en
    );

// ******************************************************************************************************* //
// 产生移位寄存器移位节拍信号：PS_Step	:
// 产生移位寄存器移位窗口指示信号：PS_Window  ：

reg PS_Step1,PS_Step2,PS_Step3;
reg PS_Window;

parameter [3:0]CTRL_IDLE = 4'd0;
parameter [3:0]CTRL_WORK = 4'd1;

reg [3:0]ctrl_state;
reg [31:0]cnt_clk,cnt_Step;


always@(posedge clk or posedge rst)
begin
	if(rst)begin
		cnt_clk<=0;
		cnt_Step<=0;
		PS_Step1 <= 1'b0;
		PS_Step2 <= 1'b0;
		PS_Step3 <= 1'b0;
		PS_Window <= 1'b0;
		ctrl_state <= CTRL_IDLE;
		end
	else
		case(ctrl_state)
			CTRL_IDLE:	begin
								cnt_clk<=0;
								cnt_Step<=0;
								
								if(P2S_Start)begin
									PS_Step1 <= 1'b0;
									PS_Step2 <= 1'b0;
									PS_Step3 <= 1'b0;
									PS_Window <= 1'b1;
									ctrl_state <= CTRL_WORK;
									end
								else begin
									PS_Step1 <= 1'b0;
									PS_Step2 <= 1'b0;
									PS_Step3 <= 1'b0;
									PS_Window <= 1'b0;
									ctrl_state <= ctrl_state;
									end
							end
			CTRL_WORK:	begin
								if(cnt_clk>=((SYS_CLK_FREQ/SERIAL_CLK_FREQ)-1))
									cnt_clk <= 32'd0;
								else
									cnt_clk <= cnt_clk + 1;
								
								if(cnt_clk==32'd1)
									PS_Step1 <= 1'b1;
								else
									PS_Step1 <= 1'b0;

								if(cnt_clk==((SYS_CLK_FREQ/SERIAL_CLK_FREQ)-1))
									PS_Step2 <= 1'b1;
								else
									PS_Step2 <= 1'b0;
								
								if(cnt_clk==(SYS_CLK_FREQ/SERIAL_CLK_FREQ)/2)
									PS_Step3 <= 1'b1;
								else
									PS_Step3 <= 1'b0;
								
								if(PS_Step2)
									if(cnt_Step>=(P2S_DATA_Width-1))begin
										cnt_Step <= 0;
										PS_Window <= 1'b0;
										ctrl_state <= CTRL_IDLE;
										end
									else begin
										cnt_Step <= cnt_Step + 1;
										PS_Window <= 1'b1;
										ctrl_state <= ctrl_state;
										end
								else
									cnt_Step <= cnt_Step;
							end
			default:begin
					cnt_clk<=0;
					cnt_Step<=0;
					PS_Step1 <= 1'b0;
					PS_Step2 <= 1'b0;
					PS_Step3 <= 1'b0;
					PS_Window <= 1'b0;
					ctrl_state <= CTRL_IDLE;
				end
				
		endcase
		
end


// ******************************************************************************************************* //
// ---- N-bits 数据串行化 ---- //
// 逻辑运行需求： rst			:
// 逻辑运行需求： P2S_Start	:
// 逻辑运行需求： PS_Step		:

reg reg_shift_lsb; //定义了一个单bit的寄存器变量，用于接收移位寄存器从最低位移出的数据
reg [31:0]reg_shift_cnt; //记录移位寄存器移出了多少个数据

parameter [3:0]PS_IDLE = 4'd0;
parameter [3:0]PS_SHIFT= 4'd1;

reg [SHIFT_REG_WIDTH_MAX-1:0]reg_shift;//定义 SHIFT_REG_WIDTH_MAX 位宽的移位寄存器
reg ps_end;//定义一个并转串周期的结束指示信号，单时钟周期正脉冲信号
reg [3:0]ps_state;//定义4bit状态机状态变量

always@(posedge clk or posedge rst)
begin
	if(rst)begin
		reg_shift_lsb <= reg_shift_lsb;
		reg_shift <= 0;
		reg_shift_cnt <= 32'd0;
		ps_end <= 1'b0;
		ps_state <= PS_IDLE;
		end
	else
		case(ps_state)
			PS_IDLE	:begin
					if(P2S_Start)begin
						reg_shift_lsb <= reg_shift_lsb;
						reg_shift <= P2S_DATA_IN;//更新移位寄存器内的数据
						reg_shift_cnt <= 32'd0;
						ps_end <= 1'b0;
						ps_state <= PS_SHIFT;
						end
					else begin
						reg_shift_lsb <= 1'b0;
						reg_shift <= 0;
						reg_shift_cnt <= 32'd0;
						ps_end <= 1'b0;
						ps_state <= PS_IDLE;
						end
				end
			PS_SHIFT	:begin
					//reg_shift_lsb <= reg_shift[31];
					if(PS_Step1)begin
						reg_shift_lsb <= reg_shift[0];
						reg_shift[SHIFT_REG_WIDTH_MAX-1:0] <= {1'b0,reg_shift[SHIFT_REG_WIDTH_MAX-1:1]}; //从低位移出，高位填0
						reg_shift_cnt <= reg_shift_cnt + 1;
						end
					else begin
						reg_shift_lsb <= reg_shift_lsb;
						reg_shift <= reg_shift;
						reg_shift_cnt <= reg_shift_cnt;
						end
					
					if(PS_Step2)begin
						if(reg_shift_cnt>=P2S_DATA_Width)begin
							ps_end <= 1'b1;
							ps_state <= PS_IDLE;
							end
						else begin
							ps_end <= 1'b0;
							ps_state <= ps_state;
							end
						end
					
				end
			default	:begin
				reg_shift_lsb <= 1'b0;
				reg_shift <= 0;
				reg_shift_cnt <= 32'd0;
				ps_end <= 1'b0;
				ps_state <= PS_IDLE;
				end
		endcase
end

// ******************************************************************************************************* //

// 产生与串行数据对应的串行时钟
reg ps_clk;

always@(posedge clk or posedge rst)
begin
	if(rst)
		ps_clk <= 1'b0;
	else
		if(PS_Step3)
			ps_clk <= 1'b1;
		else if(PS_Step2)
			ps_clk <= 1'b0;
		else
			ps_clk <= ps_clk;

end

// 串行数据端口输出
assign Serial_data	     = reg_shift_lsb;
assign Serial_clk		 = ps_clk;
assign Serial_data_en    = PS_Window;

// ******************************************************************************************************* //
// 产生忙状态指示信号
// 逻辑运行需求： rst			:
// 逻辑运行需求： P2S_Start	:
// 逻辑运行需求： ps_end		：
reg ps_det_busy;
reg [31:0]ps_det_cnt;

// ---------------------------------------- //
parameter [1:0]PS_DET_IDLE = 2'd0;//状态监测空闲参数
parameter [1:0]PS_DET_BUSY = 2'd1;//状态监测忙参数
parameter [1:0]PS_DET_END  = 2'd2;//状态监测结束
reg [1:0]ps_det_state;//状态监测状态机状态变量

always@(posedge clk or posedge rst)
begin
	if(rst)begin
		ps_det_cnt <= 32'd0;
		ps_det_busy <= 1'b1;
		ps_det_state <= PS_DET_IDLE;
		end
	else
		case(ps_det_state)
			PS_DET_IDLE	: begin
					ps_det_cnt <= 32'd0;
					ps_det_busy <= 1'b0;
					if(P2S_Start)
						ps_det_state <= PS_DET_BUSY;
					else
						ps_det_state <= ps_det_state;
				end
			PS_DET_BUSY	: begin
					ps_det_cnt <= 32'd0;
					ps_det_busy <= 1'b1;
					if(ps_end)
						ps_det_state <= PS_DET_END;
					else
						ps_det_state <= ps_det_state;
				end
			PS_DET_END	: begin
					ps_det_cnt <= ps_det_cnt + 1;
					ps_det_busy <= 1'b1;
					if(ps_det_cnt>=P2S_PROTECT_INT-1)
						ps_det_state <= PS_DET_IDLE;
					else
						ps_det_state <= ps_det_state;
				end
			default		: begin
					ps_det_cnt <= 0;
					ps_det_busy <= 1'b0;
					ps_det_state <= PS_DET_IDLE;
				end
		endcase

end

// 并串转换忙信号输出
assign P2S_BUSY	= ps_det_busy;

// ******************************************************************************************************* //
// ******************************************************************************************************* //
// 产生帧数据传输完成指示信号
// 单周期正脉冲信号
reg completed;

always@(posedge clk or posedge rst)
begin
	if(rst)
		completed <= 0;
	else
		completed <= ps_end;
	
end

assign P2S_Completed = completed;

// ******************************************************************************************************* //

endmodule