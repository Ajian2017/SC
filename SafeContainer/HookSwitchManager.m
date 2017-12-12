//
//  HookSwitchManager.m
//  SafeContainerTest
//
//  Created by qinzj on 2017/12/1.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import "HookSwitchManager.h"

@implementation HookSwitchManager

+ (BOOL)disableHook
{
    static BOOL readLocal = NO;
    static BOOL disableHook = NO;
    if (readLocal == NO) {
        disableHook = [[NSUserDefaults standardUserDefaults] boolForKey:[[self class] disableHookKey]];
        readLocal = YES;
    }
    return disableHook;
}

+ (void)setDisableHook:(BOOL)disable
{
    [[NSUserDefaults standardUserDefaults] setBool:disable forKey:[[self class] disableHookKey]];
}

+ (NSString *)disableHookKey
{
    NSString *str = [NSString stringWithFormat:@"%s",__FUNCTION__];
    return [str stringByAppendingString:@"_disableHook"];
}

@end
