
// 数据类型应用汇总

// 1. Net 类型（网络型变量）
    wire a, b, y;
    assign y = a & b;  // 组合逻辑，适用于 wire


// 2. Reg & Logic 类型（变量型变量）
    logic clk, rst;
    logic [7:0] data;

    always_ff @(posedge clk) begin
        if (rst) data <= 8'b0;
        else data <= data + 1;
    end


// 3. 结构化数据类型（数组、结构体、联合体、枚举）
    // 静态数组
    logic [7:0] my_array [0:9]; // 10 个 8-bit 变量

    // 动态数组
    int my_dyn_array [];
    my_dyn_array = new[10]; // 分配 10 个元素

    // 关联数组
    int my_assoc_array [string];  // key 类型为 string
    my_assoc_array["test"] = 100; 

    // 队列
    int queue_data [$];  // 定义队列
    queue_data.push_back(10);
    queue_data.push_back(20);
    $display(queue_data.pop_front()); // 取出 10

    // 结构体（Struct）
    typedef struct {
        int id;
        logic [7:0] data;
    } packet_t;

    packet_t pkt;
    pkt.id = 1;
    pkt.data = 8'hFF;

    // 联合体（Union）：多个变量共享相同的存储空间
    typedef union {
        logic [31:0] word;
        logic [15:0] halfword[2];
        logic [7:0] byte[4];
    } data_union;

    data_union u;
    u.word = 32'hAABBCCDD;
    $display("%h", u.byte[0]);  // 取最低字节

    // 枚举（Enum）：使用场景-状态机（FSM）
    typedef enum {IDLE, RUNNING, STOP} state_t;
    state_t current_state;

    always_ff @(posedge clk) begin
        if (reset) current_state <= IDLE;
        else if (start) current_state <= RUNNING;
    end


// 4. 高级数据类型（类、队列、动态数组、关联数组、接口）
    // 类（Class）
    class Packet;
        int id;
        function new(int id_val);
            id = id_val;
        endfunction
    endclass

    Packet pkt1 = new(100);

    // 接口（Interface）
    interface bus_if;
        logic clk, rst;
        logic [7:0] data;
    endinterface

    module DUT (bus_if bus);
        always_ff @(posedge bus.clk)
            bus.data <= bus.data + 1;
    endmodule
