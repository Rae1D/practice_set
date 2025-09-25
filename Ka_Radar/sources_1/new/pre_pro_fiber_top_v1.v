`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/03 09:08:17
// Design Name: 
// Module Name: top_v1
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


module pre_pro_fiber_top_v1(
        input enable,
        //  数据指令发送接口   
        input pro_clk,
        input pri,
        input [7:0] wave_code,
        //ddc_data
        input [15:0] data_length,  
        input data_ram_wr,  
        input [13:0] data_ram_addra,
        input [127:0] data_ram_din,    
         
        //frame_cmd_data
        input frame_cmd_en, 
        input data_ram_wr_t,  
        input [9:0] data_ram_addra_t,
        input [15:0] data_ram_din_t,        
        
        // 指令接收控制端口  
        input cmd_clk, 
//        input[9:0] ram_addr_rx,
        output[15:0] ram_dout_rx,
//        input ram_rd,    
//        output  [15:0] cmd_frame_length, //控制指令长度
//        output  cmd_valid,// 指令报文有效脉冲  目前只持续了一个时钟
         
        // GTX Reference Clock Interface
//        input GTXQ0_P,
//        input GTXQ0_N,

         //TX Interface
          input     fiber_clk,
          output      [0:63]     tx_tdata_i, 
          output                 tx_tvalid_i,
          output      [0:7]       tx_tkeep_i,  
          output                 tx_tlast_i,
          input                 tx_tready_i,
   
        //RX Interface
          input      [0:63]      rx_tdata_i,  
          input                 rx_tvalid_i,
          input      [0:7]       rx_tkeep_i,  
          input                 rx_tlast_i
    
    
 //       output fiber_clk
//        output [9:0] ram_addr_wr,
//        output [63:0] ram_din,
//        output   ram_wr,  
//        output   ce0 ,
//        output   ce1 ,
//        output   data_pri_test, //光纤接收到基带数据过程中持续高电平
//        output   rx_hf_dus ,     //光纤接收数据到数据解析发出的等待时间，持续时间为高电平               
//        input    cpib
    );
     parameter  data_clk_freq = 120000000  ;// data clk 时钟频率
     
     wire data_ram_wr;
     wire[13:0] data_ram_addra;
     wire[127:0] data_ram_din;   

//      (* MARK_DEBUG="true" *)wire CHANNEL_UP;
      wire HARD_ERR;
      wire SOFT_ERR;
      wire LANE_UP;
     (* MARK_DEBUG="true" *)  wire CHANNEL_UP; 
      
      wire[15:0] data_1_I;// 
      wire[15:0] data_1_Q;// 
      wire[15:0] data_2_I;// 
      wire[15:0] data_2_Q;// 
      wire[15:0] data_3_I;// 
      wire[15:0] data_3_Q;// 
      wire[15:0] data_4_I;// 
      wire[15:0] data_4_Q;// 
      wire data_valid    ;// 数据有效指示
      wire data_pri;     //  pri起始
      wire data_cpi;    // cpi 起始 此信号只是一个指示，时序不严格

//       wire [7:0]  wave_code = 8'h01;     
      
      
      
      
//    wire [15:0] ad_data_out_a;
//    wire [15:0] ad_data_out_b;
    
        //TX Interface
      wire     [0:63]     tx_tdata; 
      wire                tx_tvalid;
      wire     [0:7]      tx_tkeep;  
      wire                tx_tlast;
      wire                tx_tready;

     //RX Interface

          
        wire      [0:63]     rx_tdata;  
        wire                 rx_tvalid;
        wire      [0:7]      rx_tkeep;  
        wire                 rx_tlast;
        wire                 fiber_clk;
        

       
        wire cpib;      
        wire cpie;      
        wire sync;      
//        wire pri;      
         wire[0:63] data_frame;
         wire  data_frame_valid;
         wire  data_frame_last;

//	      (* MARK_DEBUG="true" *)  wire data_ram_rd;
          (* MARK_DEBUG="true" *) wire[127:0] data_ram_dout;// 
          (* MARK_DEBUG="true" *)  wire[13:0] data_ram_addrb;// 
        
          wire[0:63] data_frame_t;
          wire  data_frame_valid_t;
          wire  data_frame_last_t; 

        wire data_ram_rd_t;
        wire[63:0] data_ram_dout_t;// 
        wire[8:0] data_ram_addrb_t;// 
       
        reg[0:63] data_frame_fiber;
        reg  data_frame_valid_fiber;
        reg  data_frame_last_fiber;
           
        wire  crc_pass_fail_n;
        wire  crc_valid;
        wire  axis_data_fifo_v1_s_tready;
                      

        
        // 双口ram
        blk_ram_v1 blk_ram_v1_inst (
          .clka(pro_clk),    // input wire clka
          .wea(data_ram_wr),      // input wire [0 : 0] wea
          .addra(data_ram_addra),  // input wire [13 : 0] addra
          .dina(data_ram_din),    // input wire [127 : 0] dina
          .clkb(fiber_clk),    // input wire clkb
          .enb(data_ram_rd),      // input wire enb
          .addrb(data_ram_addrb),  // input wire [13 : 0] addrb
          .doutb(data_ram_dout)  // output wire [127 : 0] doutb
        );
              
        // 下变频后的数据组帧  下变频数据输入
        frame_ddc_data_v1a uut (
        //input 
        .clk(fiber_clk), 
        .enable(enable),  
        .pri(pri), 
        .data_length(data_length),
        .data_ram_dout(data_ram_dout),
        //output
        .data_ram_rd(data_ram_rd),
        .data_ram_addr(data_ram_addrb),
        .data_frame(data_frame), 
        .data_frame_valid(data_frame_valid), 
        .data_frame_last(data_frame_last)
            );   
 reg ram_rd;
reg [10:0]ram_addr_rx;  
reg [10:0]ram_addr_rx_t;  
reg ram_rd_reg;      
          // 双口ram
            blk_ram_t_v2 blk_ram_vt_inst (
              .clka(pro_clk),    // input wire clka
              .wea(ram_rd_reg),      // input wire [0 : 0] wea
              .addra(ram_addr_rx_t),  // input wire [7 : 0] addra
              .dina(ram_dout_rx),    // input wire [15 : 0] dina
              .clkb(fiber_clk),    // input wire clkb
              .enb(data_ram_rd_t),      // input wire enb
              .addrb(data_ram_addrb_t),  // input wire [7 : 0] addrb
              .doutb(data_ram_dout_t)  // output wire [63 : 0] doutb
            );
//  ila_cmd_test your_instance_name (
//	.clk(fiber_clk), // input wire clk


//	.probe0(data_ram_rd_t), // input wire [0:0]  probe0  
//	.probe1(data_ram_addrb_t), // input wire [7:0]  probe1 
//	.probe2(data_ram_dout_t), // input wire [63:0]  probe2
//	.probe3(data_ram_wr_t),
//	.probe4(data_ram_addra_t),
//	.probe5(data_ram_din_t)
//);

  // 定时和指令返回
           frame_timing_return_para_v1 frame_timing_return_para_v1_inst (
                    .clk(fiber_clk), 
                    .enable(enable), 
                    .frame_word_length(16'd265),
                    .data_ram_dout(data_ram_dout_t),
                    .frame_en(frame_cmd_en),   //  此处信号是定时模块产生的 定时和指令返回使能   
                    
                    .data_ram_rd(data_ram_rd_t),                 
                    .data_ram_addr(data_ram_addrb_t),
                     
                    .data_frame(data_frame_t), 
                    .data_frame_valid(data_frame_valid_t), 
                    .data_frame_last(data_frame_last_t)
                );
           
           
           always@(posedge fiber_clk)
           begin
                if(data_frame_valid_t)
                begin
                    data_frame_valid_fiber <= data_frame_valid_t;
                    data_frame_last_fiber <= data_frame_last_t;
                    data_frame_fiber <= data_frame_t;
                end
                else
                begin
                    data_frame_valid_fiber <= data_frame_valid;
                    data_frame_last_fiber  <= data_frame_last;
                    data_frame_fiber <= data_frame;
                end 
                     
           end
              
    // 组帧数据缓存，同时时钟域切换   
    axis_data_fifo_v1 axis_data_fifo_v1_inst (
    .s_axis_aresetn(1'b1),          // input wire s_axis_aresetn
    //.m_axis_aresetn(1'b1),          // input wire m_axis_aresetn
    .s_axis_aclk(fiber_clk),                // input wire s_axis_aclk
    .s_axis_tvalid(data_frame_valid_fiber),            // input wire s_axis_tvalid
    .s_axis_tready(axis_data_fifo_v1_s_tready),            // output wire s_axis_tready
    .s_axis_tdata(data_frame_fiber),              // input wire [63 : 0] s_axis_tdata
    .s_axis_tkeep(8'hFF),              // input wire [7 : 0] s_axis_tkeep
    .s_axis_tlast(data_frame_last_fiber),              // input wire s_axis_tlast
    
    .m_axis_aclk(fiber_clk),                // input wire m_axis_aclk
      .m_axis_tvalid(tx_tvalid_i),            // output wire m_axis_tvalid
      .m_axis_tready(tx_tready_i),            // input wire m_axis_tready
      .m_axis_tdata(tx_tdata_i),              // output wire [63 : 0] m_axis_tdata
      .m_axis_tkeep(tx_tkeep_i),              // output wire [7 : 0] m_axis_tkeep
      .m_axis_tlast(tx_tlast_i),              // output wire m_axis_tlast
    //.axis_data_count(),        // output wire [31 : 0] axis_data_count
    .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
    .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
    );
               
//    aurora_64b66b_0_exdes  aurora_64b66b_0_exdes_inst
//    (
//       .RESET(1'b0),   
//       .PMA_INIT(1'b0),      
//       // Error Detection Interface
//       .HARD_ERR(HARD_ERR),
//       .SOFT_ERR(SOFT_ERR),
//       // Status
//       .LANE_UP(LANE_UP),
//       .CHANNEL_UP(CHANNEL_UP),
    
//       // System Interface
//       .INIT_CLK_IN(clk_100m),           
//       //70MHz DRP clk for Virtex-6 GTH
//       .DRP_CLK_IN(clk_100m),
//       // GTX Reference Clock Interface
////       .GTXQ0_P(GTXQ0_P),
////       .GTXQ0_N(GTXQ0_N),
//         .refclk1_in(refclk1_in),
//       // GTX Serial I/O
//         .RXP(RXP),
//         .RXN(RXN),
//         .TXP(TXP),
//         .TXN(TXN),     
        
//         .user_clk(fiber_clk),
    
//         .tx_tdata_i(tx_tdata),
//         .tx_tvalid_i(tx_tvalid),
//         .tx_tkeep_i(tx_tkeep),  
//         .tx_tlast_i(tx_tlast),
//         .tx_tready_i(tx_tready),
       
//         .rx_tdata_i(rx_tdata),  
//         .rx_tvalid_i(rx_tvalid),
//         .rx_tkeep_i(rx_tkeep),  
//         .rx_tlast_i(rx_tlast),
//         .CRC_PASS_FAIL_N(crc_pass_fail_n),
//         .CRC_VALID(crc_valid)         
    
//    );
   
//assign fiber_tx_dis = 1'b0 ;
  reg cmd_valid_reg;
reg [9:0]ram_addr;
wire wea;
reg wea_reg;
 pre_pro_fiber_rx  pre_pro_fiber_rx_inst (
    .clk(cmd_clk), 
    .ram_addr_rx(ram_addr_rx), 
    .ram_dout_rx(ram_dout_rx), 
    .ram_rd(ram_rd), 
    .cmd_frame_length(cmd_frame_length), 
    .cmd_valid(cmd_valid), 
    .fiber_clk(fiber_clk), 
    .enable(enable), 
    .fiber_rx_tdata(rx_tdata_i), 
    .fiber_rx_tvalid(rx_tvalid_i), 
    .fiber_rx_tkeep(rx_tkeep_i), 
    .fiber_rx_tlast(rx_tlast_i), 
    .crc_pass_fail_n(crc_pass_fail_n), 
    .crc_valid(crc_valid)
    );

reg [9:0]cnt_10us;
always@(posedge cmd_clk)
    begin
    cmd_valid_reg <= cmd_valid;
        if(!enable)
        begin
        cnt_10us <= 0;
        end
        else if(cmd_valid_reg == 1 && cmd_valid == 0)
        cnt_10us <= 1;
        else if(cnt_10us > 0 && cnt_10us < 1200)
        cnt_10us <= cnt_10us +1;
        else
        cnt_10us <= 0;
end
always@(posedge cmd_clk)
begin
ram_rd_reg <= ram_rd;
ram_addr_rx_t <= ram_addr_rx + 6;
        if(cnt_10us >= 600 && cnt_10us < 865)
        ram_rd <= 1;
          else
          ram_rd <= 0;       
        if(ram_rd == 1 && (ram_addr_rx >= 0 && ram_addr_rx < 265))
        begin
           ram_addr_rx <= ram_addr_rx + 1;
           end
           else
           begin
           ram_addr_rx <= 0;
           end
    end

    
// // 测试端口
//  pro_fiber_rx_v3 #(.data_clk_freq(data_clk_freq))
//  pro_fiber_rx_inst (
//                   .clk(fiber_clk), 
//                   .enable(enable), 
//                //   .wave_code(wave_code), 
//                   .data_frame(data_frame_fiber), 
//                   .data_frame_valid(data_frame_valid_fiber), 
//                   .data_frame_last(data_frame_last_fiber), 
                   
//                    .data_clk(data_clk), 
//                   .data_AW_I(data_AW_I), 
//                   .data_AW_Q(data_AW_Q), 
//                   .data_AN_I(data_AN_I), 
//                   .data_AN_Q(data_AN_Q), 
//                   .data_SW_I(data_SW_I), 
//                   .data_SW_Q(data_SW_Q), 
//                   .data_SN_I(data_SN_I), 
//                   .data_SN_Q(data_SN_Q), 
//                   .data_valid(data_valid), 
//                   .data_pri(data_pri), 
//                   .data_cpi(data_cpi),                  
//                   .ccm12(ccm12), 
//                   .ccm15(ccm15), 
//                   .ccm16(ccm16), 
//                   .ccm22(ccm22), 
//                   .ram_addr_wr(ram_addr_wr), 
//                   .ram_din(ram_din), 
//                   .ram_wr(ram_wr), 
//                   .ce0(ce0), 
//                   .ce1(ce1),
//                   .data_pri_test(data_pri_test),
//                   .rx_hf_dus(rx_hf_dus),
//		           .cpib(cpib)		  
//                   );   

 
ila_1 your_instance_name (
	.clk(cmd_clk), // input wire clk


	.probe0(cmd_valid), // input wire [0:0]  probe0  
	.probe1(ram_rd), // input wire [0:0]  probe1 
	.probe2(ram_addr_rx), // input wire [9:0]  probe2 
	.probe3(ram_dout_rx), // input wire [15:0]  probe3 
	.probe4(data_ram_rd_t), // input wire [0:0]  probe4 
	.probe5(data_ram_addrb_t), // input wire [7:0]  probe5 
	.probe6(data_ram_dout_t) // input wire [63:0]  probe6
);

     
endmodule
