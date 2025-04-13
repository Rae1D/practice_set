
// 幂运算程序：计算输入的底数的指定指数次幂
# include <stdio.h>

int main(){
    int base, exponent; // 底数 & 指数
    long long result = 1;
    printf("请输入底数和指数：");
    scanf("%d %d", &base, &exponent);

    for (int i = 0; i < exponent; i++){
        result *= base;
    }
    printf("%d 的 %d 次幂为：%d", base, exponent, result);
    return 0;
}