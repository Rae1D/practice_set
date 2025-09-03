
/*===================================================
File name:          env.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    env封装了一个或多个agent、reference model、scoreboard以及其它组件
    env中需要实例化这些对象，并将他们互相连接
===================================================*/

// 这里省略reference model、scoreboard及其连接
class my_env extends uvm_env;

    `uvm_component_utils(my_env)

    // 为agent声明句柄
    master_agent m_agent;

    function new(string name="", uvm_component parent);
        super.new(name, parent);
    endfunction

    // 在build_phase中，使用factory机制创建agent对象
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_agent = master_agent::type_id::create("m_agent", this);

    endfunction

endclass





// ori
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