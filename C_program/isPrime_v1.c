
// 判断质数程序：输入一个范围，输出该范围内的所有质数
# include <stdio.h>
# include <stdbool.h>

// 判断一个数是否为质数
bool isPrime(int num){
    if (num <= 1)
        return false;
    for (int i=2; i*i<=num; i++){
        if(num % i == 0)
            return false;
    }
    return true;
}


int main(){
    int lower, upper;
    printf("请输入范围的上下限：");
    scanf("%d %d", &lower, &upper);

    printf("%d 到 %d 之间的素数有：", lower, upper);
    for(int i = lower; i <= upper; i++){
        if(isPrime(i))
            printf("%d ", i);
    }
    printf("\n");
    return 0;
}