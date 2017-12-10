//
//  ZCAlertScrollView.h
//  Sibaios
//
//  Created by 赵隆杰 on 2017/9/21.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZCAlertScrollViewBlock)(BOOL isconfirm,BOOL isDagou);

@interface ZCAlertScrollView : UIView

@property (nonatomic, copy) ZCAlertScrollViewBlock scrollViewBlock;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText;

@end
