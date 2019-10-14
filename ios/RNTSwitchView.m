//
//  RNTSwitchView.m
//  demo1
//
//  Created by King on 2019/10/12.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNTSwitchView.h"
#import "HZCycleScrollView.h"
#import "RNTEventManager.h"
@implementation RNTSwitchView

RCT_EXPORT_MODULE(RNTSwitch)
RCT_EXPORT_VIEW_PROPERTY(selectItem, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(urlArray, NSArray *)
-(UIView*)view{
  
  HZCycleScrollView* scrollView = [[HZCycleScrollView alloc] init];
  scrollView.cycleScrollViewStyle = HZCycleScrollViewStyleLoop;
  scrollView.selectItemBlock = ^(NSInteger index) {
    RNTEventManager *event = [[RNTEventManager alloc] init];
    [event sendSelectItem:@{@"index":[NSNumber numberWithUnsignedInteger:index]}];

  };
  return scrollView;
}


@end
