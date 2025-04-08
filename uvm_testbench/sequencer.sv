
/*===================================================
File name:          sequencer.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_sequencer extends uvm_sequencer #(our_packet);    // use our_packet to generate the stimulus

    `uvm_component_utils(our_sequencer)

    function new(string name = "our_sequencer", uvm_component parent = null);
        super.new(name, parent);

    endfunction: new
    
    // build phase
    function void build_phase(uvm_phase phase);
        // build other components

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections

    endfunction

    // run phase: use task bc it contains time-consuming statements
    task run_phase(uvm_phase phase);

    // main logic

    endtask


endclass: our_sequencer