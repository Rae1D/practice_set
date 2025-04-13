
// 数组最大值查找程序：找出给定数组的最大值
# include <stdio.h>

int main(){
    int arr[] = {3, 7, 1, 9, 4};
    int n = sizeof(arr) / sizeof(arr[0]);
    int max = arr[0];

    for (int i = 0; i < n; i++){
        if(arr[i] > max)
            max = arr[i];
    }
    printf("数组中的最大值为：%d\n", max);
    return 0;
}