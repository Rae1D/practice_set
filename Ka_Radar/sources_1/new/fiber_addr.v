`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/23 20:26:21
// Design Name: 
// Module Name: fiber_addr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fiber_addr(

//CLK
    input clk_120m,
//    input clk_30m,
    
    input FPGA_nRESET,
    input [31:0]pri_p_cnt,
//DATA
    input [15:0]data_out_L_1_I,
    input [15:0]data_out_L_1_Q,
    input [15:0]data_out_L_2_I,
    input [15:0]data_out_L_2_Q,
    input [15:0]data_out_L_3_I,
    input [15:0]data_out_L_3_Q,
    input [15:0]data_out_L_4_I,
    input [15:0]data_out_L_4_Q,
    input [15:0]data_out_L_5_I,
    input [15:0]data_out_L_5_Q,
    input [15:0]data_out_L_6_I,
    input [15:0]data_out_L_6_Q,
    input [15:0]data_out_L_7_I,
    input [15:0]data_out_L_7_Q,
    input [15:0]data_out_L_8_I,
    input [15:0]data_out_L_8_Q,
    input [15:0]data_out_L_9_I,
    input [15:0]data_out_L_9_Q,
    input [15:0]data_out_L_10_I,
    input [15:0]data_out_L_10_Q,
    input [15:0]data_out_L_11_I,
    input [15:0]data_out_L_11_Q,
    input [15:0]data_out_L_12_I,
    input [15:0]data_out_L_12_Q,
    input [15:0]data_out_L_13_I,
    input [15:0]data_out_L_13_Q,
    input [15:0]data_out_L_14_I,
    input [15:0]data_out_L_14_Q,
    
    input [15:0]data_out_R_1_I,
    input [15:0]data_out_R_1_Q,
    input [15:0]data_out_R_2_I,
    input [15:0]data_out_R_2_Q,
    input [15:0]data_out_R_3_I,
    input [15:0]data_out_R_3_Q,
    input [15:0]data_out_R_4_I,
    input [15:0]data_out_R_4_Q,
    input [15:0]data_out_R_5_I,
    input [15:0]data_out_R_5_Q,
    input [15:0]data_out_R_6_I,
    input [15:0]data_out_R_6_Q,
    input [15:0]data_out_R_7_I,
    input [15:0]data_out_R_7_Q,
    input [15:0]data_out_R_8_I,
    input [15:0]data_out_R_8_Q,
    input [15:0]data_out_R_9_I,
    input [15:0]data_out_R_9_Q,
    input [15:0]data_out_R_10_I,
    input [15:0]data_out_R_10_Q,
    input [15:0]data_out_R_11_I,
    input [15:0]data_out_R_11_Q,
    input [15:0]data_out_R_12_I,
    input [15:0]data_out_R_12_Q,
    input [15:0]data_out_R_13_I,
    input [15:0]data_out_R_13_Q,
    input [15:0]data_out_R_14_I,
    input [15:0]data_out_R_14_Q,

    input data_valid,  
    
    input [7:0]fpga_mode,
    input [9:0]PRI_num,
    input PRI,

    output reg [15:0]Nr,
    output reg [127:0]dina_L1,
    output reg [127:0]dina_L2,
    output reg [127:0]dina_L3,
    output reg [127:0]dina_L4,
    output reg [127:0]dina_R1,
    output reg [127:0]dina_R2,
    output reg [127:0]dina_R3,
    output reg [127:0]dina_R4,
    
    
    output reg [13:0]ram_addrb,
    output data_ram_wr,
    output reg data_out_valid,
    output reg fibertx_en
    );
    
reg [15:0] Nr_t;
reg [15:0] pulse_time;
always@(posedge clk_120m)
begin
case(fpga_mode)
 8'h01 :begin Nr_t <=  370*30;   pulse_time <= 370; end
 8'h02 :begin Nr_t <=  370*30;   pulse_time <= 370; end
 8'h03 :begin Nr_t <=  370*30;   pulse_time <= 370; end
 8'h04 :begin Nr_t <=  370*30;   pulse_time <= 370; end

 8'h09 :begin Nr_t <=  175*10;  pulse_time <= 175;end
 8'h0B :begin Nr_t <=  100*10;  pulse_time <= 100;end
 8'h0C :begin Nr_t <=  80*10;   pulse_time <= 80; end
 8'h0F :begin Nr_t <=  175*5;   pulse_time <= 175; end
 8'h10 :begin Nr_t <=  100*5;   pulse_time <= 100; end
 8'h11 :begin Nr_t <=  80*5;    pulse_time <= 80;  end
 default:  Nr_t <=  370*30;
endcase
end

//¸üĞÂdata_length
//assign Nr = Nr_t;
reg [15:0] cnt_update;
reg [6:0] PRI_No_t;
always@(posedge clk_120m)
begin
    if(!FPGA_nRESET)
        PRI_No_t <= 0;
     else
        PRI_No_t <= PRI_num;
end
always@(posedge clk_120m)
begin
    if(!FPGA_nRESET)
        cnt_update <= 0;
    else if (PRI_num == 1 && PRI_No_t != PRI_num)
        cnt_update <= 1;
    else if(cnt_update < pulse_time *120) //100mÊ±ÖÓ
        cnt_update <= cnt_update + 1;
    else 
        cnt_update <= cnt_update;
end
always@(posedge clk_120m)
begin
    if(!FPGA_nRESET)
        Nr <= 0;
    else if (cnt_update == (pulse_time-4)*120 )
        Nr <= Nr_t;
    else
        Nr <= Nr;        
    end
/////////////////////////////////dual port ram///////////////////////////////////////
    reg PRI_reg = 0;
    reg PRI_reg1 = 0;
    reg [15:0]cnt_PRI = 0;
    always@(posedge clk_120m)
    begin
        PRI_reg <= PRI;
        PRI_reg1 <= PRI_reg;
        if(!FPGA_nRESET)
            cnt_PRI <= 16'd0;
        else if(PRI_reg1 == 1'b0 && PRI_reg == 1'b1)
            cnt_PRI <= 16'd1;
        else if(cnt_PRI >= 16'd1 && data_valid)
            cnt_PRI <= cnt_PRI + 1;
        else
            cnt_PRI <= cnt_PRI;
    end
    

    
    reg [13:0]addra;
    reg data_ram_wr;
    always@(posedge clk_120m)
    begin
        if(!FPGA_nRESET)
            addra <= 0;
        else if(!data_valid)
            addra <= addra;        
        //else if(cnt_PRI == totaldelay_num)  --sdl
        else if(cnt_PRI == 1)begin
            addra <= 11'd1;
            data_ram_wr <= 1;
            end
        else if(addra >= 11'd1 && addra < Nr-1)begin
            addra <= addra + 1;
            data_ram_wr <= 1;
            end
        else begin
            addra <= 0;
            data_ram_wr <= 0;
            end
    end    
//    reg [127:0]dina_L1;
//    reg [127:0]dina_L2;
//    reg [127:0]dina_L3;
//    reg [127:0]dina_L4;
//    reg [127:0]dina_R1;
//    reg [127:0]dina_R2;
//    reg [127:0]dina_R3;
//    reg [127:0]dina_R4;
    wire [2:0] test_mode;
    vio_test_data vio_test_data_inst (
      .clk(clk_120m),                // input wire clk
      .probe_out0(test_mode)  // output wire [0 : 0] probe_out0
    );
    
    
////////////////////////////////////////////////////
wire [15:0]d_test_1;
assign d_test_1 = pri_p_cnt[15:0];
reg [15:0]d_test_2;
always@(posedge clk_120m)
    begin
        if(!FPGA_nRESET)
            d_test_2 <= 0;
        else if(data_valid)
            d_test_2 <= d_test_1;
        else d_test_2 <= d_test_2;
    end
    

reg [15:0]d_test;
always@(posedge clk_120m)
    begin
        if(!FPGA_nRESET)
            d_test <= 0;
        else if(data_valid)
            d_test <= d_test+1;
        else if(d_test == 60000)
             d_test <= 0;
        else d_test <= d_test;
    end
///////////////////////////////////////////////////////////////
    
    always@(posedge clk_120m)
    begin
            if(!FPGA_nRESET)begin
            dina_L1 <= 128'd0;
            dina_L2 <= 128'd0;
            dina_L3 <= 128'd0;
            dina_L4 <= 128'd0;
            dina_R1 <= 128'd0;
            dina_R2 <= 128'd0;
            dina_R3 <= 128'd0;
            dina_R4 <= 128'd0;
            end
            else
            begin
                case(test_mode)
                3'b000:begin
//                dina1<= (fpga_mode == 8'h01 ||  fpga_mode == 8'h03 || fpga_mode == 8'h04) ? 
                //                    {ddc_sum_I,ddc_sum_Q,64'd0,ddc_sub_I,ddc_sub_Q,64'd0}:
                        dina_L1 <= {data_out_L_1_I,data_out_L_1_Q,data_out_L_2_I,data_out_L_2_Q,data_out_L_3_I,data_out_L_3_Q,data_out_L_4_I,data_out_L_4_Q};                 
                        dina_L2 <= {data_out_L_5_I,data_out_L_5_Q,data_out_L_6_I,data_out_L_6_Q,data_out_L_7_I,data_out_L_7_Q,data_out_L_8_I,data_out_L_8_Q};                 
                        dina_L3 <= {data_out_L_9_I,data_out_L_9_Q,data_out_L_10_I,data_out_L_10_Q,data_out_L_11_I,data_out_L_11_Q,data_out_L_12_I,data_out_L_12_Q};                 
                        dina_L4 <= {data_out_L_13_I,data_out_L_13_Q,data_out_L_14_I,data_out_L_14_Q,64'b0};
                        
                                         
                        dina_R1 <= {data_out_R_1_I,data_out_R_1_Q,data_out_R_2_I,data_out_R_2_Q,data_out_R_3_I,data_out_R_3_Q,data_out_R_4_I,data_out_R_4_Q};                 
                        dina_R2 <= {data_out_R_5_I,data_out_R_5_Q,data_out_R_6_I,data_out_R_6_Q,data_out_R_7_I,data_out_R_7_Q,data_out_R_8_I,data_out_R_8_Q};                 
                        dina_R3 <= {data_out_R_9_I,data_out_R_9_Q,data_out_R_10_I,data_out_R_10_Q,data_out_R_11_I,data_out_R_11_Q,data_out_R_12_I,data_out_R_12_Q};                 
                        dina_R4 <= {data_out_R_13_I,data_out_R_13_Q,data_out_R_14_I,data_out_R_14_Q,64'b0};                 
//                                (fpga_mode == 8'h05 ||  fpga_mode == 8'h0F || fpga_mode == 8'h10 || fpga_mode == 8'h11) ? 
//                //                    {64'd0,ddc_sum_I,ddc_sum_Q,64'd0,ddc_sub_I,ddc_sub_Q}:
//                //                    {ddc_sum_I,ddc_sum_Q,64'd0,ddc_sub_I,ddc_sub_Q,64'd0};
//                                    {ddc_sum_I,ddc_sum_Q,ddc_sub_I,ddc_sub_Q,64'd0,64'd0}:
//                                    {64'd0,64'd0,ddc_sum_I,ddc_sum_Q,ddc_sub_I,ddc_sub_Q};
                end
                
               3'b001:begin
                        dina_L1 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};                 
                        dina_L2 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};                      
                        dina_L3 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};       
                        dina_L4 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};       
                        
                                         
                        dina_R1 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};        
                        dina_R2 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};        
                        dina_R3 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test};              
                        dina_R4 <= {d_test,d_test,d_test,d_test,d_test,d_test,d_test,d_test}; 
                end
                3'b010:begin
                        dina_L1 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};                 
                        dina_L2 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};                      
                        dina_L3 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};       
                        dina_L4 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};       
                        
                                         
                        dina_R1 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};        
                        dina_R2 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};        
                        dina_R3 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2};              
                        dina_R4 <= {d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2,d_test_2}; 
                end
               3'b011:begin
               dina_L1<= {16'd1,16'd1,data_out_L_2_I,data_out_L_2_Q,16'd3,16'd3,16'd4,16'd4};                      
               dina_L2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_L3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_L4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
               
               dina_R1<= {16'd1,16'd1,16'd2,16'd2,16'd3,16'd3,16'd4,16'd4};                      
               dina_R2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,data_out_R_8_I,data_out_R_8_Q};
               dina_R3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_R4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
                end
               3'b100:begin
               dina_L1<= {16'd1,16'd1,16'd2,16'd2,data_out_L_3_I,data_out_L_3_Q,16'd4,16'd4};                      
               dina_L2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_L3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_L4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
               
               dina_R1<= {16'd1,16'd1,16'd2,16'd2,16'd3,16'd3,16'd4,16'd4};                      
               dina_R2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_R3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_R4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
                end
               3'b101:begin
               dina_L1<= {16'd1,16'd1,16'd2,16'd2,16'd3,16'd3,data_out_L_4_I,data_out_L_4_Q};                      
               dina_L2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_L3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_L4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
               
               dina_R1<= {16'd1,16'd1,16'd2,16'd2,16'd3,16'd3,16'd4,16'd4};                      
               dina_R2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_R3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_R4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
                end
               3'b110:begin
               dina_L1<= {16'd1,16'd1,16'd2,16'd2,16'd3,16'd3,16'd4,16'd4};                      
               dina_L2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_L3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_L4<= {data_out_R_13_I,data_out_R_13_Q,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
               
               dina_R1<= {16'd1,16'd1,16'd2,16'd2,16'd3,16'd3,16'd4,16'd4};                      
               dina_R2<= {16'd5,16'd5,16'd6,16'd6,16'd7,16'd7,16'd8,16'd8};
               dina_R3<= {16'd9,16'd9,16'd10,16'd10,16'd11,16'd11,16'd12,16'd12};
               dina_R4<= {16'd13,16'd13,16'd14,16'd14,16'd0,16'd0,16'd0,16'd0};
                end
                         
                default : begin
                dina_L1<= 128'd0;
                dina_L2<= 128'd0;
                dina_L3<= 128'd0;
                dina_L4<= 128'd0;
                dina_R1<= 128'd0;
                dina_R2<= 128'd0;
                dina_R3<= 128'd0;
                dina_R4<= 128'd0;
                end
                endcase
            end
    end

    reg [10:0]addrb = 0;
    

    
 always@(posedge clk_120m)
    begin
     ram_addrb <= addra;
     data_out_valid <= data_valid;
    end
    
    


 reg [15:0]cnt_en = 0;  
    always@(posedge clk_120m)
    begin
        if(!FPGA_nRESET)begin
            fibertx_en <= 0;
            cnt_en <= 0;
            end     
        //else if(cnt_PRI == totaldelay_num)  --sdl
        else if(PRI_num != 1 && PRI_reg == 0 && PRI == 1)begin
           cnt_en <= 1;
           fibertx_en <= 1;
           end
        else if(cnt_en >= 1 && cnt_en <= 2*120)begin
            cnt_en <= cnt_en + 1;
            fibertx_en <= 1;
            end
        else begin
            cnt_en <= 0;
            fibertx_en <= 0;
            end
    end 



endmodule
