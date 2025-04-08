
// 带延时的异或功能task
task xor_open_iner;
    input [N-1:0] numa;
    input [N-1:0] numb;
    output [N-1:0] numco;   // output默认是reg
    #3 numco = numa ^ numb;
endtask