
// 冒泡排序程序：使用冒泡排序算法对数组进行升序排序
#include <stdio.h>
#include <stdbool.h>

void bubbleSort(int arr[], int n){
    int i, j, temp;
    bool swapped;
    for (i = 0; i < n-1; i++){
        swapped = false;
        for (j = 0; j < n-i-1; j++){    // 记住排序次数!
            if(arr[j] > arr[j+1]){
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                swapped = true;
            }
        }
        if (!swapped) break;    // 优化
    }
}


int main(){
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr) / sizeof(arr[0]);
    bubbleSort(arr, n);  
    
    printf("排序后的数组：");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);
    return 0;
}