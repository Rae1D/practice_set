
// 反转整数程序：将输入的整数反转输出
# include <stdio.h>

int main(){
    int num;
    int reverseNum = 0, remainder;
    printf("请输入一个整数：");
    scanf("%d", &num);

    while (num != 0)
    {
        remainder = num % 10; // 取最后一个数字
        reverseNum = reverseNum * 10 + remainder; // 整体左移+新数字
        num /= 10; // 为取倒数第二个数字做准备
    }

    printf("反转后的整数是：%d\n", reverseNum);
    return 0;
}