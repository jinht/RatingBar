//
//  JhtRatingBar.h
//  JhtTools
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/7.
//  Copyright © 2016年 靳海涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Block
/** 点亮星星发生变化Block */
typedef void (^StarChange)();

/** 评分条 */
@interface JhtRatingBar : UIView
#pragma mark - property
/** 星星总的数量（默认：5） */
@property (nonatomic, assign) NSInteger starTotalNumber;
/** 选中星星的数量（默认：星星总数） */
@property (nonatomic, assign) CGFloat starSelectNumber;
/** 最小选择星星数（默认：1） */
@property (nonatomic, assign) CGFloat miniSelectedNumber;

/** 是否需要半分（默认不需要） */
@property (nonatomic, assign) BOOL isNeedHalf;
/** 获得的分数 */
@property (nonatomic, assign, readonly) CGFloat scale;
/** 底部视图的颜色（默认：白色） */
@property (nonatomic, strong) UIColor *bgViewColor;

/** 是否允许可触摸（默认：允许） */
@property (nonatomic, assign) BOOL isEnableTouch;
/** 是否允许滑动选择（默认：允许）（在enable = YES的前提下才有意义） */
@property (nonatomic, assign) BOOL scrollSelectEnable;

/** 点亮星星发生变化 */
@property (nonatomic, copy) StarChange starChange;


@end
