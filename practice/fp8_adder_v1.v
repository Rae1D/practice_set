module fp8_adder_v1 (
    input  [7:0] a,
    input  [7:0] b,
    output [7:0] sum
);
    // output reg
    reg sign;
    reg [3:0] exponent;
    reg [2:0] mantissa;
    reg [3:0] exp_a;
    reg [3:0] exp_b;
    reg [3:0] mant_a;
    reg [3:0] mant_b;
    reg [3:0] exp_diff;
    reg [3:0] mant_sum;

    always @(a or b) begin
        // Unpack input operands
        sign = a[7];
        exp_a = a[6:3];
        exp_b = b[6:3];
        mant_a = {1'b1, a[2:0]};
        mant_b = {1'b1, b[2:0]};

        // 对阶
        if (exp_a > exp_b) begin
            exp_diff = exp_a - exp_b;
            mant_b = mant_b >> exp_diff;
            exponent = exp_a;
        end
        else if (exp_b > exp_a) begin
            exp_diff = exp_b - exp_a;
            mant_a = mant_a >> exp_diff;
            exponent = exp_b;
        end

        mantsum = mant_a + mant_b;
        mantissa = mantsum[2:0];
        assign sum = {sign, exponent, mantissa};

    end
    
    // Convert mantissas to include hidden bit (1.m format)
    wire [3:0] mant_a_ext = {1'b1, mant_a};
    wire [3:0] mant_b_ext = {1'b1, mant_b};
    
    // Compare exponents and align
    wire [3:0] exp_diff = exp_a - exp_b;
    wire [4:0] mant_b_shifted = mant_b_ext >> exp_diff;
    
    // Perform addition
    wire [4:0] mant_sum = mant_a_ext + mant_b_shifted;
    
    // Normalize the result
    wire [3:0] exp_res = exp_a + 1;
    wire [2:0] mant_res = mant_sum[3:1]; // Normalized mantissa
    
    // Pack the result
    assign sum = {sign_a, exp_res, mant_res};
    
endmodule