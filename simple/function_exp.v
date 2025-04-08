
// 定义计算地址总线宽度的function
parameter MEM_DEPTH = 256;
reg [logb2(MEM_DEPTH)-1:0] addr;    // 通过function可得addr的宽度为8bit

function integer logb2;
    input integer depth;
    // 256为9bit，需要在depth=2时停止循环
    for (logb2 = 0; depth > 1; logb2 += 1) begin
        depth = depth >> 1; // 右移除2
    end    
endfunction