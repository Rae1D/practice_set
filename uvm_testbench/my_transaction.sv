
/*===================================================
File name:          my_transaction.sv
Description:        templete for uvm testbench
Author:             Ding Dang
Date created:       23 Mar 2025
===================================================*/

/*===================================================
    定义transaction：
    需要从uvm_sequence_item扩展
    为了使transaction随机化，需要为每个成员指定为rand
===================================================*/

class my_transaction extends uvm_sequence_item;

    // 定义事务的属性，为激励成员指定rand属性
    // rand keyword: randomize all the signals
    rand bit [3:0] sa; //source address
    rand bit [3:0] da; //target address
    rand reg [7:0] payload[$]; //data

    // 将自定义的事务类向UVM注册
    // object宏
    `uvm_object_utils_begin(my_transaction)
        `uvm_field_int(sa, UVM_ALL_ON)
        `uvm_field_int(sa, UVM_ALL_ON)
        `uvm_field_queue_int(payload, UVM_ALL_ON)
    `uvm_object_utils_end

    // 约束项，控制随机成员的随机范围
    constraint limit{
        sa inside {[0:15]};
        da inside {[0:15]};
        payload.size() inside {[2:4]};
    }

    // 构造函数
    function new(string name = "my_transaction");
        super.new(name);
    endfunction

endclass