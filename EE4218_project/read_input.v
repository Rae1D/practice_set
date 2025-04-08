



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
        state <= Compute;
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

    if (End_Sigmoid == 1) begin //once done =1, change state in next clock cycle
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