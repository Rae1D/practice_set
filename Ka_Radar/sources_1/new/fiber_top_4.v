`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/28 07:24:48
// Design Name: 
// Module Name: fiber_top_4
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


module fiber_top_4(
   input enable,
       //  数据指令发送接口   
       input pro_clk,
       input pri,
       input [7:0] wave_code,
       //ddc_data
       input [15:0] data_length,  
       input data_ram_wr,  
        input [13:0] data_ram_addra,
       input [127:0] data_ram_din1,    
       input [127:0] data_ram_din2,    
       input [127:0] data_ram_din3,    
       input [127:0] data_ram_din4,       
        
       //frame_cmd_data
       input frame_cmd_en, 
       input data_ram_wr_t,  
       input [9:0] data_ram_addra_t,
       input [15:0] data_ram_din_t,        
       
       // 指令接收控制端口  
       input cmd_clk, 
       input[9:0] ram_addr_rx,
       output[15:0] ram_dout_rx,
       input ram_rd,    
       output  [15:0] cmd_frame_length, //控制指令长度
       output  cmd_valid,// 指令报文有效脉冲  目前只持续了一个时钟
        
       // GTX Reference Clock Interface
        input GTXQ0_P,
        input GTXQ0_N,
      // input refclk1_in,
       input clk_100m,
       
       // GTX Serial I/O
       input fiber_sd,
       output fiber_tx_dis,
       input[3:0]  RXP,
       input[3:0]  RXN,
       
       output[3:0] TXP,
       output CHANNEL_UP,
       output[3:0] TXN
    );
    
      parameter  data_clk_freq = 120000000  ;// data clk 时钟频率
           //TX Interface
        (* MARK_DEBUG="true" *)  wire     [0:255]     tx_tdata; 
         (* MARK_DEBUG="true" *) wire                tx_tvalid;
       wire     [0:31]      tx_tkeep;  
          (* MARK_DEBUG="true" *)wire                tx_tlast;
          (* MARK_DEBUG="true" *)wire                tx_tready;
 
      //RX Interface
 
           
           (* MARK_DEBUG="true" *) wire      [0:255]     rx_tdata;  
           (* MARK_DEBUG="true" *) wire                 rx_tvalid;
         wire      [0:31]      rx_tkeep;  
           (* MARK_DEBUG="true" *) wire                 rx_tlast;
         wire                 fiber_clk;
      wire refclk1_in;
      //--- Instance of GT differential buffer ---------//
           IBUFDS_GTE2 #(
            .CLKCM_CFG("TRUE"),   // Refer to Transceiver User Guide
            .CLKRCV_TRST("TRUE"), // Refer to Transceiver User Guide
            .CLKSWING_CFG(2'b11)  // Refer to Transceiver User Guide
         )
           IBUFDS_GTXE2_CLK1  
           (
               .O               (refclk1_in),
               .ODIV2           (),
               .CEB             (1'b0),
               .I               (GTXQ0_P),
               .IB              (GTXQ0_N)
           );

      
      
    pre_pro_fiber_top_v1  #(.data_clk_freq(data_clk_freq))
    pre_pro_fiber_top_v1_inst(
             .enable(enable),
            //  数据指令发送接口   
             .pro_clk(pro_clk),
             .pri(pri),
             .wave_code(wave_code),
            //ddc_data
             .data_length(data_length), 
             .data_ram_wr(data_ram_wr), 
             .data_ram_addra(data_ram_addra),
             .data_ram_din(data_ram_din1),  
     
            .frame_cmd_en(frame_cmd_en),
            .data_ram_wr_t(data_ram_wr_t),
            .data_ram_addra_t(data_ram_addra_t),
            .data_ram_din_t(data_ram_din_t),       
            
            // 指令接收控制端口  
            .cmd_clk(cmd_clk),
//            .ram_addr_rx(ram_addr_rx),
            .ram_dout_rx(ram_dout_rx),
//            .ram_rd(ram_rd), 
//            .cmd_frame_length(cmd_frame_length),
//            .cmd_valid(cmd_valid),             

            .fiber_clk(fiber_clk),           

            .tx_tdata_i(tx_tdata[0:63]),
            .tx_tvalid_i(tx_tvalid),
            .tx_tkeep_i(),  
            .tx_tlast_i(tx_tlast),
            .tx_tready_i(tx_tready),
            
            .rx_tdata_i(rx_tdata[0:63]),  
            .rx_tvalid_i(rx_tvalid),
            .rx_tkeep_i(rx_tkeep[0:7]),  
            .rx_tlast_i(rx_tlast)
    );
    
     pre_pro_fiber_top_v1b #(.data_clk_freq(data_clk_freq)) 
     pre_pro_fiber_top_v1b_inst1(
                .enable(enable),
               //  数据指令发送接口   
                .pro_clk(pro_clk),
                .pri(pri),
                .wave_code(wave_code),
               //ddc_data
                .data_length(data_length), 
                .data_ram_wr(data_ram_wr), 
                .data_ram_addra(data_ram_addra),
                .data_ram_din(data_ram_din2),  
        
               // GTX Reference Clock Interface
                .fiber_clk(fiber_clk),        

                .tx_tdata_i(tx_tdata[64:127]),
                .tx_tvalid_i(),
                .tx_tkeep_i(),  
                .tx_tlast_i(),
                .tx_tready_i(tx_tready),
                
                .rx_tdata_i(rx_tdata[64:127]),  
                .rx_tvalid_i(rx_tvalid),
                .rx_tkeep_i(rx_tkeep[8:15]),  
                .rx_tlast_i(rx_tlast)
       );
    
     pre_pro_fiber_top_v1b  #(.data_clk_freq(data_clk_freq))
     pre_pro_fiber_top_v1b_inst2(
                      .enable(enable),
                     //  数据指令发送接口   
                      .pro_clk(pro_clk),
                      .pri(pri),
                      .wave_code(wave_code),
                     //ddc_data
                      .data_length(data_length), 
                      .data_ram_wr(data_ram_wr), 
                      .data_ram_addra(data_ram_addra),
                      .data_ram_din(data_ram_din3),  
              
                        .fiber_clk(fiber_clk),     
                        .tx_tdata_i(tx_tdata[128:191]),
                        .tx_tvalid_i(),
                        .tx_tkeep_i(),  
                        .tx_tlast_i(),
                        .tx_tready_i(tx_tready),
                        
                        .rx_tdata_i(rx_tdata[128:191]),  
                        .rx_tvalid_i(rx_tvalid),
                        .rx_tkeep_i(rx_tkeep[16:23]),  
                        .rx_tlast_i(rx_tlast) 
             );
    
     pre_pro_fiber_top_v1b  #(.data_clk_freq(data_clk_freq))
     pre_pro_fiber_top_v1b_inst3(
                            .enable(enable),
                           //  数据指令发送接口   
                            .pro_clk(pro_clk),
                            .pri(pri),
                            .wave_code(wave_code),
                           //ddc_data
                            .data_length(data_length), 
                            .data_ram_wr(data_ram_wr), 
                            .data_ram_addra(data_ram_addra),
                            .data_ram_din(data_ram_din4),  
                            
                            .fiber_clk(fiber_clk),     
                            .tx_tdata_i(tx_tdata[192:255]),
                            .tx_tvalid_i(),
                            .tx_tkeep_i(),  
                            .tx_tlast_i(),
                            .tx_tready_i(tx_tready),
                            
                            .rx_tdata_i(rx_tdata[192:255]),  
                            .rx_tvalid_i(rx_tvalid),
                            .rx_tkeep_i(rx_tkeep[24:31]),  
                            .rx_tlast_i(rx_tlast) 
                            
                    
       
                   );
        (* MARK_DEBUG="true" *)   wire [0:3] LANE_UP;          
        (* MARK_DEBUG="true" *)   wire   CHANNEL_UP;          
       aurora_64b66b_4_exdes  aurora_64b66b_4_exdes_inst
                       (
                          .RESET(1'b0),   
                          .PMA_INIT(1'b0),      
                          // Error Detection Interface
                          .HARD_ERR(HARD_ERR),
                          .SOFT_ERR(SOFT_ERR),
                          // Status
                          .LANE_UP(LANE_UP),
                          .CHANNEL_UP(CHANNEL_UP),
                       
                          // System Interface
                          .INIT_CLK_IN(clk_100m),           
                          //70MHz DRP clk for Virtex-6 GTH
                          .DRP_CLK_IN(clk_100m),
                          // GTX Reference Clock Interface
                           .GTXQ0_P(GTXQ0_P),
                           .GTXQ0_N(GTXQ0_N),
                           // .refclk1_in(refclk1_in),
                          // GTX Serial I/O
                            .RXP(RXP),
                            .RXN(RXN),
                            .TXP(TXP),
                            .TXN(TXN),     
                           
                            .user_clk(fiber_clk),
                       
                            .tx_tdata_i(tx_tdata),
                            .tx_tvalid_i(tx_tvalid),
                            .tx_tkeep_i(32'hFFFFFFFF),  
                            .tx_tlast_i(tx_tlast),
                            .tx_tready_i(tx_tready),
                          
                            .rx_tdata_i(rx_tdata),  
                            .rx_tvalid_i(rx_tvalid),
                            .rx_tkeep_i(rx_tkeep),  
                            .rx_tlast_i(rx_tlast),
                            .CRC_PASS_FAIL_N(crc_pass_fail_n),
                            .CRC_VALID(crc_valid)         
                       
                       );                
                   
                   
    
endmodule
