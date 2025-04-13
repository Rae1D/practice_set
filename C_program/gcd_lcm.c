
// 最大公约数&最小公倍数程序：根据输入的两个整数，计算并输出两个数的最大公约数和最小公倍数
# include <stdio.h>

// 求最大公约数:辗转相除法（欧几里得算法）
int gcd(int a, int b){
    while (b != 0){
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// 求最小公倍数:两数之积除以最大公约数
int lcm(int a, int b){
    return (a / gcd(a, b)) * b;
}


int main(){
    int num1, num2;
    printf("请输入两个整数：");
    scanf("%d %d", &num1, &num2);

    int greatestCommonDivisor = gcd(num1, num2);
    int leastCommonMultiple = lcm(num1, num2);
    
    printf("最大公约数是：%d\n", greatestCommonDivisor);
    printf("最小公倍数是：%d\n", leastCommonMultiple);
    return 0;
}