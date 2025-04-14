
// 判断回文数程序：判断输入的整数是否为回文数
#include <stdio.h>
#include <stdbool.h>

bool isPalindrome(int num){
    int oriNum = num;
    int revNum = 0;

    while(num != 0){
        revNum = revNum * 10 + num % 10;
        num /= 10;
    }
    return oriNum == revNum;
}



int main(){
    int num = 121;
    if(isPalindrome(num))
        printf("%d 是回文数。\n", num);
    else
        printf("%d 不是回文数。\n", num);
    return 0;
}