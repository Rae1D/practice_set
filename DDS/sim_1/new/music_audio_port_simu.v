`timescale 1ns / 1ps
module music_audio_port_simu;
reg clk;//100MHZʱ��
reg SD;//��ͨ�˲���ʹ��
reg [4:0] tone;//����ָ�����
wire sd;//��ͨ�˲���ʹ��    
wire audio_out;//�������
//wire [20:0] COUNT;
music_audio_port u0(
.clk(clk),//100MHZʱ��
.SD(SD),//��ͨ�˲���ʹ��
.tone(tone),//����ָ�����
.sd(sd),//��ͨ�˲���ʹ��    
.audio_out(audio_out)//�������
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
