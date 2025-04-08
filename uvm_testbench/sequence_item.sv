
/*===================================================
File name:          sequence_item.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_packet extends uvm_sequence_item;

    `uvm_object_utils(our_packet)

    // request item
    rand bit [7:0] input_1; // rand keyword: randomize all the signals
    rand bit [7:0] input_2;

    // response item
    bit [15:0] output_3;


    function new(string name = "our_packet");
        super.new(name);

    endfunction




endclass