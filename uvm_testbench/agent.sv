
/*===================================================
File name:          agent.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    agent封装了sequencer、driver和monitor
    agent中需要实例化sequencer、driver和monitor对象，并将sequencer和driver连接起来
===================================================*/

class master_agent extends uvm_agent;

    `uvm_component_utils(master_agent)

    // 为sequencer、driver和monitor声明句柄
    my_sequencer m_seqr;
    my_driver m_driv;
    my_monitor m_moni;
    bit if_active = 1;    

    function new(string name="", uvm_component parent);
        super.new(name, parent);
    endfunction

    // 第一个phase，sequencer、driver和monitor对象在这里创建
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // 当为active模式时才创建sequencer和driver对象
        if(is_active == UVM_ACTIVE) begin
            // 使用UVM的factory机制创建对象（而不是new函数）
            // 格式：类名:静态成员type_id:静态成员函数create
            // 静态成员函数create的参数与new函数的参数一致：对象名，对象的父对象
            // 使用this表示他们的父对象为当前的agent
            m_seqr = my_sequencer::type_id::create("m_seqr", this);
            m_driv = my_driver::type_id::create("m_driv", this);
        end
        m_moni = my_monitor::type_id::create("m_moni", this);
    endfunction

    // 第二个phase
    virtual function void connect_phase(uvm_phase phase);
        if (if_active == UVM_ACTIVE)
            // 连接sequencer和driver
            // 使用TLM机制，将driver的seq_item_port和sequencer的seq_item_export相连接
            m_driv.seq_item_port.connect(m_seqr.seq_item_export);
    endfunction


endclass



// ori
class our_agent extends env_agent;

    //register component with factory
    `uvm_component_utils(our_agent)

    our_sequencer seqr;
    our_driver drv;
    our_monitor mon;

    function new(string name = "our_agent", uvm_component parent = null);
        super.new(name, parent);

    endfunction
    
    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        // build sequencer, monitor, driver
        seqr = our_sequencer::type_id::create("seqr", this);
        drv = our_driver::type_id::create("drv", this);
        mon = our_monitor::type_id::create("mon", this);

    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections
        drv.seq_item_port.connect(seqr.seq_item_export);

    endfunction

    // run phase: use task bc it contains time-consuming statements
    task run_phase(uvm_phase phase);

    // main logic

    endtask

endclass: our_agent