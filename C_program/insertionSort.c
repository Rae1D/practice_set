
// 插入排序程序：将未排序元素插入到已排序序列的合适位置
# include <stdio.h>

void insertionSort(int arr[], int n){
    int i, j, temp;
    for (i = 1; i < n; i++){
        temp = arr[i];
        j = i - 1;
        
        while(j >= 0 && arr[j] > temp){
            arr[j + 1] = arr[j];
            j -= 1;
        }
        arr[j+1] = temp;
    }
}


int main(){
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr) / sizeof(arr[0]);
    insertionSort(arr, n);  
    
    printf("排序后的数组：");
    for(int i=0; i<n; i++)
        printf("%d ", arr[i]);
    return 0;
}