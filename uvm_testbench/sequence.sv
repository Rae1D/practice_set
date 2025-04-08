
/*===================================================
File name:          sequence.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_sequence extends uvm_sequence #(our_packet);

    `uvm_object_utils(our_sequence)

    our_packet pkt;

    function new(string name = "our_sequence");
        super.new(name);

    endfunction

    task body();
        pkt = our_packet::type_id::create("Our Packet");

        repeat (10) begin
            start_item(pkt);
            pkt.randomize();    // in the sequence_item the variables with rand keyword will be randomized
            finish_item(pkt);

        end


    endtask


endclass