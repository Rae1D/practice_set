-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Wed Sep 23 09:54:22 2020
-- Host        : DESKTOP-VND4HN1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/wh/gongzhuang/test_1/test_1_0921/test_1.srcs/sources_1/ip/ila_2/ila_2_stub.vhdl
-- Design      : ila_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_2 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe12 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe22 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe23 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe37 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe38 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe39 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe40 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe41 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe42 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe43 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe44 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe45 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe46 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe47 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe48 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe49 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe50 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe51 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe52 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe53 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe54 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe55 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe56 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe57 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe58 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe59 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe60 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe61 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe62 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe63 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end ila_2;

architecture stub of ila_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[15:0],probe1[15:0],probe2[15:0],probe3[15:0],probe4[15:0],probe5[15:0],probe6[15:0],probe7[15:0],probe8[15:0],probe9[15:0],probe10[15:0],probe11[15:0],probe12[15:0],probe13[15:0],probe14[15:0],probe15[15:0],probe16[15:0],probe17[15:0],probe18[15:0],probe19[15:0],probe20[15:0],probe21[15:0],probe22[15:0],probe23[15:0],probe24[15:0],probe25[15:0],probe26[15:0],probe27[15:0],probe28[15:0],probe29[15:0],probe30[15:0],probe31[15:0],probe32[15:0],probe33[15:0],probe34[15:0],probe35[15:0],probe36[15:0],probe37[15:0],probe38[15:0],probe39[15:0],probe40[15:0],probe41[15:0],probe42[15:0],probe43[15:0],probe44[15:0],probe45[15:0],probe46[15:0],probe47[15:0],probe48[15:0],probe49[15:0],probe50[15:0],probe51[15:0],probe52[15:0],probe53[15:0],probe54[15:0],probe55[15:0],probe56[0:0],probe57[0:0],probe58[0:0],probe59[0:0],probe60[0:0],probe61[0:0],probe62[0:0],probe63[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2017.3";
begin
end;
