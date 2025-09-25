`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/06 18:43:47
// Design Name: 
// Module Name: frame
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


module frame_CMD(
    input clk_wr,
	input clk_rd,
    input [7:0]FPGA_MOD,
    input FPGA_nRESET,//全局复位
	
	output [15:0] frame_out,
	output [9:0] fiber_addrb,
	input cmd_valid,
	input cmd_frame_length,
	output ram_rd,
	output ram_addr_rx,
	output frame_valid
    );
	
//parameter frame_header = 64'hA5A5_1234_0102_0304,
//			  frame_type   = 16'h0002,
//			  frame_length = 16'h00B3,
//			  dest_addr	   = 16'h0000,
//			  source_addr  = 16'h0000,
			  
//			  check_status = 64'h0000_0000_0000_0000,
//			  stamp	       = 32'd0,
//			  CPI          = 32'd0;
//parameter	  ctr_inst0_1	   = 64'h0000000000000000,  //自检信息
//			  ctr_inst1_1	   = 32'h00000000,
//			  ctr_inst2_1	   = 32'h00000000,
//			  ctr_inst3_1	   = 16'h0000,
//			  ctr_inst4_1	   = 16'h0000,
//			  ctr_inst5_1	   = 16'h0000,
//			  ctr_inst6_1	   = 16'h0000,
//			  ctr_inst7_1	   = 16'h0000,
//			  ctr_inst8_1	   = 16'h0000,
//			  ctr_inst9_1	   = 16'h200E,
//			  ctr_inst10_1     = 16'h200E,
//			  ctr_inst11_1     = 16'h0001,
//			  ctr_inst12_1     = 16'h0001,
//			  ctr_inst14_1     = 16'h0000,
//			  ctr_inst15_1     = 16'h0000,
//			  ctr_inst16_1     = 16'h0000,
//			  ctr_inst17_1     = 16'h0000,
//			  ctr_inst18_1     = 16'h0000,
//			  ctr_inst19_1     = 16'h0000,
//			  ctr_inst20_1     = 16'h0000,
//			  ctr_inst21_1     = 16'h0000,
//			  ctr_inst22_1     = 16'h0000,
//			  ctr_inst23_1     = 16'h0000,
//			  ctr_inst24_1     = 16'h0000,
//			  ctr_inst25_1     = 16'h0000,
//			  ctr_inst26_1     = 16'h0000,
//			  ctr_inst27_1     = 32'h00000000;   //频综控制指令
			  
			  		  
	parameter	frame_length_t = 181;	  //报文实际长度-4
	parameter	frame_bit_t = 181*16;	  //报文实际长度-4
	reg [7:0] FPGA_MOD_RGE;
	wire [9:0] addra;
	reg [9:0] addrb;
	reg [9:0]addrb_t = 0;
    reg [9:0]addrb_tt = 0;
	reg [9:0] addra_init;
	reg [9:0] addra_update;
	wire wr_en;
	reg rd_en;
	reg wr_en_init;
	reg wr_en_update;
	reg [15:0] dina;

	assign addra = (addra_init == frame_length_t) ? addra_update : addra_init;
	assign wr_en = (addra_init == frame_length_t) ? wr_en_update : wr_en_init;
	
	
	
//	reg [frame_bit_t - 1:0] frame; 
//	reg [frame_bit_t - 1:0] frame_1 = {
////	frame_type,   
////	frame_length, 
////	dest_addr,	   
////	source_addr,
//	check_status,      
//	ctr_inst0_1,	   
//	ctr_inst1_1,	   
//	ctr_inst2_1,	   
//	ctr_inst3_1,	   
//	ctr_inst4_1,	   
//	ctr_inst5_1,	   
//	ctr_inst6_1,	   
//	ctr_inst7_1,	   
//	ctr_inst8_1,	   
//	ctr_inst9_1,	   
//	ctr_inst10_1,   
//	ctr_inst11_1,   
//	ctr_inst12_1,   
//	ctr_inst13_1,   
//	ctr_inst14_1,   
//	ctr_inst15_1,   
//	ctr_inst16_1,   
//	ctr_inst17_1,   
//	ctr_inst18_1,   
//	ctr_inst19_1,   
//	ctr_inst20_1,   
//	ctr_inst21_1,   
//	ctr_inst22_1,   
//	ctr_inst23_1,   
//	ctr_inst24_1,   
//	ctr_inst25_1,   
//	ctr_inst26_1,
//	ctr_inst27_1   
//	};	 
  
reg [frame_bit_t - 1:0] frame; 
wire [frame_bit_t - 1:0] frame_1;
assign frame_1={16'hABCD,       ////第一个不发，从第二个算起
//               16'd200,16'd300,16'd400,16'd500,16'd600,16'd700,16'd800,
//               16'd10,16'd20,16'd30,16'd40,16'd50,16'd60,16'd70,16'd80,
//               16'd11,16'd21,16'd31,16'd41,16'd51,16'd61,16'd71,16'd81,
//               16'd31,16'd32,16'd33,16'd34,16'd35,16'd36,16'd37,16'd38,
//               16'd14,16'd24,16'd34,16'd44,16'd54,16'd64,16'd74,16'd84,
//               16'd17,16'd27,16'd37,16'd47,16'd57,16'd67,16'd77,16'd87,
//               16'd81,16'd82,16'd83,16'd84,16'd85,16'd86,16'd87,16'd88,
//               16'd10,16'd20,16'd30,16'd40,16'd50,16'd60,16'd70,16'd80,
//               16'd11,16'd21,16'd31,16'd41,16'd51,16'd61,16'd71,16'd81,
//               16'd144,16'd244,16'd344,16'd444,16'd544,16'd644,16'd744,16'd844,
//               16'd122,16'd222,16'd322,16'd422,16'd522,16'd622,16'd722,16'd822,
//               16'd166,16'd266,16'd366,16'd466,16'd566,16'd666,16'd766,16'd866,
//               16'd177,16'd277,16'd377,16'd477,16'd577,16'd677,16'd777,16'd877,
//               16'd14,16'd24,16'd34,16'd44,16'd54,16'd64,16'd47,16'd84,
//               16'd71,16'd72,16'd73,16'd74,16'd75,16'd76,16'd77,16'd78,
//               16'd51,16'd52,16'd53,16'd54,16'd55,16'd56,16'd57,16'd58,
//               16'd188,16'd288,16'd388,16'd488,16'd588,16'd688,16'd788,16'd888,
//               16'd1,16'd2,16'd3,16'd4,16'd5,16'd6,16'd7,16'd8,
//               16'd11,16'd22,16'd33,16'd44,16'd55,16'd66,16'd77,16'd88,
//               16'd111,16'd222,16'd333,16'd444,16'd555,16'd666,16'd777,16'd888,
//               16'd100,16'd200,16'd300,16'd400,16'd500,16'd600,16'd700,16'd800,
//               16'd10,16'd20,16'd30,16'd40,16'd50,16'd60,16'd70,16'd80,        
//               16'd15
                16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,      
                16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,      
                16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,16'd3,      
                 1088'b0,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000, 
                 
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000,
                 16'b0000000000000000
                
                              };


	always@(posedge clk_wr)
	begin
		if(!FPGA_nRESET)
			frame <= frame_1;
		else 
		begin
			case(FPGA_MOD)
				8'h01:	frame <= frame_1;			
				default:frame <= frame_1;
			endcase
		end
	end
	
	always@(posedge clk_wr)
	begin
		if(!FPGA_nRESET)
			addra_init <= 10'd0;
		else if (addra_init < frame_length_t  && wr_en_init ==1)
			addra_init <= addra_init + 1'b1;
		else 
			addra_init <= addra_init;
	end 
	
	always@(posedge clk_wr)
	begin
		if(!FPGA_nRESET)
			wr_en_init <= 1'b0;
		else if (addra_init < frame_length_t  )
			wr_en_init <= 1'b1;
		else 
			wr_en_init <= 1'b0;
	end 
	
    always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            FPGA_MOD_RGE <= 8'd0;
        else 
            FPGA_MOD_RGE <= FPGA_MOD;
    end 
    
    always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            addra_update <= frame_length_t ;
        else if (FPGA_MOD_RGE != FPGA_MOD && addra_init == frame_length_t )
            addra_update <= 10'b0;
        else if( addra_update < frame_length_t  && wr_en_update ==1 )
            addra_update <= addra_update + 1'b1;
        else
             addra_update <= addra_update ;
    end 
	
    always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            wr_en_update <= 1'b0;
        else if (addra_update < frame_length_t  )
            wr_en_update <= 1'b1;
        else 
            wr_en_update <= 1'b0;
    end 
    reg [frame_bit_t - 1:0] frame_t = 0;
	always@(posedge clk_wr)
	begin
		if(!FPGA_nRESET)
			dina <= 16'h0000; 
        else if(wr_en == 0)
        begin
            frame_t <= frame;
            dina <= 16'h0000;
        end
		else if(addra <= frame_length_t )
        begin
            dina <= frame_t [frame_bit_t-17:frame_bit_t-32];
            frame_t<= frame_t<<16;
        end
		else
            dina <= 16'h0000;
	end	
	

	
	//ram读取控制	
	reg [9:0] rd_cnt;
	reg [9:0] addra_t;
	always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            addra_t <= 10'd0;
        else
            addra_t <= addra;
    end
    always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            rd_cnt <= 0;
        else if(addra == frame_length_t  && addra != addra_t)
            rd_cnt <= 1;
        else if (rd_cnt <= (frame_length_t+ 20) && rd_cnt >= 1)
            rd_cnt <= rd_cnt + 1'b1;
        else
            rd_cnt <= rd_cnt;
    end
	always@(posedge clk_wr)
	begin
		if(!FPGA_nRESET)
		begin
			rd_en <= 1'b0;
        end
		else if (addra == frame_length_t  && addra != addra_t)
			rd_en <= 1'b1;
		else if (rd_cnt <= frame_length_t  && rd_cnt >= 1)
			rd_en <= rd_en;
		else 
			rd_en <= 1'b0;
	end 
    always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            addrb <= 10'd0;
        else if (rd_cnt <= frame_length_t  && rd_cnt >= 1)
            addrb <= addrb + 1'b1;
        else 
            addrb <= 10'b0;
    end 
    
	reg frame_valid_reg;
    always@(posedge clk_wr)
    begin
        if(!FPGA_nRESET)
            frame_valid_reg <= 1'b0;
        else if (rd_cnt <= (frame_length_t + 1) && rd_cnt >= 2)
            frame_valid_reg <= 1'b1;
        else 
            frame_valid_reg <= 1'b0;
    end
	frame_ram frame_ram_inst (
	  .clka(clk_wr),           // input wire clka           
	  .ena(wr_en),             // input wire ena            
	  .wea(wr_en),             // input wire [0 : 0] wea    
	  .addra(addra),           // input wire [9 : 0] addra  
	  .dina(dina),             // input wire [15 : 0] dina  
	  .clkb(clk_rd),           // input wire clkb           
	  .enb(rd_en),             // input wire enb            
	  .addrb(addrb),           // input wire [9 : 0] addrb  
      .doutb(frame_out)        // output wire [15 : 0] doutb 
	);
always@(posedge clk_rd)
    begin
            if(!FPGA_nRESET)
            begin
                addrb_t <= 10'd0;
                addrb_tt <= 10'd0;
            end
            else
            begin
                addrb_t <= addrb;
                addrb_tt <= addrb_t;
            end
    end

assign fiber_addrb = addrb_tt;
assign frame_valid = frame_valid_reg;



//ila_frame your_instance_name (
//	.clk(clk_rd), // input wire clk


//	.probe0(wr_en), // input wire [0:0]  probe0  
//	.probe1(addra), // input wire [9:0]  probe1 
//	.probe2(dina), // input wire [15:0]  probe2 
//	.probe3(rd_en), // input wire [0:0]  probe3 
//	.probe4(addrb), // input wire [9:0]  probe4 
//	.probe5(frame_out) // input wire [15:0]  probe5
//);

	endmodule