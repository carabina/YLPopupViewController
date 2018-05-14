//
//  UIViewController+YLPopupViewController.h
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YLPopupAnimation <NSObject>
@required
- (void)showView:(UIView*)popupView overlayView:(UIView*)overlayView;
- (void)dismissView:(UIView*)popupView overlayView:(UIView*)overlayView completion:(void (^)(void))completion;

@end
@interface UIViewController (YLPopupViewController)
@property (nonatomic, strong) UIView *ylPopupView;
@property (nonatomic, strong) UIView *ylOverlayView;
@property (nonatomic, copy) void (^ylDismissHandle)(void);
@property (nonatomic, retain, readonly) id<YLPopupAnimation> ylPopupAnimation;

- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation;
- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation dismissed:(void(^)(void))dismissed;


- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation backgroundClickEnable:(BOOL)enable;
- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation backgroundClickEnable:(BOOL)enable dismissed:(void(^)(void))dismissed;


- (void)yl_dismissPopupView;
- (void)yl_dismissPopupViewWithanimation:(id<YLPopupAnimation>)animation;
@end

#pragma mark -
@interface UIView (YLPopupViewController)
@property (nonatomic, weak, readonly) UIViewController *ylPopupViewController;

@end
