//
//  CommonUtil.m
//  SafeContainer
//
//  Created by qinzj on 2017/10/10.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import "CommonUtil.h"

#define CORE_PRINT(x)  va_list argp;\
va_start (argp, x);\
vprintf(x,argp);\
va_end (argp);


@implementation CommonUtil

+ (void)warnLog:(const char * )msg, ...
{
    printf("--> Warning: ");
    CORE_PRINT(msg)
    printf("\n");
}

+ (BOOL)isEmptyStr:(NSString *)str
{
    BOOL empty = NO;
    if(str == nil || [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length <=0 ){
        empty = YES;
    }
    return empty;
}

@end
