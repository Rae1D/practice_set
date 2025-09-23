
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_axi_sdata.h"

// This typedef defines a custom stream 
typedef ap_axis<32,0,0,0> AXIS_wLAST;
#define ROWS 64
#define COLS 7

void hidden_layer(
    int input[64][7],  
    int output[64][2], 
    int weight[7][2],
    int bias[2])
{
   
    for (int t = 0; t < 64; t++) {
        for (int i = 0; i < 2; i++) {
            output[t][i] = 0; // Initialize output to 0.0f
            for (int c = 0; c < 7; c++) {
                output[t][i] += (weight[c][i] * input[t][c]);
                // printf("Output for hidden_layer: %d\r\n ", output[0][i]); 
            }
            output[t][i] += bias[i];
            output[t][i] = (output[t][i] >> 8); // Right shift to scale down the output
            // printf("Output for hidden_layer after right shift: %d\r\n ", output[0]); // Print the sigmoid output for debugging
    
    
        }
    }
}

void output_layer(
    int input[64][2],  
    int output[64], 
    int weight[2][1],
    int bias[1])
{
    for (int t = 0; t < 64; t++) {
        for (int i = 0; i < 1; i++) {
            output[t] = 0; // Initialize output to 0.0f
            for (int c = 0; c < 2; c++) {
                output[t] += (weight[c][i] * input[t][c]);
                // printf("Output for output_layer: %d\r\n ", output[0]); // Print the sigmoid output for debugging
                
            }
            output[t] += bias[i]; // Add bias to the output
            output[t] = (output[t] >> 8); // Right shift to scale down the output
        
        }  // printf("Output for output_layer after right shift: %d\r\n ", output[0]); // Print the sigmoid output for debugging
    }
}

void sigmoid(
    int input[64][2],  
    int output[64][2])
{
    int sigmoid_lookup[256] = {12,12,12,12,13,13,13,14,14,14,15,15,15,16,16,16,17,17,18,18,18,19,19,20,20,21,21,21,22,22,23,23,24,24,25,26,26,27,27,28,28,29,30,30,31,32,32,33,34,34,35,36,36,37,38,39,39,40,41,42,43,44,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,66,67,68,69,70,72,73,74,75,76,78,79,80,82,83,84,86,87,88,90,91,92,94,95,97,98,99,101,102,104,105,107,108,110,111,113,114,116,117,119,120,122,123,125,126,128,129,130,132,133,135,136,138,139,141,142,144,145,147,148,150,151,153,154,156,157,158,160,161,163,164,165,167,168,169,171,172,173,175,176,177,179,180,181,182,183,185,186,187,188,189,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,211,212,213,214,215,216,216,217,218,219,219,220,221,221,222,223,223,224,225,225,226,227,227,228,228,229,229,230,231,231,232,232,233,233,234,234,234,235,235,236,236,237,237,237,238,238,239,239,239,240,240,240,241,241,241,242,242,242,243,243,243};
    for (int t = 0; t < 64; t++) {
        for (int i = 0; i < 2; i++) {
            // printf("Input for sigmoid: %d\r\n ", input[0][i]); // Print the sigmoid output for debugging
            output[t][i] = sigmoid_lookup[input[t][i]]; // Use the lookup table for sigmoid
            // printf("Output for sigmoid: %d\r\n ", output[0][i]); // Print the sigmoid output for debugging
        }
    }
}



void fullModel_1(hls::stream<AXIS_wLAST>& S_AXIS, hls::stream<AXIS_wLAST>& M_AXIS)
{
    #pragma HLS INTERFACE ap_ctrl_none port=return // Indicates no control signals for start/stop
    #pragma HLS INTERFACE axis port=S_AXIS // axis implements the port as an AXI4-STREAM interface 
    #pragma HLS INTERFACE axis port=M_AXIS

	AXIS_wLAST read_input, write_output;

    // Receive and store the input matrix, and weights 
    int output_hidden[ROWS][2]; // stores 8-bit unsigned values (0-255)
    int output_sigmoid[ROWS][2]; // stores 8-bit unsigned values (0-255)    
    int pred[ROWS] = {0};

    int inputs[ROWS][COLS]; // stores 8-bit unsigned values (0-255)
    int bias_hidden[2];
    int weight_hidden[7][2];
    int bias_output[1];
    int weight_output[2][1];


    GetInput:for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            // Read each value, expecting an integer followed by a comma or end of line
            read_input = S_AXIS.read();
            inputs[i][j] = read_input.data;
        }
    }

    
    GetHiddenLayer:for (int j = 0; j < 2; j++) {
		// Read each value, expecting an integer followed by a comma or end of line
        read_input = S_AXIS.read();
        bias_hidden[j] = read_input.data;
	}

    for (int i = 0; i < COLS; i++) {
        for (int j = 0; j < 2; j++) {
            // Read each value, expecting an integer followed by a comma or end of line
            read_input = S_AXIS.read();
            weight_hidden[i][j] = read_input.data;
        }
    }

    GetOutputLayer:
    // Read each value, expecting an integer followed by a comma or end of line
    read_input = S_AXIS.read();
    bias_output[0] = read_input.data;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 1; j++) {
            // Read each value, expecting an integer followed by a comma or end of line
            read_input = S_AXIS.read();
            weight_output[i][j] = read_input.data;
        }
    }

    hidden_layer(inputs, output_hidden, weight_hidden, bias_hidden);
    sigmoid(output_hidden, output_sigmoid);
    output_layer(output_sigmoid, pred, weight_output, bias_output);
    
    for (int t = 0; t < 64; t++) {
        // printf("%d\n", pred[t]); // basically if >= 39, then 1 else 0
        if(pred[t] > 39) {
            pred[t] = 1;
        } else {
            pred[t] = 0;
        }
        write_output.data = pred[t];
        if (t == 63) {
            write_output.last = 1; // Set the last flag for the last element
        } else {
            write_output.last = 0; // Clear the last flag for other elements
        }       
        M_AXIS.write(write_output);

    }

} // end ip function
