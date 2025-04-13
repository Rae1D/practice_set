
// 打印水仙花数程序：打印所有的三位数水仙花数
// 水仙花数是指一个三位数，其各位数字的立方和等于该数本身。
# include <stdio.h>

int main(){
    int sxhNum, remainder;
    printf("所有的水仙花数有：");

    for (int i = 100; i < 1000; i++){
        sxhNum = i;
        int result = 0;

        while (sxhNum != 0){
            remainder = sxhNum % 10;
            result += remainder * remainder * remainder;
            sxhNum /= 10;
        }
        
        if(result == i)
            printf("%d ", i);
    }
    printf("\n");
    return 0;
}