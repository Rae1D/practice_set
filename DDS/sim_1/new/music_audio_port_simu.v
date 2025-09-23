`timescale 1ns / 1ps
module music_audio_port_simu;
reg clk;//100MHZ时钟
reg SD;//低通滤波器使能
reg [4:0] tone;//音调指令接收
wire sd;//低通滤波器使能    
wire audio_out;//音调输出
//wire [20:0] COUNT;
music_audio_port u0(
.clk(clk),//100MHZ时钟
.SD(SD),//低通滤波器使能
.tone(tone),//音调指令接收
.sd(sd),//低通滤波器使能    
.audio_out(audio_out)//音调输出
//.COUNT(COUNT)
);
initial
begin
clk<=1'b1;
SD<=1'b1;
tone<=5'd22;
end
always begin
#10 clk=1'b0;
#10 clk=1'b1;
end
always begin
#20 tone=5'd12;
#20 tone=5'd12;
#20 tone=5'd12;
#20 tone=5'd11;
#20 tone=5'd10;
#20 tone=5'd10;
end
endmodule
