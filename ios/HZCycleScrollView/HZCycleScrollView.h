//
//  HZCycleScrollView.h
//  HZCycleScrollView
//
//  Created by huangzhenyu on 2018/7/13.
//  Copyright © 2018年 huangzhenyu. All rights reserved.
//
//参考
//https://www.cnblogs.com/v-jing/p/3509219.html
//https://blog.csdn.net/qq_18505715/article/details/78411052
//通过n+2张图片实现循环滚动
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,HZCycleScrollViewStyle) {
    HZCycleScrollViewStyleDefault,
    HZCycleScrollViewStyleLoop
};

@interface HZCycleScrollView : UIView
@property (nonatomic,assign) HZCycleScrollViewStyle cycleScrollViewStyle;
@property (nonatomic,strong) NSArray<NSString *> *urlArray;
@property (nonatomic,assign) CGFloat itemSpace;//item之间的间距,内部间距（不包括最左边和最右边） 可以设置负值
@property (nonatomic,assign) CGFloat rightLeakSpace;
@property (nonatomic,strong) UIImage *placeHolderImage;

@property (nonatomic,copy) void(^selectItemBlock)(NSInteger index);
@end
