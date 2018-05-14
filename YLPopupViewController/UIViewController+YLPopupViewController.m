//
//  UIViewController+YLPopupViewController.m
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "UIViewController+YLPopupViewController.h"
#import <objc/runtime.h>
#import "YLPopupBackgroundView.h"

static char kYLPopupViewKey;
static char kYLOverlayViewKey;
static char kYLDismissHandleKey;
static char kYLPopupViewControllerKey;
static char kYLPopupAnimationKey;
@implementation UIViewController (YLPopupViewController)
#pragma mark - Publick
- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation {
    [self _presentPopupView:popupView animation:animation backgroundClickable:YES dismissed:nil];
}
- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation dismissed:(void(^)(void))dismissed {
    [self _presentPopupView:popupView animation:animation backgroundClickable:YES dismissed:dismissed];
}


- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation backgroundClickEnable:(BOOL)enable {
    [self _presentPopupView:popupView animation:animation backgroundClickable:enable dismissed:nil];
}
- (void)yl_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation backgroundClickEnable:(BOOL)enable dismissed:(void(^)(void))dismissed {
    [self _presentPopupView:popupView animation:animation backgroundClickable:enable dismissed:dismissed];
}


- (void)yl_dismissPopupView {
    [self _dismissPopupViewWithAnimation:nil];
}
- (void)yl_dismissPopupViewWithanimation:(id<YLPopupAnimation>)animation {
    [self _dismissPopupViewWithAnimation:animation];
}

#pragma mark - view handle
- (void)_presentPopupView:(UIView *)popupView animation:(id<YLPopupAnimation>)animation backgroundClickable:(BOOL)enabled dismissed:(void(^)(void))dismissed {

    // check if source view controller is not in destination
    if ([self.ylOverlayView.subviews containsObject:popupView]) return;
    
    // fix issue #2
    if (self.ylOverlayView && self.ylOverlayView.subviews.count > 1) {
        [self _dismissPopupViewWithAnimation:nil];
    }
    
    UIView *sourceView = [self yl_topView];
    self.ylPopupView = nil;
    self.ylPopupView = popupView;
    self.ylPopupAnimation = nil;
    self.ylPopupAnimation = animation;
    // customize popupView
    popupView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    if (!self.ylOverlayView) {
        UIView *overlayView = [[UIView alloc] initWithFrame:sourceView.bounds];
        overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlayView.backgroundColor = [UIColor clearColor];
        // BackgroundView
        UIView *backgroundView = [[YLPopupBackgroundView alloc] initWithFrame:sourceView.bounds];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        backgroundView.backgroundColor = [UIColor clearColor];
        [overlayView addSubview:backgroundView];
        //  Make the Background Clickenabled
        if (enabled) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yl_dismissPopupView)];
            [backgroundView addGestureRecognizer:tap];
        }
        self.ylOverlayView = overlayView;
        overlayView.alpha = 0;
    }
    
    [self.ylOverlayView addSubview:popupView];
    [sourceView addSubview:self.ylOverlayView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.ylOverlayView.alpha = 1.0f;
    }];
    popupView.center = self.ylOverlayView.center;
    if (animation) {
        [animation showView:popupView overlayView:self.ylOverlayView];
    }
    [self setYlDismissHandle:dismissed];
}
- (void)_dismissPopupViewWithAnimation:(id<YLPopupAnimation>)animation {
    if (animation) {
        [animation dismissView:self.ylPopupView overlayView:self.ylOverlayView completion:^(void) {
            [self.ylOverlayView removeFromSuperview];
            [self.ylPopupView removeFromSuperview];
            self.ylPopupView = nil;
            self.ylPopupAnimation = nil;
            
            id dismissed = [self ylDismissHandle];
            if (dismissed != nil){
                ((void(^)(void))dismissed)();
                [self setYlDismissHandle:nil];
            }
        }];
    }else{
        [self.ylOverlayView removeFromSuperview];
        [self.ylPopupView removeFromSuperview];
        self.ylPopupView = nil;
        self.ylPopupAnimation = nil;
        
        id dismissed = [self ylDismissHandle];
        if (dismissed != nil){
            ((void(^)(void))dismissed)();
            [self setYlDismissHandle:nil];
        }
    }
}

-(UIView *)yl_topView {
    UIViewController *recentView = self;
    
    while (recentView.parentViewController != nil) {
        recentView = recentView.parentViewController;
    }
    return recentView.view;
}
#pragma mark - Getter Setter
- (void)setYlPopupView:(UIView *)ylPopupView {
    objc_setAssociatedObject(self, &kYLPopupViewKey, ylPopupView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ylPopupView {
    return objc_getAssociatedObject(self, &kYLPopupViewKey);
}

- (void)setYlOverlayView:(UIView *)ylOverlayView {
    objc_setAssociatedObject(self, &kYLOverlayViewKey, ylOverlayView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)ylOverlayView {
    return objc_getAssociatedObject(self, &kYLOverlayViewKey);
}

- (void)setYlDismissHandle:(void (^)(void))ylDismissHandle {
    objc_setAssociatedObject(self, &kYLDismissHandleKey, ylDismissHandle, OBJC_ASSOCIATION_COPY);
}
-(void (^)(void))ylDismissHandle {
    return objc_getAssociatedObject(self, &kYLDismissHandleKey);
}

- (void)setYlPopupAnimation:(id<YLPopupAnimation>)ylPopupAnimation {
    objc_setAssociatedObject(self, &kYLPopupAnimationKey, ylPopupAnimation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id<YLPopupAnimation>)ylPopupAnimation {
     return objc_getAssociatedObject(self, &kYLPopupAnimationKey);
}

@end

#pragma mark - UIView+YLPopupView
@implementation UIView (YLPopupViewController)
- (UIViewController *)ylPopupViewController {
    return objc_getAssociatedObject(self, &kYLPopupViewControllerKey);
}

- (void)setYlPopupViewController:(UIViewController * _Nullable)ylPopupViewController {
    objc_setAssociatedObject(self, &kYLPopupViewControllerKey, ylPopupViewController, OBJC_ASSOCIATION_ASSIGN);
}
@end

