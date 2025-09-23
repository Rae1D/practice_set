#pragma once
void conv2d( // normal function with loops 
    float input[1][28][28],  
    float output[4][26][26],    
    float weight[4][1][3][3],
    float bias[4]
);

void tanh_4
(
    float input[4][26][26],
    float output[4][26][26]
);

void avgpool_4(float input[4][26][26], float output[4][9][9]); 

void flatten(float input[4][9][9], float output[1][324]); 


void linear_8(
    float input[1][324],  
    float output[1][8], 
    float weight[8][324],
    float bias[8]);

void tanh_1
(
    float input[1][8],
    float output[1][8]
);

void linear_10(
    float input[1][8],  
    float output[1][10], 
    float weight[10][8],
    float bias[10]);

// void max(float input[1][10], int* output);
void max(float arr[1][10], int prediction[1]);
