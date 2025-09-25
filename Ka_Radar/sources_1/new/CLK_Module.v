`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/09 11:17:28
// Design Name: 
// Module Name: CLK_Module
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

module CLK_Module(
    
    input           V7_REF_DAC_CLKP, V7_REF_DAC_CLKN,
    
    output          DAC_CLK_120M,

    output          DAC_CLKP, DAC_CLKN,
    output          DCI_CLKP, DCI_CLKN,
    output          DAC_CLKP2, DAC_CLKN2,
    output          DCI_CLKP2, DCI_CLKN2,
  
    output reg      dac_set,
    output          SYS_RST
);
    
    wire    osc_locked;
    wire    DAC_CLK_120M_i,DAC_CLK_120M_o,DAC_CLK_600M,DAC_CLK_120M_90o;
    wire    DACLK_locked;
    
    reg     pll_locked_r1=0,pll_locked_r2=0;
    reg     ref_rst_temp=0;
    reg     [31:0]cnt1=0;
    reg     ref_rst=0,sp_rst_r=0;
    
    assign      DAC_CLK_120M  = DAC_CLK_120M_o;
    
    /////// -- 差分时钟转单端时钟 -- ///////////////
    IBUFDS #(
        .DIFF_TERM      ("TRUE"),       // Differential Termination
        .IBUF_LOW_PWR   ("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
        .IOSTANDARD     ("DEFAULT")     // Specify the input I/O standard
    ) IBUFDS_DAC_120M (
        .I              ( V7_REF_DAC_CLKP   ),  // Diff_p buffer input (connect directly to top-level port)
        .IB             ( V7_REF_DAC_CLKN   ), // Diff_n buffer input (connect directly to top-level port)
        .O              ( DAC_CLK_120M_i    )  // Buffer output      
    );  
    
    DAC_CLK DAC_CLK_INST(
        .clk_in1        ( DAC_CLK_120M_i    ),  // input clk_in1
        .reset          ( 1'd0              ),  // input reset
        .clk_out1       ( DAC_CLK_120M_o    ),  // output clk_out1
        .clk_out2       ( DAC_CLK_600M      ),  // output clk_out2
        .clk_out3       ( DAC_CLK_120M_90o  ),  // output clk_out1
        .locked         ( DACLK_locked      )   // output locked
    );    
        
    ///// -- 单端时钟转差分时钟输出 -- ///////////////
    OBUFDS #(
        .IOSTANDARD     ("DEFAULT"), // Specify the output I/O standard
        .SLEW           ("SLOW")           // Specify the output slew rate
    ) OBUFDS_DAC_DCI_inst (
        .O              ( DCI_CLKP          ),     // Diff_p output (connect directly to top-level port)
        .OB             ( DCI_CLKN          ),   // Diff_n output (connect directly to top-level port)
        .I              ( DAC_CLK_120M_o    )      // Buffer input
    );    
        
    ///// -- 单端时钟转差分时钟输出 -- ///////////////
    OBUFDS #(
          .IOSTANDARD   ("DEFAULT"), // Specify the output I/O standard
          .SLEW         ("SLOW")           // Specify the output slew rate
    ) OBUFDS_DAC_CLK_inst (
          .O            ( DAC_CLKP          ),     // Diff_p output (connect directly to top-level port)
          .OB           ( DAC_CLKN          ),   // Diff_n output (connect directly to top-level port)
          .I            ( DAC_CLK_600M      )      // Buffer input
    );
    ///// -- 单端时钟转差分时钟输出 -- ///////////////
    OBUFDS #(
        .IOSTANDARD     ("DEFAULT"), // Specify the output I/O standard
        .SLEW           ("SLOW")           // Specify the output slew rate
    ) OBUFDS_DAC_DCI_inst1 (
        .O              ( DCI_CLKP2          ),     // Diff_p output (connect directly to top-level port)
        .OB             ( DCI_CLKN2          ),   // Diff_n output (connect directly to top-level port)
        .I              ( DAC_CLK_120M_o    )      // Buffer input
    );    
        
    ///// -- 单端时钟转差分时钟输出 -- ///////////////
    OBUFDS #(
          .IOSTANDARD   ("DEFAULT"), // Specify the output I/O standard
          .SLEW         ("SLOW")           // Specify the output slew rate
    ) OBUFDS_DAC_CLK_inst1 (
          .O            ( DAC_CLKP2          ),     // Diff_p output (connect directly to top-level port)
          .OB           ( DAC_CLKN2          ),   // Diff_n output (connect directly to top-level port)
          .I            ( DAC_CLK_600M      )      // Buffer input
    );    




        
    always@( posedge DAC_CLK_120M_o )
    begin
        pll_locked_r1  <= DACLK_locked;
        pll_locked_r2  <= pll_locked_r1;
        
        if(pll_locked_r2)
            ref_rst_temp <= 1'b0;
        else
            ref_rst_temp <= 1'b1;
        
        if(ref_rst_temp)
            cnt1 <= 0;
        else begin
            if(cnt1 < 2000000000)
                cnt1 <= cnt1 + 1'b1;
            else
                cnt1 <= cnt1;
        end
            
        if(cnt1 < 2000)          //
            ref_rst <= 1'b1;
        else
            ref_rst <= 1'b0;	
        
        if(cnt1<20000)begin
            dac_set   <= 0;
        end else if(cnt1<21000)begin
            dac_set   <= 1;
        end else begin
            dac_set   <= 0;
        end
        
    end
    
    assign      SYS_RST = ref_rst;

endmodule