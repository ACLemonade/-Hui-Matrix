//
//  main.m
//  回形矩阵
//
//  Created by Lemonade on 16/10/11.
//  Copyright © 2016年 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //回形矩阵思路:从最外圈开始,将每圈的值存入数组,然后逐圈减小,每圈循环
        int n;//多少圈
        int count;//循环多少次
        int i, j;//行、列临时变量
        int t;//存入的数

        while (1) {
            count = 0;
            t = 0;
            int a[20][20];//要存入(输出)的数组
            printf("请输入:");
            scanf("%d", &n);
            count = n/2+1;
            for (i = 0; i < count; i++) {
                //一圈一共四条线,我们的目标:得到四条线的坐标,然后算出四条线的数,并存入数组
                
                //一个小点:奇数圈的时候,最中间的点一下循环执行不到,需要单独处理
                if (i == n-1-i) {
                    a[i][i] = n*n;
                    break;
                }
                
                //第一条线
                for (j = i; j < n-1-i; j++) {
                    t++;
                    a[i][j] = t;
                }
                //第二条线
                for (j = i; j < n-1-i; j++) {
                    t++;
                    a[j][n-1-i] = t;
                }
                //第三条线
                for (j = n-1-i; j > i; j--) {
                    t++;
                    a[n-1-i][j] = t;
                }
                //第四条线
                for (j = n-1-i; j > i; j--) {
                    t++;
                    a[j][i] = t;
                }
                
            }
            for (i = 0; i < n; i++) {
                for (j = 0; j < n; j++) {
                    printf("%2d ", a[i][j]);
                    if ((j+1)%n == 0) {
                        printf("\n");
                    }
                }
            }

        }
            }
    return 0;
}
