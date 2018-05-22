//
//  ViewController.m
//  test_code
//
//  Created by admin on 2018/5/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import <stdio.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, readonly, strong) NSString *str;

@end

@implementation ViewController
{
    UIView *vv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"12";
//    NSLog(@"%ld", [self testFib:92]);
//    printf("%s", [str UTF8String]);
//    [self charSize];
//    [self frameAndBounds];
//    getCurrentDeviceType();
//    [self weakAndStrongTest];
//    [self findNumberAppearOnce];
//    [self convertStringToNumber];r
//    [self firstAppear];
//    DeleteChars((char *)[@"They are students." UTF8String], (char *)[@"aeiou" UTF8String]);
//    [self deleteString:@"aeiou" fromString:@"They are students."];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)blockTest {
    
}

- (void)frameAndBounds {
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    view2.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:view2];
//
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = [UIColor greenColor];
//    [view2 addSubview:view];
//    view2.bounds = CGRectMake(-50, -50, 200, 200);
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 736)];
    view.delegate = self;
    [self.view addSubview:view];
    view.contentSize = CGSizeMake(414*2, 736*2);
    vv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    vv.backgroundColor = [UIColor blackColor];
    [view addSubview:vv];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    printf("%s||%s\n", [NSStringFromCGPoint(scrollView.bounds.origin) UTF8String], [NSStringFromCGPoint(scrollView.frame.origin) UTF8String]);
}

- (NSInteger)testFib:(NSInteger)count {
//    if (count == 0) {
//        return 0;
//    }
//
//    if (count == 1) {
//        return 1;
//    }
//
//    return [self testFib:count - 1] + [self testFib:count - 2];
    int result[2] = {0, 1};
    if (count < 2) {
        return result[count];
    }

    NSInteger fibMinusOne = 1;
    NSInteger fibMinusTwo = 0;
    NSInteger fibN = 0;

    for (NSInteger i = 2; i <= count; ++i) {
        fibN = fibMinusOne + fibMinusTwo;
        fibMinusTwo = fibMinusOne;
        fibMinusOne = fibN;
    }

    return fibN;
}

- (void)charSize {
    
    char str[11];
    strcpy(str, "1234567890");
    printf("%s", str);
}

- (void)weakAndStrongTest {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        NSLog(@"%@", strongSelf);
    });
    _str = @"ss";
}

static void getCurrentDeviceType() {
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"SIMULATOR");
#elif TARGER_OS_IPHONE
    NSLog(@"iPhone");
#endif
}

- (void)getWIFIInfo {
    NSString *ssid, *macIp;
    CFArrayRef myArray = CNCopySupportedInterfaces();
    if (myArray != nil) {
        CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
        if (myDict != nil) {
            NSDictionary *dict = (NSDictionary*)CFBridgingRelease(myDict);
            
            ssid = [dict valueForKey:@"SSID"];
            macIp = [dict valueForKey:@"BSSID"];
        }
    }
}

- (void)printNumberByBitCount:(NSInteger)count {
    if (count <= 0) {
        return;
    }
    
}

- (void)deleteString:(NSString *)targerString fromString:(NSString *)sourceString {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:65535];
    for (NSUInteger j = 0; j < 65535; j++) {
        [array addObject:@0];
    }
    for (NSUInteger i = 0; i < targerString.length; i++) {
        NSUInteger code = (NSUInteger)[targerString characterAtIndex:i];
        NSUInteger count = [array[code] unsignedIntegerValue];
        count++;
        array[code] = [NSNumber numberWithUnsignedInteger:count];
    }
    
    for (NSUInteger k = 0; k < 65535; k++) {
        if ([array[k] unsignedIntegerValue] > 0) {
            NSLog(@"%ld", k);
        }
    }
}

void DeleteChars(char* pStrSource, const char* pStrDelete)
{
    if(NULL == pStrSource || NULL == pStrDelete)
        return;
    
    // Initialize an array, the index in this array is ASCII value.
    // All entries in the array, whose index is ASCII value of a
    // character in the pStrDelete, will be set as 1.
    // Otherwise, they will be set as 0.
    const unsigned int nTableSize = 256;
    int hashTable[nTableSize];
    memset(hashTable, 0, sizeof(hashTable));
    
    const char* pTemp = pStrDelete;
    while ('\0' != *pTemp)
    {
        hashTable[*pTemp] = 1;
        ++ pTemp;
    }
    
    char* pSlow = pStrSource-1;
    char* pFast = pStrSource;
    while ('\0' != *pFast)
    {
        // if the character is in pStrDelete, move both pStart and
        // pEnd forward, and copy pEnd to pStart.
        // Otherwise, move only pEnd forward, and the character
        // pointed by pEnd is deleted
        if(1 != hashTable[*pFast])
        {
            *pSlow = *pFast;
            ++ pSlow;
        }
        
        ++pFast;
    }
    
    *pSlow = '\0';
}

#pragma mark 把字符串转换成整数[算法]
- (void)firstAppear {
    NSString *string = @"我こ你的8877我的啊a";
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:65535];
    for (NSInteger i = 0; i < 65535; i++) {
        [array addObject:@0];
    }

    for (NSInteger j = 0; j < string.length; j++) {
        NSUInteger count = (NSUInteger)[string characterAtIndex:j];
        NSUInteger num = [array[count] unsignedIntegerValue];
        num++;
        array[count] = [NSNumber numberWithUnsignedInteger:num];
    }
    
    NSInteger first = 0;
    for (NSInteger k = 0; k < 65535; k++) {
        if ([array[k] unsignedIntegerValue] == 1) {
            NSString *str = [NSString stringWithFormat:@"%C", (unichar)k];
            if ([string rangeOfString:str].location + 1 < first || first == 0) {
                first = [string rangeOfString:str].location + 1;
            }
        }
    }
    
    if (first != 0) {
        NSLog(@"%@", [NSString stringWithFormat:@"%C", [string characterAtIndex:first-1]]);
    }
}
#ifdef DEBUG
- (void)cookie {
    NSHTTPCookie *cookie;;
}
#endif
- (void)convertStringToNumber {
    NSString *string = @"12345";
    const char *c = [string UTF8String];
    int result = 0;
    
}

#pragma mark 只出现一次的两个数字，其他均为成对出现
- (void)findNumberAppearOnce {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSNumber *number = [NSNumber numberWithUnsignedInteger:arc4random() % 20];
        if (i == 3) {
            [array addObject:[NSNumber numberWithInteger:1979]];
        }
        
        if (i == 7) {
            [array addObject:[NSNumber numberWithInteger:1888]];
        }
        
        if (![array containsObject:number]) {
            [array addObject:number];
            [array addObject:number];
        }
        printf("%d", i);
    }
    NSInteger xorCount = 0;
    for (int i = 0; i < array.count; i++) {
        xorCount ^= [array[i] integerValue];
    }
    
    NSUInteger indexOfOne = [self firstBinOne:xorCount];
    
    NSInteger num1 = 0;
    NSInteger num2 = 0;
    
    for (int j = 0; j < array.count; j++) {
        if ([self isBinOne:[array[j] integerValue] bit:indexOfOne]) {
            num1 ^= [array[j] integerValue];
        } else {
            num2 ^= [array[j] integerValue];
        }
    }
    NSLog(@"%ld %ld", num1, num2);
}

- (NSUInteger)firstBinOne:(NSUInteger)number {
    NSUInteger indexBit = 0;
    while ((number & 1) == 0 && indexBit < 32) {
        number = number >> 1;
        indexBit++;
    }
    
    return indexBit;
}

- (BOOL)isBinOne:(NSInteger)number bit:(NSUInteger)bit {
    number = number >> bit;
    return (number & 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
