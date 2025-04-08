
// 异步FIFO
module async_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DATA_DEPTH = 64
)
(
    // 写信号
    input i_wrclk,
    input i_wrst_n,
    input i_wren,
    input [DATA_WIDTH-1:0] i_wdata,
    // 读信号
    input i_rdclk,
    input i_rdrst_n,
    input i_rden,
    output [DATA_WIDTH-1:0] o_rdata,
    // 空满信号
    output o_full,
    output o_empty
);
    // 1. 定义读写指针和读写地址（地址与RAM相连）
    reg [clogb2(DATA_DEPTH-1):0] r_wrptr;
    reg [clogb2(DATA_DEPTH-1):0] r_rdptr;
    wire [clogb2(DATA_DEPTH-1)-1:0] w_waddr;    // 地址比指针少1位
    wire [clogb2(DATA_DEPTH-1)-1:0] w_raddr;

    assign w_waddr = r_wrptr[clogb2(DATA_DEPTH-1)-1:0];
    assign w_raddr = r_rdptr[clogb2(DATA_DEPTH-1)-1:0];

    // 2. 读写指针（写非满or读非空 -> 加1）
    // a. 写指针（写时钟域）
    always @(posedge i_wrclk or negedge i_wrst_n) begin
        if (!i_wrst_n)
            r_wrptr <= 'd0;
        else if (i_wren && !o_full)
            r_wrptr <= r_wrptr + 1'b1;
    end
    // b. 读指针（读时钟域）
    always @(posedge i_rdclk or negedge i_rdrst_n) begin
        if (!i_rdrst_n)
            r_rdptr <= 'd0;
        else if (i_rden && !o_empty)
            r_rdptr <= r_rdptr + 1'b1;
    end

    // 3. 将指针转换为格雷码
    wire [clogb2(DATA_DEPTH-1):0] w_wrptr_gray;
    wire [clogb2(DATA_DEPTH-1):0] w_rdptr_gray;

    assign w_wrptr_gray = r_wrptr ^ (r_wrptr >> 1);
    assign w_rdptr_gray = r_rdptr ^ (r_rdptr >> 1);

    // 4. 多bit跨时钟域打两拍
    reg [clogb2(DATA_DEPTH-1):0] r_wrptr_gray_d0, r_wrptr_gray_d1;
    reg [clogb2(DATA_DEPTH-1):0] r_rdptr_gray_d0, r_rdptr_gray_d1;
    // a. 在写时钟域下读指针打两拍
    always @(posedge i_wrclk or negedge i_wrst_n) begin
        if (!i_wrst_n) begin
            r_rdptr_gray_d0 <= 'd0;
            r_rdptr_gray_d1 <= 'd0;
        end
        else begin
            r_rdptr_gray_d0 <= w_rdptr_gray;
            r_rdptr_gray_d1 <= r_rdptr_gray_d0;
        end
    end    
    // b. 在读时钟域下写指针打两拍
    always @(posedge i_rdclk or negedge i_rdrst_n) begin
        if (!i_rdrst_n) begin
            r_wrptr_gray_d0 <= 'd0;
            r_wrptr_gray_d1 <= 'd0;
        end
        else begin
            r_wrptr_gray_d0 <= w_wrptr_gray;
            r_wrptr_gray_d1 <= r_wrptr_gray_d0;
        end
    end

    // 5. 空满判断（空：在读时钟域下的指针相等；满：在写时钟域下的指针前两位不同，其余位相等）
    assign o_empty = (w_rdptr_gray == r_wrptr_gray_d1);
    assign o_full = (w_wrptr_gray == {~r_rdptr_gray_d1[clogb2(DATA_DEPTH-1):clogb2(DATA_DEPTH-1)-1], r_rdptr_gray_d1[clogb2(DATA_DEPTH-1)-2:0]})

    // 6. 使能信号判断
    wire w_wren, w_rden;
    assign w_wren = ~o_full && i_wren;
    assign w_rden = ~o_empty && i_rden;

    // 7. RAM例化
    ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .DATA_DEPTH(DATA_DEPTH)
    )
    u_ram(
        // 写信号
        .i_wrclk(i_wrclk),
        .i_wrst_n(i_wrst_n),
        .i_wren(w_wren),
        .i_waddr(w_waddr),
        .i_wdata(i_wdata),
        // 读信号
        .i_rdclk(i_rdclk),
        .i_rdrst_n(i_rdrst_n),
        .i_rden(w_rden),
        .i_raddr(w_raddr),
        .o_rdata(o_rdata)
    );

    // 定义位宽的函数：对数取整 （e.g. 7: 3b'111）
    function integer clogb2(input integer number);
    begin
        for (clogb2 = 0; number > 0; clogb2 = clogb2 + 1) begin
            number = number >> 1;
        end
    end   
    endfunction

endmodule






// 双端口RAM
module ram #(
    parameter DATA_WIDTH = 8,
    parameter DATA_DEPTH = 64
)
(
    // 写信号
    input i_wrclk,
    input i_wrst_n,
    input i_wren,
    input [clogb2(DATA_DEPTH-1)-1:0] i_waddr,
    input [DATA_WIDTH-1:0] i_wdata,
    // 读信号
    input i_rdclk,
    input i_rdrst_n,
    input i_rden,
    input [clogb2(DATA_DEPTH-1)-1:0] i_raddr,
    output [DATA_WIDTH-1:0] o_rdata
);
    // 1. 定义RAM深度
    reg [DATA_WIDTH-1] dual_ram [0:DATA_DEPTH-1];

    // 2. 读写数据（类似同步FIFO，但没有空满判断）
    // a. 在写时钟域下对RAM进行写入
    integer i;
    always @(posedge i_wrclk or negedge i_wrst_n) begin
        if (!i_wrst_n)
            for (i=0; i<DATA_DEPTH; i=i+1)
                dual_ram[i] <= 'd0;
        else if (i_wren)
            dual_ram[i_waddr] <= i_wdata;
    end

    // b. 在读时钟域下对RAM进行读取
    reg [DATA_WIDTH-1:0] r_rdata;
    always @(posedge i_rdclk or negedge i_rdrst_n) begin
        if (!i_rdrst_n)
            r_rdata <= 'd0;
        else if (i_rden)
            r_rdata <= dual_ram[i_raddr];
    end
    assign o_rdata = r_rdata;

    // 定义位宽的函数：对数取整 （e.g. 7: 3b'111）
    function integer clogb2(input integer number);
    begin
        for (clogb2 = 0; number > 0; clogb2 = clogb2 + 1) begin
            number = number >> 1;
        end
    end   
    endfunction

endmodule