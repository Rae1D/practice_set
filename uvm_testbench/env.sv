
/*===================================================
File name:          env.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_env extends uvm_env;

    //register component with factory
    `uvm_component_utils(our_env)
    
    // instantiate classes
    our_agent agnt;

    function new(string name = "our_env", uvm_component parent = null);
        super.new(name, parent);

    endfunction
    
    // build phase
    function void build_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
        // build other components
        // build agent class
        agnt = our_agent::type_id::create("agnt", this);    // create agent

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections

    endfunction

    // run phase: use task bc it contains time-consuming statements
    task run_phase(uvm_phase phase);

    // main logic

    endtask

endclass: our_env