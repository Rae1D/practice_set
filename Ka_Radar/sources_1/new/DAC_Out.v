`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/09 14:22:24
// Design Name: 
// Module Name: DAC_Out
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

module DAC_Out(
    input           clk,  rst,  
    input           SW_RF,  // 开辐射
    input           [15:0]DAC_DATA_I,DAC_DATA_Q,
    input           [15:0]DDS_I_OUT ,DDS_Q_OUT, 
    output          [15:0]DAC_DP, DAC_DN    
);
    
    reg           [31:0]DAC_DATA;
    wire          [7:0]VIO_DAC_MUX;  
    
    always@(posedge clk)
    begin
        if(rst)begin
            DAC_DATA        <= 0;
        end else begin
            if(SW_RF)begin
                case (VIO_DAC_MUX)
                                    8'd0:  DAC_DATA        <= {DAC_DATA_Q[15:0],DAC_DATA_I[15:0]}; // 不截位
//                    8'd0:  DAC_DATA        <= { DAC_DATA_Q[15],DAC_DATA_Q[15:1], DAC_DATA_I[15], DAC_DATA_I[15:1]}; // 截一位
                    8'd1:  DAC_DATA        <= { DDS_Q_OUT[15:4],4'b0,   DDS_I_OUT[15:4], 4'b0};
                endcase
            end else begin
                DAC_DATA        <= 0;
            end
        end
    end
        
    DAC_OUT_IO DAC_OUT_IO(
        .clk_in                 ( clk       ), // input clk_in    
        .data_out_from_device   ( DAC_DATA  ), 
        .data_out_to_pins_p     ( DAC_DP    ), 
        .data_out_to_pins_n     ( DAC_DN    ), 
        .io_reset               ( rst       ) // input io_reset
    ); 
   
    VIO_DAC_OUT VIO_DAC_OUT (
        .clk                    ( clk           ),                // input wire clk
        .probe_out0             ( VIO_DAC_MUX   )  // output wire [7 : 0] probe_out0
    );
    
    ILA_DAC_OUT ILA_DAC_OUT (
	.clk   (clk), // input wire clk

	.probe0    (DAC_DATA[31:16]), // input wire [15:0]  probe0  
	.probe1    (DAC_DATA[15:0]), // input wire [15:0]  probe1 
	.probe2    (DAC_DATA_I), // input wire [15:0]  probe2 
	.probe3    (DAC_DATA_Q), // input wire [15:0]  probe3 
	.probe4    (DDS_I_OUT), // input wire [15:0]  probe4 
	.probe5    (DDS_Q_OUT) // input wire [15:0]  probe5
);
    
    
endmodule
