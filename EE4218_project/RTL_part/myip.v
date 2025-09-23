/*
----------------------------------------------------------------------------------
--	(c) Rajesh C Panicker, NUS
--  Description : Matrix Multiplication AXI Stream Coprocessor. Based on the orginal AXIS Coprocessor template (c) Xilinx Inc
-- 	Based on the orginal AXIS coprocessor template (c) Xilinx Inc
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
/*
-------------------------------------------------------------------------------
--
-- Definition of Ports
-- ACLK              : Synchronous clock
-- ARESETN           : System reset, active low
-- S_AXIS_TREADY  : Ready to accept data in
-- S_AXIS_TDATA   :  Data in 
-- S_AXIS_TLAST   : Optional data in qualifier
-- S_AXIS_TVALID  : Data in is valid
-- M_AXIS_TVALID  :  Data out is valid
-- M_AXIS_TDATA   : Data Out
-- M_AXIS_TLAST   : Optional data out qualifier
-- M_AXIS_TREADY  : Connected slave device is ready to accept data out
--
-------------------------------------------------------------------------------
*/

module myip_v1_0 
	(
		// DO NOT EDIT BELOW THIS LINE ////////////////////
		ACLK,
		ARESETN,
		S_AXIS_TREADY,
		S_AXIS_TDATA,
		S_AXIS_TLAST,
		S_AXIS_TVALID,
		M_AXIS_TVALID,
		M_AXIS_TDATA,
		M_AXIS_TLAST,
		M_AXIS_TREADY
		// DO NOT EDIT ABOVE THIS LINE ////////////////////
	);

	input					ACLK;    // Synchronous clock
	input					ARESETN; // System reset, active low
	// slave in interface
	output	reg				S_AXIS_TREADY;  // Ready to accept data in
	input	[31 : 0]		S_AXIS_TDATA;   // Data in
	input					S_AXIS_TLAST;   // Optional data in qualifier
	input					S_AXIS_TVALID;  // Data in is valid
	// master out interface
	output	reg				M_AXIS_TVALID;  // Data out is valid
	output	reg [31 : 0]	M_AXIS_TDATA;   // Data Out
	output	reg				M_AXIS_TLAST;   // Optional data out qualifier
	input					M_AXIS_TREADY;  // Connected slave device is ready to accept data out

//----------------------------------------
// Implementation Section
//----------------------------------------
// In this section, we povide an example implementation of MODULE myip_v1_0
// that does the following:
//
// 1. Read all inputs
// 2. Add each input to the contents of register 'sum' which acts as an accumulator
// 3. After all the inputs have been read, write out the content of 'sum', 'sum+1', 'sum+2', 'sum+3'
//
// You will need to modify this example for
// MODULE myip_v1_0 to implement your coprocessor


// RAM parameters for PROJECT
    localparam A_depth_bits = 9;  	// 512 elements (A is a 64x8 matrix)
    localparam B_depth_bits = 4; 	// 16 elements (B is a 8x2 matrix)
    localparam RES_depth_bits = 7;	// 128 elements (RES is a 64x2 matrix)
    localparam SIG_depth_bits = 8;	// 192 elements (SIG is a 64x3 matrix)
    localparam C_depth_bits = 2;	// 3 elements (C is a 3x1 matrix)
    localparam OUT_depth_bits = 6;	// 64 elements (OUT is a 64x1 matrix)
    localparam width = 8;			// all 8-bit data
    localparam M = 64; 
    localparam N = 8;
    localparam P = 2;
    localparam Q = 3;
	
// wires (or regs) to connect to RAMs and matrix_multiply_0 for assignment 1
// those which are assigned in an always block of myip_v1_0 shoud be changes to reg.
    reg		A_write_en;								// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg.
    reg		[A_depth_bits-1:0] A_write_address;		// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg. 
    reg		[width-1:0] A_write_data_in;			// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	A_read_en;								// matrix_multiply_0 -> A_RAM.
    wire	[A_depth_bits-1:0] A_read_address;		// matrix_multiply_0 -> A_RAM.
    wire	[width-1:0] A_read_data_out;			// A_RAM -> matrix_multiply_0.

    reg		B_write_en;								// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
    reg		[B_depth_bits-1:0] B_write_address;		// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
    reg		[width-1:0] B_write_data_in;			// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	B_read_en;								// matrix_multiply_0 -> B_RAM.
    wire	[B_depth_bits-1:0] B_read_address;		// matrix_multiply_0 -> B_RAM.
    wire	[width-1:0] B_read_data_out;			// B_RAM -> matrix_multiply_0.

    wire	RES_write_en;							// matrix_multiply_0 -> RES_RAM.
    wire	[RES_depth_bits-1:0] RES_write_address;	// matrix_multiply_0 -> RES_RAM.
    wire	[width-1:0] RES_write_data_in;			// matrix_multiply_0 -> RES_RAM.
    wire	RES_read_en;  							// myip_v1_0 -> RES_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	[RES_depth_bits-1:0] RES_read_address;	// myip_v1_0 -> RES_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	[width-1:0] RES_read_data_out;			// RES_RAM -> myip_v1_0

    wire	SIG_write_en;								// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	[SIG_depth_bits-1:0] SIG_write_address;		// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg. 
    wire	[width-1:0] SIG_write_data_in;			// myip_v1_0 -> A_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	SIG_read_en;								// matrix_multiply_0 -> A_RAM.
    wire	[SIG_depth_bits-1:0] SIG_read_address;		// matrix_multiply_0 -> A_RAM.
    wire	[width-1:0] SIG_read_data_out;			// A_RAM -> matrix_multiply_0.

    reg		C_write_en;								// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
    reg		[C_depth_bits-1:0] C_write_address;		// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
    reg		[width-1:0] C_write_data_in;			// myip_v1_0 -> B_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	C_read_en;								// matrix_multiply_0 -> B_RAM.
    wire	[C_depth_bits-1:0] C_read_address;		// matrix_multiply_0 -> B_RAM.
    wire	[width-1:0] C_read_data_out;			// B_RAM -> matrix_multiply_0.

    wire	OUT_write_en;							// matrix_multiply_0 -> RES_RAM.
    wire	[OUT_depth_bits-1:0] OUT_write_address;	// matrix_multiply_0 -> RES_RAM.
    wire	[width-1:0] OUT_write_data_in;			// matrix_multiply_0 -> RES_RAM.
    reg		OUT_read_en;  							// myip_v1_0 -> RES_RAM. To be assigned within myip_v1_0. Possibly reg.
    reg		[OUT_depth_bits-1:0] OUT_read_address;	// myip_v1_0 -> RES_RAM. To be assigned within myip_v1_0. Possibly reg.
    wire	[width-1:0] OUT_read_data_out;			// RES_RAM -> myip_v1_0	
	
// wires (or regs) to connect to matrix_multiply for assignment 1
    reg		Start_hidden; 								// myip_v1_0 -> matrix_multiply_0. To be assigned within myip_v1_0. Possibly reg.
    wire	Done_hidden;								// matrix_multiply_0 -> myip_v1_0. 

    reg     Start_Sigmoid; //Starts sigmoid function call
    wire    Done_Sigmoid; //Ends sigmoid function call

    reg     Start_Out; //Starts output layer call
    wire    Done_Out; //Ends output layer call
			
				
// Total number of input data.
    localparam NUMBER_OF_A_WORDS = M * (N-1); // 448 data points for 64 x 7 matrix
    localparam NUMBER_OF_B_WORDS = N * P; // 16 data points for 8 x 2 matrix
    localparam NUMBER_OF_C_WORDS = Q; // 3 data points for 3 x 1 matrix

    localparam NUMBER_OF_INPUT_WORDS = NUMBER_OF_A_WORDS + NUMBER_OF_B_WORDS + NUMBER_OF_C_WORDS; //467 in total

// Total number of output data
    localparam NUMBER_OF_OUTPUT_WORDS = M; // 64 outputs

// Define the states of state machine (one hot encoding)
    localparam Idle  		    = 8'b1000_0000;
    localparam Read_Inputs 	    = 8'b0100_0000;
    localparam Write_Col0 	    = 8'b0010_0000;
    localparam Compute_hid 		= 8'b0001_0000;
    localparam Compute_sig 		= 8'b0000_1000;
    localparam Compute_out 		= 8'b0000_0100;
    localparam Preload  	    = 8'b0000_0010;
    localparam Write_Outputs    = 8'b0000_0001;

    reg [7:0] state;


// Counters to store the number inputs read & outputs written.
	// Could be done using the same counter if reads and writes are not overlapped (i.e., no dataflow optimization)
	// Left as separate for ease of debugging
    reg [$clog2(NUMBER_OF_INPUT_WORDS) - 1:0] read_counter; // [8:0]
    reg [$clog2(NUMBER_OF_OUTPUT_WORDS) - 1:0] write_counter; // [5:0]
    // add write_col0_counter (0-63)
    reg [$clog2(M) - 1:0] write_col0_counter; // [5:0]


	always @(posedge ACLK) 
	begin
	// implemented as a single-always Moore machine
	// a Mealy machine that asserts S_AXIS_TREADY and captures S_AXIS_TDATA etc can save a clock cycle

		/****** Synchronous reset (active low) ******/
		if (!ARESETN)
		begin
			// CAUTION: make sure your reset polarity is consistent with the system reset polarity
			state        <= Idle;
        end
		else
		begin
			case (state)

                Idle:
                begin
                    read_counter 	<= 0;
                    write_counter 	<= 0;
                    write_col0_counter 	<= 0;

                    S_AXIS_TREADY 	<= 0;
                    M_AXIS_TVALID 	<= 0;
                    M_AXIS_TLAST  	<= 0;

                    // Do not write to RAMs in Idle state
                    A_write_en <= 0;
                    B_write_en <= 0;
                    C_write_en <= 0;
                    OUT_read_en <= 0; 
                    Start_hidden <= 0; // No signal to MMul Module. Just initialization here. 
                    Start_Sigmoid <= 0;
                    Start_Out <= 0;

                    if (S_AXIS_TVALID == 1)
                    begin
                        state       	<= Read_Inputs;
                        S_AXIS_TREADY 	<= 1; 
                        // start receiving data once you go into Read_Inputs
                    end
                end

                Read_Inputs: begin
                    S_AXIS_TREADY <= 1;

                    if (S_AXIS_TVALID) begin
                        if (read_counter < NUMBER_OF_A_WORDS) begin  // Fill A[i][1~7]
                            A_write_en      <= 1;
                            A_write_address <= (read_counter / (N-1)) * N + (read_counter % (N-1) + 1);
                            A_write_data_in <= S_AXIS_TDATA[7:0];
                            B_write_en      <= 0;
                            C_write_en      <= 0;
                        end
                        else if (read_counter < NUMBER_OF_A_WORDS + NUMBER_OF_B_WORDS) begin  // Fill B_RAM
                            B_write_en      <= 1;
                            B_write_address <= read_counter - NUMBER_OF_A_WORDS;
                            B_write_data_in <= S_AXIS_TDATA[7:0];
                            A_write_en      <= 0;
                            C_write_en      <= 0;
                        end
                        else begin  // Fill C_RAM
                            C_write_en      <= 1;
                            C_write_address <= read_counter - (NUMBER_OF_A_WORDS + NUMBER_OF_B_WORDS);
                            C_write_data_in <= S_AXIS_TDATA[7:0];
                            A_write_en      <= 0;
                            B_write_en      <= 0;
                        end

                        read_counter <= read_counter + 1;
                    end

                    if (read_counter == NUMBER_OF_INPUT_WORDS - 1) begin
                        S_AXIS_TREADY <= 0;
                        state <= Write_Col0;
                        write_col0_counter <= 0;
                    end
                end
            
                Write_Col0: begin // Write the first column of A_RAM
                    C_write_en <= 0;
                    A_write_en      <= 1;
                    A_write_address <= write_col0_counter * 8; // 0, 8, 16, ..., 63*8
                    A_write_data_in <= 8'd255;

                    if (write_col0_counter == 63) begin
                        state <= Compute_hid;
                        Start_hidden <= 1;
                    end else begin
                        write_col0_counter <= write_col0_counter + 1;
                    end
                end

                Compute_hid:
                begin
                    // Stop the enabling of write to RAM A. Moved to Compute state so that the last data is written before computation. 
                    A_write_en <= 0;
                    if(Done_hidden == 1) begin
                        state		<= Compute_sig;
                        Start_hidden 		<= 0;
                        
                        // 暂时先不加下面的(sigmoid中RES_read_en = Start_Sigmoid)
                        // read data out from the RES RAM
                        // RES_read_en 		<= 1;
                        // RES_read_address 	<= 0;
                    end 
                end

                Compute_sig:
                begin
                    Start_Sigmoid <= 1; // 之后应该可以移到上面,省1个周期

                    if (Done_Sigmoid == 1) begin //once done =1, change state in next clock cycle
                        state <= Compute_out;
                        Start_Sigmoid <= 0;
                    end
                end

                Compute_out:
                begin
                    Start_Out <= 1;

                    if(Done_Out == 1) begin
                        state		<= Preload;
                        Start_Out 	<= 0;
                        // read data out from the OUT RAM
                        OUT_read_en 		<= 1;
                        OUT_read_address 	<= 0;
                    end 
                end

                Preload: // 1 cycle for data to available
                begin
                    OUT_read_address 	<= OUT_read_address + 1;
                    state <= Write_Outputs; 

                end

                Write_Outputs: // When you enter WO, data must be ready. 
                begin
                    
                    if (M_AXIS_TREADY == 1) 
                    begin

                        if (M_AXIS_TLAST == 1) 
                        begin
                            state	<= Idle;
                            M_AXIS_TVALID		<= 0;
                            M_AXIS_TLAST	<= 0;
                        end
                        else begin
                            M_AXIS_TVALID		<= 1;
                            M_AXIS_TDATA 	<= {24'b0, OUT_read_data_out};	// OUT_read_data_out must be wire, or you will have this error: [Synth 8-685] variable 'RES_read_data_out' should not be used in output port connection	
                            OUT_read_address 	<= OUT_read_address +1;

                            // should only update write_counter when you are actually writing the data 
                            write_counter <= write_counter + 1;
                        end

                        if (write_counter == NUMBER_OF_OUTPUT_WORDS - 1) begin
                            OUT_read_en <= 0; 
                            M_AXIS_TLAST	<= 1;

                        end
                    end
                end			

			endcase
		end
	end
	   
// Connection to sub-modules / components for assignment 1
    memory_RAM 
    #(
        .width(width), 
        .depth_bits(A_depth_bits)
    ) A_RAM 
    (
        .clk(ACLK),
        .write_en(A_write_en),
        .write_address(A_write_address),
        .write_data_in(A_write_data_in),
        .read_en(A_read_en),    
        .read_address(A_read_address),
        .read_data_out(A_read_data_out)
    );
                                        
                                        
    memory_RAM 
    #(
        .width(width), 
        .depth_bits(B_depth_bits)
    ) B_RAM 
    (
        .clk(ACLK),
        .write_en(B_write_en),
        .write_address(B_write_address),
        .write_data_in(B_write_data_in),
        .read_en(B_read_en),    
        .read_address(B_read_address),
        .read_data_out(B_read_data_out)
    );
                                        
                                        
    memory_RAM 
    #(
        .width(width), 
        .depth_bits(RES_depth_bits)
    ) RES_RAM 
    (
        .clk(ACLK),
        .write_en(RES_write_en),
        .write_address(RES_write_address),
        .write_data_in(RES_write_data_in),
        .read_en(RES_read_en),    
        .read_address(RES_read_address),
        .read_data_out(RES_read_data_out)
    );


    memory_RAM 
    #(
        .width(width), 
        .depth_bits(SIG_depth_bits)
    ) SIG_RAM 
    (
        .clk(ACLK),
        .write_en(SIG_write_en),
        .write_address(SIG_write_address),
        .write_data_in(SIG_write_data_in),
        .read_en(SIG_read_en),    
        .read_address(SIG_read_address),
        .read_data_out(SIG_read_data_out)
    );


    memory_RAM 
    #(
        .width(width), 
        .depth_bits(C_depth_bits)
    ) C_RAM 
    (
        .clk(ACLK),
        .write_en(C_write_en),
        .write_address(C_write_address),
        .write_data_in(C_write_data_in),
        .read_en(C_read_en),    
        .read_address(C_read_address),
        .read_data_out(C_read_data_out)
    );


    memory_RAM 
    #(
        .width(width), 
        .depth_bits(OUT_depth_bits)
    ) OUT_RAM 
    (
        .clk(ACLK),
        .write_en(OUT_write_en),
        .write_address(OUT_write_address),
        .write_data_in(OUT_write_data_in),
        .read_en(OUT_read_en),    
        .read_address(OUT_read_address),
        .read_data_out(OUT_read_data_out)
    );


    mm_new 
    #(
        .width(width), 
        .A_depth_bits(A_depth_bits), 
        .B_depth_bits(B_depth_bits), 
        .RES_depth_bits(RES_depth_bits),
        .M(M),
        .N(N), 
        .P(P)
    ) mm_new_0
    (									
        .clk(ACLK),
        .Start(Start_hidden),
        .Done(Done_hidden),
        
        .A_read_en(A_read_en),
        .A_read_address(A_read_address),
        .A_read_data_out(A_read_data_out),
        
        .B_read_en(B_read_en),
        .B_read_address(B_read_address),
        .B_read_data_out(B_read_data_out),
        
        .RES_write_en(RES_write_en),
        .RES_write_address(RES_write_address),
        .RES_write_data_in(RES_write_data_in)
    );


    Sigmoid
    #(
        .width(width),	
        .RES_depth_bits(RES_depth_bits),
        .SIG_depth_bits(SIG_depth_bits)
    ) Sigmoid_0
    (
        .clk(ACLK), 
        .Start_Sigmoid(Start_Sigmoid),
        .End_Sigmoid(Done_Sigmoid), 

        .RES_read_en(RES_read_en), 
        .RES_read_address(RES_read_address), 
        .RES_read_data_out(RES_read_data_out),

        .SIG_write_en(SIG_write_en), 	
        .SIG_write_address(SIG_write_address), 
        .SIG_write_data_in(SIG_write_data_in)
    );


    matrix_multiply 
    #(
        .width(width), 
        .A_depth_bits(SIG_depth_bits), 
        .B_depth_bits(C_depth_bits), 
        .RES_depth_bits(OUT_depth_bits),
        .M(M),
        .N(Q)  
    ) matrix_multiply_0
    (									
        .clk(ACLK),
        .Start(Start_Out),
        .Done(Done_Out),
        
        .A_read_en(SIG_read_en),
        .A_read_address(SIG_read_address),
        .A_read_data_out(SIG_read_data_out),
        
        .B_read_en(C_read_en),
        .B_read_address(C_read_address),
        .B_read_data_out(C_read_data_out),
        
        .RES_write_en(OUT_write_en),
        .RES_write_address(OUT_write_address),
        .RES_write_data_in(OUT_write_data_in)
    );

endmodule