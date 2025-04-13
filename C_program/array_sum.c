
// 数组和运算程序：计算给定数组中所有元素的和
# include <stdio.h>

int main(){
    int arr[] = {1, 2, 3, 4, 5};
    int n = sizeof(arr) / sizeof(arr[0]); // 数组数量=数组总长度/单个数组元素长度
    int sum = 0;

    for (int i = 0; i < n; i++)
        sum += arr[i];
    printf("数组的和为：%d\n", sum);
    return 0;
}