
// 杨辉三角形程序：打印出指定行数的杨辉三角形
// 杨辉三角形的特点：每个数等于它上方两个数之和，每行首尾数字为1
#include <stdio.h>

#define SIZE 10

int main(){
    int triangle[SIZE][SIZE];

    for(int i = 0; i < SIZE; i++){
        for(int j = 0; j <= i; j++){    // 一行一个，两行两个，...
            if(j == 0 || j == i)
                triangle[i][j] = 1;
            else
                triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j];
        }
    }

    for(int i = 0; i < SIZE; i++){
        // for(int j = 0; j < SIZE - i; j++)
        //     printf("      ");
        for(int j = 0; j <= i; j++)
            printf("%6d", triangle[i][j]);
        printf("\n");
    }
    return 0;
}