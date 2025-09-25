// file: AD_RX_IP.v
// (c) Copyright 2009 - 2011 Xilinx, Inc. All rights reserved.
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
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//----------------------------------------------------------------------------

`timescale 1ps/1ps

(* CORE_GENERATION_INFO = "AD_RX_IP,selectio_wiz_v4_1,{component_name=AD_RX_IP,bus_dir=INPUTS,bus_sig_type=DIFF,bus_io_std=LVDS_25,use_serialization=true,use_phase_detector=false,serialization_factor=8,enable_bitslip=false,enable_train=false,system_data_width=8,bus_in_delay=NONE,bus_out_delay=NONE,clk_sig_type=DIFF,clk_io_std=LVCMOS18,clk_buf=BUFIO2,active_edge=RISING,clk_delay=NONE,v6_bus_in_delay=VAR_LOADABLE,v6_bus_out_delay=NONE,v6_clk_buf=MMCM,v6_active_edge=DDR,v6_ddr_alignment=SAME_EDGE_PIPELINED,v6_oddr_alignment=SAME_EDGE,ddr_alignment=C0,v6_interface_type=NETWORKING,interface_type=NETWORKING,v6_bus_in_tap=0,v6_bus_out_tap=0,v6_clk_io_std=LVDS_25,v6_clk_sig_type=DIFF}" *)

module AD_RX_IP
   // width of the data for the system
 #(parameter sys_w = 8,
   // width of the data for the device
   parameter dev_w = 64)
 (input ISERDES_RST,
  // From the system into the device
  input  [sys_w-1:0] DATA_IN_FROM_PINS_P,
  input  [sys_w-1:0] DATA_IN_FROM_PINS_N,
  output [dev_w-1:0] DATA_IN_TO_DEVICE,
//  input              IN_DELAY_RESET,                       // Active high synchronous reset for input delay
//  input  [sys_w -1 :0]           IN_DELAY_DATA_CE,                     // Enable signal for delay
//  input  [sys_w -1 :0]           IN_DELAY_DATA_INC,                    // Delay increment (high), decrement (low) signal
  input  [4:0]       IN_DELAY_TAP_IN,  // Dynamically loadable delay tap value for input delay
  output [4:0]       IN_DELAY_TAP_OUT, // Delay tap value for monitoring input delay
//  output             DELAY_LOCKED,   // Locked signal from IDELAYCTRL
//  input              REF_CLOCK,      // Reference clock for IDELAYCTRL. Has to come from BUFG.
//  input              BITSLIP,       // Bitslip module is enabled in NETWORKING mode
                                    // User should tie it to '0' if not needed
  input              CLK_IN,        // Fast clock input from PLL/MMCM
  input              CLK_DIV_IN//,    // Slow clock input from PLL/MMCM
//  input              IO_RESET
  );
  localparam         num_serial_bits = dev_w/sys_w;
  // Signal declarations
  ////------------------------------
  wire               clock_enable = 1'b1;
  // After the buffer
  wire   [sys_w-1:0] data_in_from_pins_int;
  // Between the delay and serdes
  wire [sys_w-1:0]  data_in_from_pins_delay;
  wire [sys_w-1:0] in_delay_ce;
  wire [sys_w-1:0] in_delay_inc_dec;
  wire [4:0]  in_delay_tap_in_int[0:sys_w - 1];   // fills in starting with 0
  wire [4:0]  in_delay_tap_out_int[0:sys_w - 1];   // fills in starting with 0
  // Array to use intermediately from the serdes to the internal
  //  devices. bus "0" is the leftmost bus
  wire [sys_w-1:0]  iserdes_q[0:13];   // fills in starting with 0
//   assign in_delay_ce = {                      IN_DELAY_DATA_CE[7],
//                     IN_DELAY_DATA_CE[6],
//                     IN_DELAY_DATA_CE[5],
//                     IN_DELAY_DATA_CE[4],
//                     IN_DELAY_DATA_CE[3],
//                     IN_DELAY_DATA_CE[2],
//                     IN_DELAY_DATA_CE[1],
//                     IN_DELAY_DATA_CE[0]};
//   assign in_delay_inc_dec = {                      IN_DELAY_DATA_INC[7],
//                     IN_DELAY_DATA_INC[6],
//                     IN_DELAY_DATA_INC[5],
//                     IN_DELAY_DATA_INC[4],
//                     IN_DELAY_DATA_INC[3],
//                     IN_DELAY_DATA_INC[2],
//                     IN_DELAY_DATA_INC[1],
//                     IN_DELAY_DATA_INC[0]};
   assign in_delay_tap_in_int[0] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[1] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[2] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[3] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[4] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[5] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[6] = IN_DELAY_TAP_IN ;
//   assign in_delay_tap_in_int[7] = IN_DELAY_TAP_IN ;
   assign IN_DELAY_TAP_OUT = in_delay_tap_out_int[0];
//   assign IN_DELAY_TAP_OUT[5*(1 + 1) -1:5*(1)] = in_delay_tap_out_int[1];
//   assign IN_DELAY_TAP_OUT[5*(2 + 1) -1:5*(2)] = in_delay_tap_out_int[2];
//   assign IN_DELAY_TAP_OUT[5*(3 + 1) -1:5*(3)] = in_delay_tap_out_int[3];
//   assign IN_DELAY_TAP_OUT[5*(4 + 1) -1:5*(4)] = in_delay_tap_out_int[4];
//   assign IN_DELAY_TAP_OUT[5*(5 + 1) -1:5*(5)] = in_delay_tap_out_int[5];
//   assign IN_DELAY_TAP_OUT[5*(6 + 1) -1:5*(6)] = in_delay_tap_out_int[6];
//   assign IN_DELAY_TAP_OUT[5*(7 + 1) -1:5*(7)] = in_delay_tap_out_int[7];
  // Create the clock logic

  // We have multiple bits- step over every bit, instantiating the required elements
  genvar pin_count;
  genvar slice_count;
  generate for (pin_count = 0; pin_count < sys_w; pin_count = pin_count + 1) begin: pins
    // Instantiate the buffers
    ////------------------------------
    // Instantiate a buffer for every bit of the data bus
    IBUFDS
      #(.DIFF_TERM  ("TRUE"),             // Differential termination
        .IOSTANDARD ("LVDS"))
     ibufds_inst
       (.I          (DATA_IN_FROM_PINS_P  [pin_count]),
        .IB         (DATA_IN_FROM_PINS_N  [pin_count]),
        .O          (data_in_from_pins_int[pin_count]));

    // Instantiate the delay primitive
    ////-------------------------------

     (* IODELAY_GROUP = "AD_RX_IP_group" *)
     IDELAYE2
       # (
         .CINVCTRL_SEL           ("FALSE"),                            // TRUE, FALSE
         .DELAY_SRC              ("IDATAIN"),                          // IDATAIN, DATAIN
         .HIGH_PERFORMANCE_MODE  ("FALSE"),                            // TRUE, FALSE
         .IDELAY_TYPE            ("VAR_LOAD"),              // FIXED, VARIABLE, or VAR_LOADABLE
         .IDELAY_VALUE           (0),                  // 0 to 31
         .REFCLK_FREQUENCY       (200.0),
         .PIPE_SEL               ("FALSE"),
         .SIGNAL_PATTERN         ("DATA"))                             // CLOCK, DATA
       idelaye2_bus
           (
         .DATAOUT                (data_in_from_pins_delay[pin_count]),
         .DATAIN                 (1'b0),                               // Data from FPGA logic
         .C                      (CLK_DIV_IN),
         .CE                     (in_delay_ce[pin_count]), //(IN_DELAY_DATA_CE),
         .INC                    (in_delay_inc_dec[pin_count]), //IN_DELAY_DATA_INC),
         .IDATAIN                (data_in_from_pins_int  [pin_count]), // Driven by IOB
         .LD                     (1'b1),//IN_DELAY_RESET
         .REGRST                 (1'b0),
         .LDPIPEEN               (1'b0),
         .CNTVALUEIN             (in_delay_tap_in_int[pin_count]), //IN_DELAY_TAP_IN),
         .CNTVALUEOUT            (in_delay_tap_out_int[pin_count]), //IN_DELAY_TAP_OUT),
         .CINVCTRL               (1'b0)
         );


     // Instantiate the serdes primitive
     ////------------------------------

     // local wire only for use in this generate loop
     wire cascade_shift;
     wire [sys_w-1:0] icascade1;
     wire [sys_w-1:0] icascade2;
     wire clk_in_int_inv;

     assign clk_in_int_inv = ~ CLK_IN;

     // declare the iserdes
     ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (8),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("IFD"),                                // Use input at DDLY to output the data on Q
         .SERDES_MODE       ("MASTER"))
       iserdese2_master (
         .Q1                (iserdes_q[0][pin_count]),
         .Q2                (iserdes_q[1][pin_count]),
         .Q3                (iserdes_q[2][pin_count]),
         .Q4                (iserdes_q[3][pin_count]),
         .Q5                (iserdes_q[4][pin_count]),
         .Q6                (iserdes_q[5][pin_count]),
         .Q7                (iserdes_q[6][pin_count]),
         .Q8                (iserdes_q[7][pin_count]),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (0),                             // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                                   // The amount of bitslip is fixed by the DATA_WIDTH selection.
         .CE1               (clock_enable),                        // 1-bit Clock enable input
         .CE2               (clock_enable),                        // 1-bit Clock enable input
         .CLK               (CLK_IN),                              // Fast clock driven by MMCM
         .CLKB              (clk_in_int_inv),                      // Locally inverted fast 
         .CLKDIV            (CLK_DIV_IN),                          // Slow clock from MMCM
         .CLKDIVP           (1'b0),
         .D                 (1'b0),                                // 1-bit Input signal from IOB
         .DDLY              (data_in_from_pins_delay[pin_count]),  // 1-bit Input from Input Delay component 
         .RST               (ISERDES_RST),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    // unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ());                                   // unregistered output of ISERDESE1

     // Concatenate the serdes outputs together. Keep the timesliced
     //   bits together, and placing the earliest bits on the right
     //   ie, if data comes in 0, 1, 2, 3, 4, 5, 6, 7, ...
     //       the output will be 3210, 7654, ...
     ////---------------------------------------------------------
     for (slice_count = 0; slice_count < num_serial_bits; slice_count = slice_count + 1) begin: in_slices
        // This places the first data in time on the right
        assign DATA_IN_TO_DEVICE[slice_count*sys_w+:sys_w] =
          iserdes_q[num_serial_bits-slice_count-1];
        // To place the first data in time on the left, use the
        //   following code, instead
        // assign DATA_IN_TO_DEVICE[slice_count*sys_w+:sys_w] =
        //   iserdes_q[slice_count];
     end
  end
  endgenerate

//// IDELAYCTRL is needed for calibration
//(* IODELAY_GROUP = "AD_RX_IP_group" *)
//  IDELAYCTRL
//    delayctrl (
//     .RDY    (DELAY_LOCKED),
//     .REFCLK (REF_CLOCK),
//     .RST    (IO_RESET));
endmodule
