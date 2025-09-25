 ///////////////////////////////////////////////////////////////////////////////
 //
 // Project:  Aurora 64B/66B
 // Company:  Xilinx
 //
 //
 //
 // (c) Copyright 2008 - 2009 Xilinx, Inc. All rights reserved.
 //
 // This file contains confidential and proprietary information
 // of Xilinx, Inc. and is protected under U.S. and
 // international copyright and other intellectual property
 // laws.
 //
 // DISCLAIMER
 // This disclaimer is not a license and does not grant any
 // rights to the materials distributed herewith. Except as
 // otherwise provided in a valid license issued to you by
 // Xilinx, and to the maximum extent permitted by applicable
 // law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 // WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 // AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 // BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 // INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 // (2) Xilinx shall not be liable (whether in contract or tort,
 // including negligence, or under any other theory of
 // liability) for any loss or damage of any kind or nature
 // related to, arising under or in connection with these
 // materials, including for any direct, or any indirect,
 // special, incidental, or consequential loss or damage
 // (including loss of data, profits, goodwill, or any type of
 // loss or damage suffered as a result of any action brought
 // by a third party) even if such damage or loss was
 // reasonably foreseeable or Xilinx had been advised of the
 // possibility of the same.
 //
 // CRITICAL APPLICATIONS
 // Xilinx products are not designed or intended to be fail-
 // safe, or for use in any application requiring fail-safe
 // performance, such as life-support or safety devices or
 // systems, Class III medical devices, nuclear facilities,
 // applications related to the deployment of airbags, or any
 // other applications that could lead to death, personal
 // injury, or severe property or environmental damage
 // (individually and collectively, "Critical
 // Applications"). Customer assumes the sole risk and
 // liability of any use of Xilinx products in Critical
 // Applications, subject only to applicable laws and
 // regulations governing limitations on product liability.
 //
 // THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 // PART OF THIS FILE AT ALL TIMES.

 //
 ///////////////////////////////////////////////////////////////////////////////
 //
 //  EXAMPLE_DESIGN
 //
 //
 //  Description:  This module instantiates 4 lane Aurora Module.
 //                Used to exhibit functionality in hardware using the example design
 //                The User Interface is connected to Data Generator and Checker.
 ///////////////////////////////////////////////////////////////////////////////

 // aurora sample file, example design

 `timescale 1 ns / 10 ps

   (* core_generation_info = "aurora_64b66b_4,aurora_64b66b_v11_2_5,{c_aurora_lanes=4,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=2,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=3,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=4,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=4.8,c_gt_type=gtx,c_qpll=false,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=120.0,c_simplex=false,c_simplex_mode=TX,c_stream=false,c_ufc=false,c_user_k=false,flow_mode=None,interface_mode=Framing,dataflow_config=Duplex}" *)
(* DowngradeIPIdentifiedWarnings="yes" *)
 module aurora_64b66b_4_exdes  #
 (
     parameter   USE_CORE_TRAFFIC     =   1,
     parameter   USR_CLK_PCOUNT     =  9'd255,
     parameter   EXAMPLE_SIMULATION =   0
      //pragma translate_off
        | 1
      //pragma translate_on
      ,
      parameter   USE_LABTOOLS       =   0
 )
 (
     RESET,

     // Error Detection Interface
     HARD_ERR,
     SOFT_ERR,
     
     // Status
     LANE_UP,
     CHANNEL_UP,

     // System Interface
     INIT_CLK_IN,
     PMA_INIT,

     //70MHz DRP clk for Virtex-6 GTH
     DRP_CLK_IN,
     // GTX Reference Clock Interface
     GTXQ0_P,
     GTXQ0_N,



     CRC_PASS_FAIL_N,
     CRC_VALID,


     // GTX Serial I/O
     RXP,
     RXN,
     TXP,
     TXN,     
    
    user_clk,
     tx_tdata_i,
     tx_tvalid_i,
      tx_tkeep_i,  
     tx_tlast_i,
     tx_tready_i,
    
      rx_tdata_i,  
     rx_tvalid_i,
      rx_tkeep_i,  
     rx_tlast_i

 );
 `define DLY #1


 //***********************************Port Declarations*******************************

       input               RESET;

     // Error Detection Interface
       output            HARD_ERR;
       output            SOFT_ERR;
    

     // Status
       output  [0:3]      LANE_UP;
       output             CHANNEL_UP;

       input              PMA_INIT;
//       input              INIT_CLK_P;
//       input              INIT_CLK_N;
       input              INIT_CLK_IN;
       input              DRP_CLK_IN;

     // GTX Reference Clock Interface
       input              GTXQ0_P;
       input              GTXQ0_N;


     // GTX Serial I/O
       input   [0:3]      RXP;
       input   [0:3]      RXN;

       output  [0:3]      TXP;
       output  [0:3]      TXN;

       output             CRC_PASS_FAIL_N;
       output             CRC_VALID;

       output user_clk;
     //TX Interface
       input      [0:255]     tx_tdata_i; 
       input                 tx_tvalid_i;
       input      [0:31]       tx_tkeep_i;  
       input                 tx_tlast_i;
       output                 tx_tready_i;

     //RX Interface
       output      [0:255]      rx_tdata_i;  
       output                 rx_tvalid_i;
       output      [0:31]       rx_tkeep_i;  
       output                 rx_tlast_i;




 //************************External Register Declarations*****************************

     //Error reporting signals
       reg                  HARD_ERR;
       reg                  SOFT_ERR;
(* KEEP = "TRUE" *)       reg       [0:7]      DATA_ERR_COUNT;

     //Global signals
       reg       [0:3]      LANE_UP;
       reg                  CHANNEL_UP;

 //********************************Wire Declarations**********************************

     wire    [280:0]          tied_to_ground_vec_i;
     wire            INIT_CLK_IN;

     //Dut1
     //TX Interface
       wire      [0:255]    tx_tdata_i; 
       wire                 tx_tvalid_i;
       wire      [0:31]      tx_tkeep_i;  
       wire                 tx_tlast_i;
       wire                 tx_tready_i;

     //RX Interface
       wire      [0:255]     rx_tdata_i;  
       wire                 rx_tvalid_i;
       wire      [0:31]      rx_tkeep_i;  
       wire                 rx_tlast_i;





     //TX Interface
       wire      [0:255]    tx_d_i;
       wire                 tx_src_rdy_n_i;
       wire      [0:4]       tx_rem_i;
       wire                 tx_sof_n_i;
       wire                 tx_eof_n_i;
       wire                 tx_dst_rdy_n_i;

     //RX Interface
       wire      [0:255]     rx_d_i;
       wire                 rx_src_rdy_n_i;
       wire      [0:4]       rx_rem_i;
       wire                 rx_sof_n_i;
       wire                 rx_eof_n_i;




     //Error Detection Interface
       wire                 hard_err_i;
       wire                 soft_err_i;

     //Status
       wire                 channel_up_i;
       wire      [0:3]      lane_up_i;


     //System Interface
       wire                 reset_i ;
       wire                 gt_rxcdrovrden_i ;
       wire                 power_down_i;
       wire      [2:0]      loopback_i ;
       wire                 gt_pll_lock_i ;
       wire                 fsm_resetdone_i ;
       wire                 tx_out_clk_i ;

     // Error signals from the frame checker
       wire      [0:7]       data_err_count_o;
     wire                  data_err_init_clk_i;


     // clock
       wire               user_clk_i;
       wire               sync_clk_i;
 wire               INIT_CLK_i  /* synthesis syn_keep = 1 */;

     wire               drp_clk_i = INIT_CLK_i;
     wire               DRP_CLK_i;
     wire    [8:0] drpaddr_in_i;
     wire    [15:0]     drpdi_in_i;
       wire    [15:0]     drpdo_out_i;
       wire               drprdy_out_i;
       wire               drpen_in_i;
       wire               drpwe_in_i;
     wire    [8:0] drpaddr_in_lane1_i;
     wire    [15:0]     drpdi_in_lane1_i;
       wire    [15:0]     drpdo_out_lane1_i;
       wire               drprdy_out_lane1_i;
       wire               drpen_in_lane1_i;
       wire               drpwe_in_lane1_i;
     wire    [8:0] drpaddr_in_lane2_i;
     wire    [15:0]     drpdi_in_lane2_i;
       wire    [15:0]     drpdo_out_lane2_i;
       wire               drprdy_out_lane2_i;
       wire               drpen_in_lane2_i;
       wire               drpwe_in_lane2_i;
     wire    [8:0] drpaddr_in_lane3_i;
     wire    [15:0]     drpdi_in_lane3_i;
       wire    [15:0]     drpdo_out_lane3_i;
       wire               drprdy_out_lane3_i;
       wire               drpen_in_lane3_i;
       wire               drpwe_in_lane3_i;
       wire               link_reset_i;
       wire               sysreset_from_vio_i =1'b0 ;
       wire               gtreset_from_vio_i =1'b0 ;
       wire               rx_cdrovrden_i =1'b0 ;
       wire               gt_reset_i;
       wire               gt_reset_i_tmp;
       wire               gt_reset_i_tmp2;
       wire               sysreset_from_vio_r3;
       wire               sysreset_from_vio_r3_initclkdomain;
       wire               gtreset_from_vio_r3;
       wire               tied_to_ground_i;
       wire               tied_to_vcc_i;
       wire               gt_reset_i_eff;
       wire               system_reset_i;
       wire                          pll_not_locked_i;
 
reg  pma_init_from_fsm = 0;
reg pma_init_from_fsm_r1 = 0;
reg lane_up_vio_usrclk_r1 = 0;
reg data_err_count_o_r1  = 0;
(* mark_debug = "TRUE" *) reg rx_tvalid_r = 1'd0;
 
(* mark_debug = "TRUE" *) reg [8:0] usr_clk_counter = 9'd0;
(* mark_debug = "TRUE" *) wire usr_clk_count_done;
 

     wire reset2FrameGenCheck;
 

 //*********************************Main Body of Code**********************************

  //   assign reset2FrameGenCheck = system_reset_i | !channel_up_i;
 
     assign INIT_CLK_i = INIT_CLK_IN ;




//--- Instance of GT differential buffer ---------//

     //____________________________Register User I/O___________________________________

     // Register User Outputs from core.
     always @(posedge user_clk_i)
     begin
         HARD_ERR         <=  hard_err_i;
         SOFT_ERR         <=  soft_err_i;
         LANE_UP          <=  lane_up_i;
         CHANNEL_UP       <=  channel_up_i;
  
     end

assign DRP_CLK_i   = DRP_CLK_IN;
assign user_clk   = user_clk_i;


//   BUFG drpclk_bufg_i
//   (
//      .I  (DRP_CLK_IN),
//      .O  (DRP_CLK_i)
//   );

     //____________________________Register User I/O___________________________________

     // System Interface
     assign power_down_i      =   1'b0;
     assign tied_to_ground_i   =   1'b0;
     assign tied_to_ground_vec_i = 281'd0;
     assign tied_to_vcc_i      =   1'b1;
    // Native DRP Interface
     assign  drpaddr_in_i                     =  'h0;
     assign  drpdi_in_i                       =  16'h0;
     assign  drpwe_in_i     =  1'b0;
     assign  drpen_in_i     =  1'b0;
     assign  drpaddr_in_lane1_i                     =  'h0;
     assign  drpdi_in_lane1_i                       =  16'h0;
     assign  drpwe_in_lane1_i     =  1'b0;
     assign  drpen_in_lane1_i     =  1'b0;
     assign  drpaddr_in_lane2_i                     =  'h0;
     assign  drpdi_in_lane2_i                       =  16'h0;
     assign  drpwe_in_lane2_i     =  1'b0;
     assign  drpen_in_lane2_i     =  1'b0;
     assign  drpaddr_in_lane3_i                     =  'h0;
     assign  drpdi_in_lane3_i                       =  16'h0;
     assign  drpwe_in_lane3_i     =  1'b0;
     assign  drpen_in_lane3_i     =  1'b0;





   reg [127:0]        pma_init_stage = {128{1'b1}};
 reg [23:0]         pma_init_pulse_width_cnt = 24'h0;
   reg pma_init_assertion = 1'b0;
 reg pma_init_assertion_r;
   reg gt_reset_i_delayed_r1;
  reg gt_reset_i_delayed_r2;
   wire gt_reset_i_delayed;



     generate
        always @(posedge INIT_CLK_i)
        begin
            pma_init_stage[127:0] <= {pma_init_stage[126:0], gt_reset_i_tmp};
        end

        assign gt_reset_i_delayed = pma_init_stage[127];

        always @(posedge INIT_CLK_i)
        begin
            gt_reset_i_delayed_r1     <=  gt_reset_i_delayed;
            gt_reset_i_delayed_r2     <=  gt_reset_i_delayed_r1;
            pma_init_assertion_r  <= pma_init_assertion;
            if(~gt_reset_i_delayed_r2 & gt_reset_i_delayed_r1 & ~pma_init_assertion & (pma_init_pulse_width_cnt != 24'hFFFFFF))
                pma_init_assertion <= 1'b1;
            else if (pma_init_assertion & pma_init_pulse_width_cnt == 24'hFFFFFF)
                pma_init_assertion <= 1'b0;

            if(pma_init_assertion)
                pma_init_pulse_width_cnt <= pma_init_pulse_width_cnt + 24'h1;
        end



    if(EXAMPLE_SIMULATION)
    assign gt_reset_i_eff = gt_reset_i_delayed;
    else
    assign gt_reset_i_eff = pma_init_assertion ? 1'b1 : gt_reset_i_delayed;


     if(USE_LABTOOLS)
     begin:chip_reset
     assign  gt_reset_i_tmp = PMA_INIT | gtreset_from_vio_r3 | pma_init_from_fsm_r1;
     assign  reset_i  =  RESET | sysreset_from_vio_r3;
     assign  gt_reset_i = gt_reset_i_eff;
     assign  gt_rxcdrovrden_i  =  rx_cdrovrden_i;
     end
     else
     begin:no_chip_reset
     assign  gt_reset_i_tmp = PMA_INIT;
     assign  reset_i  =   RESET | gt_reset_i_tmp2;
     assign  gt_reset_i = gt_reset_i_eff;
     assign  gt_rxcdrovrden_i  =  1'b0;
     assign  loopback_i  =  3'b000;
     end

     if(!USE_LABTOOLS)
     begin
aurora_64b66b_4_rst_sync_exdes   u_rst_sync_gtrsttmpi
     (
       .prmry_in     (gt_reset_i_tmp),
       .scndry_aclk  (user_clk_i),
       .scndry_out   (gt_reset_i_tmp2)
      );
     end

     endgenerate

     //___________________________Module Instantiations_________________________________

// this is non shared mode, the clock, GT common are part of example design.
    aurora_64b66b_4_support
aurora_64b66b_4_block_i
     (
        // TX AXI4-S Interface
         .s_axi_tx_tdata(tx_tdata_i),
         .s_axi_tx_tlast(tx_tlast_i),
         .s_axi_tx_tkeep(tx_tkeep_i),
         .s_axi_tx_tvalid(tx_tvalid_i),
         .s_axi_tx_tready(tx_tready_i),


        // RX AXI4-S Interface
         .m_axi_rx_tdata(rx_tdata_i),
         .m_axi_rx_tlast(rx_tlast_i),
         .m_axi_rx_tkeep(rx_tkeep_i),
         .m_axi_rx_tvalid(rx_tvalid_i),



        // GT Serial I/O
         .rxp(RXP),
         .rxn(RXN),

         .txp(TXP),
         .txn(TXN),


        //GT Reference Clock Interface
        .gt_refclk1_p (GTXQ0_P),
        .gt_refclk1_n (GTXQ0_N),
        // Error Detection Interface
         .hard_err              (hard_err_i),
         .soft_err              (soft_err_i),

        // Status
         .channel_up            (channel_up_i),
         .lane_up               (lane_up_i),
         .crc_pass_fail_n       (CRC_PASS_FAIL_N),
         .crc_valid             (CRC_VALID),

        // System Interface
        .INIT_CLK_i(INIT_CLK_i),
         .init_clk_out          (),
         .user_clk_out          (user_clk_i),

         .sync_clk_out(sync_clk_i),
         .reset_pb(reset_i),
         .gt_rxcdrovrden_in(gt_rxcdrovrden_i),
         .power_down(power_down_i),
         .loopback(loopback_i),
         .pma_init(gt_reset_i),
         .gt_pll_lock(gt_pll_lock_i),
         .drp_clk_in(DRP_CLK_i),// (drp_clk_i),
    //---------------------- GT DRP Ports ----------------------
         .drpaddr_in          (drpaddr_in_i),
         .drpdi_in            (drpdi_in_i),
         .drpdo_out           (drpdo_out_i),
         .drprdy_out          (drprdy_out_i),
         .drpen_in            (drpen_in_i),
         .drpwe_in            (drpwe_in_i),
         .drpaddr_in_lane1          (drpaddr_in_lane1_i),
         .drpdi_in_lane1            (drpdi_in_lane1_i),
         .drpdo_out_lane1           (drpdo_out_lane1_i),
         .drprdy_out_lane1          (drprdy_out_lane1_i),
         .drpen_in_lane1            (drpen_in_lane1_i),
         .drpwe_in_lane1            (drpwe_in_lane1_i),
         .drpaddr_in_lane2          (drpaddr_in_lane2_i),
         .drpdi_in_lane2            (drpdi_in_lane2_i),
         .drpdo_out_lane2           (drpdo_out_lane2_i),
         .drprdy_out_lane2          (drprdy_out_lane2_i),
         .drpen_in_lane2            (drpen_in_lane2_i),
         .drpwe_in_lane2            (drpwe_in_lane2_i),
         .drpaddr_in_lane3          (drpaddr_in_lane3_i),
         .drpdi_in_lane3            (drpdi_in_lane3_i),
         .drpdo_out_lane3           (drpdo_out_lane3_i),
         .drprdy_out_lane3          (drprdy_out_lane3_i),
         .drpen_in_lane3            (drpen_in_lane3_i),
         .drpwe_in_lane3            (drpwe_in_lane3_i),


//         .init_clk_p                            (INIT_CLK_P),
//         .init_clk_n                            (INIT_CLK_N),
         .link_reset_out                        (link_reset_i),
         .mmcm_not_locked_out                   (pll_not_locked_i),




         .sys_reset_out                            (system_reset_i),
         .tx_out_clk                               (tx_out_clk_i)
     );



     always @(posedge user_clk_i)
         if (reset2FrameGenCheck)
             rx_tvalid_r <=  `DLY 1'b0;
         else if (rx_tvalid_i)
         	 rx_tvalid_r <=  `DLY 1'b1;
         else 
         	 rx_tvalid_r <=  `DLY rx_tvalid_r;


     always @(posedge user_clk_i)
         if (reset2FrameGenCheck)
             usr_clk_counter <=  `DLY 'd0;
         else if (usr_clk_counter >= USR_CLK_PCOUNT)
         	 usr_clk_counter <=  `DLY USR_CLK_PCOUNT;
         else 
         	 usr_clk_counter <=  `DLY usr_clk_counter + 1'b1;

     assign usr_clk_count_done = (usr_clk_counter >= USR_CLK_PCOUNT)? 1'b1:1'b0;

    reg usr_clk_count_done_r;
    reg usr_clk_count_done_r2;     

     always @(posedge user_clk_i)
             usr_clk_count_done_r <=  `DLY usr_clk_count_done;

     always @(posedge user_clk_i)
             usr_clk_count_done_r2 <=  `DLY usr_clk_count_done_r;


//------------------------------------------------------------------------------
 endmodule
