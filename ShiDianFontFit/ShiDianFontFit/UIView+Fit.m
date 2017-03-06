//
//  UIView+Fit.m
//  ShiDianFontFit
//
//  Created by 冯成林 on 2017/3/6.
//  Copyright © 2017年 冯成林. All rights reserved.
//

#import "UIView+Fit.h"
#define p [UIScreen mainScreen].bounds.size.width / 320.0

@implementation UIView (Fit)

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self viewConstraintsFit:self];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self viewConstraintsFit:obj];
    }];
}

-(void)viewConstraintsFit:(__weak UIView *)v{
    
    [v.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.identifier.length > 0) {
            
            obj.constant = obj.constant *p;
        }
    }];
}

@end
