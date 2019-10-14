//
//  RNTEventManager.m
//  demo1
//
//  Created by King on 2019/10/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNTEventManager.h"

@implementation RNTEventManager
RCT_EXPORT_MODULE();
- (NSArray<NSString *> *)supportedEvents
{
  return @[@"selectItem"];
}

- (void)sendSelectItem:(NSDictionary *)obj
{
  [self sendEventWithName:@"selectItem" body:obj];
}

//.m文件
+(id)allocWithZone:(NSZone *)zone {
  static RNTEventManager *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
  });
  return sharedInstance;
}
@end
