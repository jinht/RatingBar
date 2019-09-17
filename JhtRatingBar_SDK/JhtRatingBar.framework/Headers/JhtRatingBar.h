//
//  JhtRatingBar.h
//  JhtRatingBar
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/7.
//  Copyright © 2016年 JhtRatingBar. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 评分条 View */
@interface JhtRatingBar : UIView

#pragma mark - property
#pragma mark optional
typedef void (^StarChange)();
/** 点亮星星数量 发生变化 */
@property (nonatomic, copy) StarChange starChange;
/** 获得的分数 */
@property (nonatomic, assign, readonly) CGFloat scale;

/** 星星总的数量
 *  default: 5
 */
@property (nonatomic, assign) NSInteger starTotalNumber;
/** 选中星星的数量（设置默认选中星星个数）
 *  default: 星星总数
 */
@property (nonatomic, assign) CGFloat selectedStarNumber;
/** 最少选中星星数
 *  default: 1
 */
@property (nonatomic, assign) CGFloat minSelectedNumber;

/** 是否可触摸
 *  default: YES
 */
@property (nonatomic, assign) BOOL touchEnable;
/** 是否允许滑动选择（在touchEnable = YES 前提下才有意义）
 *  default: YES
 */
@property (nonatomic, assign) BOOL scrollSelectEnable;

/** 是否需要半分
 *  default: NO
 */
@property (nonatomic, assign) BOOL isNeedHalf;
/** 底部视图的颜色
 *  default: [UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *bgViewColor;


@end
