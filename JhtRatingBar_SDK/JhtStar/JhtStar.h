//
//  JhtStar.h
//  JhtRatingBar
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/7.
//  Copyright © 2016年 JhtRatingBar. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 选中星星 类型 */
typedef NS_ENUM(NSUInteger, Jht_SelectedStarType) {
    // 未选中
    Selected_noStar = 0,
    // 选中一半
    Selected_halfStar,
    // 全部选中
    Selected_allStar
};


@interface JhtStar : UIView

#pragma mark - property
/** 星星 是否为选中状态 */
@property (nonatomic, assign) Jht_SelectedStarType selectedStarType;


@end
