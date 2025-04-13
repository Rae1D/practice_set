
/*===================================================
File name:          interface.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

interface our_interface(input logic clk);

    logic [7:0] input_1;
    logic [7:0] input_2;

    logic [15:0] output_3;

    // 驱动端modport（driver用）
    modport drv (
        output input_1,
        output input_2,
        output output_3
    );

    // 接收端modport（DUT用）
    modport dut (
        output input_1,
        output input_2,
        output output_3
    );

endinterface