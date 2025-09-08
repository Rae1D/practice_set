
/*===================================================
File name:          sequence.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    当transaction类创建好之后，需要通过某种方式来产生对象，即sequence事务发生器
    需要从uvm_sequence扩展
    sequence控制并产生一系列transaction
    一种sequence一般只用来产生一种类型的transaction
    sequence中最重要的部分是body()任务（含对事务的控制和产生）
===================================================*/

// 参数化的类，指定该sequence所产生的transaction的类型
class my_sequence extends uvm_sequence # (my_transaction);

    // object宏
    `uvm_object_utils(my_sequence)
    //`uvm_object_utils_end
    
    // 构造函数
    function new(string name = "my_sequence");
        super.new(name);
    endfunction

    // sequence中最重要的部分，控制和产生transaction序列
    // 需要验证工程师自己完成
    virtual task body();
        // 这里的staring phase指test.sv中的config.db中定义的run phase
        if(starting_phase != null)
            starting_phase.raise_objection(this);

        repeat(10)begin
            // uvm内建的宏，用来产生transaction（每调用一次产生一个transaction）
            `uvm_do(req)
        end

        #100;
        
        if(starting_phase != null)
            starting_phase.drop_objection(this);
    endtask

endclass




// ori
class our_sequence extends uvm_sequence #(our_packet);

    `uvm_object_utils(our_sequence)

    our_packet pkt;

    function new(string name = "our_sequence");
        super.new(name);

    endfunction

    task body();
        pkt = our_packet::type_id::create("Our Packet");

        repeat (10) begin
            start_item(pkt);
            pkt.randomize();    // in the sequence_item the variables with rand keyword will be randomized
            finish_item(pkt);

        end


    endtask


endclass