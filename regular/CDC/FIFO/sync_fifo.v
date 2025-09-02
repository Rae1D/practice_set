
// 同步FIFO
module sync_fifo #(
    // 1. 定义FIFO的大小（width和depth）
    parameter DATA_WIDTH = 8,
    parameter DATA_DEPTH = 128  // 127：7b'111_1111
)
(
    // 2. 定义FIFO的接口
    // a. 系统时钟和复位信号（输入）
    input wire i_sys_clk,
    input wire i_sys_rst_n,
    // b. 读写使能和数据（读数据输出，其余输入）
    input wire i_wren,
    input wire i_rden,
    input wire [DATA_WIDTH-1:0] i_wdata,
    output wire [DATA_WIDTH-1:0] o_rdata,
    // c. 空满信号（输出）
    output wire o_full,
    output wire o_empty
);
    // 3. 定义寄存器：FIFO、读写指针和当前存储数量（reg）
    reg [DATA_WIDTH-1:0] mem_ram [0:DATA_DEPTH-1];
    reg [clogb2(DATA_DEPTH-1)-1:0] r_wr_ptr;
    reg [clogb2(DATA_DEPTH-1)-1:0] r_rd_ptr;    // 读写指针（地址）：0-127, [6:0]
    reg [clogb2(DATA_DEPTH-1):0] r_fifo_number; // 当前存储数量：0-128

    // 4. 读写指针（写非满or读非空 -> 加1）
    // a. 写指针
    always @(posedge i_sys_clk or negedge i_sys_rst_n) begin
        if (!i_sys_rst_n)
            r_wr_ptr <= 'd0;
        else if (i_wren && !o_full)
            r_wr_ptr <= r_wr_ptr + 1'b1;
        else
            r_wr_ptr <= r_wr_ptr;
    end

    // b. 读指针
    always @(posedge i_sys_clk or negedge i_sys_rst_n) begin
        if (!i_sys_rst_n)
            r_rd_ptr <= 'd0;
        else if (i_rden && !o_empty)
            r_rd_ptr <= r_rd_ptr + 1'b1;
        else
            r_rd_ptr <= r_rd_ptr;
    end

    // 5. 读写数据（写非满 -> 写入FIFO，读非空 -> 读出FIFO）
    // a. 写数据
    integer i;
    always @(posedge i_sys_clk or negedge i_sys_rst_n) begin
        if (!i_sys_rst_n) begin
            for (i = 0; i < DATA_DEPTH; i = i + 1) begin
                mem_ram[i] <= 'd0;  // FIFO中所有数据清零
            end
        end
        else if (i_wren && !o_full)
            mem_ram[r_wr_ptr] <= i_wdata;
    end

    // b. 读数据
    reg [DATA_WIDTH-1:0] r_rdata;   // 输出reg，后面assign一下
    always @(posedge i_sys_clk or negedge i_sys_rst_n) begin
        if (!i_sys_rst_n)
            r_rdata <= 'd0;
        else if (i_rden && !o_empty)
            r_rdata <= mem_ram[r_rd_ptr];
    end

    // 6. 记录当前存储数量，用于控制空满信号
    always @(posedge i_sys_clk or negedge i_sys_rst_n) begin
        if (!i_sys_rst_n)
            r_fifo_number <= 'd0;
        else if (i_wren && !i_rden && !o_full)  // 只写 -> 加1
            r_fifo_number <= r_fifo_number + 1'b1;
        else if (!i_wren && i_rden && !o_empty)  // 只读 -> 减1
            r_fifo_number <= r_fifo_number - 1'b1;
        else
            r_fifo_number <= r_fifo_number;
    end    
    
    // 7. 输出reg和空满信号的赋值
    assign o_rdata = r_rdata;
    assign o_full = (r_fifo_number == DATA_DEPTH);  // 满：当前存储数量为FIFO深度
    assign o_empty = (r_fifo_number == 'd0);    // 空：当前存储数量为0

    // 定义位宽的函数：对数取整 （e.g. 7: 3b'111）
    function integer clogb2(input integer number);
    begin
        for (clogb2 = 0; number > 0; clogb2 = clogb2 + 1) begin
            number = number >> 1;
        end
    end   
    endfunction

endmodule