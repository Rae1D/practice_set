module mm_parallel
	#(	parameter width = 8, 			// width is the number of bits per location
		parameter A_depth_bits = 9, 	// depth is the number of locations (2^number of address bits)
		parameter B_depth_bits = 9, 
		parameter RES_depth_bits = 9,
        parameter M = 64,
		parameter N = 8,
        parameter P = 2
	) 
	(
		input clk,										
		input Start, 
		output reg Done, 
		
		// Bank 0: A的前半部分 (M × N/2)
		output reg A0_read_en, 
		output reg [A_depth_bits-1:0] A0_read_address,
		input [width-1:0] A0_read_data_out,
		
		// Bank 1: A的后半部分 (M × N/2)  
		output reg A1_read_en, 
		output reg [A_depth_bits-1:0] A1_read_address,
		input [width-1:0] A1_read_data_out,
		
		// Bank 0: B的前半部分 (N/2 × P)
		output reg B0_read_en, 
		output reg [B_depth_bits-1:0] B0_read_address,
		input [width-1:0] B0_read_data_out,
		
		// Bank 1: B的后半部分 (N/2 × P)
		output reg B1_read_en, 
		output reg [B_depth_bits-1:0] B1_read_address,
		input [width-1:0] B1_read_data_out,
		
		output reg RES_write_en,
		output reg [RES_depth_bits-1:0] RES_write_address,
		output reg [width-1:0] RES_write_data_in
    );

	localparam IDLE = 3'b100, COMPUTE = 3'b010, STORE = 3'b001;
	reg [2:0] state;

	reg [$clog2(M):0] i; // Row index
	reg [$clog2(N/2):0] j; // Inner dimension index (现在范围是0到N/2-1)
	reg [$clog2(P):0] k; // Column index of B
	reg [1:0] cycle_load;
	reg [$clog2(N/2):0] cycle;
	reg [19:0] sum0; // Bank 0的累加结果
	reg [19:0] sum1; // Bank 1的累加结果

	// 计算矩阵分割后的参数
	localparam N_HALF = N / 2;

	always @(posedge clk) begin
		case (state)
			IDLE: begin 
				if (Start) begin
					cycle_load <= cycle_load + 1;
					if (cycle_load == 0) begin
						state <= IDLE;
					end else if (cycle_load == 1) begin
						// 同时读取两个bank的数据
						A0_read_address <= i * N_HALF + j;      // A的前半部分
						A1_read_address <= i * N_HALF + j;      // A的后半部分
						B0_read_address <= j * P + k;           // B的前半部分
						B1_read_address <= j * P + k;           // B的后半部分
						j <= j + 1;
						state <= IDLE;
					end else if (cycle_load == 2) begin
						// 继续读取数据
						A0_read_address <= i * N_HALF + j;
						A1_read_address <= i * N_HALF + j;
						B0_read_address <= j * P + k;
						B1_read_address <= j * P + k;
						j <= j + 1;
						state <= COMPUTE;
					end else begin
						state <= IDLE;
					end
				end else begin
					// 初始化所有信号
					A0_read_en <= 1;
					A1_read_en <= 1;
					B0_read_en <= 1;
					B1_read_en <= 1;
					RES_write_en <= 0;
					A0_read_address <= 0;
					A1_read_address <= 0;
					B0_read_address <= 0;
					B1_read_address <= 0;
					RES_write_address <= 0;
					i <= 0;
					j <= 0;
					k <= 0;
					cycle_load <= 0;
					cycle <= 0;
					Done <= 0;
					sum0 <= 0;
					sum1 <= 0;
				end
			end

			COMPUTE: begin
				// 同时读取两个bank的数据
				A0_read_address <= i * N_HALF + j;
				A1_read_address <= i * N_HALF + j;
				B0_read_address <= j * P + k;
				B1_read_address <= j * P + k;
				
				cycle <= cycle + 1;
				
				// 并行执行两个MAC操作
				sum0 <= sum0 + (A0_read_data_out * B0_read_data_out); // A前半 × B前半
				sum1 <= sum1 + (A1_read_data_out * B1_read_data_out); // A后半 × B后半
				
				if (j < N_HALF-1) begin
					state <= COMPUTE;
					j <= j + 1;
				end else if (cycle < N_HALF-1) begin
					state <= COMPUTE;
				end else begin
					state <= STORE;
				end
			end

			STORE: begin
				RES_write_en <= 1;
				RES_write_address <= i * P + k;
				// 将两个bank的结果相加得到最终结果
				RES_write_data_in <= (sum0 + sum1)[15:width];
				
				if (k < P-1) begin
					state <= IDLE;
					k <= k + 1;
					j <= 0;
					cycle_load <= 1;
					cycle <= 0;
					sum0 <= 0;
					sum1 <= 0;
				end else if (i < M-1) begin
					state <= IDLE;
					i <= i + 1;
					k <= 0;
					j <= 0;
					cycle_load <= 1;
					cycle <= 0;
					sum0 <= 0;
					sum1 <= 0;
				end else begin
					state <= IDLE;
					Done <= 1;
				end
			end

			default: begin
				state <= IDLE;
			end
		endcase
	end 

endmodule