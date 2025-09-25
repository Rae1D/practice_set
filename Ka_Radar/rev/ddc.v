
// ADC输出的4路信号
wire [15:0]CH01_DATA_OUT;
wire [15:0]CH02_DATA_OUT;
wire [15:0]CH03_DATA_OUT;
wire [15:0]CH04_DATA_OUT;

// 根据ad_mode设置ddc模块输入（vio）
assign ddc_data_in_1 = (ad_mode == 2'b00)? CH01_DATA_OUT :      
                     (ad_mode == 2'b01)? CH02_DATA_OUT :
                     (ad_mode == 2'b10)? CH03_DATA_OUT :CH04_DATA_OUT;

// 同样设置ddc模块输入（vio）
assign ddc_data_in = (num_cpi == 1 || cpi_dsel)?ddc_data_in_1 : 16'b0;     

// ddc例化，仅了解即可
ddc ddc_inst(                                          //////Բ��װ Nr��ram_addrb ��ʱû��
     .clk_ddc(clk_ad_120m),           //// ADC采样速率120M
//     .clk_sim(clk_120m),           //// 120M
//     .clk_data(clk_120m),
     .FPGA_MOD(FPGA_MOD),
     .reset_n(FPGA_nRESET),// 全局复位
     .data_in(ddc_data_in),// 输入数据（产生见上）
     .ddc_en(1'b1),
     .data_ddc_I(data_ddc_I),// 输出基带I/Q信号
     .data_ddc_Q(data_ddc_Q),
     .data_out_valid(data_out_ddc_valid)
);

// top module 方位模块的输出wire
wire [15:0]fw_out_1_24_I;
wire [15:0]fw_out_1_24_Q;
wire [15:0]fw_out_25_48_I;
wire [15:0]fw_out_25_48_Q;
wire fw_out_valid;

// vio设置fgpagpiofw和fgpagpiofy
vio_fpgagpio vio_fpgagpio_1 (
  .clk(clk_ad_120m),                // input wire clk
  .probe_out0(fgpagpiofw),  // output wire [3 : 0] probe_out0
  .probe_out1(fgpagpiofy)  // output wire [3 : 0] probe_out1
);

// 方位模块例化
 dbf_fangwei fangwei_inst(
     .clk_120m(clk_ad_120m),
     .dataI(data_ddc_I),
     .dataQ(data_ddc_Q),
     .data_in_valid(data_out_ddc_valid),
   
     .fpga_gpio(fgpagpiofw),    // vio设置
   
     .add_out_1_24_I (fw_out_1_24_I ),
     .add_out_1_24_Q (fw_out_1_24_Q ),
     .add_out_25_48_I(fw_out_25_48_I),
     .add_out_25_48_Q(fw_out_25_48_Q),
     .data_out_valid(fw_out_valid)
    );

// top module 俯仰模块的输出wire（280略）

dbf_fuyang fuyang_inst(
        .clk_120m(clk_ad_120m),
        .data_1_24_I(fw_out_1_24_I),
        .data_1_24_Q(fw_out_1_24_Q),
        .data_25_48_I(fw_out_25_48_I),
        .data_25_48_Q(fw_out_25_48_Q),
        .data_in_valid(fw_out_valid),
        
        .fpga_gpio(fgpagpiofy), // vio设置

        .data_out_L_1_I(fy_out_L_1_I),
        .data_out_L_1_Q(fy_out_L_1_Q),
        // 280略
        .data_out_R_70_I(fy_out_R_70_I),
        .data_out_R_70_Q(fy_out_R_70_Q),
    
        .data_out_valid(fy_out_valid)   
        );

// top module 子阵相加模块的输出wire
wire [15:0]add_L_1_35_I ;  
wire [15:0]add_L_1_35_Q ;  
wire [15:0]add_R_1_35_I ;  
wire [15:0]add_R_1_35_Q ;  
wire [15:0]add_L_36_70_I;  
wire [15:0]add_L_36_70_Q;  
wire [15:0]add_R_36_70_I;  
wire [15:0]add_R_36_70_Q;  
wire adddataout_valid;    

add_zizhen add_zizhen_1(
    .clk(clk_ad_120m),

    .data_in_valid(fy_out_valid),
    .data_in_L_1_I(fy_out_L_1_I),         
    .data_in_L_1_Q(fy_out_L_1_Q),
    // 280略
    .data_in_R_70_I(fy_out_R_70_I),       
    .data_in_R_70_Q(fy_out_R_70_Q),       


   .add_L_1_35_I (add_L_1_35_I ) ,
   .add_L_1_35_Q (add_L_1_35_Q ) ,
   .add_R_1_35_I (add_R_1_35_I ) ,
   .add_R_1_35_Q (add_R_1_35_Q ) ,
   .add_L_36_70_I(add_L_36_70_I)  ,
   .add_L_36_70_Q(add_L_36_70_Q)  ,
   .add_R_36_70_I(add_R_36_70_I)  ,
   .add_R_36_70_Q(add_R_36_70_Q)  ,
   .dataout_valid(adddataout_valid)
);

// 上变频模块的输出wire和例化
wire [15:0]duc_1;
wire [15:0]duc_2 ;
wire [15:0]duc_3 ;
wire [15:0]duc_4 ;  
wire  duc_out_valid;   

duc duc_inst(
.clk_duc     (clk_ad_120m),
 .FPGA_nRESET(FPGA_nRESET),
.add_L_1_35_I (add_L_1_35_I ),
.add_L_1_35_Q (add_L_1_35_Q ),
.add_R_1_35_I (add_R_1_35_I ),
.add_R_1_35_Q (add_R_1_35_Q ),
.add_L_36_70_I(add_L_36_70_I),
.add_L_36_70_Q(add_L_36_70_Q),
.add_R_36_70_I(add_R_36_70_I),
.add_R_36_70_Q(add_R_36_70_Q),
.duc_v_in_valid(1'b1),

.duc_1(duc_1),
.duc_2(duc_2),
.duc_3(duc_3),
.duc_4(duc_4),
.duc_out_valid(duc_out_valid) 
);