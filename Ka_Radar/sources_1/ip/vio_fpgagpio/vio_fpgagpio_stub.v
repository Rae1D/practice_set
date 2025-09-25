// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jul 14 10:19:01 2021
// Host        : DESKTOP-VND4HN1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               g:/wwl/test_1_0315_370us_ttt/test_1.srcs/sources_1/ip/vio_fpgagpio/vio_fpgagpio_stub.v
// Design      : vio_fpgagpio
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.3" *)
module vio_fpgagpio(clk, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[7:0]" */;
  input clk;
  output [7:0]probe_out0;
endmodule
