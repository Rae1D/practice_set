// Full Conv Model to test SW version
/*
C-implementation (SOFT): 15 marks
10 marks for running on PC (only if it doesn't run on FPGA board).
15 marks for being able to run on the FPGA board, with a convincing demo.

*/
#include <stdio.h>
#include "definitions.h"
#include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\C_Prog\conv.c"
#include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\C_Prog\intermediates.c"
#include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\C_Prog\linear.c"
#include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\Model\test_images_mnist.h"
#include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\Model\test_labels_mnist.h"
#include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\Model\model_weights_and_biases.h"


#include <stdio.h>
#include <stdlib.h>

#define DEBUG_LOGS 0


int main()
{
    
    int prediction[1] = {0};
    int totalTestCases = 100;
    // printf("Actual Label: %d\r\n", testLabels[testCaseNum]);

    int correct = 0; 
    // int testCase = 0; // LABEL = 7

    // PRINT COUNTER
    int print_count = 0; 
    int print_limit = 50; // Set the limit for printing

    
    for (int testCase = 0; testCase < totalTestCases; testCase++)
    {
        printf("Test Case: %d\n", testCase); 

        // Allocate on the heap
        float (*arr_26)[26][26] = malloc(4 * 26 * 26 * sizeof(float));
        float (*arr2_26)[26][26] = malloc(4 * 26 * 26 * sizeof(float));
        float (*arr_9)[9][9] = malloc(4 * 9 * 9 * sizeof(float));
        float (*arr_324)[324] = malloc(1 * 324 * sizeof(float));
        float (*arr_8)[8] = malloc(1 * 8 * sizeof(float));
        float (*arr2_8)[8] = malloc(1 * 8 * sizeof(float));
        float (*output)[10] = malloc(1 * 10 * sizeof(float));
    
        if (!arr_26 || !arr2_26 || !arr_9 || !arr_324 || !arr_8 || !arr2_8 || !output) {
            printf("Memory allocation failed!\n");
            return 1;
        }

        conv2d(testCases[testCase], arr_26, feature_0_weight, feature_0_bias);

        #if DEBUG_LOGS 
          // Print the array
          printf("PRINTING OUTPUT OF conv2d \r\n");
            for (int i = 0; i < 4; i++) {
                printf("Block %d:\n", i);
                for (int j = 0; j < 26; j++) {
                    for (int k = 0; k < 26; k++) {
                        printf("%.4f ", arr_26[i][j][k]);
                    }
                    printf("\n");
                break;

                }
                printf("\n");
            }
        #endif

        tanh_4(arr_26, arr2_26);

        #if DEBUG_LOGS
        // Print the array
        printf("PRINTING OUTPUT OF tanh_4\r\n");
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 26; j++) {
                for (int k = 0; k < 26; k++) {
                    printf("%.4f ", arr2_26[i][j][k]);
                }
                printf("\n");
                break;
            }
            printf("\n");
        }
      #endif

        avgpool_4(arr2_26, arr_9);

        #if DEBUG_LOGS
          // Print the array
          printf("PRINTING OUTPUT OF avgpool_4\r\n");
            for (int i = 0; i < 4; i++) {
                printf("Block %d:\n", i);
                for (int j = 0; j < 9; j++) {
                    for (int k = 0; k < 9; k++) {
                        printf("%.4f ", arr_9[i][j][k]);
                    }
                    printf("\n");
                break;

                }
                printf("\n");
            }
        #endif
        
        flatten(arr_9, arr_324);

        #if DEBUG_LOGS
        // Print the array
        printf("PRINTING OUTPUT OF flatten\r\n");
            for (int j = 0; j < 1; j++) {
                for (int k = 0; k < 324; k++) {
                    printf("%.4f ", arr_324[j][k]);

                    // if (k == print_limit)
                    // {
                    //     break;
                    // }
                }
                printf("\n");

            }
            printf("\n");
        #endif

        linear_8(arr_324, arr_8, classifier_1_weight, classifier_1_bias);

        #if DEBUG_LOGS
        // Print the array
        printf("PRINTING OUTPUT OF linear_8\r\n");
            for (int j = 0; j < 1; j++) {
                for (int k = 0; k < 8; k++) {
                    printf("%.4f ", arr_8[j][k]);

                    // if (k == print_limit)
                    // {
                    //     break;
                    // }
                }
                printf("\n");

            }
            printf("\n");
        #endif

        tanh_1(arr_8, arr2_8);

        #if DEBUG_LOGS
        // Print the array
        printf("PRINTING OUTPUT OF tanh_1\r\n");
            for (int j = 0; j < 1; j++) {
                for (int k = 0; k < 8; k++) {
                    printf("%.4f ", arr2_8[j][k]);

                    // if (k == print_limit)
                    // {
                    //     break;
                    // }
                }
                printf("\n");

            }
            printf("\n");
        #endif


        linear_10(arr2_8, output, classifier_3_weight, classifier_3_bias);

        #if DEBUG_LOGS
        // Print the array
        printf("PRINTING OUTPUT OF linear_10\r\n");
            for (int j = 0; j < 1; j++) {
                for (int k = 0; k < 10; k++) {
                    printf("%.4f ", output[j][k]);

                    // if (k == print_limit)
                    // {
                    //     break;
                    // }
                }
                printf("\n");

            }
            printf("\n");
        #endif

        max(output, prediction);
        
        printf("Prediction: %d\r\n", prediction[0]);
        printf("Actual Label: %d\r\n", testLabels[testCase]);
        printf("------\r\n");
        // Free allocated memory
        free(arr_26);
        free(arr2_26);
        free(arr_9);
        free(arr_324);
        free(arr_8);
        free(arr2_8);
        free(output);

        if (prediction[0] == testLabels[testCase])
        {
            correct++; 
        }
    }
    
    // #pragma HLS ARRAY_PARTITION variable=x1 block factor=4 dim=1
    printf("Accuracy: %f", ((float) correct / totalTestCases) * 100);

    return 0;
}
