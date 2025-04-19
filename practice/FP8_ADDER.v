module FP8_ADDER(
CLK,
RESETN,
input_a,
input_b,
output_c
);


input CLK;			////	clock signal
input RESETN; 		////	reset disable

input [7:0] input_a; 	////	fp8 operand
input [7:0] input_b;	////	fp8 operand

output [7:0] output_c;	////	fp8 final output

////////*	stage 1 (swap)	*////////
reg [7:0] operand_a;	////	bigger operand
reg [7:0] operand_b;	////	smaller operand

always @(posedge CLK or negedge RESETN) begin
    if (!RESETN) begin
        operand_a <= 'b0;
        operand_b <= 'b0;
    end
    else if (input_a[6:3] >= input_b[6:3]) begin
        operand_a <= input_a;
        operand_b <= input_b;
    end
    else begin
        operand_a <= input_b;
        operand_b <= input_a;
    end
end

////////*	stage 2 	*////////
wire sig_a = operand_a[7];
wire [3:0] exp_a = operand_a[6:3];
wire [3:0] exp_b = operand_b[6:3];
wire [2:0] mas_a = operand_a[2:0];
wire [2:0] mas_b = operand_b[2:0];
wire [3:0] exp_diff = exp_a - exp_b;

reg sig_p1;
reg [3:0] exp_a_p1;
reg [3:0] shifted_mas;
reg [2:0] mas_a_p1;

always @(posedge CLK or negedge RESETN) begin
    if (!RESETN) begin
        sig_p1 <= 'b0;
        exp_a_p1 <= 'b0;
        shifted_mas <= 'b0;
        mas_a_p1 <= 'b0;
    end
    else begin
        sig_p1 <= sig_a;
        exp_a_p1 <= exp_a;
        shifted_mas <= {1'b1, mas_b} >> exp_diff;
        mas_a_p1 <= mas_a;
    end
end

////////*	stage 3		*////////
reg sig_p2;
reg [3:0] exp_a_p2;
reg [4:0] mas_add_result;

always @(posedge CLK or negedge RESETN) begin
    if (!RESETN) begin
        sig_p2 <= 'b0;
        exp_a_p2 <= 'b0;
        mas_add_result <= 'b0;
    end
    else begin
        sig_p2 <= sig_p1;
        exp_a_p2 <= exp_a_p1;
        mas_add_result <= {2'b01, mas_a_p1} + {1'b0, shifted_mas};
    end
end

////////*	stage 4		*////////
reg sig_p3;
reg [3:0] exp_a_p3;
reg [2:0] mas_add_p3;

always @(posedge CLK or negedge RESETN) begin
    if (!RESETN) begin
        sig_p3 <= 'b0;
        exp_a_p3 <= 'b0;
        mas_add_p3 <= 'b0;
    end
    else begin
        sig_p3 <= sig_p2; // Assign sign
        if (mas_add_result[4]) begin  // If overflow occurs
            exp_a_p3 <= exp_a_p2 + 1; // Increase exponent
            mas_add_p3 <= mas_add_result[3:1]; // Normalize mantissa
        end
        else begin
            exp_a_p3 <= exp_a_p2; // Keep exponent
            mas_add_p3 <= mas_add_result[2:0]; // Align mantissa
        end
    end
end

assign output_c = {sig_p3, exp_a_p3, mas_add_p3};

endmodule