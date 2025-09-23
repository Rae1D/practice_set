`timescale 1ns / 1ps
module showmaker(
 input clk, // 系统时钟
 input rstn,
 input [3:0] thou_the,
 input [3:0] hund_the,
 input [3:0] ten_the,
 input [3:0] one_the,
 input [3:0] thou_real,
 input [3:0] hund_real,
 input [3:0] ten_real,
 input [3:0] one_real,
 output reg [3:0] dis_the4,// 理论值显示位
 output reg [3:0] dis_real4,// 实际值显示位
 output reg [13:0] dis_all// 理论值+实际值显示数
 );
    reg [1:0] sel;

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            sel <= 0;
        else 
            sel <= sel + 1;
    end

    // 理论值
    always @(posedge clk) begin
        case(sel)
        0:case(one_the)
            0:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1111110; end
            1:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b0110000; end
            2:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1101101; end
            3:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1111001; end
            4:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b0110011; end
            5:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1011011; end
            6:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1011111; end
            7:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1110000; end
            8:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1111111; end
            9:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b1111011; end
            default:begin    dis_the4<=4'b0001;dis_all[13:7]<=7'b0000000; end
        endcase
        1:case(ten_the)
            0:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1111110; end
            1:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b0110000; end
            2:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1101101; end
            3:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1111001; end
            4:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b0110011; end
            5:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1011011; end
            6:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1011111; end
            7:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1110000; end
            8:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1111111; end
            9:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b1111011; end
            default:begin    dis_the4<=4'b0010;dis_all[13:7]<=7'b0000000; end
        endcase
        2:case(hund_the)
            0:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1111110; end
            1:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b0110000; end
            2:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1101101; end
            3:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1111001; end
            4:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b0110011; end
            5:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1011011; end
            6:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1011111; end
            7:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1110000; end
            8:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1111111; end
            9:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b1111011; end
            default:begin    dis_the4<=4'b0100;dis_all[13:7]<=7'b0000000; end
        endcase
        3:case(thou_the)
            0:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1111110; end
            1:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b0110000; end
            2:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1101101; end
            3:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1111001; end
            4:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b0110011; end
            5:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1011011; end
            6:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1011111; end
            7:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1110000; end
            8:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1111111; end
            9:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b1111011; end
            default:begin    dis_the4<=4'b1000;dis_all[13:7]<=7'b0000000; end
        endcase
        endcase
    end

    // 实际值显示
    always @(posedge clk) begin
        case(sel)
        0:case(one_real)
            0:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1111110; end
            1:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b0110000; end
            2:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1101101; end
            3:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1111001; end
            4:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b0110011; end
            5:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1011011; end
            6:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1011111; end
            7:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1110000; end
            8:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1111111; end
            9:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b1111011; end
            default:begin    dis_real4<=4'b0001;dis_all[6:0]<=7'b0000000; end
        endcase
        1:case(ten_real)
            0:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1111110; end
            1:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b0110000; end
            2:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1101101; end
            3:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1111001; end
            4:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b0110011; end
            5:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1011011; end
            6:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1011111; end
            7:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1110000; end
            8:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1111111; end
            9:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b1111011; end
            default:begin    dis_real4<=4'b0010;dis_all[6:0]<=7'b0000000; end
        endcase
        2:case(hund_real)
            0:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1111110; end
            1:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b0110000; end
            2:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1101101; end
            3:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1111001; end
            4:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b0110011; end
            5:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1011011; end
            6:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1011111; end
            7:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1110000; end
            8:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1111111; end
            9:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b1111011; end
            default:begin    dis_real4<=4'b0100;dis_all[6:0]<=7'b0000000; end
        endcase
        3:case(thou_real)
            0:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1111110; end
            1:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b0110000; end
            2:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1101101; end
            3:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1111001; end
            4:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b0110011; end
            5:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1011011; end
            6:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1011111; end
            7:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1110000; end
            8:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1111111; end
            9:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b1111011; end
            default:begin    dis_real4<=4'b1000;dis_all[6:0]<=7'b0000000; end
        endcase
        endcase
    end
    
endmodule
