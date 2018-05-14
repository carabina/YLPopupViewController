//
//  YLPopupViewAnimationSlide.h
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+YLPopupViewController.h"
@interface YLPopupViewAnimationSlide : NSObject<YLPopupAnimation>
typedef NS_ENUM(NSUInteger, YLPopupViewAnimationSlideType) {
    YLPopupViewAnimationSlideTypeBottomTop,
    YLPopupViewAnimationSlideTypeBottomBottom,
    YLPopupViewAnimationSlideTypeTopTop,
    YLPopupViewAnimationSlideTypeTopBottom,
    YLPopupViewAnimationSlideTypeLeftLeft,
    YLPopupViewAnimationSlideTypeLeftRight,
    YLPopupViewAnimationSlideTypeRightLeft,
    YLPopupViewAnimationSlideTypeRightRight,
};
@property (nonatomic,assign)YLPopupViewAnimationSlideType type;
@end
