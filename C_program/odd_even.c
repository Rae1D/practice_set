
// 判断奇偶程序：判断输入的整数是奇数还是偶数
# include <stdio.h>

int main(){
    int num;
    printf("请输入一个整数：");
    scanf("%d", &num);
    
    if (num % 2 == 0)
        printf("%d 是一个偶数。\n", num);
    else
        printf("%d 是一个奇数。\n", num);
    return 0;
}