`timescale 1ns / 1ps

/* 
----------------------------------------------------------------------------------
--	(c) Rajesh C Panicker, NUS
--  Description : Template for the Matrix Multiply unit for the AXI Stream Coprocessor
--	License terms :
--	You are free to use this code as long as you
--		(i) DO NOT post a modified version of this on any public repository;
--		(ii) use it only for educational purposes;
--		(iii) accept the responsibility to ensure that your implementation does not violate any intellectual property of any entity.
--		(iv) accept that the program is provided "as is" without warranty of any kind or assurance regarding its suitability for any particular purpose;
--		(v) send an email to rajesh.panicker@ieee.org briefly mentioning its use (except when used for the course EE4218 at the National University of Singapore);
--		(vi) retain this notice in this file or any files derived from this.
----------------------------------------------------------------------------------
*/

// those outputs which are assigned in an always block of matrix_multiply shoud be changes to reg (such as output reg Done).

module matrix_multiply
	#(	parameter width = 8, 			// width is the number of bits per location
		parameter A_depth_bits = 9, 	// depth is the number of locations (2^number of address bits)
		parameter B_depth_bits = 3, 
		parameter RES_depth_bits = 6,
		parameter M = 64,
		parameter N = 8
	) 
	(
		input clk,										
		input Start,									// myip_v1_0 -> matrix_multiply_0.
		output reg Done,									// matrix_multiply_0 -> myip_v1_0. Possibly reg.
		
		output reg A_read_en,  								// matrix_multiply_0 -> A_RAM. Possibly reg.
		output reg [A_depth_bits-1:0] A_read_address, 		// matrix_multiply_0 -> A_RAM. Possibly reg.
		input [width-1:0] A_read_data_out,				// A_RAM -> matrix_multiply_0.
		
		output reg B_read_en, 								// matrix_multiply_0 -> B_RAM. Possibly reg.
		output reg [B_depth_bits-1:0] B_read_address, 		// matrix_multiply_0 -> B_RAM. Possibly reg.
		input [width-1:0] B_read_data_out,				// B_RAM -> matrix_multiply_0.
		
		output reg RES_write_en, 							// matrix_multiply_0 -> RES_RAM. Possibly reg.
		output reg [RES_depth_bits-1:0] RES_write_address, 	// matrix_multiply_0 -> RES_RAM. Possibly reg.
		output reg [width-1:0] RES_write_data_in 			// matrix_multiply_0 -> RES_RAM. Possibly reg.
	);
	
	// implement the logic to read A_RAM, read B_RAM, do the multiplication and write the results to RES_RAM
	// Note: A_RAM and B_RAM are to be read synchronously. Read the wiki for more details.

	// FSM states
	// localparam IDLE = 3'b000, LOAD = 3'b001, WAIT = 3'b010, COMPUTE = 3'b011, STORE = 3'b100, DONE = 3'b101;
	// one hot encoding
	// localparam IDLE = 6'b100000, LOAD = 6'b010000, WAIT = 6'b001000, COMPUTE = 6'b000100, STORE = 6'b000010, DONE = 6'b000001;
	localparam IDLE = 3'b100, COMPUTE = 3'b010, STORE = 3'b001;
	// reg [2:0] state, n_state = IDLE; // ET TO CHECK***: do I have to declare this as IDLE
	reg [2:0] state; // ET TO CHECK***: do I have to declare this as IDLE? No, because I have the default case in the case statement.

	// SV ONLY. 
	// typdef enum logic [2:0] {IDLE, LOAD, WAIT, COMPUTE, STORE, DONE} state_machine;
	// state_machine state; // ET TO CHECK***: do I have to declare this as IDLE? No, because I have the default case in the case statement.

	// matrix indexs
	reg [A_depth_bits:0] i;
	reg [B_depth_bits:0] j; // ET TO CHECK***: can you use a variable for the reg size?
	reg [1:0] cycle_load;
	reg [$clog2(N):0] cycle; // check the cycle of COMPUTE state
	// reg [15:0] sum; // more bits to store the sum of the multiplication
	reg [19:0] sum; // more bits to store the sum of the multiplication (255 * 255 * 8 accumulates = 520,200, which is 19 bits)
	
	// Removed n_state, and used state directly in the always block.
	// always @(posedge clk)
		// state <= n_state;
		
	always @(posedge clk) begin
		case (state)
			IDLE: begin 
				if (Start) begin
					// n_state <= LOAD;
					// state <= LOAD;
					cycle_load <= cycle_load + 1;
					if (cycle_load == 0) begin // First cycle: idle
						state <= IDLE;
					end
					else 
					if (cycle_load == 1) begin // Second cycle: load
						A_read_address <= i * N + j;
						B_read_address <= j;
						j <= j + 1;
						state <= IDLE;
					end
					else if (cycle_load == 2) begin // Third cycle: wait
						A_read_address <= i * N + j;
						B_read_address <= j;
						j <= j + 1;
						state <= COMPUTE;
					end
					else begin
						state <= IDLE;
					end
				end
				else begin
					// A_read_en <= 0;
					// B_read_en <= 0;
					//enable always 1
					A_read_en <= 1;
					B_read_en <= 1;
					RES_write_en <= 0;
					A_read_address <= 0;
					B_read_address <= 0;
					RES_write_address <= 0;
					i <= 0;
					j <= 0;
					cycle_load <= 0;
					cycle <= 0;
					Done <= 0;
					sum <= 0;
				end
			end
			// LOAD: begin
			// 	// A_read_en <= 1;
			// 	// B_read_en <= 1;
			// 	// move to next address in the RAMs
			// 	A_read_address <= i * N + j;
			// 	B_read_address <= j;
			// 	j <= j + 1; // for pipeline
			// 	// n_state <= COMPUTE;
			// 	state <= WAIT;
			// end
			// WAIT: begin // ET NOTE: THIS STATE IS ONLY TO DELAY COMPUTE STATE BY 1 CYCLE FOR DATA TO BE READY.
			// 	state <= COMPUTE;
			// 	// for pipeline
			// 	A_read_address <= i * N + j;
			// 	B_read_address <= j;
			// 	j <= j + 1;
			// end
			COMPUTE: begin
				// for pipeline
				A_read_address <= i * N + j;
				B_read_address <= j;
				cycle <= cycle + 1; // check COMPUTE cycle
				sum <= sum + (A_read_data_out * B_read_data_out); // This also works, but the following is more explicit.
				// sum <= sum + ( {8'b0, A_read_data_out} * {8'b0, B_read_data_out} ); // use *dsp??
				if (j < N-1) begin // CAN YOU EXPLAIN WHY YOU USE N-1? Need j to increment from 0 to 3, so the last time to enter this block is when j = 2. j increments to 3. Data in Addr=3 is read, move to Store.
					// n_state <= LOAD;
					// state <= LOAD;
					state <= COMPUTE;
					j <= j + 1;
				end
				else if (cycle < N-1) begin
					state <= COMPUTE;
				end
				else begin
					// n_state <= STORE;
					state <= STORE;
					// A_read_en <= 0;
					// B_read_en <= 0;
				end
			end
			STORE: begin
				RES_write_en <= 1;
				RES_write_address <= i;
				// RES_write_data_in <= sum[width-1:0]; // take the upper 8 bits (Scaling down by 256)
				RES_write_data_in <= sum[15:width]; // take the upper 8 bits (Scaling down by 256)
				if (i < M-1) begin
					// n_state <= LOAD;
					state <= IDLE;
					i <= i + 1;
					j <= 0;
					cycle_load <= 1;
					cycle <= 0;
					sum <= 0;
				end 
				else begin
					// n_state <= DONE;
					// state <= DONE;
					state <= IDLE;
					Done <= 1; // ET TO DO***: There is a delay of 1 cycle before Start changes to 0. So assert Done before changing states so that when it moves to IDLE, Start=0. Is there a better way?
					RES_write_en <= 0; // In order to start reading in the next cycle, write_en has to be low
				end
			end
			// DONE: begin // ET TO CHECK***: Can remove this state, and just go to IDLE in the else block from COMPUTE?
			// 	// n_state <= IDLE;
			// 	state <= IDLE;
			// 	// Done <= 1; // ET TO CHECK***: is the timing correct? Will Start be 0 after Done is asserted in this clock. (No. Timing bug) 
			// end
			default: begin
				// n_state <= IDLE; // ET TO CHECK***: I am not sure if this would deal with the initialization or do I have to col_numust declare the n_state as IDLE from the start.
				state <= IDLE; // ET TO CHECK***: I am not sure if this would deal with the initialization or do I have to col_numust declare the n_state as IDLE from the start.
			end
		endcase
	end 

endmodule