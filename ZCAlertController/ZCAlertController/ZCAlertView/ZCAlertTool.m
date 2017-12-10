//
//  ZCAlertTool.m
//  ZCAlert
//
//  Created by 赵隆杰 on 2017/8/31.
//  Copyright © 2017年 赵隆杰. All rights reserved.
//

#import "ZCAlertTool.h"
#import "UIColor+WBTHelper.h"

@interface ZCAlertTool()
{
    UIView *currentView;
    UIView *_popView;
}

@end

@implementation ZCAlertTool
/*
 private var currentView: UIView!
 private var _popView: UIView!
 static let shared = ZCAlertTool()
 
 
 */
//全局变量
static id _instance = nil;
//单例方法
+(instancetype)shared{
    return [[self alloc] init];
}
////alloc会调用allocWithZone:
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//初始化方法
- (instancetype)init{
    // 只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}
//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone{
    return  _instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone{
    return  _instance;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}



- (void)popView:(UIView *)popView animated:(BOOL)animated
{
    UIView *window = [UIApplication sharedApplication].keyWindow;
    
    currentView = [[UIView alloc] initWithFrame:window.bounds];
    popView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    currentView.backgroundColor = [UIColor wbt_colorWithHexValue:0x3a3a3a alpha:0.5];
    [currentView addSubview:popView];
    [window addSubview:currentView];
    _popView = popView;
    
    if (animated) {
        // 将view宽高缩至无限小（点）
        popView.transform = CGAffineTransformMakeScale( CGFLOAT_MIN, CGFLOAT_MIN);
        [UIView animateWithDuration:0.2 animations:^{
            // 以动画的形式将view慢慢放大至原始大小的1.1倍
            popView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            // 以动画的形式将view恢复至原始大小
            [UIView animateWithDuration:0.1 animations:^{
                popView.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

- (void)closeWithAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion
{
    if (animated) {
        [UIView animateWithDuration:0.1 animations:^{
            _popView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                currentView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            } completion:^(BOOL finished) {
                [currentView removeFromSuperview];
                completion();
            }];
        }];
    } else {
        [currentView removeFromSuperview];
        completion();
        
    }
}

- (void)keyboard:(BOOL)iskeyboardShow
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _popView.transform = CGAffineTransformMakeTranslation(0, iskeyboardShow ? -100 : 0);
    } completion:^(BOOL finished) {
        
    }];
}


@end
