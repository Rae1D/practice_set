#include <stdio.h>


void outmex(int n, int arr[]){
    int i, j;
    for (i=0; i<n; i++){
        if (i==n-1)
        printf("0");
        else{
            int mex=0;
            while(1){
                int same = 0;
                for (j=i; j<n; j++)
                {
                    if(arr[j]==mex) same++;
                }
                if (same == 0) break;
                mex++;
            }
            printf("%d ", mex);
        }
    }
}


int main() {
    
    /*int num;
    scanf("%d", &num);

    int arr[num];
    for(int i=0; i<num; i++){
        scanf("%d", &arr[i]);
    }*/
    
    int num =5;
    int arr[] = {3,2,1,0,5};

    outmex(num, arr);
    return 0;
}