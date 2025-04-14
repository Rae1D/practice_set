
// 字符串统计程序：统计输入字符串中每个字符出现的次数，并输出结果
#include <stdio.h>
#include <string.h>

void countChars(char str[]){
    int count[256] = {0};
    int i;

    for(i=0; i<strlen(str); i++)
        count[(int)str[i]]++;
    
    for(i=0; i<256; i++){
        if(count[i]>0)
            printf("字符 %c 出现了 %d 次。\n", i, count[i]);
    }
}

int main(){
    char str[] = "hello world";
    countChars(str);

    return 0;
}