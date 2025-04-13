
// 斐波那契数列程序：根据输入的项数，输出相应长度的斐波那契数列
# include <stdio.h>

int main(){
    int num;
    int t1 = 0, t2 = 1; // 斐波那契数列前两项
    int nextTerm; // 计算下一项
    printf("请输入要输出的斐波那契数列的项数：");
    scanf("%d", &num);

    printf("斐波那契数列：%d, %d", t1, t2);
    for (int i = 3; i <= num; i++){
        nextTerm = t1 + t2;
        printf(", %d", nextTerm);
        t1 = t2;
        t2 = nextTerm;
    }
    
    return 0;
}