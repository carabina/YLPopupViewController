//
//  ViewController.m
//  YLPopupViewController
//
//  Created by cy on 2018/5/14.
//  Copyright © 2018年 cy. All rights reserved.
//

#import "ViewController.h"
#import "TextView.h"
#import "YLPopupViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fade:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    [self yl_presentPopupView:text animation:[YLPopupViewAnimationFade new]];
    
}
- (IBAction)slide:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    [self yl_presentPopupView:text animation:[YLPopupViewAnimationSlide new]];
    
}

- (IBAction)spring:(id)sender {
    
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    [self yl_presentPopupView:text animation:[YLPopupViewAnimationSpring new]];
}
- (IBAction)drop:(id)sender {
    
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    [self yl_presentPopupView:text animation:[YLPopupViewAnimationDrop new]];
}
- (IBAction)dqwdwqd:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeBottomTop;
    [self yl_presentPopupView:text animation:slide];
}
- (IBAction)bo:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeBottomBottom;
    [self yl_presentPopupView:text animation:slide];
}
- (IBAction)top:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeTopTop;
    [self yl_presentPopupView:text animation:slide];
}
- (IBAction)topbottm:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeTopBottom;
    [self yl_presentPopupView:text animation:slide];
}

- (IBAction)ll:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeLeftLeft;
    [self yl_presentPopupView:text animation:slide];
}
- (IBAction)fwefwef:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeLeftRight;
    [self yl_presentPopupView:text animation:slide];
}
- (IBAction)fefewfwef:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeRightLeft;
    [self yl_presentPopupView:text animation:slide];
}
- (IBAction)wfewf:(id)sender {
    TextView *text = [TextView viewFromXib];
    text.frame = CGRectMake(0, 0, 300, 300);
    YLPopupViewAnimationSlide *slide = [YLPopupViewAnimationSlide new];
    slide.type = YLPopupViewAnimationSlideTypeRightRight;
    [self yl_presentPopupView:text animation:slide];
}

@end
