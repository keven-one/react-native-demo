//
//  RNTEventManager.h
//  demo1
//
//  Created by King on 2019/10/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
NS_ASSUME_NONNULL_BEGIN

@interface RNTEventManager : RCTEventEmitter<RCTBridgeModule>
- (void)sendSelectItem:(NSDictionary *)obj;
@end

NS_ASSUME_NONNULL_END
