//
//  ZCAlertTool.h
//  ZCAlert
//
//  Created by 赵隆杰 on 2017/8/31.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCAlertView.h"
#import "ZCAlertScrollView.h"

@interface ZCAlertTool : UIView

//单例方法
+(instancetype _Nullable)shared;

- (void)popView:(UIView *_Nullable)popView animated:(BOOL)animated;
- (void)closeWithAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion;
- (void)keyboard:(BOOL)iskeyboardShow;

@end
