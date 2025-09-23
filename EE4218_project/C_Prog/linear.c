#include "stdio.h"
void linear_8(
    float input[1][324],  
    float output[1][8], 
    float weight[8][324],
    float bias[8])
{
    /*
    Output: 8 Features

    Linear
    Input: 
    1 x 324
    Parameter name: classifier.1.weight, Shape: torch.Size([8, 324])
    Parameter name: classifier.1.bias, Shape: torch.Size([8])

    Output: 
    1 x 8 

    */
//    printf("Called linear_8!\r\n");

    for (int i = 0; i < 8; i++) {
        output[0][i] = 0.0; // Initialize output to 0.0f
        output[0][i] += bias[i];
        for (int c = 0; c < 324; c++) {
            output[0][i] += weight[i][c] * input[0][c];
        }
        // printf("output[0][%d] = %f\r\n", i, output[0][i]);
    }
}

void linear_10(
    float input[1][8],  
    float output[1][10], 
    float weight[10][8],
    float bias[10])
{
    /*
    Output: 10 Features

    Linear 
    Input: 
    1 x 8 
    Parameter name: classifier.3.weight, Shape: torch.Size([10, 8])
    Parameter name: classifier.3.bias, Shape: torch.Size([10])

    Output: 
    1 x 10 

    */
//    printf("Called linear_10!\r\n");

    for (int i = 0; i < 10; i++) {
        output[0][i] = 0.0; // Initialize output to 0.0f
        output[0][i] += bias[i];
        for (int c = 0; c < 8; c++) {
            output[0][i] += weight[i][c] * input[0][c];
        }

    }
}
