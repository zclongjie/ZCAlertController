//
//  UIImage+Candy.h
//  Candy
//
//  Created by Aiwa on 8/21/15.
//  Copyright (c) 2015 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Candy)


+(UIImage*) imageFromColor: (UIColor*) color;

+(UIImage*) fixImageRotation :(UIImage*) aImage;

-(UIImage*)scaleToSize:(CGSize)size;

+(UIImage*)resizeWithImage:(UIImage*)image;

+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
