
// 字符串复制程序：将一个字符串复制到另一个字符串
# include <stdio.h>

int main(){
    char str1[20] = "Hello";
    char str2[] = "World";
    int i = 0, j = 0;
    
    while (str1[i] != '\0')
    {
        i++;
    }
    while (str2[j] != '\0')
    {
        str1[i] = str2[j];
        i++;
        j++;
    }
    str1[i] = '\0';
    printf("复制后的字符串为：%s\n", str1);
    return 0;
}