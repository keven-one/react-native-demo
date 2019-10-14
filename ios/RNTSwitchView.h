//
//  RNTSwitchView.h
//  demo1
//
//  Created by King on 2019/10/12.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTViewManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTSwitchView : RCTViewManager
{
  BOOL _clickItemEvent;
}
@property (nonatomic, copy) RCTBubblingEventBlock selectItem;

@end

NS_ASSUME_NONNULL_END
