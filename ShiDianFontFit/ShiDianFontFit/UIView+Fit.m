//
//  UIView+Fit.m
//  ShiDianFontFit
//
//  Created by 冯成林 on 2017/3/6.
//  Copyright © 2017年 冯成林. All rights reserved.
//

#import "UIView+Fit.h"
#import "NSLayoutConstraint+Fit.h"

#define p [UIScreen mainScreen].bounds.size.width / 320.0



@implementation UIView (Fit)


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self viewSubviewsFit];
    });
}

-(void)viewSubviewsFit{
    
    [self viewConstraintsFit];
    
    if ([self isKindOfClass:[UILabel class]]) {return;}
    if ([self isKindOfClass:[UIButton class]]) {return;}
    if ([self isKindOfClass:[UITextField class]]) {return;}
    if ([self isKindOfClass:[UITextView class]]) {return;}
    
    if (self.subviews.count > 0) {
    
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [view viewConstraintsFit];
        
            [view viewSubviewsFit];
            
        }];
    }
}

-(void)viewConstraintsFit{
    
    [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.identifier.length > 0) {
            
            if (obj.originalConstant <= 0) {
            
                obj.originalConstant = obj.constant;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    obj.constant = obj.originalConstant * p;
                });
                
            }
        }
    }];
}

@end
