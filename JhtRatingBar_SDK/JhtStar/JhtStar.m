//
//  JhtStar.m
//  JhtRatingBar
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/7.
//  Copyright © 2016年 JhtRatingBar. All rights reserved.
//

#import "JhtStar.h"

@interface JhtStar ()

@property (nonatomic, strong) UIImageView *starIV;

@end


/** 单个星星与整条背景缩放比例 */
static const CGFloat KStarScale = 0.85;

@implementation JhtStar

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addStarWithFrame:frame];
    }
    return self;
}

/** 添加星星 */
- (void)addStarWithFrame:(CGRect)frame {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_light"]];
    
    self.starIV = imgView;
    [self addSubview:imgView];
    
    CGFloat imgWH = CGRectGetWidth(frame);
    imgView.frame = CGRectMake(0, 0, imgWH * KStarScale, imgWH * KStarScale);
    imgView.center = CGPointMake(imgWH * 0.5, imgWH * 0.5);
}


#pragma mark - Setter
- (void)setSelectedStarType:(Jht_SelectedStarType)selectedStarType {
    NSString *imgName;
    if (selectedStarType == 0) {
        imgName = @"star_off";
        
    } else if (selectedStarType == 1) {
        imgName = @"star_half";
        
    } else {
        imgName = @"star_light";
    }
    NSString *imPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"JhtStar.bundle/%@", imgName]];
    [self.starIV setImage:[UIImage imageWithContentsOfFile:imPath]];
}


@end
