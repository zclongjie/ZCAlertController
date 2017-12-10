//
//  ZCAlertView.h
//  ZCAlert
//
//  Created by 赵隆杰 on 2017/8/31.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZCAlertViewBlock)(BOOL isconfirm,NSString *text);
typedef void(^ZCAlertViewKeyBoardBlock)(BOOL isKeyBoardShow);

@interface ZCAlertView : UIView

@property (nonatomic, copy) ZCAlertViewBlock alertViewBlock;
@property (nonatomic, copy) ZCAlertViewKeyBoardBlock keyBoardBlock;

//非输入框，固定按钮字，只有一个确定
- (instancetype)initWithMessageSucceed:(NSString *)message;

//非输入框，固定按钮字，确定和取消
- (instancetype)initWithMessage:(NSString *)message;

//非输入框，自定义按钮字，只有一个按钮
- (instancetype)initWithMessage:(NSString *)message succeedText:(NSString *)succeedText;

//非输入框，自定义按钮字，有两个按钮
- (instancetype)initWithMessage:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText;

//输入框，固定按钮字
- (instancetype)initWithTitle:(NSString *)title defaultText:(NSString *)defaultText;

//输入框，自定义按钮字
- (instancetype)initWithTitle:(NSString *)title defaultText:(NSString *)defaultText dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText;

@end
