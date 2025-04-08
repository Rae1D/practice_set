
/*===================================================
File name:          top.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

`include "uvm_macros.svh"

import uvm_pkg::*;

module top();   // contain design & test component
    
    // instantiate the interface
    our_interface intf();

    // instantiate the design
    our_design uut();

    initial begin
        // set method
        uvm_config_db #(virtual our_interface)::set(null, "*", "intf", intf);
    end

    // start the test by running the test component
    initial begin
        run_test("our_test");   // test component
    end

endmodule