`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/21 19:35:13
// Design Name: 
// Module Name: ddc
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


module ddc(
    input clk_ddc,           ////ADC采样速率120M
//    input clk_sim,           ////120M
//    input clk_data,
    input [7:0]FPGA_MOD,
    input reset_n,//全局复位
    input [15:0]data_in,//输入数据
    input ddc_en,
    output [15:0]data_ddc_I,
    output [15:0]data_ddc_Q,
    //    output reg data_out_valid_reg,
    output data_out_valid
    //    output reg fir_config_tvalid,
    //    output [7:0]fir_config_data
);
wire [5:0]DS_num;
//assign DS_num = (FPGA_MOD == 8'h09 ||  FPGA_MOD == 8'h0B || FPGA_MOD == 8'h0C)? 6'd10:6'd20;
assign DS_num = 6'd4;
////////////////////////////////////////nco_freq_en/////////////////////////////////////////////
reg nco_freq_en;
reg [7:0]cnt = 0;
always@(posedge clk_ddc)
begin
if(!reset_n)
    cnt <= 0;
else if(cnt < 8'd8)
    cnt <= cnt + 1;
else
    cnt <= cnt;
end

always @(posedge clk_ddc)
begin
if(!reset_n)
    nco_freq_en <= 0;
else if(cnt <= 8'd4)
    nco_freq_en <= 1;
else
    nco_freq_en <= 0;
end

wire rdy;
wire [15:0]sine;
wire [15:0]cosine;
//nco_20M sin_cos (
//.aclken(ddc_en), // input ce
//.aclk(clk_ddc), // input clk
//.s_axis_config_tvalid(nco_freq_en),  // input wire s_axis_config_tvalid
//.s_axis_config_tdata(32'h3851EB85),    // input wire [31 : 0] s_axis_config_tdata
////    .s_axis_config_tdata(32'h40000000),    // input wire [31 : 0] s_axis_config_tdata
//.m_axis_data_tvalid(rdy), // output rdy
//.m_axis_data_tdata({sine,cosine}) // output [15 : 0] cosine
//);
nco_30m sin_cos (
  .aclk(clk_ddc),                                  // input wire aclk
  .aclken(ddc_en),                              // input wire aclken
  .s_axis_config_tvalid(nco_freq_en),  // input wire s_axis_config_tvalid
  .s_axis_config_tdata(32'h40000000),    // input wire [31 : 0] s_axis_config_tdata
  .m_axis_data_tvalid(rdy),      // output wire m_axis_data_tvalid
  .m_axis_data_tdata({sine,cosine})        // output wire [31 : 0] m_axis_data_tdata
);
/////nco_freq = fo/fs*2^32;
//////////////////////////////////////ddc///////////////////////////////////////////////
wire [31:0]data_I;
wire [31:0]data_Q;
mult  mult_I_inst (
.CLK(clk_ddc), // input clk
.A(data_in), // input [15 : 0] a
.B(cosine), // input [15 : 0] b
.P(data_I) // output [31 : 0] p
);    
mult  mult_Q_inst (
.CLK(clk_ddc), // input clk
.A(data_in), // input [15 : 0] a
.B(sine), // input [15 : 0] b
.P(data_Q) // output [31 : 0] p
);
//////////////////////////////Truncation_ctl//////////////////////////////////////////
reg [15:0] data_I_temp = 0;
always@(posedge clk_ddc)               /////////////////////clk_ddc------clk_data?????
begin
data_I_temp <= {data_I[31],data_I[30:16]};
//    if(data_I[31:28] == 4'b0000 || data_I[31:28] == 4'b1111)
//        data_I_temp <= {data_I[31],data_I[27:13]};
//    else
//        data_I_temp <= {data_I[31]} ? 16'h8000 : 16'h7fff;
end

reg [15:0] data_Q_temp = 0;
always@(posedge clk_ddc)
begin
data_Q_temp <= {data_Q[31],data_Q[30:16]};
//    if(data_Q[31:28] == 4'b0000 || data_Q[31:28] == 4'b1111)
//        data_Q_temp <= {data_Q[31],data_Q[27:13]};
//    else
//        data_Q_temp <= {data_Q[31]} ? 16'h8000 : 16'h7fff;
end

//////////////////////////fir_lowpass///////////////////////////////////
wire [35:0] data_fir_I;
wire [35:0] data_fir_Q;
wire [39:0] fir_temp_I,fir_temp_Q;
wire fir_ddc_dv;
//wire [7:0]fir_config_tdata;
reg fir_config_tvalid = 0;
reg [7:0]FPGA_MOD_reg = 0;
always@(posedge clk_ddc)
begin
FPGA_MOD_reg <= FPGA_MOD;
if(FPGA_MOD_reg != FPGA_MOD)
    fir_config_tvalid <= 1;
else
    fir_config_tvalid <= 0;
end
wire [7:0]fir_config_data;
assign fir_config_data =  (FPGA_MOD == 8'h02 ||  FPGA_MOD == 8'h03 || FPGA_MOD == 8'h04)? 8'd1:8'd0;
             //////////FPGA_MOD为01--单频    02--6us30M    03--30us30M    04--组合脉冲
fir_ddc FIR_I (
.aclk(clk_ddc),
.s_axis_data_tvalid(ddc_en), 
.s_axis_data_tdata(data_I_temp),
.s_axis_config_tvalid(fir_config_tvalid),  // input wire s_axis_config_tvalid
.s_axis_config_tdata(fir_config_data),    // input wire [7 : 0] s_axis_config_tdata
.m_axis_data_tvalid(fir_ddc_dv),
.m_axis_data_tdata(fir_temp_I));
assign data_fir_I = fir_temp_I[35:0];

fir_ddc FIR_Q (
.aclk(clk_ddc),
.s_axis_data_tvalid(ddc_en), 
.s_axis_data_tdata(data_Q_temp), 
.s_axis_config_tvalid(fir_config_tvalid),  // input wire s_axis_config_tvalid
.s_axis_config_tdata(fir_config_data),    // input wire [7 : 0] s_axis_config_tdata
.m_axis_data_tvalid(),
.m_axis_data_tdata(fir_temp_Q));
assign data_fir_Q = fir_temp_Q[35:0];


reg [5:0]cnt_DS = 0;
always@(posedge clk_ddc)
begin
if(!reset_n)
    cnt_DS <= 0;
else if((cnt_DS < DS_num)&&(fir_ddc_dv==1))//20200925 wx
    cnt_DS <= cnt_DS + 1;
else
    cnt_DS <= 1;        
end
reg downsample_valid = 0;
always@(posedge clk_ddc)
begin
if(!reset_n)
    downsample_valid <= 0;
//else if(cnt_DS == DS_num)
else if(cnt_DS == 1)//20200925 wx
    downsample_valid <= 1;
else
    downsample_valid <= 0;        
end
///////////////////////////////////////////////////////////////////////////////////////
//always @(posedge clk_ddc)
//begin
// if(downsample_valid)
// begin
//if(data_fir_I[34:31] == 4'b0000 || data_fir_I[34:31] == 4'b1111)//20200508 �޸Ľ�λ
//    data_ddc_I_temp <= {data_fir_I[34],data_fir_I[30:0]};
//else
//    data_ddc_I_temp <= {data_fir_I[34]} ? 32'h80000000 : 32'h7fffffff;
    
//if(data_fir_Q[34:31] == 4'b0000 || data_fir_Q[34:31] == 4'b1111)
//    data_ddc_Q_temp <= {data_fir_Q[34],data_fir_Q[30:0]};
//else
//    data_ddc_Q_temp <= {data_fir_Q[34]} ? 32'h80000000 : 32'h7fffffff;
//end
////    if(downsample_valid)
////    begin
////        data_ddc_I_temp <= {data_fir_I[36],data_fir_I[35:5]};
////        data_ddc_Q_temp <= {data_fir_Q[36],data_fir_Q[35:5]};
////    end
//data_out_valid_reg <= fir_ddc_dv;
//end
wire [15:0]data_ddc_I_temp;
wire [15:0]data_ddc_Q_temp;
wire data_out_valid_reg;
wire [2:0]ddc_cut_ctl;
ddc_cut ddc_cut_inst (
  .clk(clk_ddc),                // input wire clk
  .probe_out0(ddc_cut_ctl)  // output wire [2 : 0] probe_out0
);

cut_ctl_top_ddc #(.LEN(36)) ddc_cut(
    .clk(clk_ddc),
    .data_i(data_fir_I),
    .data_q(data_fir_Q),
    .in_valid(fir_ddc_dv),
    .cut_ctl(ddc_cut_ctl),
    .downsample_valid(downsample_valid),
    
    .data_out_i(data_ddc_I_temp),
    .data_out_q(data_ddc_Q_temp),
    .out_valid(data_out_valid_reg)
);
/////////////////////////////////////////////////////////////////////////////////////////////////
assign data_ddc_I = data_ddc_I_temp;
assign data_ddc_Q = data_ddc_Q_temp;
assign data_out_valid = data_out_valid_reg && downsample_valid;



//[7:0]FPGA_MOD
//reset_n
//[15:0]data_in
//[15:0]cnt_1,
//[15:0]sine;  
//[15:0]cosine;
// [31:0]data_I
// [31:0]data_Q
// [34:0] data_fir_I
// [34:0] data_fir_Q
//  downsample_valid
//   [31:0]data_ddc_I,  
//   [31:0]data_ddc_Q,  
//   data_out_valid      
//ila_1 ddc_ila (
//	.clk(clk_ddc), // input wire clk

//	.probe0(FPGA_MOD), // input wire [7:0]  probe0  
//	.probe1(reset_n), // input wire [0:0]  probe1 
//	.probe2(data_in), // input wire [15:0]  probe2 
//	.probe3(data_in), // input wire [0:0]  probe3 
//	.probe4(sine), // input wire [15:0]  probe4 
//	.probe5(cosine), // input wire [15:0]  probe5 
//	.probe6(data_I), // input wire [0:0]  probe6 
//	.probe7(data_Q), // input wire [31:0]  probe7 
//	.probe8(data_fir_I), // input wire [31:0]  probe8 
//	.probe9(data_fir_Q), // input wire [15:0]  probe9 
//	.probe10(downsample_valid), // input wire [15:0]  probe10 
//	.probe11(data_ddc_I), // input wire [39:0]  probe11 
//	.probe12(data_ddc_Q), // input wire [39:0]  probe12 
//	.probe13(data_out_valid) // input wire [0:0]  probe13 
//);
   
endmodule
