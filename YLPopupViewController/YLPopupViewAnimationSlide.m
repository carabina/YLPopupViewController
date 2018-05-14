//
//  YLPopupViewAnimationSlide.m
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "YLPopupViewAnimationSlide.h"

@implementation YLPopupViewAnimationSlide
- (void)showView:(UIView *)popupView overlayView:(UIView *)overlayView{
    
    CGSize sourceSize = overlayView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupStartRect;
    switch (_type) {
        case YLPopupViewAnimationSlideTypeBottomTop:
        case YLPopupViewAnimationSlideTypeBottomBottom:
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        sourceSize.height,
                                        popupSize.width,
                                        popupSize.height);
            
            break;
        case YLPopupViewAnimationSlideTypeLeftLeft:
        case YLPopupViewAnimationSlideTypeLeftRight:
            popupStartRect = CGRectMake(-sourceSize.width,
                                        (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
            break;
            
        case YLPopupViewAnimationSlideTypeTopTop:
        case YLPopupViewAnimationSlideTypeTopBottom:
            popupStartRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                        -popupSize.height,
                                        popupSize.width,
                                        popupSize.height);
            break;
            
        default:
            popupStartRect = CGRectMake(sourceSize.width,
                                        (sourceSize.height - popupSize.height) / 2,
                                        popupSize.width,
                                        popupSize.height);
            break;
    }
    CGRect popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                     (sourceSize.height - popupSize.height) / 2,
                                     popupSize.width,
                                     popupSize.height);
    
    // Set starting properties
    popupView.frame = popupStartRect;
    popupView.alpha = 1.0f;
    [UIView animateWithDuration:0.25 delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        popupView.frame = popupEndRect;
    } completion:nil];
    
    
}
- (void)dismissView:(UIView *)popupView overlayView:(UIView *)overlayView completion:(void (^)(void))completion{
    CGSize sourceSize = overlayView.bounds.size;
    CGSize popupSize = popupView.bounds.size;
    CGRect popupEndRect;
    switch (_type) {
        case YLPopupViewAnimationSlideTypeBottomTop:
        case YLPopupViewAnimationSlideTypeTopTop:
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      -popupSize.height,
                                      popupSize.width,
                                      popupSize.height);
            break;
        case YLPopupViewAnimationSlideTypeBottomBottom:
        case YLPopupViewAnimationSlideTypeTopBottom:
            popupEndRect = CGRectMake((sourceSize.width - popupSize.width) / 2,
                                      sourceSize.height,
                                      popupSize.width,
                                      popupSize.height);
            break;
        case YLPopupViewAnimationSlideTypeLeftRight:
        case YLPopupViewAnimationSlideTypeRightRight:
            popupEndRect = CGRectMake(sourceSize.width,
                                      popupView.frame.origin.y,
                                      popupSize.width,
                                      popupSize.height);
            break;
        default:
            popupEndRect = CGRectMake(-popupSize.width,
                                      popupView.frame.origin.y,
                                      popupSize.width,
                                      popupSize.height);
            break;
    }
    
    [UIView animateWithDuration:0.25 delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        popupView.frame = popupEndRect;
        overlayView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        completion();
    }];
    
}
@end
