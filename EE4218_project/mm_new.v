module mm_new
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
		
		output reg A_read_en, 
		output reg [A_depth_bits-1:0] A_read_address,
		input [width-1:0] A_read_data_out,
		
		output reg B_read_en, 
		output reg [B_depth_bits-1:0] B_read_address,
		input [width-1:0] B_read_data_out,
		
		output reg RES_write_en,
		output reg [RES_depth_bits-1:0] RES_write_address,
		output reg [width-1:0] RES_write_data_in
    );

	localparam IDLE = 3'b100, COMPUTE = 3'b010, STORE = 3'b001;
	reg [2:0] state;

	reg [$clog2(M):0] i; // Row index
	reg [$clog2(N):0] j; // Inner dimension index
	reg [$clog2(P):0] k; // Column index of B
	reg [1:0] cycle_load;
	reg [$clog2(N):0] cycle;
	reg [19:0] sum;

	always @(posedge clk) begin
		case (state)
			IDLE: begin 
				if (Start) begin
					cycle_load <= cycle_load + 1;
					if (cycle_load == 0) begin
						state <= IDLE;
					end else if (cycle_load == 1) begin
						A_read_address <= i * N + j;
						B_read_address <= j * P + k;
						j <= j + 1;
						state <= IDLE;
					end else if (cycle_load == 2) begin
						A_read_address <= i * N + j;
						B_read_address <= j * P + k;
						j <= j + 1;
						state <= COMPUTE;
					end else begin
						state <= IDLE;
					end
				end else begin
					A_read_en <= 1;
					B_read_en <= 1;
					RES_write_en <= 0;
					A_read_address <= 0;
					B_read_address <= 0;
					RES_write_address <= 0;
					i <= 0;
					j <= 0;
					k <= 0;
					cycle_load <= 0;
					cycle <= 0;
					Done <= 0;
					sum <= 0;
				end
			end

			COMPUTE: begin
				A_read_address <= i * N + j;
				B_read_address <= j * P + k;
				cycle <= cycle + 1;
				sum <= sum + (A_read_data_out * B_read_data_out);
				if (j < N-1) begin
					state <= COMPUTE;
					j <= j + 1;
				end else if (cycle < N-1) begin
					state <= COMPUTE;
				end else begin
					state <= STORE;
				end
			end

			STORE: begin
				RES_write_en <= 1;
				RES_write_address <= i * P + k;
				RES_write_data_in <= sum[15:width];
				if (k < P-1) begin
					state <= IDLE;
					k <= k + 1;
					j <= 0;
					cycle_load <= 1;
					cycle <= 0;
					sum <= 0;
				end else if (i < M-1) begin
					state <= IDLE;
					i <= i + 1;
					k <= 0;
					j <= 0;
					cycle_load <= 1;
					cycle <= 0;
					sum <= 0;
				end else begin
					state <= IDLE;
					Done <= 1;
					// RES_write_en <= 0;
				end
			end

			default: begin
				state <= IDLE;
			end
		endcase
	end 

endmodule
