
/*===================================================
File name:          sequencer.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    sequencer的作用：
    - 启动sequence
    - 将sequence产生的item发送到UVM的组件中（即driver）
    sequencer的功能大多数已经在UVM源码中实现，所以创建sequencer比较简单
===================================================*/

// 从uvm_sequencer扩展
// 参数化的类，参数表示向driver发送的事务的类型（一种sequencer对应一种类型的transaction）
typedef uvm_sequencer # (my_transaction) my_sequencer;



// ori
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