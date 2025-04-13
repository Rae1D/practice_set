
// 选择排序程序：使用选择排序算法对数组进行升序排序
# include <stdio.h>

void selectionSort(int arr[], int n){
    int i, j, temp;
    int min_idx;
    for (i = 0; i < n-1; i++){
        min_idx = i;
        for (j = i+1; j < n; j++){    // 记住排序次数!
            if(arr[j] < arr[min_idx]){
                min_idx = j;
            }
        }
        temp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = temp;
    }
}


int main(){
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr) / sizeof(arr[0]);
    selectionSort(arr, n);  
    
    printf("排序后的数组：");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);
    return 0;
}