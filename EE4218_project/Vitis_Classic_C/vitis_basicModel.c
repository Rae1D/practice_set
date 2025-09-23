/*
----------------------------------------------------------------------------------



----------------------------------------------------------------------------------
*/

/***************************** Include Files *********************************/
#include "xparameters.h"
#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"
#include "xstatus.h"

// For UART
#include "xuartps.h"
#include "xil_printf.h"
#include "stdio.h"

// For timer
#include "xtmrctr.h"

// input data
// #include "C:\Users\ellia\OneDrive\Desktop\ee4218_ay2425s2\Project\Basic\input_data.h"

int labels[64] = {0,1,1,1,0,0,1,1,1,0,0,0,1,1,1,0,1,0,1,0,0,1,1,0,1,1,1,1,0,0,0,0,0,0,1,1,0,1,0,1,0,1,0,0,1,1,1,1,1,0,0,1,1,0,1,0,0,1,0,0,1,0,1,0};

/***************** Macros *********************/
#define NUMBER_OF_INPUT_WORDS 64*7 + 8*2 + 3*1  // length of an input vector (467)
#define NUMBER_OF_OUTPUT_WORDS 64  // length of an input vector
#define NUMBER_OF_TEST_VECTORS 1  // number of such test vectors (cases)


#define TIMEOUT_VALUE 1<<20; // timeout for reception
//#define TIMEOUT_VALUE 1<<10; // INCREASED timeout for reception


#define ROWS 64
#define COLS 7
// interrupt
#define WORD_SIZE 4			/* Size of words in bytes */
#define MAX_PACKET_LEN 4
#define NO_OF_PACKETS 64
#define MAX_DATA_BUFFER_SIZE 6272


// timer
#define TMRCTR_DEVICE_ID	XPAR_TMRCTR_0_DEVICE_ID
#define TIMER_COUNTER_0	 0

// interrupt
#ifdef XPAR_UARTNS550_0_BASEADDR
#include "xuartns550_l.h"       /* to use uartns550 */
#endif

#ifndef SDT
#ifdef XPAR_INTC_0_DEVICE_ID
 #include "xintc.h"
#else
 #include "xscugic.h"
#endif
#endif

#ifdef SDT
#include "xinterrupt_wrap.h"
#endif
/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#ifndef SDT
#define UART_DEVICE_ID                  XPAR_XUARTPS_0_DEVICE_ID
#define FIFO_DEV_ID	   	XPAR_AXI_FIFO_0_DEVICE_ID

#else
#define	XUARTPS_BASEADDRESS		XPAR_XUARTPS_0_BASEADDR
#endif

// for interrupt
#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC_DEVICE_ID          XPAR_INTC_0_DEVICE_ID
#define FIFO_INTR_ID		XPAR_INTC_0_LLFIFO_0_VEC_ID
#else
#define INTC_DEVICE_ID          XPAR_SCUGIC_SINGLE_DEVICE_ID
#define FIFO_INTR_ID            XPAR_FABRIC_LLFIFO_0_VEC_ID
#endif

#ifdef XPAR_INTC_0_DEVICE_ID
 #define INTC           XIntc
 #define INTC_HANDLER   XIntc_InterruptHandler
#else
 #define INTC           XScuGic
 #define INTC_HANDLER   XScuGic_InterruptHandler
#endif
/************************** Function Prototypes ******************************/
#ifndef SDT
int UartInitialize(u16 DeviceId);
#else
int UartInitialize(UINTPTR BaseAddress);
#endif

/************************** Variable Definitions *****************************/
u16 DeviceId = FIFO_DEV_ID;

// 2 FIFOS FOR 2 COPROCESSORS
XLlFifo FifoInstance0; 	// Device instance
XLlFifo *InstancePtr0 = &FifoInstance0; // Device pointer
XLlFifo FifoInstance1;     // Device 1 instance
XLlFifo *InstancePtr1 = &FifoInstance1; // Device 1 pointer

// uart
XUartPs Uart_Ps;		/* The instance of the UART Driver */

// timer
XTmrCtr TimerCounter; /* The instance of the Tmrctr Device */


/*
 * Instance of the Interrupt Controller
 */
#ifndef SDT
static INTC Intc;
#endif


// u32 SourceBuffer[MAX_DATA_BUFFER_SIZE * WORD_SIZE];
// u32 DestinationBuffer[MAX_DATA_BUFFER_SIZE * WORD_SIZE];
u32 DestinationBuffer[64]; // Note: We only use a size of 1 for the data received


#ifndef SDT
int XLlFifoInterruptExample(XLlFifo *InstancePtr, u16 DeviceId);
int SetupInterruptSystem(INTC *IntcInstancePtr, XLlFifo *InstancePtr,
				u16 FifoIntrId);
static void DisableIntrSystem(INTC *IntcInstancePtr, u16 FifoIntrId);
#else
int XLlFifoInterruptExample(XLlFifo *InstancePtr, UINTPTR BaseAddress);
#endif
int TxSend(XLlFifo *InstancePtr, u32 *SourceAddr);
static void FifoHandler(XLlFifo *Fifo);
static void FifoRecvHandler(XLlFifo *Fifo);
static void FifoSendHandler(XLlFifo *Fifo);
static void FifoErrorHandler(XLlFifo *InstancePtr, u32 Pending);

/*
 * Flags interrupt handlers use to notify the application context the events.
 */
volatile int TxDone;
volatile int RxDone; // Flag for receiving
volatile int Error;

/*****************************************************************************/
/**
*
* TxSend routine, It will send the requested amount of data at the
* specified addr.
*
* @param	InstancePtr is a pointer to the instance of the
*		XLlFifo component.
*
* @param	SourceAddr is the address of the memory
*
* @return
*		-XST_SUCCESS to indicate success
*		-XST_FAILURE to indicate failure
*
* @note		None
*
******************************************************************************/
int TxSend(XLlFifo *InstancePtr, u32  *SourceAddr)
{
	int i;
	int j;
	xil_printf("In TxSend: Transmitting Data ... \r\n");

	/* Fill the transmit buffer with incremental pattern */
	for (i=0; i < MAX_DATA_BUFFER_SIZE; i++)
		*(SourceAddr + i) = i;

	for(i=0; i < NO_OF_PACKETS; i++){
		/* Writing into the FIFO Transmit Port Buffer */
		for (j=0; j < MAX_PACKET_LEN; j++){
			if( XLlFifo_iTxVacancy(InstancePtr) ){
				XLlFifo_TxPutWord(InstancePtr,
					*(SourceAddr+(i*MAX_PACKET_LEN)+j));
			}
		}

	}

	/* Start Transmission by writing transmission length into the TLR */
	XLlFifo_iTxSetLen(InstancePtr, (MAX_DATA_BUFFER_SIZE * WORD_SIZE));


	/* Transmission Complete */
	return XST_SUCCESS;
}


/*****************************************************************************/
/**
*
* This is the interrupt handler for the fifo it checks for the type of interrupt
* and proceeds according to it.
*
* @param	InstancePtr is a reference to the Fifo device instance.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void FifoHandler(XLlFifo *InstancePtr)
{
	u32 Pending;

	Pending = XLlFifo_IntPending(InstancePtr);
	while (Pending) {
		if (Pending & XLLF_INT_RC_MASK) {
			FifoRecvHandler(InstancePtr);
			XLlFifo_IntClear(InstancePtr, XLLF_INT_RC_MASK);
			// xil_printf("FifoHandler: RC : Pending: %d\n\r", Pending);

		}
		else if (Pending & XLLF_INT_TC_MASK) {
            // 28 march 2025 11.50pm Basically a print statement here will help the program finish. But why

			// xil_printf("FifoHandler: TC #1 : Pending: %d\n\r", Pending); // If you have reached this, program has already send a transmit req.
			FifoSendHandler(InstancePtr);
			//  xil_printf("FifoHandler: TC (Transmit?) : Pending: %d\n\r", Pending); // If you have reached this, program has already send a transmit req.
            // for (volatile int i = 0; i < 1000; i++); // testing A NOP
            // for (volatile int i = 0; i < 10000; i++);  // a delay (fails)
            // XLlFifo_IntClear(InstancePtr, XLLF_INT_TC_MASK); // uhh test (not this)
            // usleep(10);
            // for (volatile int i = 1341; i > 0; i--);

		}
		else if (Pending & XLLF_INT_ERROR_MASK){
			FifoErrorHandler(InstancePtr, Pending);
            // xil_printf("FifoHandler: ERROR : Pending: %d\n\r", Pending);
			XLlFifo_IntClear(InstancePtr, XLLF_INT_ERROR_MASK);
		} else {
			XLlFifo_IntClear(InstancePtr, Pending);
		}
		Pending = XLlFifo_IntPending(InstancePtr);
		// xil_printf("FifoHandler: Pending: %d\n\r", Pending);
	}
}

/*****************************************************************************/
/**
*
* This is the Receive handler callback function.
*
* @param	InstancePtr is a reference to the Fifo device instance.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void FifoRecvHandler(XLlFifo *InstancePtr) // for E8, expecting the first value to be a code
{
	int i;
	u32 RxWord;
	static u32 ReceiveLength;
    u32 counter = 0;
    int Status;
    u32 loop_counter = 0;

	// xil_printf("FifoRecvHandler: Receiving Data... \n\r");
//	xil_printf("FifoRecvHandler: XLlFifo_iRxOccupancy(InstancePtr) : %d\n\r", XLlFifo_iRxOccupancy(InstancePtr));

	while(XLlFifo_iRxOccupancy(InstancePtr)) {
		/* Read Receive Length */
		loop_counter++;
		ReceiveLength = (XLlFifo_iRxGetLen(InstancePtr))/WORD_SIZE; // expecting 1 or 2 values - if 1 value, no exit taken, if 2, exit taken and given prediction, or at the end

        // #if ENABLE_DEBUG_LOGS
//		xil_printf("ReceiveLength:%d, loop_counter: %d\r\n", ReceiveLength, loop_counter);
		// #endif
        for (i=0; i < ReceiveLength; i++) {
				RxWord = XLlFifo_RxGetWord(InstancePtr);
                // converter2.i = RxWord;
                counter++;

				*(DestinationBuffer + (loop_counter-1)*ReceiveLength + i) = RxWord;

		}
	}
    // converter2.i = DestinationBuffer[0]; // the first value that is returned is the exit code.

	Status = XLlFifo_IsRxDone(InstancePtr); // is this supposed to be here? Idk


    RxDone = 1; // IMPORTANT FLAG
    // xil_printf("RxDone: %d\n\r", RxDone);

}

/*****************************************************************************/
/*
*
* This is the transfer Complete Interrupt handler function.
*
* This clears the transmit complete interrupt and set the done flag.
*
* @param	InstancePtr is a pointer to Instance of AXI FIFO device.
*
* @return	None
*
* @note		None
*
******************************************************************************/
static void FifoSendHandler(XLlFifo *InstancePtr)
{
	XLlFifo_IntClear(InstancePtr, XLLF_INT_TC_MASK);

	TxDone = 1;
}

/*****************************************************************************/
/**
*
* This is the Error handler callback function and this function increments the
* the error counter so that the main thread knows the number of errors.
*
* @param	InstancePtr is a pointer to Instance of AXI FIFO device.
*
* @param	Pending is a bitmask of the pending interrupts.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void FifoErrorHandler(XLlFifo *InstancePtr, u32 Pending)
{
	if (Pending & XLLF_INT_RPURE_MASK) {
		XLlFifo_RxReset(InstancePtr);
	} else if (Pending & XLLF_INT_RPORE_MASK) {
		XLlFifo_RxReset(InstancePtr);
	} else if(Pending & XLLF_INT_RPUE_MASK) {
		XLlFifo_RxReset(InstancePtr);
	} else if (Pending & XLLF_INT_TPOE_MASK) {
		XLlFifo_TxReset(InstancePtr);
	} else if (Pending & XLLF_INT_TSE_MASK) {
	}
	Error++;
}

/****************************************************************************/
/**
*
* This function setups the interrupt system such that interrupts can occur
* for the FIFO device. This function is application specific since the
* actual system may or may not have an interrupt controller. The FIFO
* could be directly connected to a processor without an interrupt controller.
* The user should modify this function to fit the application.
*
* @param    InstancePtr contains a pointer to the instance of the FIFO
*           component which is going to be connected to the interrupt
*           controller.
*
* @return   XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note     None.
*
****************************************************************************/
#ifndef SDT
int SetupInterruptSystem(INTC *IntcInstancePtr, XLlFifo *InstancePtr,
				u16 FifoIntrId)
{

	int Status;

#ifdef XPAR_INTC_0_DEVICE_ID
	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	Status = XIntc_Initialize(IntcInstancePtr, INTC_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Connect a device driver handler that will be called when an interrupt
	 * for the device occurs, the device driver handler performs the
	 * specific interrupt processing for the device.
	 */
	Status = XIntc_Connect(IntcInstancePtr, FifoIntrId,
			   (XInterruptHandler)FifoHandler,
			   (void *)InstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller such that interrupts are enabled for
	 * all devices that cause interrupts, specific real mode so that
	 * the FIFO can cause interrupts through the interrupt controller.
	 */
	Status = XIntc_Start(IntcInstancePtr, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the AXI FIFO device.
	 */
	XIntc_Enable(IntcInstancePtr, FifoIntrId);
#else
	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
				IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, FifoIntrId, 0xA0, 0x3);

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XScuGic_Connect(IntcInstancePtr, FifoIntrId,
				(Xil_InterruptHandler)FifoHandler,
				InstancePtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	XScuGic_Enable(IntcInstancePtr, FifoIntrId);
#endif

	/*
	 * Initialize the exception table.
	 */
	Xil_ExceptionInit();

	/*
	 * Register the interrupt controller handler with the exception table.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
		(Xil_ExceptionHandler)INTC_HANDLER,
		(void *)IntcInstancePtr);;

	/*
	 * Enable exceptions.
	 */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}
/*****************************************************************************/
/**
*
* This function disables the interrupts for the AXI FIFO device.
*
* @param	IntcInstancePtr is the pointer to the INTC component instance
* @param	FifoIntrId is interrupt ID associated for the FIFO component
*
* @return	None
*
* @note		None
*
******************************************************************************/
static void DisableIntrSystem(INTC *IntcInstancePtr, u16 FifoIntrId)
{
#ifdef XPAR_INTC_0_DEVICE_ID
	/* Disconnect the interrupts */
	XIntc_Disconnect(IntcInstancePtr, FifoIntrId);
#else
	XScuGic_Disconnect(IntcInstancePtr, FifoIntrId);
#endif
}
#endif

#ifdef XPAR_UARTNS550_0_BASEADDR
/*****************************************************************************/
/*
*
* Uart16550 setup routine, need to set baudrate to 9600 and data bits to 8
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
static void Uart550_Setup(void)
{

	XUartNs550_SetBaud(XPAR_UARTNS550_0_BASEADDR,
			XPAR_XUARTNS550_CLOCK_HZ, 9600);

	XUartNs550_SetLineControlReg(XPAR_UARTNS550_0_BASEADDR,
			XUN_LCR_8_DATA_BITS);
}
#endif

// --------------------------------- SW VERSION OF MLP -------------------- //
void hidden_layer(
    u32 input[64][7],
    u32 output[64][2],
    u32 weight[7][2],
    u32 bias[2])
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
    u32 input[64][2],
    u32 output[64],
    u32 weight[2][1],
    u32 bias[1])
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
    u32 input[64][2],
    u32 output[64][2])
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


void swModel
(
    u32 input[64][7],
	u32 weight_hidden[7][2],
	u32 bias_hidden[2],
	u32 weight_output[2][1],
	u32 bias_output[1],
    u32 pred[64]
)
{
    int output[64][2];
    int sig_output[64][2];
    // int pred[64];
    hidden_layer(input, output, weight_hidden, bias_hidden);
    sigmoid(output, sig_output);
    output_layer(sig_output, pred, weight_output, bias_output);

    for (int t = 0; t < 64; t++) {
		// xil_printf("%d\n", pred[t]); // basically if >= 39, then 1 else 0
		if(pred[t] > 39) {
			pred[t] = 1;
		} else {
			pred[t] = 0;
		}
    }
}

// --------------------------------- END OF SW VERSION OF MLP -------------------- //
// --------------------------------- START OF HW VERSION OF MLP -------------------- //
// This function sendsd out values to the different coprocessors
void basicModel_HLS_IP(
	u32 input[64][7],
	u32 weight_hidden[7][2],
	u32 bias_hidden[2],
	u32 weight_output[2][1],
	u32 bias_output[1]
)
{
	/*Sends and receives the data*/

	long word_cnt = 0;
	/* Writing into the FIFO Transmit Port Buffer */
	// xil_printf("XLlFifo_iTxVacancy(InstancePtr0) : %d \r\n", XLlFifo_iTxVacancy(InstancePtr0)); // 1020

	while (word_cnt < NUMBER_OF_INPUT_WORDS)
	{
		// Send out input matrix
		for (int i = 0; i < ROWS; i++) {
			for (int j = 0; j < COLS; j++) {
				// If FIFO is free, send the data out
					XLlFifo_TxPutWord(InstancePtr0, input[i][j]);
					word_cnt++;
			}
		}

		// Send out hidden layer
		for (int j = 0; j < 2; j++) {
			XLlFifo_TxPutWord(InstancePtr0, bias_hidden[j]);
			word_cnt++;


		}
		for (int i = 0; i < COLS; i++) {
			for (int j = 0; j < 2; j++) {
				XLlFifo_TxPutWord(InstancePtr0, weight_hidden[i][j]);
				word_cnt++;

			}
		}

		// Send Output layer
		XLlFifo_TxPutWord(InstancePtr0, bias_output[0]);
		word_cnt++;
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < 1; j++) {
				XLlFifo_TxPutWord(InstancePtr0, weight_output[i][j]);
				word_cnt++;
			}
		}
		// xil_printf("word_cnt: %d ... \r\n", word_cnt); // 467
//		xil_printf("XLlFifo_iTxVacancy(InstancePtr0) : %d \r\n", XLlFifo_iTxVacancy(InstancePtr0));

	}


	/* Start Transmission by writing transmission length (number of bytes = 4* number of words) into the TLR */
	XLlFifo_iTxSetLen(InstancePtr0, word_cnt * 4);



	/* Check for Transmission completion */
//	while(!TxDone)
//	{
//		xil_printf("XLlFifo_iTxVacancy(InstancePtr0) : %d \r\n", XLlFifo_iTxVacancy(InstancePtr0));
//		}
//	TxDone = 0;  // Wait for the FifoSendHandler to be called


	/* Transmission Complete */

	/******************** Output from Coprocessor : Receive the Data Stream ***********************/

	// xil_printf(" Receiving data for test case %d ... \r\n", test_case_cnt);

	int timeout_count = TIMEOUT_VALUE;
	// wait for coprocessor to send data, subject to a timeout
	// Use this line for debugging
	//  xil_printf(" XLlFifo_iRxOccupancy(InstancePtr0) %d ... \r\n", XLlFifo_iRxOccupancy(InstancePtr0));
	// while(!XLlFifo_iRxOccupancy(InstancePtr0)) {
	// 	timeout_count--;
	// 	if (timeout_count == 0)
	// 	{
	// 		xil_printf("Timeout while waiting for data ... \r\n");
	// 		return XST_FAILURE;
	// 	}
	// }
	while(!RxDone) // wait to receive data
	{
//		 xil_printf("Have Not Received Data!\n\r");
	}
	RxDone = 0;

}

// void basicModel_RTL_IP()
// {

// }

// --------------------------------- END OF HW VERSION OF MLP -------------------- //
// UART

#ifndef SDT
int UartInitialize(u16 DeviceId)
#else
int Uartinitalize(UINTPTR BaseAddress)
#endif
{
	u8 HelloWorld[] = "Hello World\n";
	int SentCount = 0;
	int Status;
	XUartPs_Config *Config;

	/*
	 * Initialize the UART driver so that it's ready to use
	 * Look up the configuration in the config table and then initialize it.
	 */
#ifndef SDT
	Config = XUartPs_LookupConfig(DeviceId);
#else
	Config = XUartPs_LookupConfig(BaseAddress);
#endif
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XUartPs_SetBaudRate(&Uart_Ps, 115200);

	// ORIGINAL HELLO WORLD MSG SENT OUT //
	while (SentCount < (sizeof(HelloWorld) -1)) { // -1 to avoid printing the null byte at the end of the string
		/* Transmit the data */
		SentCount += XUartPs_Send(&Uart_Ps,
					   &HelloWorld[SentCount], 1);
	}
	return SentCount;
}

/*****************************************************************************
* Main function
******************************************************************************/
int main()
{
	int Status_Uart;
	int Status_Timer;
	int Status = XST_SUCCESS;
	long word_cnt = 0;
	int test_case_cnt = 0;
	// int success;
	u8 buf[1];
	u8 data_out = 0;
	u8 length_out = 0;
	u8 temp_out = 0;
	u8 value_out[3];
	u8 endbytes[] = "\n";

	/************************** Initializations of Uart *****************************/
	#ifndef SDT
		Status_Uart = UartInitialize(UART_DEVICE_ID);
	#else
		Status = UartInitialize(XUARTPS_BASEADDRESS);
	#endif
		if (Status_Uart == XST_FAILURE) {
			xil_printf("Uartps hello world Example Failed\r\n");
			return XST_FAILURE;
		}


	/************************** Initializations of Timer  *****************************/
	XTmrCtr *TmrCtrInstancePtr0 = &TimerCounter;
	u8 TmrCtrNumber = TIMER_COUNTER_0;

	/*
	* Initialize the timer counter so that it's ready to use,
	* specify the device ID that is generated in xparameters.h
	*/
	#ifndef SDT
	Status_Timer = XTmrCtr_Initialize(TmrCtrInstancePtr0, TMRCTR_DEVICE_ID);
	#else
	Status_Timer = XTmrCtr_Initialize(TmrCtrInstancePtr0, BaseAddr);
	#endif
		if (Status_Timer != XST_SUCCESS) {
			return XST_FAILURE;
		}

		/*
		* Perform a self-test to ensure that the hardware was built
		* correctly, use the 1st timer in the device (0)
		*/
		Status_Timer = XTmrCtr_SelfTest(TmrCtrInstancePtr0, TmrCtrNumber);
		if (Status_Timer != XST_SUCCESS) {
			return XST_FAILURE;
		}

		// Not sure if we need the XTmrCtr_SetOptions() function but the timer works without it so I am removing it for now
		XTmrCtr_SetOptions(TmrCtrInstancePtr0, TmrCtrNumber, // I don't know what this does. It doesn't seem to affect the timer function
			XTC_AUTO_RELOAD_OPTION);

		// Reset to 0 after each section timed
		XTmrCtr_SetResetValue(TmrCtrInstancePtr0, TmrCtrNumber, 0);


		if (Status_Timer == XST_FAILURE) {
			xil_printf("Timer Failed\r\n");
			return XST_FAILURE;
		}

	/************************** Initializations - FIFO *****************************/
	XLlFifo_Config *Config; // reuse for both FIFOs
    int Status0 = XST_SUCCESS; // can also use just a single status variable.
    int Status1 = XST_SUCCESS;

	/* Initialize the Device Configuration Interface driver */
	Config = XLlFfio_LookupConfig(DeviceId);
	if (!Config) {
		xil_printf("No config found for %d\r\n", DeviceId);
		return XST_FAILURE;
	}

	Status0 = XLlFifo_CfgInitialize(InstancePtr0, Config, Config->BaseAddress);
	if (Status0 != XST_SUCCESS) {
		xil_printf("Initialization failed\r\n");
		return XST_FAILURE;
	}

    Status1 = XLlFifo_CfgInitialize(InstancePtr1, Config, Config->BaseAddress);
    if (Status1 != XST_SUCCESS) {
        xil_printf("Initialization failed\r\n");
        return XST_FAILURE;
    }


	/* Check for the Reset value */
	Status0 = XLlFifo_Status(InstancePtr0);
	XLlFifo_IntClear(InstancePtr0,0xffffffff);
	Status0 = XLlFifo_Status(InstancePtr0);
	if(Status0 != 0x0) {
		xil_printf("\n ERROR : Reset value of ISR0 : 0x%x\t. Expected : 0x0\r\n",
			    XLlFifo_Status(InstancePtr0));
		return XST_FAILURE;
	}

    /* Check for the Reset value */
	Status1 = XLlFifo_Status(InstancePtr1);
	XLlFifo_IntClear(InstancePtr1,0xffffffff);
	Status1 = XLlFifo_Status(InstancePtr1);
	if(Status1 != 0x0) {
		xil_printf("\n ERROR : Reset value of ISR0 : 0x%x\t. Expected : 0x0\r\n",
			    XLlFifo_Status(InstancePtr1));
		return XST_FAILURE;
	}

	 /******************** Connect AXI Stream FIFO interrupt ***********************/
    /*
	 * Connect the Axi Streaming FIFO to the interrupt subsystem such
	 * that interrupts can occur. This function is application specific.
	 */
    #ifndef SDT
	Status = SetupInterruptSystem(&Intc, InstancePtr0, FIFO_INTR_ID);
    #else
	Status = XSetupInterruptSystem(InstancePtr, &FifoHandler,
			               InstancePtr->IntId,
				       InstancePtr->IntrParent,
				       XINTERRUPT_DEFAULT_PRIORITY);
    #endif
	if (Status != XST_SUCCESS) {
		xil_printf("Failed intr setup\r\n");
		return XST_FAILURE;
	}
	 XLlFifo_IntEnable(InstancePtr0, XLLF_INT_ALL_MASK); // enables all the interrupts
//	XLlFifo_IntEnable(InstancePtr, XLLF_INT_RC_MASK); // rcv complete interrupt
	TxDone = 0;
    RxDone = 0;


    /************************** Start the Tests *****************************/
    xil_printf("Starting the tests ...\r\n");
    u32 start_recv_uart = 0;
	u32 end_recv_uart = 0;
	u32 start_time = 0;
	u32 end_time = 0;

    // SW Version of MLP
    u32 average_time = 0; // Use to track average time
	u32 sum = 0;
	u32 loop_count = 100;
    // u32 pred[64] = {0}; // prediction array

    // Receive Data from UART
	xil_printf(" Transmitting Data for test case %d ... \r\n", test_case_cnt);

	// Filling the matrix
	u32 input[64][7]; // one test input first
    u32 output[64][2];
    u32 sig_output[64][2];
    u32 pred[64];

	u32 bias_hidden[2];
	u32 weight_hidden[7][2];
	u32 bias_output[1];
	u32 weight_output[2][1];



	int input_cols = 0;
	int input_rows = 0;
	int hidden_weights_cols = 0;
	int hidden_weights_rows = 0;

	while (word_cnt < NUMBER_OF_INPUT_WORDS)
	{
		if (scanf("%u,", &buf[0]) != 1) {
			xil_printf("Invalid input!\n");
			return 1;
		}
		else
		{
			if(word_cnt < ROWS*COLS) // FILL UP INPUT MATRIX
			{
				if (input_cols== COLS) // End of row
					{
						input_cols = 0;
						input_rows++;
					}
					// xil_printf("buf[0]: %d\r\n", buf[0]);
					input[input_rows][input_cols]= buf[0];
					// xil_printf("Input[%d][%d]: %d\r\n", input_rows, input_cols, input[input_rows][input_cols]);
					input_cols++;
					word_cnt++;
			}
			else if(word_cnt < ROWS*COLS + 2) // FILL UP HIDDEN BIAS
			{

				bias_hidden[word_cnt - ROWS*COLS] = buf[0];
				word_cnt++;
			}
			else if(word_cnt < ROWS*COLS + 2 + 7*2) // FILL UP HIDDEN WEIGHTS
			{
				if(hidden_weights_cols == 2) // End of row
					{
						hidden_weights_cols = 0;
						hidden_weights_rows++;
					}
					weight_hidden[hidden_weights_rows][hidden_weights_cols] = buf[0];
					hidden_weights_cols++;
					word_cnt++;
			}
			else if (word_cnt < ROWS*COLS + 2 + 7*2 + 1) // FILL UP OUTPUT BIAS
			{
				bias_output[word_cnt - ROWS*COLS - 2 - 7*2] = buf[0];
				word_cnt++;
			}
			else if (word_cnt < ROWS*COLS + 2 + 7*2 + 1 + 2)  // FILL UP OUTPUT WEIGHTS
			{
				weight_output[word_cnt - ROWS*COLS - 2 - 7*2 - 1][0] = buf[0];
				word_cnt++;
			}
			else
			{
				xil_printf("Invalid input!\n");
				return 1;
			}
		} // else

	} // while
	xil_printf("word_cnt: %d!\n", word_cnt);

	// Checking the values received
	// for (int i = 0; i < ROWS; i++) {
	// 	for (int j = 0; j < COLS; j++) {
	// 		xil_printf("Input[%d][%d]: %d\r\n", i, j, input[i][j]);
	// 	}
	// }

	// Checking the values received
	// for (int i = 0; i < ROWS; i++) {
	// 	for (int j = 0; j < COLS; j++) {
	// 		xil_printf("Input[%d][%d]: %d\r\n", i, j, input[i][j]);
	// 	}
	// }
	// for (int i = 0; i < 2; i++) {
	// 	xil_printf("Bias_hidden[%d]: %d\r\n", i, bias_hidden[i]);
	// }
	// for (int i = 0; i < 7; i++) {
	// 	for (int j = 0; j < 2; j++) {
	// 		xil_printf("Weight_hidden[%d][%d]: %d\r\n", i, j, weight_hidden[i][j]);
	// 	}
	// }
	// for (int i = 0; i < 1; i++) {
	// 	xil_printf("Bias_output[%d]: %d\r\n", i, bias_output[i]);
	// }
	// for (int i = 0; i < 1; i++) {
	// 	for (int j = 0; j < 2; j++) {
	// 		xil_printf("Weight_output[%d][%d]: %d\r\n", i, j, weight_output[i][j]);
	// 	}
	// }


	// SW Timed Section -----------------------------------------------------------------------
    sum = 0;
	for (int i = 0; i < loop_count; i++) // find average time
	{
		start_time = XTmrCtr_GetValue(TmrCtrInstancePtr0, TmrCtrNumber);
		XTmrCtr_Start(TmrCtrInstancePtr0, TmrCtrNumber);
		swModel(input, weight_hidden, bias_hidden, weight_output, bias_output, pred); // Call the SW model of MLP

		// Stop Timer
		end_time = XTmrCtr_GetValue(TmrCtrInstancePtr0, TmrCtrNumber);
		XTmrCtr_Stop(TmrCtrInstancePtr0, TmrCtrNumber);
		sum += end_time-start_time;

		// Reset to 0
		XTmrCtr_Reset(TmrCtrInstancePtr0, TmrCtrNumber);
	}
	average_time = sum / loop_count;
	int correct = 1;
    // Print logs
	xil_printf("Average Time taken for MLP in SW: %d\r\n", average_time);
    for (int i = 0; i < 64; i++) {
        if (pred[i] == labels[i]) {
        	correct = correct & 1;
        }
        else
        {
            // xil_printf("Predicted value for test case %d: %d\r\n", i, pred[i]);
            // xil_printf("label: %d: \r\n", labels[i]);
            correct = correct & 0;
        }
    }
	// // HW HLS Timed Section ---------------------------------------------------------------------------------------
	u32 ReceiveLength = 0;
    sum = 0;
	for (int i = 0; i < loop_count; i++) // find average time
	{
		average_time = 0; // Reset to 0

		start_time = XTmrCtr_GetValue(TmrCtrInstancePtr0, TmrCtrNumber);
		XTmrCtr_Start(TmrCtrInstancePtr0, TmrCtrNumber);
		basicModel_HLS_IP(input, weight_hidden, bias_hidden, weight_output, bias_output); // Call the SW model of MLP

		// Stop Timer
		end_time = XTmrCtr_GetValue(TmrCtrInstancePtr0, TmrCtrNumber);
		XTmrCtr_Stop(TmrCtrInstancePtr0, TmrCtrNumber);

		sum += end_time-start_time;

		// Reset to 0
		XTmrCtr_Reset(TmrCtrInstancePtr0, TmrCtrNumber);

//		ReceiveLength = XLlFifo_iRxGetLen(InstancePtr0)/4;

		// fake read out to clear
		// if (i != loop_count-1) // read out all except the last data packet
		// {
		// 	for (int j=0; j<64; j++)
		// 	{
		// 		data_out = DestinationBuffer[j];
		// 	}
		// }
	} // loop for average time
	average_time = sum / loop_count;
	for (int j=0; j<64; j++)
	{
		data_out = DestinationBuffer[j];

		if (data_out != labels[j])
		{
			xil_printf("FAIL at case: %d. Predicted: %d\r\n", j, data_out);
		}
		else
		{
			xil_printf("%d \r\n", data_out);
		}

	}
	xil_printf("Average Time taken for MLP in HW HLS: %d\r\n", average_time);

	// ReceiveLength = XLlFifo_iRxGetLen(InstancePtr0)/4;
	//  // *************Sending out the data to UART *************
	//  for (word_cnt=0; word_cnt < ReceiveLength; word_cnt++) {
	// 	// read one word at a time
	// 	// result_memory[word_cnt+test_case_cnt*NUMBER_OF_OUTPUT_WORDS] = XLlFifo_RxGetWord(InstancePtr0);
	// 	// RES[word_cnt+test_case_cnt*NUMBER_OF_OUTPUT_WORDS] = XLlFifo_RxGetWord(InstancePtr0);
	// 	data_out = XLlFifo_RxGetWord(InstancePtr0);
	// 	pred[word_cnt] = data_out; // save into matrix for comparison

	// 	// xil_printf("Data out :%u\r\n", data_out);

	// 	temp_out = data_out;
	// 	length_out = 0;

	// 	// corner case: matrix value = 0
	// 	if (temp_out == 0)
	// 	{
	// 		fputc((temp_out+'0'), stdout);
	// 	}
	// 	// find the length of the final string
	// 	while (temp_out > 0)
	// 	{
	// 		length_out++;
	// 		temp_out /= 10;
	// 	}
	// 	for (int k = 0; k < length_out; k++)
	// 	{
	// 		value_out[k] = (data_out % 10) + '0'; // value_out = ['0', '6', '1']
	// 		data_out /= 10;
	// 	}
	// 	for (int k = length_out-1; k >= 0; k--) // send in reverse to send out 1,6,0
	// 	{
	// 		fputc(value_out[k], stdout);
	// 	}
	// 		fputc(endbytes[0], stdout);
	// }

	// Status = XLlFifo_IsRxDone(InstancePtr0);
	// if(Status != TRUE){
	// 	xil_printf("Failing in receive complete ... \r\n");
	// 	return XST_FAILURE;
	// }

 // Disable at the end
 #ifndef SDT
 DisableIntrSystem(&Intc, FIFO_INTR_ID);
#endif



    if (correct)
    {
    	 xil_printf("SUCCESS\r\n");
    	 return XST_SUCCESS;
    }
    else
    {
    	xil_printf("FAIL\r\n");
    	return XST_FAILURE;
    }




} // MAIN
