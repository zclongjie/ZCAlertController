//
//  ZCAlertView.m
//  ZCAlert
//
//  Created by 赵隆杰 on 2017/8/31.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import "ZCAlertView.h"
#import "UIColor+WBTHelper.h"
#import "UIImage+Candy.h"

#define selfWidth 270

#define kTextBlackColor [UIColor wbt_colorWithHexValue:0x000000 alpha:1]
#define kThemeColor [UIColor wbt_colorWithHexValue:0xFED943 alpha:1] //app主题色
#define kThemeLightcolor [UIColor wbt_colorWithHexValue:0xFEEDB5 alpha:1] //app主题浅色
#define kTextDarkgrayColor [UIColor wbt_colorWithHexValue:0x696969 alpha:1] //深灰色文字
#define kLineColor [UIColor wbt_colorWithHexValue:0xcccccc alpha:1] //灰色线

typedef NS_ENUM(NSInteger, ZCAlertStyleType) {
    ZCAlertStyleAlert = 0,
    ZCAlertStyleConfirm = 1,
    ZCAlertStyleInput = 2
};

@interface ZCAlertView()<UITextFieldDelegate>
{
    ZCAlertStyleType alertStyle;
    UITextField *textField;
}

@end

@implementation ZCAlertView

//非输入框，固定按钮字，只有一个确定
- (instancetype)initWithMessageSucceed:(NSString *)message
{
    self = [super init];
    if (self) {
        [self initWithTitle:@"提示" message:message detaultText:@"" dismissText:@"确定" confirmText:@"确定" style:ZCAlertStyleAlert];
    }
    return self;
}
//非输入框，固定按钮字，确定和取消
- (instancetype)initWithMessage:(NSString *)message
{
    self = [super init];
    if (self) {
        [self initWithTitle:@"提示" message:message detaultText:@"" dismissText:@"取消" confirmText:@"确定" style:ZCAlertStyleConfirm];
    }
    return self;
}

//非输入框，自定义按钮字，只有一个按钮
- (instancetype)initWithMessage:(NSString *)message succeedText:(NSString *)succeedText
{
    self = [super init];
    if (self) {
        [self initWithTitle:@"提示" message:message detaultText:@"" dismissText:succeedText confirmText:@"" style:ZCAlertStyleAlert];
    }
    return self;
}
//非输入框，自定义按钮字，有两个按钮
- (instancetype)initWithMessage:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText
{
    self = [super init];
    if (self) {
        [self initWithTitle:@"提示" message:message detaultText:@"" dismissText:dismissText confirmText:confirmText style:ZCAlertStyleConfirm];
    }
    return self;
}

//输入框，固定按钮字
- (instancetype)initWithTitle:(NSString *)title defaultText:(NSString *)defaultText
{
    self = [super init];
    if (self) {
        [self initWithTitle:title message:@"" detaultText:defaultText dismissText:@"取消" confirmText:@"确定"];
    }
    return self;
}

//输入框，自定义按钮字
- (instancetype)initWithTitle:(NSString *)title defaultText:(NSString *)defaultText dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText
{
    self = [super init];
    if (self) {
        [self initWithTitle:title message:@"" detaultText:defaultText dismissText:dismissText confirmText:confirmText];
    }
    return self;
}

- (void)initWithTitle:(NSString *)title message:(NSString *)message detaultText:(NSString *)defaultText dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText
{
    [self initWithTitle:title message:message detaultText:defaultText dismissText:dismissText confirmText:confirmText style:ZCAlertStyleInput];
}

- (void)initWithTitle:(NSString *)title message:(NSString *)message detaultText:(NSString *)defaultText dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText style:(ZCAlertStyleType)style
{
    alertStyle = style;
    CGFloat contentLabelH = 50;
    BOOL isCenter = false;
    if (style != ZCAlertStyleInput) {
        
        CGFloat height = [message boundingRectWithSize:CGSizeMake(selfWidth - 25, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        
        if (height < 30) {
            isCenter = true;
        } else {
            contentLabelH = height + 36;
        }
        
        if (contentLabelH > 228) {
            contentLabelH = 228;
        }
    }
    
    CGRect frame = CGRectMake(0, 0, selfWidth, contentLabelH + 84);
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 6;
    self.frame = frame;
    
    UILabel *topTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, selfWidth, 25)];
    topTitle.text = title;
    topTitle.font = [UIFont systemFontOfSize:18];
    topTitle.textColor = kTextBlackColor;
    topTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:topTitle];
    
    CGFloat lineY;
    if (style != ZCAlertStyleInput) {
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = kTextDarkgrayColor;
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.frame = CGRectMake(15, topTitle.frame.origin.y + topTitle.frame.size.height, selfWidth - 25, contentLabelH);
        contentLabel.text = message;
        contentLabel.textAlignment = isCenter ? NSTextAlignmentCenter : NSTextAlignmentLeft;
        [self addSubview:contentLabel];
        
        lineY = contentLabel.frame.origin.y + contentLabel.frame.size.height;
    } else {
        UIView *textFieldView = [[UIView alloc] initWithFrame:CGRectMake(15, topTitle.frame.origin.y + topTitle.frame.size.height + 10, selfWidth - 30, contentLabelH - 20)];
        textFieldView.layer.borderWidth = 0.5;
        textFieldView.layer.borderColor = kTextDarkgrayColor.CGColor;
        textFieldView.layer.cornerRadius = 3;
        [self addSubview:textFieldView];
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(8, 5, textFieldView.frame.size.width - 16, 20)];
        textField.font = [UIFont systemFontOfSize:14];
        textField.textColor = [UIColor darkTextColor];
        textField.textAlignment = NSTextAlignmentLeft;
        textField.text = defaultText;
        textField.delegate = self;
        [textFieldView addSubview:textField];
        
        lineY = textFieldView.frame.origin.y + textFieldView.frame.size.height + 10;
    }
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, lineY, selfWidth, 0.5)];
    line.backgroundColor = kLineColor;
    [self addSubview:line];
    
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dismissButton addTarget:self action:@selector(dismissButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [dismissButton setTitleColor:kThemeColor forState:UIControlStateNormal];
    [dismissButton setTitle:dismissText forState:UIControlStateNormal];
    [dismissButton setBackgroundImage:[UIImage imageFromColor:kThemeLightcolor] forState:UIControlStateHighlighted];
    [self addSubview:dismissButton];
    
    if (style == ZCAlertStyleAlert) {
        dismissButton.frame = CGRectMake(0, line.frame.origin.y + line.frame.size.height, selfWidth, 44);
        dismissButton.titleLabel.font = [UIFont systemFontOfSize:16];
    } else {
        dismissButton.frame = CGRectMake(0, line.frame.origin.y + line.frame.size.height, selfWidth/2, 44);
        dismissButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth/2, line.frame.origin.y + line.frame.size.height, 0.5, 44)];
        line2.backgroundColor = kLineColor;
        [self addSubview:line2];
        
        UIButton *comfirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        comfirmButton.frame = CGRectMake(selfWidth/2 + 0.5, line.frame.origin.y + line.frame.size.height, selfWidth/2 - 0.5, 44);
        [comfirmButton addTarget:self action:@selector(confirmButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        comfirmButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [comfirmButton setTitleColor:kThemeColor forState:UIControlStateNormal];
        [comfirmButton setTitle:confirmText forState:UIControlStateNormal];
        [comfirmButton setBackgroundImage:[UIImage imageFromColor:kThemeLightcolor] forState:UIControlStateHighlighted];
        [self addSubview:comfirmButton];
        
    }
    
}

- (void)dismissButtonTapped {
    if (self.alertViewBlock != nil) {
        self.alertViewBlock(NO, @"");
    }
}

- (void)confirmButtonTapped {
    if (self.alertViewBlock != nil) {
        if (alertStyle == ZCAlertStyleInput) {
            self.alertViewBlock(YES, textField.text);
        } else {
            self.alertViewBlock(YES, @"");
        }
    }
}

#pragma UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.keyBoardBlock != nil) {
        self.keyBoardBlock(YES);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.keyBoardBlock != nil) {
        self.keyBoardBlock(NO);
    }
}

@end
