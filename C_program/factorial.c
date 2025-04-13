
// 阶乘运算程序：计算输入的非负整数的阶乘
# include <stdio.h>

int factorial(int n){
    if (n == 0 || n == 1)
        return 1;
    else
        return n * factorial(n-1);
}

int main(){
    int num;
    // unsigned long long factorial_num = 1;
    printf("请输入一个整数：");
    scanf("%d", &num);
    
    if (num < 0)
        printf("负数没有阶乘。\n");
    else {
        // for (int i = 2; i <= num; i++)
        //     factorial_num *= i;
        printf("%d 的阶乘是 %d。\n", num, factorial(num));
    }
    return 0;
}