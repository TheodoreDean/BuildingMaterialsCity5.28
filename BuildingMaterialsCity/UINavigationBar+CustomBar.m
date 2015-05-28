//
//  UINavigationBar+CustomBar.m
//  掌上高博
//
//  Created by administrator on 13-10-18.
//  Copyright (c) 2013年 myApp. All rights reserved.
//

#import "UINavigationBar+CustomBar.h"

@implementation UINavigationBar (CustomBar)

- (void)customNavigationBar {
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self setBackgroundImage:[UIImage imageNamed:@"导航条背景.png"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [self drawRect:self.bounds];
    }
    
}

- (void)drawRect:(CGRect)rect {
    [[UIImage imageNamed:@"导航条背景.png"] drawInRect:rect];
}

@end
