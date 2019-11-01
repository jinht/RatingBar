//
//  JhtRatingBar.m
//  JhtRatingBar
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/7.
//  Copyright © 2016年 JhtRatingBar. All rights reserved.
//

#import "JhtRatingBar.h"
#import "JhtStar.h"

@interface JhtRatingBar ()

@property (nonatomic, strong) JhtStar *star;

@end


/** 默认星星 总数 */
static const NSInteger KRBDefaultStarCount = 5;

@implementation JhtRatingBar

#pragma mark - Init
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self rbInitParam];
        
        [self rbAddGesture];
        
        [self rbAddStarWithCount:_starTotalNumber];
    }
    
    return self;
}

#pragma mark Init Method
/** 初始化参数 */
- (void)rbInitParam {
    self.backgroundColor = [UIColor whiteColor];
    _minSelectedNumber = 1;
    self.starTotalNumber = KRBDefaultStarCount;
    _selectedStarNumber = _starTotalNumber;
    self.touchEnable = YES;
    self.scrollSelectEnable = YES;
}

/** 添加手势 */
- (void)rbAddGesture {
    // 点击
    if (self.touchEnable) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rbTapGes:)];
        [self addGestureRecognizer:tap];
    }
    // 滑动
    if (self.touchEnable && self.scrollSelectEnable) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rbPanGes:)];
        [self addGestureRecognizer:pan];
    }
}

/** 点击 触发方法 */
- (void)rbTapGes:(UITapGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self];
    if (self.isNeedHalf) {
        CGFloat count = (point.x / CGRectGetHeight(self.frame));
        count = count < _minSelectedNumber ? _minSelectedNumber : count;
        self.selectedStarNumber = count > _starTotalNumber ? _starTotalNumber : count;
        
    } else {
        NSInteger count = (point.x / CGRectGetHeight(self.frame)) + 1;
        count = count < _minSelectedNumber ? _minSelectedNumber : count;
        self.selectedStarNumber = count > _starTotalNumber ? _starTotalNumber : count;
    }
}

/** 滑动 触发方法 */
- (void)rbPanGes:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self];
    if (self.isNeedHalf) {
        CGFloat count = (point.x / CGRectGetHeight(self.frame));
        // 最小点亮数的左右边
        count = count < _minSelectedNumber ? _minSelectedNumber : count;
        
        if (count >= 0 && count <= _starTotalNumber && _selectedStarNumber != count) {
            self.selectedStarNumber = count;
        }
        
    } else {
        NSInteger count = (point.x / CGRectGetHeight(self.frame)) + 1;
        // 最小点亮数的左右边
        count = count < _minSelectedNumber ? _minSelectedNumber : count;
        
        if (count >= 0 && count <= _starTotalNumber && _selectedStarNumber != count) {
            _selectedStarNumber = count;
        }
    }
}

/** 添加星星 */
- (void)rbAddStarWithCount:(NSInteger)count {
    if (self.subviews.count) {
        // 全部删除
        for (UIView *vi in self.subviews) {
            if ([vi isMemberOfClass:[JhtStar class]]) {
                [vi removeFromSuperview];
            }
        }
    }
    
    // star的 宽高 就是 JhtRatingBar的高度
    CGFloat starWH = CGRectGetHeight(self.frame);
    for (NSInteger i = 0; i < count; i ++) {
        JhtStar *star = [[JhtStar alloc] initWithFrame:CGRectMake(starWH * i, 0, starWH, starWH)];
        // 初始化 星星为未选中状态
        star.selectedStarType = Selected_noStar;
        self.star = star;
        [self addSubview:star];
    }
    
    // 设置默认选中的星星数量
    self.selectedStarNumber = _starTotalNumber;
    
    [self rbJudgeWidth];
}

/** 判断设置的宽度是否能够放得下所有星星 */
- (void)rbJudgeWidth {
    CGRect frame = self.frame;
    CGFloat realWidth = _starTotalNumber * CGRectGetHeight(frame);
    if (CGRectGetMaxX(frame) < realWidth && realWidth <= [UIScreen mainScreen].bounds.size.width) {
        frame.size.width = realWidth;
        self.frame = frame;
    }
}


#pragma mark - Setter
- (void)setStarTotalNumber:(NSInteger)starTotalNumber {
    if (_starTotalNumber != starTotalNumber) {
        _starTotalNumber = starTotalNumber;
        
        [self rbAddStarWithCount:starTotalNumber];
        if (_selectedStarNumber != KRBDefaultStarCount) {
            [self setSelectedStarNumber:_selectedStarNumber];
            
        } else {
            self.selectedStarNumber = starTotalNumber;
        }
    }
    
    [self rbJudgeWidth];
}

- (void)setSelectedStarNumber:(CGFloat)selectedStarNumber {
    _selectedStarNumber = selectedStarNumber;
    
    if (selectedStarNumber < _minSelectedNumber) {
        return;
    }
    
    // 判断是否需要半分
    if (self.isNeedHalf) {
        // 计算点亮星星个数
        NSString *starCount = [NSString stringWithFormat:@"%lf", selectedStarNumber];
        // 整数分
        NSInteger num1 = [[[starCount componentsSeparatedByString:@"."] firstObject] integerValue];
        // 小数分
        CGFloat num2 = [[NSString stringWithFormat:@"0.%@", [[starCount componentsSeparatedByString:@"."] lastObject]] floatValue];

        if (num2 > 0.6) {
            num1 += 1;
            num2 = 0.0;
        }
        BOOL isHalf = num2 >= 0.3 ? YES : NO;
        
        for (NSInteger i = 0; i < self.subviews.count; i ++) {
            JhtStar *star = self.subviews[i];
            if (i < num1) {
                star.selectedStarType = Selected_allStar;
                
            } else if (i == num1 && isHalf) {
                star.selectedStarType = Selected_halfStar;
                
            } else {
                star.selectedStarType = Selected_noStar;
            }
        }
        
        CGFloat num3 = isHalf ? 0.5 : 0.0;
        _scale = (CGFloat)num1 + num3;
        
    } else {
        NSInteger starCount = (NSInteger)selectedStarNumber;
        // 改变 star 选中状态
        for (NSInteger i = 0; i < self.subviews.count; i ++) {
            JhtStar *star = self.subviews[i];
            if (i < starCount) {
                star.selectedStarType = Selected_allStar;
                
            } else {
                star.selectedStarType = Selected_noStar;
            }
        }
        
        _scale = starCount;
    }
    
    // 星星选中状态发生变化
    if (self.starChange) {
        self.starChange();
    }
}

- (void)setBgViewColor:(UIColor *)bgViewColor {
    if (_bgViewColor != bgViewColor) {
        self.backgroundColor = bgViewColor;
    }
}


@end
