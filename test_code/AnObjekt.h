//
//  AnObjekt.h
//  test_code
//
//  Created by admin on 2018/5/22.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnObjekt : NSObject

+ (instancetype)getInstance;
- (instancetype)init __attribute__((unavailable("Disabled. Use +sharedInstance instead")));
+ (instancetype)new __attribute__((unavailable("Disabled. Use +sharedInstance instead")));

@end
