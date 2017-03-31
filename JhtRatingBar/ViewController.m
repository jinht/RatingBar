//
//  ViewController.m
//  JhtRatingBar
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/8.
//  Copyright © 2016年 Jht. All rights reserved.
//

#import "ViewController.h"
#import "JhtRatingBar.h"

@interface ViewController ()
/** 评分条 */
@property (nonatomic, strong) JhtRatingBar *ratingBar;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加评分条
    [self addRatingBar];
}



#pragma mark - 添加评分条
/** 添加评分条 */
- (void)addRatingBar {
    // 添加评分条
    self.ratingBar = [[JhtRatingBar alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 280) / 2, 150, 280, 35)];
    self.ratingBar.bgViewColor = [UIColor lightGrayColor];
    self.ratingBar.starTotalNumber = 8;
    self.ratingBar.selectedStarNumber = 4;
    self.ratingBar.minSelectedNumber = 0;
    self.ratingBar.isNeedHalf = YES;
    __weak JhtRatingBar *weakBar = self.ratingBar;
    self.ratingBar.starChange = ^() {
        NSLog(@"scale = %lf", weakBar.scale);
    };
    [self.view addSubview:self.ratingBar];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
