-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jul 14 10:19:01 2021
-- Host        : DESKTOP-VND4HN1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               g:/wwl/test_1_0315_370us_ttt/test_1.srcs/sources_1/ip/vio_fpgagpio/vio_fpgagpio_stub.vhdl
-- Design      : vio_fpgagpio
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_fpgagpio is
  Port ( 
    clk : in STD_LOGIC;
    probe_out0 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end vio_fpgagpio;

architecture stub of vio_fpgagpio is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_out0[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2018.3";
begin
end;
