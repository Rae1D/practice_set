
/*===================================================
File name:          monitor.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    monitor的主要功能：
    - 监视接口信号，捕获接口上活动的事务
    - 将PIN级信号转化为事务级的数据包
    - 将这些数据包发送到analysis组件（reference model、scoreboard等）进行分析，产生报告
    monitor通过TLM-port与其他组件相连
===================================================*/

class my_monitor extends uvm_monitor;

    `uvm_component_utils(my_monitor)

    function new(string name ="", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task reset_phase(uvm_phase phase);
        #150;
        `uvm_info("MON_RESET_PHASE", "Now Monitor reset phase running !", UVM_MEDIUM)
    endtask

    // monitor的功能主要在run_phase中进行
    virtual task run_phase(uvm_phase phase);
        forever begin
            `uvm_info("MON_RUN_PHASE", "Monitor run!", UVM_MEDIUM)
            #100;
        end
    endtask
endclass 




// ori
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