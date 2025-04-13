
// 菜单驱动程序：提供一个菜单，根据输入执行相应的操作
#include <stdio.h>

int main(){
    int choice;
    printf("1. 加法\n");
    printf("2. 减法\n");
    printf("3. 退出\n");
    printf("请输入1你的选择：");
    scanf("%d", &choice);

    switch (choice){
    case 1:
        printf("你选择了加法。\n");
        break;
    case 2:
        printf("你选择了减法。\n");
        break;  
    case 3:
        printf("退出程序。\n");
        break;
    default:
        printf("无效的选择。\n");
        break;
    }
    return 0;
}