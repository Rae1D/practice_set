
/*===================================================
File name:          test.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

class our_test extends uvm_test;

    // register our class with UVM factory to make our code modular and reusable
    `uvm_component_utils(our_test)

    // instantiate classes
    our_env env;

    // Constructor: create our class and initialize class property
    function new(string name = "our_test", uvm_component parent = null);
        // super keyword: refer to all the properties in the parent class
        super.new(name, parent);

    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // build env class here
        env = our_env::type_id::create("env", this);    // create env object

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections

    endfunction

    // run phase: use task bc it contains time-consuming statements
    task run_phase(uvm_phase phase);

    // main logic

    endtask

    // methods
    // properties


endclass