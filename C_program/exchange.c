
// 交换数字程序：交换输入的两个整数（不使用临时变量）
# include <stdio.h>

int main(){
    int num1, num2;
    printf("请输入两个整数：");
    scanf("%d %d", &num1, &num2);

    num1 = num1 + num2;
    num2 = num1 - num2;
    num1 = num1 - num2;
    printf("交换后的数为：%d, %d\n", num1, num2);
    return 0;
}