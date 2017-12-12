//
//  NSSet+SafeContainer.m
//  SafeContainer
//
//  Created by qinzj on 2017/10/31.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import "NSSet+SafeContainer.h"
#import "HookUtil.h"
#import "HookSwitchManager.h"

@implementation NSSet (SafeContainer)

+ (void)load
{
    if ([HookSwitchManager disableHook]) {
        return ;
    }
    
    [HookUtil hookClassMethod:@selector(setWithObject:)
                   dstClasses:@[@"NSSet"]
             registerSelNames:@[@"SafeContainer_setWithObject:"]
                     callBack:^(BOOL ok, NSString *msg) {
        NSLog(@"------> ok:%d msg:%@",ok, msg);
    }];

    [HookUtil hookInstanceMethod:@selector(initWithSet:copyItems:)
                      dstClasses:@[@"NSSet"]
                registerSelNames:@[@"SafeContainer_initWithSet:copyItems:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(initWithArray:range:copyItems:)
                      dstClasses:@[@"NSSet"]
                registerSelNames:@[@"SafeContainer_initWithArray:range:copyItems:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];

    [HookUtil hookInstanceMethod:@selector(addObject:)
                      dstClasses:@[@"__NSSetM"]
                registerSelNames:@[@"SafeContainer_addObject:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(removeObject:)
                      dstClasses:@[@"__NSSetM"]
                registerSelNames:@[@"SafeContainer_removeObject:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(isEqualToSet:)
                      dstClasses:@[@"NSSet"]
                registerSelNames:@[@"SafeContainer_isEqualToSet:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(isSubsetOfSet:)
                      dstClasses:@[@"NSSet"]
                registerSelNames:@[@"SafeContainer_isSubsetOfSet:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(intersectsSet:)
                      dstClasses:@[@"NSSet"]
                registerSelNames:@[@"SafeContainer_intersectsSet:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(minusSet:)
                      dstClasses:@[@"NSMutableSet"]
                registerSelNames:@[@"SafeContainer_minusSet:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(unionSet:)
                      dstClasses:@[@"NSMutableSet"]
                registerSelNames:@[@"SafeContainer_unionSet:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(setSet:)
                      dstClasses:@[@"NSMutableSet"]
                registerSelNames:@[@"SafeContainer_setSet:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (NSSet *)SafeContainer_setWithObject:(id)obj
{
    if (!obj) {
        LOGW_F("%s | obj can not be nil",__FUNCTION__);
        return nil;
    }
    return [[self class] SafeContainer_setWithObject:obj];
}

- (NSSet *)SafeContainer_initWithArray:(id)obj range:(NSRange)range copyItems:(BOOL)copy
{
    if (!obj) {
        LOGW_F("%s | obj can not be nil",__FUNCTION__);
        return nil;
    }
    return [self SafeContainer_initWithArray:obj range:range copyItems:copy];
}

- (NSSet *)SafeContainer_initWithSet:(id)obj copyItems:(BOOL)copy
{
    if (!obj) {
        LOGW_F("%s | obj can not be nil",__FUNCTION__);
        return nil;
    }
    return [self SafeContainer_initWithSet:obj copyItems:copy];
}

- (void)SafeContainer_addObject:(id)obj
{
    if (!obj) {
        LOGW_F("%s | obj can not be nil",__FUNCTION__);
        return ;
    }
    return [self SafeContainer_addObject:obj];
}

- (void)SafeContainer_removeObject:(id)obj
{
    if (!obj) {
        LOGW_F("%s | obj can not be nil",__FUNCTION__);
        return ;
    }
    return [self SafeContainer_removeObject:obj];
}

- (BOOL)SafeContainer_isEqualToSet:(NSSet *)set
{
    if (![set isKindOfClass:[NSSet class]]) {
        LOGW_F("%s | set argument is not an NSSet",__FUNCTION__);
        return NO;
    }
    return [self SafeContainer_isEqualToSet:set];
}

- (BOOL)SafeContainer_isSubsetOfSet:(NSSet *)set
{
    if (![set isKindOfClass:[NSSet class]]) {
        LOGW_F("%s | set argument is not an NSSet",__FUNCTION__);
        return NO;
    }
    return [self SafeContainer_isSubsetOfSet:set];
}

- (BOOL)SafeContainer_intersectsSet:(NSSet *)set
{
    if (![set isKindOfClass:[NSSet class]]) {
        LOGW_F("%s | set argument is not an NSSet",__FUNCTION__);
        return NO;
    }
    return [self SafeContainer_intersectsSet:set];
}

- (void)SafeContainer_minusSet:(NSSet *)set
{
    if (![set isKindOfClass:[NSSet class]]) {
        LOGW_F("%s | set argument is not an NSSet",__FUNCTION__);
        return ;
    }
    return [self SafeContainer_minusSet:set];
}

- (void)SafeContainer_unionSet:(NSSet *)set
{
    if (![set isKindOfClass:[NSSet class]]) {
        LOGW_F("%s | set argument is not an NSSet",__FUNCTION__);
        return ;
    }
    return [self SafeContainer_unionSet:set];
}

- (void)SafeContainer_setSet:(NSSet *)set
{
    if (![set isKindOfClass:[NSSet class]]) {
        LOGW_F("%s | set argument is not an NSSet",__FUNCTION__);
        return ;
    }
    return [self SafeContainer_setSet:set];
}

@end
