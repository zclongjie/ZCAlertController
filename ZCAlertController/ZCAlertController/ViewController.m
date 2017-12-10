//
//  ViewController.m
//  ZCAlertController
//
//  Created by 赵隆杰 on 2017/12/10.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import "ViewController.h"
#import "ZCAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    for (NSInteger i = 0; i < 7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, 50 + 70*i, 200, 50);
        [button setTitle:[NSString stringWithFormat:@"按钮%ld",i] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}


- (void)buttonAction:(UIButton *)button
{
    switch (button.tag) {
        case 0:
        {
            [ZCAlertController alertMessage:@"非输入框，固定按钮字，只有一个确定" succeed:^{
                NSLog(@"非输入框，固定按钮字，点击了确定");
            }];
        }
            break;
        case 1:
        {
            [ZCAlertController alertMessage:@"非输入框，固定按钮字，有确定和取消" confirm:^{
                NSLog(@"非输入框，固定按钮字，点击了确定");
            } cancel:^{
                NSLog(@"非输入框，固定按钮字，点击了取消");
            }];
        }
            break;
        case 2:
        {
            [ZCAlertController alertMessage:@"非输入框，自定义按钮字，只有一个按钮" succeedText:@"按钮" succeed:^{
                NSLog(@"非输入框，自定义按钮字，只有一个按钮，点击了按钮");
            }];
        }
            break;
        case 3:
        {
            [ZCAlertController alertMessage:@"非输入框，自定义按钮字，有两个按钮" dismissText:@"左按钮" confirmText:@"右按钮" confirm:^{
                NSLog(@"非输入框，自定义按钮字，有两个按钮，点击了右按钮");
            } cancel:^{
                NSLog(@"非输入框，自定义按钮字，有两个按钮，点击了左按钮");
            }];
        }
            break;
        case 4:
        {
            [ZCAlertController alertTitle:@"输入框，固定按钮字" defaultText:@"输入框默认字" confirm:^{
                NSLog(@"输入框，固定按钮字，点击了确定");
            } cancel:^{
                NSLog(@"输入框，固定按钮字，点击了取消");
            }];
        }
            break;
        case 5:
        {
            [ZCAlertController alertTitle:@"输入框，自定义按钮字" defaultText:@"输入框默认字" dismissText:@"左按钮" confirmText:@"右按钮" confirm:^{
                NSLog(@"输入框，自定义按钮字，点击了右按钮");
            } cancel:^{
                NSLog(@"输入框，自定义按钮字，点击了左按钮");
            }];
        }
            break;
        case 6:
        {
            [ZCAlertController alertScrollTitle:@"弹出ScrollView" message:@"这是弹出ScrollView的文本部分。\n很长很长\n分段分段\n随意随意\n...\n下面是乱贴的\n\n我们平时的贫穷，那些可以说出的贫穷都不算真正的贫穷。那些你以为限制了我们的想象力的都不算真正的限制了我们的想象力。\n真正限制你想象力的恰恰就是那些你不知道的事情。你从来没有接触过，你从来没有意识过，在你的世界里没有出现过的事情。\n其实，最怕的不是贫穷。是那种贫穷思维。我从小就穷呀，我父母也穷。我从小就是穷的命，以后也就这样了。随随便便就这样过吧。\n这样的思维真的要不得，如果自己都放弃自己，别人更不会正眼看你。我们这个时代的年轻人就是想的太多做的太少，老是想着躺着能挣钱。\n王小波说过：“人的一切痛苦，本质上都是对自己的无能的愤怒。”越是没能力就越是想享受，越是享受不到就越是痛苦。就这样无限重复，循环。\n钱是好东西，谁都喜欢它。那些不爱钱的，是因为他们有钱。在他们眼里他们活着就要改变世界。可是，我们活着就是为了让自己幸福，让自己在乎的人幸福。\n纵然贫穷限制了我们的想象力，也不该是我们颓废的理由。贫穷限制了我们的想象力，却没有限制我们奋斗的能力。\n物质上的缺失纵然让我们难过，可是心灵上的贫瘠才是真正的可怕。我们应该在有限的条件里丰富我们的精神。\n贫穷是一条漫长的河流，努力奋斗才是我们可以依靠到达彼岸的独木舟。" dismissText:@"取消" confirmText:@"确定" confirm:^(BOOL isDagou) {
                if (isDagou) {
                    NSLog(@"弹出ScrollView，勾选并点击了确定");
                } else {
                    NSLog(@"弹出ScrollView，未勾选并点击了确定");
                }
                
            } cancel:^{
                NSLog(@"弹出ScrollView，点击了取消");
            }];
        }
            break;
            
        default:
            break;
    }
    
}

@end
