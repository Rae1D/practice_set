
// 字符串复制程序：将一个字符串复制到另一个字符串
# include <stdio.h>

int main(){
    char source[] = "Hello";
    char destination[10];
    int i = 0;
    
    while(source[i] != '\0'){
        destination[i] = source[i];
        i++;
    }
    destination[i] = '\0';
    printf("复制后的字符串为：%s\n", destination);
    return 0;
}