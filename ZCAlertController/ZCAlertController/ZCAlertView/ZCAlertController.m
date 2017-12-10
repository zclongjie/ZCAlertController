//
//  ZCAlertController.m
//  ZCAlert
//
//  Created by 赵隆杰 on 2017/12/10.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import "ZCAlertController.h"
#import "ZCAlertTool.h"

@interface ZCAlertController ()

@end

@implementation ZCAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//非输入框，固定按钮字，只有一个确定
+ (void)alertMessage:(NSString *)message succeed:(void(^)(void))succeed
{
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithMessageSucceed:message];
    alertView.alertViewBlock = ^(BOOL isconfirm, NSString *text) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (succeed != nil) {
                succeed();
            }
        }];
    };
    [[ZCAlertTool shared] popView:alertView animated:YES];
}

//非输入框，固定按钮字，确定和取消
+ (void)alertMessage:(NSString *)message confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel
{
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithMessage:message];
    alertView.alertViewBlock = ^(BOOL isconfirm, NSString *text) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (isconfirm) {
                if (confirm != nil) {
                    confirm();
                }
            } else {
                if (cancel != nil) {
                    cancel();
                }
            }
        }];
    };
    [[ZCAlertTool shared] popView:alertView animated:YES];
}

//非输入框，自定义按钮字，只有一个按钮
+ (void)alertMessage:(NSString *)message succeedText:(NSString *)succeedText succeed:(void(^)(void))succeed
{
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithMessage:message succeedText:succeedText];
    alertView.alertViewBlock = ^(BOOL isconfirm, NSString *text) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (succeed != nil) {
                succeed();
            }
        }];
    };
    [[ZCAlertTool shared] popView:alertView animated:YES];
}

//非输入框，自定义按钮字，有两个按钮
+ (void)alertMessage:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel
{
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithMessage:message dismissText:dismissText confirmText:confirmText];
    alertView.alertViewBlock = ^(BOOL isconfirm, NSString *text) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (isconfirm) {
                if (confirm != nil) {
                    confirm();
                }
            } else {
                if (cancel != nil) {
                    cancel();
                }
            }
        }];
    };
    [[ZCAlertTool shared] popView:alertView animated:YES];
}

//输入框，固定按钮字
+ (void)alertTitle:(NSString *)title defaultText:(NSString *)defaultText confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel
{
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithTitle:title defaultText:defaultText];
    alertView.alertViewBlock = ^(BOOL isconfirm, NSString *text) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (isconfirm) {
                if (confirm != nil) {
                    confirm();
                }
            } else {
                if (cancel != nil) {
                    cancel();
                }
            }
        }];
    };
    alertView.keyBoardBlock = ^(BOOL isKeyBoardShow) {
        [[ZCAlertTool shared] keyboard:isKeyBoardShow];
    };
    [[ZCAlertTool shared] popView:alertView animated:YES];
}

//输入框，自定义按钮字
+ (void)alertTitle:(NSString *)title defaultText:(NSString *)defaultText dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel
{
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithTitle:title defaultText:defaultText dismissText:dismissText confirmText:confirmText];
    alertView.alertViewBlock = ^(BOOL isconfirm, NSString *text) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (isconfirm) {
                if (confirm != nil) {
                    confirm();
                }
            } else {
                if (cancel != nil) {
                    cancel();
                }
            }
        }];
    };
    alertView.keyBoardBlock = ^(BOOL isKeyBoardShow) {
        [[ZCAlertTool shared] keyboard:isKeyBoardShow];
    };
    [[ZCAlertTool shared] popView:alertView animated:YES];
}

//弹出ScrollView
+ (void)alertScrollTitle:(NSString *)title message:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText confirm:(void(^)(BOOL isDagou))confirm cancel:(void(^)(void))cancel
{
    ZCAlertScrollView *scrollView = [[ZCAlertScrollView alloc] initWithTitle:title message:message dismissText:dismissText confirmText:confirmText];
    scrollView.scrollViewBlock = ^(BOOL isconfirm, BOOL isDagou) {
        [[ZCAlertTool shared] closeWithAnimated:NO completion:^{
            if (isconfirm) {
                if (confirm != nil) {
                    confirm(isDagou);
                }
            } else {
                if (cancel != nil) {
                    cancel();
                }
            }
        }];
    };
    [[ZCAlertTool shared] popView:scrollView animated:YES];
}


@end
