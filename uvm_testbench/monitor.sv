
/*===================================================
File name:          monitor.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_monitor extends uvm_monitor;

    `uvm_component_utils(our_monitor)

    our_packet pkt;
    
    // instantiate interface
    our_interface intf;

    uvm_analysis_port #(our_packet) mon_port;

    function new(string name = "our_monitor", uvm_component parent = null);
        super.new(name, parent);

    endfunction: new
    
    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        pkt = our_packet::type_id::create("Our Packet");
        
        // get method
        uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf);

        mon_port = new("Monitor Port", this);

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
        
            pkt.input_1 <= intf.input_1;
            pkt.input_2 <= intf.input_2;

    end

    endtask


endclass: our_monitor