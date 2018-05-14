//
//  YLPopupViewAnimationSpring.m
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "YLPopupViewAnimationSpring.h"
@interface YLPopupViewAnimationSpring () <CAAnimationDelegate>
@property (nonatomic,copy)void (^completion)(void);
@end
@implementation YLPopupViewAnimationSpring
- (void)showView:(UIView *)popupView overlayView:(UIView *)overlayView{
    popupView.alpha = 1.0f;
    
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 0.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)], [NSValue valueWithCATransform3D:CATransform3DIdentity]
                            ];
    
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f,@1.f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [popupView.layer addAnimation:popAnimation forKey:nil];
    
}

- (void)dismissView:(UIView *)popupView overlayView:(UIView *)overlayView completion:(void (^)(void))completion{
    _completion = completion;
    
    [UIView animateWithDuration:0.4 animations:^{
        overlayView.alpha = 0;
    }];
    
    CAKeyframeAnimation *hideAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    hideAnimation.duration = 0.4;
    hideAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.00f, 0.00f, 0.00f)]];
    hideAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f];
    hideAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    hideAnimation.delegate = self;
    [popupView.layer addAnimation:hideAnimation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    _completion();
}

@end
