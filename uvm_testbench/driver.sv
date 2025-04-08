
/*===================================================
File name:          driver.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_driver extends uvm_driver #(our_packet);

    `uvm_component_utils(our_driver)

    // instantiate interface
    our_interface intf;

    // instantiate packet
    our_packet pkt;

    function new(string name = "our_driver", uvm_component parent = null);
        super.new(name, parent);

    endfunction: new
    
    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        pkt = our_packet::type_id::create("Our Packet");

        // get method
        uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf);

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections

    endfunction

    // run phase: use task bc it contains time-consuming statements
    task run_phase(uvm_phase phase);

    // main logic
    forever begin
        @(posedge intf.clk);
            seq_item_port.get_next_item(pkt);

            intf.input_1 <= pkt.input_1;    // assign the input value to the interface
            intf.input_2 <= pkt.input_2;

            seq_item_port.item_done();
    end

    endtask


endclass: our_driver