`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/09 09:50:32
// Design Name: 
// Module Name: duc
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


module duc(
input clk_duc,
input [15:0]add_L_1_35_I ,
input [15:0]add_L_1_35_Q ,
input [15:0]add_R_1_35_I ,
input [15:0]add_R_1_35_Q ,
input [15:0]add_L_36_70_I,
input [15:0]add_L_36_70_Q,
input [15:0]add_R_36_70_I,
input [15:0]add_R_36_70_Q,
input duc_v_in_valid,
input FPGA_nRESET,

 output  [15:0]duc_1,
 output  [15:0]duc_2,
 output  [15:0]duc_3,
 output  [15:0]duc_4,




output duc_out_valid 
    );

reg [7:0]cnt;
always@(posedge clk_duc)
begin
if(!FPGA_nRESET)
    cnt <= 0;
else if(cnt < 8'd8)
    cnt <= cnt + 1;
else
    cnt <= cnt;
end
 reg nco_freq_en;
  reg nco_freq_en1;
always @(posedge clk_duc)
begin
if(!FPGA_nRESET)
begin
    nco_freq_en <= 0;
    nco_freq_en1 <= 0;
    end
else if(cnt <= 8'd4)
begin
    nco_freq_en <= 1;
      nco_freq_en1 <= 1;
    
end
else
begin
    nco_freq_en <= 0;
      nco_freq_en1 <= nco_freq_en1;
end
end
   wire [31:0]data_I_1;
   wire [31:0]data_I_2;
   wire [31:0]data_I_3;
   wire [31:0]data_I_4;  
   wire [31:0]data_Q_1;
   wire [31:0]data_Q_2;
   wire [31:0]data_Q_3;
   wire [31:0]data_Q_4;
   reg [15:0]data_I_temp_1;
   reg [15:0]data_I_temp_2;
   reg [15:0]data_I_temp_3;
   reg [15:0]data_I_temp_4;
   
   reg [15:0]data_Q_temp_1;
   reg [15:0]data_Q_temp_2;
   reg [15:0]data_Q_temp_3;
   reg [15:0]data_Q_temp_4;
   
   
   wire duc_out_valid_1;
    wire  [15:0]sine; 
    wire[15:0]cosine;
        wire  [15:0]sine2; 
    wire[15:0]cosine2;
            wire  [15:0]sine3; 
    wire[15:0]cosine3;
            wire  [15:0]sine4; 
    wire[15:0]cosine4;
    wire rdy;
    wire [15:0]decimation_1_I;
    wire [15:0]decimation_2_I;
    wire [15:0]decimation_3_I;
    wire [15:0]decimation_4_I;
    wire [15:0]decimation_1_Q;
    wire [15:0]decimation_2_Q;
    wire [15:0]decimation_3_Q;
    wire [15:0]decimation_4_Q;
          
  
 ///////////////内插//////////
 decimation decimation_1(
    .clk_120m(clk_duc),
     .data_ddc_I(add_L_1_35_I),
     .data_ddc_Q(add_L_1_35_Q),
  
    . rst_n(FPGA_nRESET),
    
    .data_I(decimation_1_I),
    .data_Q(decimation_1_Q)

    );
 
  decimation decimation_2(
    .clk_120m(clk_duc),
     .data_ddc_I(add_R_1_35_I),
     .data_ddc_Q(add_R_1_35_Q),
  
    . rst_n(FPGA_nRESET),
    
    .data_I(decimation_2_I),
    .data_Q(decimation_2_Q)

    );
     decimation decimation_3(
    .clk_120m(clk_duc),
     .data_ddc_I(add_L_36_70_I),
     .data_ddc_Q(add_L_36_70_Q),
  
    . rst_n(FPGA_nRESET),
    
    .data_I(decimation_3_I),
    .data_Q(decimation_3_Q)

    );
     decimation decimation_4(
    .clk_120m(clk_duc),
     .data_ddc_I(add_R_36_70_I),
     .data_ddc_Q(add_R_36_70_Q),
  
    . rst_n(FPGA_nRESET),
    
    .data_I(decimation_4_I),
    .data_Q(decimation_4_Q)

    );
 
 
 
 ///////////滤波/////////////////
    
wire   [39:0]  data_I_fir_1;
wire   [39:0]  data_Q_fir_1;
wire   [39:0]  data_I_fir_2;
wire   [39:0]  data_Q_fir_2;
wire   [39:0]  data_I_fir_3;
wire   [39:0]  data_Q_fir_3;
wire   [39:0]  data_I_fir_4;
wire   [39:0]  data_Q_fir_4;

fir_dec fir_dec_1 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_1_I),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(duc_out_valid_1),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_I_fir_1)    // output wire [39 : 0] m_axis_data_tdata
);
fir_dec fir_dec_2 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_2_I),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_I_fir_2)    // output wire [39 : 0] m_axis_data_tdata
);
fir_dec fir_dec_3 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_3_I),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_I_fir_3)    // output wire [39 : 0] m_axis_data_tdata
);
fir_dec fir_dec_4 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_4_I),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_I_fir_4)    // output wire [39 : 0] m_axis_data_tdata
);
fir_dec fir_dec_5 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_1_Q),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_Q_fir_1)    // output wire [39 : 0] m_axis_data_tdata
);
fir_dec fir_dec_6 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_2_Q),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_Q_fir_2)    // output wire [39 : 0] m_axis_data_tdata
);

fir_dec fir_dec_7 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_3_Q),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_Q_fir_3)    // output wire [39 : 0] m_axis_data_tdata
);

fir_dec fir_dec_8 (
  .aclk(clk_duc),                              // input wire aclk
  .s_axis_data_tvalid(duc_v_in_valid),  // input wire s_axis_data_tvalid
  .s_axis_data_tready(),  // output wire s_axis_data_tready
  .s_axis_data_tdata(decimation_4_Q),    // input wire [15 : 0] s_axis_data_tdata
  .m_axis_data_tvalid(),  // output wire m_axis_data_tvalid
  .m_axis_data_tdata(data_Q_fir_4)    // output wire [39 : 0] m_axis_data_tdata
); 
///////////////////
wire [2:0]duc_cut_ctl;
wire [2:0]duc_cut_ctl_inst;

vio_duc vio_duc_1 (
  .clk(clk_duc),                // input wire clk
  .probe_out0(duc_cut_ctl),  // output wire [2 : 0] probe_out0
   .probe_out1(duc_cut_ctl_inst)  // output wire [2 : 0] probe_out0
);
     //////////////////////
         /////////////截位/////////
         wire   [15:0]  data_1_I;
         wire duc_out_inst_valid;
wire   [15:0]  data_1_Q;
wire   [15:0]  data_2_I;
wire   [15:0]  data_2_Q;
wire   [15:0]  data_3_I;
wire   [15:0]  data_3_Q;
wire   [15:0]  data_4_I;
wire   [15:0]  data_4_Q;

   cut_ctl_top_dbf #(.LEN(33)) duc_cut_inst_1(
    .clk(clk_duc),
    .data_i(data_I_fir_1[32:0]),
    .data_q(data_Q_fir_1[32:0]),
    .in_valid(duc_out_valid_1),
    .cut_ctl(duc_cut_ctl_inst),

    
    .data_out_i(data_1_I),
    .data_out_q(data_1_Q),
    .out_valid(duc_out_inst_valid)
);
cut_ctl_top_dbf #(.LEN(33)) duc_cut_inst_2(
    .clk(clk_duc),
    .data_i(data_I_fir_2[32:0]),
    .data_q(data_Q_fir_2[32:0]),
    .in_valid(duc_out_valid_1),
    .cut_ctl(duc_cut_ctl_inst),
 
    
    .data_out_i(data_2_I),
    .data_out_q(data_2_Q),
    .out_valid()
);
    /////////////截位/////////
   cut_ctl_top_dbf #(.LEN(33)) duc_cut_inst_3(
    .clk(clk_duc),
    .data_i(data_I_fir_3[32:0]),
    .data_q(data_Q_fir_3[32:0]),
    .in_valid(duc_out_valid_1),
    .cut_ctl(duc_cut_ctl_inst),

    
    .data_out_i(data_3_I),
    .data_out_q(data_3_Q),
    .out_valid()
);
cut_ctl_top_dbf #(.LEN(33)) duc_cut_inst_4(
    .clk(clk_duc),
    .data_i(data_I_fir_4[32:0]),
    .data_q(data_Q_fir_4[32:0]),
    .in_valid(duc_out_valid_1),
    .cut_ctl(duc_cut_ctl_inst),
 
    
    .data_out_i(data_4_I),
    .data_out_q(data_4_Q),
    .out_valid()
);

    //////////////////////    









    
 wire nco_valid;  
 wire [31:0] phase2;
 wire [31:0] phase3;
 wire [31:0] phase4;
 
 vio_ducphase vio_ducphase_inst (
  .clk(clk_duc),                // input wire clk
  .probe_out0(phase2),  // output wire [31 : 0] probe_out0
  .probe_out1(phase3),  // output wire [31 : 0] probe_out1
  .probe_out2(phase4)  // output wire [31 : 0] probe_out2
); 

    ///////////////
 nco_30m sin_cos_1 (
  .aclk(clk_duc),                                  // input wire aclk
  .aclken(duc_out_inst_valid),                              // input wire aclken
  .s_axis_config_tvalid(nco_freq_en),  // input wire s_axis_config_tvalid
  .s_axis_config_tdata(32'h40000000),    // input wire [31 : 0] s_axis_config_tdata
  .m_axis_data_tvalid(nco_valid),      // output wire m_axis_data_tvalid
  .m_axis_data_tdata({sine,cosine})        // output wire [31 : 0] m_axis_data_tdata
);  
 nco_30m_2 sin_cos_2 (
  .aclk(clk_duc),                                  // input wire aclk
  .aclken(duc_out_inst_valid),                              // input wire aclken
  .s_axis_phase_tvalid(nco_freq_en1),  // input wire s_axis_config_tvalid
  .s_axis_phase_tdata(phase2),    // input wire [31 : 0] s_axis_config_tdata
  .m_axis_data_tvalid(),      // output wire m_axis_data_tvalid
  .m_axis_data_tdata({sine2,cosine2})        // output wire [31 : 0] m_axis_data_tdata
); 
 nco_30m_3 sin_cos_3 (
  .aclk(clk_duc),                                  // input wire aclk
  .aclken(duc_out_inst_valid),                              // input wire aclken
  .s_axis_phase_tvalid(nco_freq_en1),  // input wire s_axis_config_tvalid
  .s_axis_phase_tdata(phase3),    // input wire [31 : 0] s_axis_config_tdata
  .m_axis_data_tvalid(),      // output wire m_axis_data_tvalid
  .m_axis_data_tdata({sine3,cosine3})        // output wire [31 : 0] m_axis_data_tdata
); 

 nco_30m_4 sin_cos_4 (
  .aclk(clk_duc),                                  // input wire aclk
  .aclken(duc_out_inst_valid),                              // input wire aclken
  .s_axis_phase_tvalid(nco_freq_en1),  // input wire s_axis_config_tvalid
  .s_axis_phase_tdata(phase4),    // input wire [31 : 0] s_axis_config_tdata
  .m_axis_data_tvalid(),      // output wire m_axis_data_tvalid
  .m_axis_data_tdata({sine4,cosine4})        // output wire [31 : 0] m_axis_data_tdata
); 
mult  mult_I_1 (
.CLK(clk_duc), // input clk
.A(data_1_I), // input [15 : 0] a
.B(cosine), // input [15 : 0] b
.P(data_I_1) // output [31 : 0] p
);    
mult  mult_Q_1 (
.CLK(clk_duc), // input clk
.A(data_1_Q), // input [15 : 0] a
.B(sine), // input [15 : 0] b
.P(data_Q_1) // output [31 : 0] p
);
mult  mult_I_2 (
.CLK(clk_duc), // input clk
.A(data_2_I), // input [15 : 0] a
.B(cosine2), // input [15 : 0] b
.P(data_I_2) // output [31 : 0] p
);    
mult  mult_Q_2 (
.CLK(clk_duc), // input clk
.A(data_2_Q), // input [15 : 0] a
.B(sine2), // input [15 : 0] b
.P(data_Q_2) // output [31 : 0] p
);
mult  mult_I_3 (
.CLK(clk_duc), // input clk
.A(data_3_I), // input [15 : 0] a
.B(cosine3), // input [15 : 0] b
.P(data_I_3) // output [31 : 0] p
);    
mult  mult_Q_3 (
.CLK(clk_duc), // input clk
.A(data_3_Q), // input [15 : 0] a
.B(sine3), // input [15 : 0] b
.P(data_Q_3) // output [31 : 0] p
);
mult  mult_I_4 (
.CLK(clk_duc), // input clk
.A(data_4_I), // input [15 : 0] a
.B(cosine4), // input [15 : 0] b
.P(data_I_4) // output [31 : 0] p
);    
mult  mult_Q_4 (
.CLK(clk_duc), // input clk
.A(data_4_Q), // input [15 : 0] a
.B(sine4), // input [15 : 0] b
.P(data_Q_4) // output [31 : 0] p
);
wire [32:0]cut_I_1;
wire [32:0]cut_I_2;
wire [32:0]cut_I_3;
wire [32:0]cut_I_4;
wire [32:0]cut_Q_1;
wire [32:0]cut_Q_2;
wire [32:0]cut_Q_3;
wire [32:0]cut_Q_4;

assign cut_I_1 = {data_I_1[31],data_I_1[31:0]};
assign cut_I_2 = {data_I_2[31],data_I_2[31:0]};
assign cut_I_3 = {data_I_3[31],data_I_3[31:0]};
assign cut_I_4 = {data_I_4[31],data_I_4[31:0]};
assign cut_Q_1 = {data_Q_1[31],data_Q_1[31:0]};
assign cut_Q_2 = {data_Q_2[31],data_Q_2[31:0]};
assign cut_Q_3 = {data_Q_3[31],data_Q_3[31:0]};
assign cut_Q_4 = {data_Q_4[31],data_Q_4[31:0]};











 
    wire [32:0]duc_1_1;   
    wire [32:0]duc_2_1;
    wire [32:0]duc_3_1;
    wire [32:0]duc_4_1;

  
       
 

//    if(duc_out_valid)
//    begin
   assign duc_1_1 = cut_I_1 -cut_Q_1;
   assign duc_2_1 = cut_I_2 -cut_Q_2;
   assign duc_3_1 = cut_I_3 -cut_Q_3;
   assign duc_4_1 = cut_I_4 -cut_Q_4;
    
     
//    end



    /////////////截位/////////
   cut_ctl_top_dbf #(.LEN(33)) duc_cut_1(
    .clk(clk_duc),
    .data_i(duc_1_1),
    .data_q(duc_2_1),
    .in_valid(nco_valid),
    .cut_ctl(duc_cut_ctl),

    
    .data_out_i(duc_1),
    .data_out_q(duc_2),
    .out_valid(duc_out_valid)
);
cut_ctl_top_dbf #(.LEN(33)) duc_cut_2(
    .clk(clk_duc),
    .data_i(duc_3_1),
    .data_q(duc_4_1),
    .in_valid(nco_valid),
    .cut_ctl(duc_cut_ctl),
 
    
    .data_out_i(duc_3),
    .data_out_q(duc_4),
    .out_valid()
);

    
    

    
    
 ila_duc your_instance_name (
	.clk(clk_duc), // input wire clk


	.probe0(decimation_1_I), // input wire [15:0]  probe0  
	.probe1(decimation_2_I), // input wire [15:0]  probe1 
	.probe2(decimation_3_I), // input wire [15:0]  probe2 
	.probe3(decimation_4_I), // input wire [15:0]  probe3 
	.probe4(decimation_1_Q), // input wire [15:0]  probe4 
	.probe5(decimation_2_Q), // input wire [15:0]  probe5 
	.probe6(decimation_3_Q), // input wire [15:0]  probe6 
	.probe7(decimation_4_Q), // input wire [15:0]  probe7 
	.probe8(sine), // input wire [15:0]  probe8 
	.probe9(cosine) , // input wire [15:0]  probe9 
	.probe10(duc_out_valid_1), // input wire [0:0]  probe10 
	.probe11(duc_v_in_valid), // input wire [0:0]  probe11 
	.probe12(duc_out_valid), // input wire [0:0]  probe12);   
	.probe13(data_1_I), // input wire [15:0]  probe13 
	.probe14(data_1_Q), // input wire [15:0]  probe14 
	.probe15(data_2_I), // input wire [15:0]  probe15 
	.probe16(data_2_Q), // input wire [15:0]  probe16 
	.probe17(data_3_I), // input wire [15:0]  probe17 
	.probe18(data_3_Q), // input wire [15:0]  probe18 
	.probe19(data_4_I), // input wire [15:0]  probe19 
	.probe20(data_4_Q), // input wire [15:0]  probe20
	.probe21(cut_I_1), // input wire [32:0]  probe21 
	.probe22(cut_I_2), // input wire [32:0]  probe22 
	.probe23({sine2,cosine2}), // input wire [32:0]  probe23 
	.probe24(cut_I_4), // input wire [32:0]  probe24 
	.probe25(cut_Q_1), // input wire [32:0]  probe25 
	.probe26(cut_Q_2), // input wire [32:0]  probe26 
	.probe27(cut_Q_3), // input wire [32:0]  probe27 
	.probe28(cut_Q_4), // input wire [32:0]  probe28
    .probe29(duc_1_1), // input wire [32:0]  probe29 
	.probe30(duc_2_1), // input wire [32:0]  probe30 
	.probe31(duc_3_1), // input wire [32:0]  probe31 
	.probe32(duc_4_1), // input wire [32:0]  probe32
	.probe33(phase2), // input wire [32:0]  probe30 
	.probe34(phase3), // input wire [32:0]  probe31 
	.probe35(phase4) // input wire [32:0]  probe32
	);
    
    
    
    
    
    
    
    
    
    
    
endmodule