//
//  HZCycleScrollView.m
//  HZCycleScrollView
//
//  Created by huangzhenyu on 2018/7/13.
//  Copyright © 2018年 huangzhenyu. All rights reserved.
//

#import "HZCycleScrollView.h"
#import "UIImageView+WebCache.h"
//#import "HZCycleItemView.h"

@interface HZCycleScrollView()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *itemArray;
@property (nonatomic,strong) NSMutableArray *actualUrlArray;

@end

@implementation HZCycleScrollView
- (instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self adjustFrame];
}

#pragma mark getter setter
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.clipsToBounds = NO;
//        _scrollView.layer.cornerRadius = 10;
        _scrollView.alwaysBounceHorizontal = NO;
        //decelerationrate 设置当它减速时的速度,0.1f的话,很快就停下来,1就正常速度停下,即滑动一定距离才停.
        _scrollView.decelerationRate = 0;
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _scrollView;
}

- (NSMutableArray *)itemArray{
    if (!_itemArray) {
        _itemArray = [NSMutableArray arrayWithCapacity:3];
    }
    return _itemArray;
}

- (NSMutableArray *)actualUrlArray{
    if (!_actualUrlArray) {
        _actualUrlArray = [NSMutableArray arrayWithCapacity:3];
    }
    return _actualUrlArray;
}

- (void)setCycleScrollViewStyle:(HZCycleScrollViewStyle)cycleScrollViewStyle{
    _cycleScrollViewStyle = cycleScrollViewStyle;
    [self removeAllItems];
    [self addAllItems];
    [self adjustFrame];
}

- (void)setUrlArray:(NSArray *)urlArray{
    _urlArray = urlArray;
    if (urlArray.count > 0) {
        [self removeAllItems];
        [self addAllItems];
        [self adjustFrame];
    }
}

- (void)setRightLeakSpace:(CGFloat)rightLeakSpace{
    _rightLeakSpace = rightLeakSpace;
    [self adjustFrame];
}

- (void)setPlaceHolderImage:(UIImage *)placeHolderImage{
    _placeHolderImage = placeHolderImage;
    for (int i = 0; i < self.itemArray.count; i++) {
        UIImageView *itemView = self.itemArray[i];
        NSString *url = self.actualUrlArray[i];
        [itemView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:_placeHolderImage];
    }
}

- (void)addAllItems{
    if (self.cycleScrollViewStyle == HZCycleScrollViewStyleLoop) {//循环滚动
        
        //添加item
        for (int i = 0; i < _urlArray.count; i++) {
            UIImageView *itemView = [self createItem:_urlArray[i]];
            itemView.tag = i;
            [self.scrollView addSubview:itemView];
            [self.itemArray addObject:itemView];
            [self.actualUrlArray addObject:_urlArray[i]];
        }
        if (_urlArray.count <= 1) {//只有一张图
            return;
        }
        if (_urlArray.count > 1) {
            //最左侧添加最后一张图片
            UIImageView *lastItemView = [self createItem:_urlArray.lastObject];
            lastItemView.tag = _urlArray.count - 1;
            [self.scrollView addSubview:lastItemView];
            [self.itemArray insertObject:lastItemView atIndex:0];
            [self.actualUrlArray insertObject:_urlArray.lastObject atIndex:0];
            
            //最右侧添加第一张图片
            UIImageView *firstItemView = [self createItem:_urlArray.firstObject];
            firstItemView.tag = 0;
            [self.scrollView addSubview:firstItemView];
            [self.itemArray addObject:firstItemView];
            [self.actualUrlArray addObject:_urlArray.firstObject];
        }
        
    } else {
        //添加item
        for (int i = 0; i < _urlArray.count; i++) {
            UIImageView *itemView = [self createItem:_urlArray[i]];
            itemView.tag = i;
            [self.scrollView addSubview:itemView];
            [self.itemArray addObject:itemView];
            [self.actualUrlArray addObject:_urlArray[i]];
        }
    }
}

- (UIImageView *)createItem:(NSString *)url{
    UIImageView *itemView = [[UIImageView alloc] init];
    itemView.clipsToBounds = YES;
    itemView.layer.cornerRadius = 10;
    itemView.backgroundColor = [self colorWithHexString:@"#eeeeee"];
    itemView.userInteractionEnabled = YES;
    itemView.contentMode = UIViewContentModeScaleAspectFill;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [itemView addGestureRecognizer:tap];
    [itemView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:self.placeHolderImage];
    return itemView;
}

#pragma mark private
- (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            NSLog(@"不合规范的颜色值:%@",hexString);
            return [UIColor clearColor];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

- (void)removeAllItems{
    NSArray *tempArr = [self.itemArray copy];
    for (UIView *item in tempArr) {
        if ([item isKindOfClass:[UIImageView class]]) {
            [item removeFromSuperview];
            [self.itemArray removeObject:item];
        }
    }
    [self.actualUrlArray removeAllObjects];
}

- (void)adjustFrame{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    if (width <= 0 || height <= 0) {
        return;
    }
    if (self.itemArray.count <= 0) {
        return;
    }
    self.scrollView.frame = CGRectMake(0, 0, width - _rightLeakSpace, height);
    CGFloat scrollW = self.scrollView.frame.size.width;
    NSUInteger itemCount = self.itemArray.count;
    CGFloat itemW = scrollW - self.itemSpace;
    self.scrollView.contentSize = CGSizeMake(itemCount * scrollW, height);
    for (int i = 0; i < itemCount; i++) {
        UIImageView *itemView = self.itemArray[i];
        CGFloat itemX = i * itemW + (i + 1) * self.itemSpace;
        CGFloat itemY = 0;
        CGFloat itemH = height;
        itemView.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
    if (self.cycleScrollViewStyle == HZCycleScrollViewStyleDefault) {//默认不循环
        //将scrollView滚动到0
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    } else {
        if (self.itemArray.count <= 1) {
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        } else {
            //将scrollView滚动到第二个item
            [self.scrollView setContentOffset:CGPointMake(scrollW, 0) animated:NO];
        }
        
    }
    
}

- (void)initUI{
    _itemSpace = 10;
    _rightLeakSpace = 20;
    self.clipsToBounds = YES;
    [self addSubview:self.scrollView];
}

- (void)tap:(UIGestureRecognizer *)gesture{
    NSInteger index = gesture.view.tag;
    if (self.selectItemBlock) {
        self.selectItemBlock(index);
    }
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
//    NSLog(@"contentOffsetX  --- %f",scrollView.contentOffset.x);
//    NSLog(@"scrollViewDidEndDecelerating");

    if (self.cycleScrollViewStyle == HZCycleScrollViewStyleDefault) {//默认不循环

    } else {
        if (self.itemArray.count <= 1) {
            return;
        }
        // 根据偏移量获取到当前展示的是图片几
        NSInteger pageNum = scrollView.contentOffset.x / scrollViewW;

        /*
         判断如果当前展示的是否是最后一张图片(图片1),
         如果是的话就滚动到第二张图片(图片1)的位置
         如果当前展示的是第一张图片(图片5)的话就滚动到第六张(图片5)的位置
         */
        if (pageNum == self.itemArray.count - 1)
        {
            [scrollView setContentOffset:CGPointMake(scrollViewW, 0) animated:NO];
//            self.pageControl.currentPage = 0;
            return;
        }
        else if (pageNum == 0)
        {
            [scrollView setContentOffset:CGPointMake(scrollViewW * (self.itemArray.count - 2), 0) animated:NO];
//            self.pageControl.currentPage = self.itemArray.count - 2;
            return;
        }

        // 设置pageControl的currentPage数
//        self.pageControl.currentPage = pageNum - 1;

    }
}

#pragma mark hitTest
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self])
    {
        for (UIView *subview in _scrollView.subviews)
        {
            CGPoint offset = CGPointMake(point.x - _scrollView.frame.origin.x + _scrollView.contentOffset.x - subview.frame.origin.x,
                                         point.y - _scrollView.frame.origin.y + _scrollView.contentOffset.y - subview.frame.origin.y);
//            NSLog(@"offset -- %@",NSStringFromCGPoint(offset));
            if ((view = [subview hitTest:offset withEvent:event]))
            {
                return view;
            }
        }
        return _scrollView;
    }
    return view;
}
@end
