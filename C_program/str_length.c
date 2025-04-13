
// 字符串长度程序：计算给定字符串的长度
# include <stdio.h>

int main(){
    char str[] = "Hello";
    int length = 0;
    while (str[length] != '\0') //字符串结尾为\0
    {
        length++;
    }
    
    printf("字符串的长度为：%d\n", length);
    return 0;
}