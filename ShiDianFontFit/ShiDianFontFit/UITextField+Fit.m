//
//  UITextField+Fit.m
//  ShiDianFontFit
//
//  Created by 冯成林 on 2017/3/6.
//  Copyright © 2017年 冯成林. All rights reserved.
//

#import "UITextField+Fit.h"
#import <objc/runtime.h>

#define p [UIScreen mainScreen].bounds.size.width / 320.0

@implementation UITextField (Fit)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    
    if (self) {
        
        if(self.tag != 999){
            CGFloat fontSize = self.font.pointSize;
            self.font = [UIFont systemFontOfSize:fontSize*p];
//            [self fit];
        }
    }
    return self;
}


//-(void)awakeFromNib {
//    
//    [super awakeFromNib];
//    
//    [self fit];
//}
//
//-(void)fit {
//    
//    [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        if (obj.identifier.length > 0) {
//            
//            obj.constant = obj.constant *p;
//        }
//    }];
//    
//    [self.superview.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        if (obj.identifier.length > 0) {
//            
//            obj.constant = obj.constant *p;
//        }
//    }];
//}


@end
