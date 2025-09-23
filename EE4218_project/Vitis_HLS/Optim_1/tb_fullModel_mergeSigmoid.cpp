
#include <stdio.h>
#include "..\input_data.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"

/***************** AXIS with TLAST structure declaration *********************/
/*
struct AXIS_wLAST{
	int data;
	bool last;
};
*/
typedef ap_axis<32,0,0,0> AXIS_wLAST;
#define COLS 7

/***************** Coprocessor function declaration *********************/

void fullModel_2_merge(hls::stream<AXIS_wLAST>& S_AXIS, hls::stream<AXIS_wLAST>& M_AXIS);

/***************** Macros *********************/
// #define NUMBER_OF_INPUT_WORDS   // length of an input vector
#define NUMBER_OF_OUTPUT_WORDS 64  // length of an input vector
// #define NUMBER_OF_TEST_VECTORS 64  // number of such test vectors (cases)

int main()
{
    int word_cnt, test_case_cnt = 0;
	int success;
	AXIS_wLAST read_output, write_input;
	hls::stream<AXIS_wLAST> S_AXIS;
	hls::stream<AXIS_wLAST> M_AXIS;

	int sendCounter = 0;
    int returnResMem[64];

	/********************* Send in the Data ***************/
	SendInput:for (int i = 0; i < 64; i++) {
		for (int j = 0; j < 7; j++) {
			write_input.data = inputs[i][j]; // 8-bit unsigned values (0-255)
			write_input.last = 0;
			S_AXIS.write(write_input);
			sendCounter++;
		
		}
	}

	SendHiddenLayer:
	for (int j = 0; j < 2; j++) {
		write_input.data = bias_hidden[j]; // 8-bit unsigned values (0-255)
		write_input.last = 0;
		S_AXIS.write(write_input);
		sendCounter++;

		
	}
	for (int i = 0; i < COLS; i++) {
        for (int j = 0; j < 2; j++) {
			write_input.data = weight_hidden[i][j]; // 8-bit unsigned values (0-255)
			write_input.last = 0;
			S_AXIS.write(write_input);
			sendCounter++;

        }
    }
	SendOutputLayer:
	write_input.data = bias_output[0]; // 8-bit unsigned values (0-255)
	write_input.last = 0;
	S_AXIS.write(write_input);
	sendCounter++;


	for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 1; j++) {
			write_input.data = weight_output[i][j]; // 8-bit unsigned values (0-255)
			write_input.last = 0;
			S_AXIS.write(write_input);
			sendCounter++;

        }
    }

	/********************* Call the hardware function (invoke the co-processor / ip) ***************/

	fullModel_2_merge(S_AXIS, M_AXIS);


	/******************** Output from Coprocessor : Receive the Data Stream ***********************/

	printf(" Receiving data for test case %d ... \r\n", test_case_cnt);

	for (word_cnt=0 ; word_cnt < NUMBER_OF_OUTPUT_WORDS ; word_cnt++){

		read_output = M_AXIS.read(); // extract one word from the stream
        returnResMem[word_cnt] = read_output.data;

		if (word_cnt == NUMBER_OF_OUTPUT_WORDS-1)
		{
			printf("See TLAST: %d\n", read_output.last);
			if (read_output.last != 1)
			{
				printf("FAILURE FOR THE AXIS PROTOCOL \n");
			}
		}
		else {
			printf("Data: %d\n", read_output.data);
			printf("See TLAST: %d\n", read_output.last);
		}
	}

	/* Reception Complete */

	/************************** Checking correctness of results *****************************/


	/* Compare the data send with the data received */
	printf(" Comparing data ...\r\n");
	success = 1;

	for(word_cnt=0; word_cnt < NUMBER_OF_OUTPUT_WORDS; word_cnt++){
		success = success & (returnResMem[word_cnt] == labels[word_cnt]);
        if(returnResMem[word_cnt] != labels[word_cnt])
        {
            printf("case failed: %d\r\n", word_cnt);
            printf("returnResMem[word_cnt]: %d\r\n", returnResMem[word_cnt]);
            printf("labels[word_cnt]: %d\r\n", labels[word_cnt]);
        }
	}

	if (success != 1){
		printf("Test Failed\r\n");
		return 1;
	}

	printf("Test Success\r\n");

	return 0;
}
