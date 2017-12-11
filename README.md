# ZCAlertController

使用方法：

在需要使用的地方导入头文件 #import "ZCAlertController.h"

然后调用方法，如

[ZCAlertController alertMessage:@"非输入框，固定按钮字，只有一个确定" succeed:^{
                NSLog(@"非输入框，固定按钮字，点击了确定");
            }];
