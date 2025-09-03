
/*===================================================
File name:          test.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    testcase实例化并配置env
    配置需要启动的sequence
===================================================*/

class my_test extends uvm_test;
    
    `uvm_component_utils(my_test)

    // 为env声明句柄
    my_env m_env;

    function new(string name="", uvm_component parent);
        super.new(name, parent);
    endfunction

    // 创建env对象
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_env = my_env::type_id::create("m_env", this);
        
        // 使用configuration机制为sequencer指定一个需要启动的sequence
        // uvm_config_db是UVM内建的带参数的类，set是其静态函数（为指定目标设置资源）
        // 参数：调用set的位置，被配置变量的相对路径（*为通配符），目标变量的标识符，要启动的sequence的类型
        uvm_config_db # (uvm_object_wrapper)::set(this, "*.m_seqr.run_phase", "default_sequence", my_sequence::get_type());

    endfunction

    // 先于run_phase执行
    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        uvm_top.print_topology(uvm_default_tree_printer); //print
    endfunction

endclass




// ori
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