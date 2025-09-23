#include <math.h>
#include <stdio.h>

void tanh_4
(
    float input[4][26][26],
    float output[4][26][26]
)
{
    // printf("Called tanh_4!\r\n");
    
    for (int out_c = 0; out_c < 4; out_c++) {  // Loop over output channels
        for (int i = 0; i < 26; i++) {
            for (int j = 0; j < 26; j++) {
                output[out_c][i][j] = (float) tanh(input[out_c][i][j]);            
            }
        }
    }
}


#define HEIGHT 26
#define WIDTH 26
#define KERNEL_SIZE 2
#define STRIDE 3

void avgpool_4(float input[4][26][26], float output[4][9][9]) 
{

    // printf("Called avgpool_4!\r\n");

    // Iterate over the batch
    for (int b = 0; b < 4; b++) {
        // Iterate over the output height and width
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                // Calculate the top-left corner of the pooling window
                int start_i = i * STRIDE;
                int start_j = j * STRIDE;

                float sum = 0.0;
                int count = 0;

                // Sum the values within the 2x2 kernel window
                for (int ki = 0; ki < KERNEL_SIZE; ki++) {
                    for (int kj = 0; kj < KERNEL_SIZE; kj++) {
                        // Ensure we don't exceed the input dimensions
                        if (start_i + ki < HEIGHT && start_j + kj < WIDTH) {
                            sum += input[b][start_i + ki][start_j + kj];
                            count++;
                        }
                    }
                }

                // Calculate the average and store in the output
                output[b][i][j] = sum / count;
            }
        }
    }
}

void flatten(float input[4][9][9], float output[1][324]) 
{
    // printf("Called flatten!\r\n");

    int index = 0;
    
    // Iterate through the 3D input tensor and flatten it into a 1D array
    for (int b = 0; b < 4; b++) {
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                output[0][index++] = input[b][i][j];
            }
        }
    }
}

void tanh_1
(
    float input[1][8],
    float output[1][8]
)
{
    // printf("Called tanh_1!\r\n");

    for (int j = 0; j < 8; j++) {
        output[0][j] = (float) tanh(input[0][j]);            
    }
}



void max(float arr[1][10], int prediction[1])
{
    float max_value = -10.0;  // Initialize max_value to the smallest possible integer
    int max_index = -1;       // Variable to store the index of the max value

   for (int i = 0; i < 10; i++)
   {
        if (arr[0][i] > max_value)
            {
            max_value = arr[0][i];
            max_index = i;
            // printf("max_index: %d\r\n", max_index);
            }
}
   prediction[0] = max_index; 
//    printf("prediction[0]:  %d\n", prediction[0]);
}


// void max(float input[1][10], int* output)
// {
//     // printf("Called max!\r\n");
    
//     float max_value = -10.0;  // Initialize max_value to the smallest possible integer
//     int max_index = -1;       // Variable to store the index of the max value

//    for (int i = 0; i < 10; i++)
//    {
//          if (input[0][i] > max_value)
//          {
//             max_value = input[0][i];
//             max_index = i;
//             // printf("max_index: %d\r\n", max_index);
//          }
//    }
//    *output = max_index;
// }

// testing  
// int main()
// {
//     float var = 0.35;
//     float output = (float) tanh(var);   
//     double output2 = tanh(var);   
//     printf("output: %f\r\n", output);         
//     printf("output2: %f\r\n", output2);         
//     return 0; 
// }