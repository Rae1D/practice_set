
/*===================================================
File name:          driver.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    driver的三个主要职能：
    - 从sequencer获取transaction
    - 将transaction分解为DUT可以接受的PIN级信号
    - 将信号按照DUT总线协议的方式驱动给DUT
===================================================*/

// 从uvm_driver扩展
// 参数化的类，指定driver所要处理的事务的类型
class my_driver extends uvm_driver #(my_transaction);

    `uvm_component_utils(my_driver)

    // 在实例化时要指定其父对象
    function new(string name = "my_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    // 在task phase中需要在执行代码的前后分别使用raise_objection()和drop_objection()
    virtual task reset_phase(uvm_phase phase);
        phase.raise_objection(this);
        #100;
        `uvm_info("DRV_RESET_PHASE", "Now driver reset the DUT...", UVM_MEDIUM)
        phase.drop_objection(this);
    endtask

    virtual task configure_phase(uvm_phase phase);
        phase.raise_objection(this);
        #100;
        `uvm_info("DRV_CONFIGURE_PHASE", "Now driver config the DUT...", UVM_MEDIUM)
        phase.drop_objection(this);
    endtask


    // run_phase是driver的主要方法
    // driver在这个方法中完成从sequencer获取事务、对事务的分解和驱动DUT
    virtual task run_phase(uvm_phase phase);
        #3000;
        forever begin
            seq_item_port.get_next_item(req); // 从sequencer中获取事务对象
            `uvm_info("DRV_RUN_PHASE", req.sprint(), UVM_MEDIUM) //print
            #100;
            seq_item_port.item_done(); // 通知sequencer该事务已经处理完毕        
        end
    endtask

endclass




// ori
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