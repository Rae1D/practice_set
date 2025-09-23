#include <stdio.h>

void conv2d( // normal function with loops 
    float input[1][28][28],  
    float output[4][26][26],    
    float weight[4][1][3][3],
    float bias[4]
)
{
    // printf("Called conv2d!\r\n");
    
    for (int out_c = 0; out_c < 4; out_c++) {  // Loop over output channels
        for (int i = 0; i < 26; i++) {
            for (int j = 0; j < 26; j++) {
                output[out_c][i][j] = 0.0; // initialized to 0'
                output[out_c][i][j] += bias[out_c];

                for (int c = 0; c < 1; c++) {  // Loop over input channels
                    for (int k = 0; k < 3; k++) {
                        for (int l = 0; l < 3; l++) {
                            // Account for the different strides. (FIXED THE STRIDE AS 1 HERE)
                            output[out_c][i][j] += input[0][i * 1 + k][j * 1+ l] * weight[out_c][c][k][l];
                        }
                    }
                }
            }
        }
    }
}