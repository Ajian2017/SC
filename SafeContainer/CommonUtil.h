//
//  CommonUtil.h
//  SafeContainer
//
//  Created by qinzj on 2017/10/10.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOGW_F(fmt, ...) [CommonUtil warnLog:fmt,__VA_ARGS__];
#define LOGW(fmt)        [CommonUtil warnLog:fmt];

#define IS_EMPTY_STR(x) [CommonUtil isEmptyStr:x]

@interface  CommonUtil: NSObject

+ (void)warnLog:(const char * )msg, ...;

+ (BOOL)isEmptyStr:(NSString *)str;


@end
