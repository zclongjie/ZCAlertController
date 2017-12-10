//
//  ZCAlertController.h
//  ZCAlert
//
//  Created by 赵隆杰 on 2017/12/10.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCAlertController : UIViewController

//非输入框，固定按钮字，只有一个确定
+ (void)alertMessage:(NSString *)message succeed:(void(^)(void))succeed;

//非输入框，固定按钮字，确定和取消
+ (void)alertMessage:(NSString *)message confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel;

//非输入框，自定义按钮字，只有一个按钮
+ (void)alertMessage:(NSString *)message succeedText:(NSString *)succeedText succeed:(void(^)(void))succeed;

//非输入框，自定义按钮字，有两个按钮
+ (void)alertMessage:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel;

//输入框，固定按钮字
+ (void)alertTitle:(NSString *)title defaultText:(NSString *)defaultText confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel;

//输入框，自定义按钮字
+ (void)alertTitle:(NSString *)title defaultText:(NSString *)defaultText dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText confirm:(void(^)(void))confirm cancel:(void(^)(void))cancel;

//弹出ScrollView
+ (void)alertScrollTitle:(NSString *)title message:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText confirm:(void(^)(BOOL isDagou))confirm cancel:(void(^)(void))cancel;


@end
