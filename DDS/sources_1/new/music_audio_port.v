`timescale 1ns / 1ps

//����ģ��
module music_audio_port(
    input clk,//100MHZʱ��
    input SD,//��ͨ�˲���ʹ��
    input [4:0] tone,//����ָ�����
    output sd,//��ͨ�˲���ʹ��    
    output reg audio_out//�������
//    output reg [20:0] COUNT
    );
 
    reg [20:0] count=21'd0;
    reg [20:0] COUNT;//��Ƶ��������Ԥ��������
    reg [20:0] buffer[20:0];//������ӦƵ�ʵ�Ԥ����
    assign sd=SD;
    //�Ĵ������ͱ�����ʼ��
    initial
      begin 
        buffer[0]=21'd191110;
        buffer[1]=21'd170259;
        buffer[2]=21'd151685;
        buffer[3]=21'd143172;
        buffer[4]=21'd127554;
        buffer[5]=21'd113636;
        buffer[6]=21'd101239;
        buffer[7]=21'd95557;
        buffer[8]=21'd85131;
        buffer[9]=21'd75844;
        buffer[10]=21'd71689;
        buffer[11]=21'd63776;
        buffer[12]=21'd56818;
        buffer[13]=21'd50620;
        buffer[14]=21'd47778;
        buffer[15]=21'd42566;
        buffer[16]=21'd37951;
        buffer[17]=21'd35793;
        buffer[18]=21'd31888;
        buffer[19]=21'd28409;
        buffer[20]=21'd25310;
      end
    //����ָ����գ�Ԥ�����仯      
    always @(tone)
      if(tone>=0&&tone<=20)
         COUNT=buffer[tone];
      else
         COUNT=1;
    //��Ƶ���    
    initial
    begin
    audio_out<=1;
    end
    always @ (posedge clk)          
          begin
            if(count>=COUNT&&COUNT!=21'd1)
                begin
                count<=21'd0;
                audio_out<=~audio_out;                  
                end
            else if(COUNT==21'd1)
                audio_out<=0;
            else
                count<=count+21'd1;
          end
endmodule

