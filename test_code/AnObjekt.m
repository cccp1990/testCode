//
//  AnObjekt.m
//  test_code
//
//  Created by admin on 2018/5/22.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AnObjekt.h"

@implementation AnObjekt

static AnObjekt *obj = nil;

+ (instancetype)getInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [super allocWithZone:NULL];
    });
    
    return obj;
}

+ (void)load {
    [super load];
    printf("loaded AnObjekt\n");
}

+ (void)initialize {
    [super initialize];
    printf("initialized AnObjekt");
}
@end
