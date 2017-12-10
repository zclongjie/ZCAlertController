//
//  ZCAlertScrollView.m
//  Sibaios
//
//  Created by 赵隆杰 on 2017/9/21.
//  Copyright © 2017年 shaolin. All rights reserved.
//

#import "ZCAlertScrollView.h"

#import "UIColor+WBTHelper.h"
#import "UIImage+Candy.h"

#define K_SCREEN_W  [[UIScreen mainScreen] bounds].size.width
#define K_SCREEN_H [[UIScreen mainScreen] bounds].size.height

#define kTextBlackColor [UIColor wbt_colorWithHexValue:0x000000 alpha:1]
#define kThemeColor [UIColor wbt_colorWithHexValue:0xFED943 alpha:1] //app主题色
#define kThemeLightcolor [UIColor wbt_colorWithHexValue:0xFEEDB5 alpha:1] //app主题浅色
#define kTextDarkgrayColor [UIColor wbt_colorWithHexValue:0x696969 alpha:1] //深灰色文字
#define kLineColor [UIColor wbt_colorWithHexValue:0xcccccc alpha:1] //灰色线

@interface ZCAlertScrollView()
{
    BOOL isdaGou;
}

@end

@implementation ZCAlertScrollView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message dismissText:(NSString *)dismissText confirmText:(NSString *)confirmText
{
    self = [super init];
    if (self) {
        CGFloat frameW = 345*(K_SCREEN_W/375);
        CGFloat frameH = 444*(K_SCREEN_W/375);
        
        CGRect frame = CGRectMake(0, 0, frameW, frameH);
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6;
        self.frame = frame;
        
        UILabel *topTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, frameW, 25)];
        topTitle.text = title;
        topTitle.font = [UIFont systemFontOfSize:18];
        topTitle.textColor = kTextBlackColor;
        topTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:topTitle];
        
        UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [dismissButton addTarget:self action:@selector(dismissButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [dismissButton setTitleColor:kTextDarkgrayColor forState:UIControlStateNormal];
        [dismissButton setTitle:dismissText forState:UIControlStateNormal];
        [dismissButton setBackgroundImage:[UIImage imageFromColor:kThemeLightcolor] forState:UIControlStateHighlighted];
        [self addSubview:dismissButton];
        
        dismissButton.frame = CGRectMake(0, frameH - 44, frameW/2, 44);
        dismissButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(frameW/2, dismissButton.frame.origin.y, 0.5, 44)];
        line2.backgroundColor = kLineColor;
        [self addSubview:line2];
        
        UIButton *comfirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        comfirmButton.frame = CGRectMake(frameW/2 + 0.5, dismissButton.frame.origin.y, frameW/2 - 0.5, 44);
        [comfirmButton addTarget:self action:@selector(confirmButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        comfirmButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [comfirmButton setTitleColor:kThemeColor forState:UIControlStateNormal];
        [comfirmButton setTitle:confirmText forState:UIControlStateNormal];
        [comfirmButton setBackgroundImage:[UIImage imageFromColor:kThemeLightcolor] forState:UIControlStateHighlighted];
        [self addSubview:comfirmButton];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, dismissButton.frame.origin.y, frameW, 0.5)];
        line.backgroundColor = kLineColor;
        [self addSubview:line];
        
        isdaGou = YES;
        UIImageView *gouImage = [[UIImageView alloc] initWithFrame:CGRectMake(3, line.frame.origin.y - 40, 40, 40)];
        gouImage.image = [UIImage imageNamed:@"dagou_selected"];
        gouImage.contentMode = UIViewContentModeCenter;
        gouImage.tag = 100;
        [self addSubview:gouImage];
        UITapGestureRecognizer* stapLeftAvatar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dagouAction:)];
        gouImage.userInteractionEnabled = YES;
        [gouImage addGestureRecognizer:stapLeftAvatar];
        
        UILabel *gouTitle = [[UILabel alloc] initWithFrame:CGRectMake(gouImage.frame.origin.x + gouImage.frame.size.width, line.frame.origin.y - 40, frameW - (gouImage.frame.origin.x + gouImage.frame.size.width), 40)];
        gouTitle.textColor = kTextBlackColor;
        gouTitle.font = [UIFont systemFontOfSize:12];
        gouTitle.text = @"下次不再提示";
        [self addSubview:gouTitle];
        
        UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topTitle.frame.origin.y + topTitle.frame.size.height + 10, frameW, gouTitle.frame.origin.y - (topTitle.frame.origin.y + topTitle.frame.size.height + 10))];
        [self addSubview:contentScrollView];
        
        CGFloat height = [message boundingRectWithSize:CGSizeMake(frameW - 25, 0) options:NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = kTextDarkgrayColor;
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.frame = CGRectMake(15, 0, frameW - 25, height);
        contentLabel.text = message;
        [contentScrollView addSubview:contentLabel];
        
        contentScrollView.contentSize = CGSizeMake(frameW, height + 10);
        
    }
    return self;
}

- (void)dagouAction:(UITapGestureRecognizer*) gesture
{
    isdaGou = !isdaGou;
    NSInteger tag = gesture.view.tag;
    UIImageView *image = (UIImageView *)[self viewWithTag:tag];
    image.image = isdaGou ? [UIImage imageNamed:@"dagou_selected"] : [UIImage imageNamed:@"dagou_normal"];
}

- (void)dismissButtonTapped {
    if (self.scrollViewBlock != nil) {
        self.scrollViewBlock(NO, NO);
    }
}

- (void)confirmButtonTapped {
    if (self.scrollViewBlock != nil) {
        self.scrollViewBlock(YES, isdaGou);
    }
}


@end
