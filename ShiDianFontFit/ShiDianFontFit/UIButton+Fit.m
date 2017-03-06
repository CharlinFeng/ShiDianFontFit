//
//  UILabel+Fit.m
//  test1
//
//  Created by 冯成林 on 2017/3/3.
//  Copyright © 2017年 冯成林. All rights reserved.
//

#import "UIButton+Fit.h"
#import <objc/runtime.h>

#define p [UIScreen mainScreen].bounds.size.width / 320.0


@implementation UIButton (Fit)

+ (void)load{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
    [self myInitWithCoder:aDecode];
    
    if (self) {
        //部分不像改变字体的 把tag值设置成333跳过
        if(self.tag != 999){
            
            CGFloat fontSize = self.titleLabel.font.pointSize;
            
            self.titleLabel.font = [UIFont systemFontOfSize:fontSize*p];
            
//            [self fit];
        }
    }
    
    return self;
}

//
//-(void)awakeFromNib {
//
//    [super awakeFromNib];
//
//    [self fit];
//
//}
//
//-(void)fit{
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
