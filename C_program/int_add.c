
// 整数相加程序：输入两个整数，计算它们的和并输出结果
# include <stdio.h>

int main(){
    int num1, num2, sum;
    printf("请输入两个整数：");
    scanf("%d %d", &num1, &num2); // 获取输入

    sum = num1 + num2;
    printf("两个整数之和为：%d\n", sum);
    return 0;
}