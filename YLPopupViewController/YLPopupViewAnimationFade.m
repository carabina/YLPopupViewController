//
//  YLPopupViewAnimationFade.m
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "YLPopupViewAnimationFade.h"

@implementation YLPopupViewAnimationFade
- (void)showView:(UIView *)popupView overlayView:(UIView *)overlayView{
    // Generating Start and Stop Positions
    // Set starting properties
    popupView.center = overlayView.center;
    popupView.alpha = 0.0f;
    
    [UIView animateWithDuration:0.5 animations:^{
        popupView.alpha = 1.0f;
    } completion:nil];
    
}
- (void)dismissView:(UIView *)popupView overlayView:(UIView *)overlayView completion:(void (^)(void))completion{
    [UIView animateWithDuration:0.25 animations:^{
        overlayView.alpha = 0.0f;
        popupView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (finished) {
            completion();
        }
    }];
}

@end
