
// 二分法查找程序：在有序数组中使用二分查找算法查找特定元素
#include <stdio.h>

int binarySearch(int arr[], int left, int right, int target){
    while (left <= right){
        int mid = left + (right - left) / 2;

        if(arr[mid] == target)
            return mid;
        else if (arr[mid] < target)
            left = mid + 1;
        else
            right = mid - 1;
    }
    return -1;
}

int main(){
    int arr[] = {1, 2, 3, 4, 5};
    int n = sizeof(arr) / sizeof(arr[0]);
    int target = 1;

    int result = binarySearch(arr, 0, n-1, target);
    if(result == -1)
        printf("元素未找到\n");
    else
        printf("元素在索引 %d 处\n", result);

    return 0;
}