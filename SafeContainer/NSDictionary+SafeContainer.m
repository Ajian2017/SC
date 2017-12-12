//
//  NSDictionary+SafeContainer.m
//  SafeContainer
//
//  Created by qinzj on 2017/10/10.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import "NSDictionary+SafeContainer.h"
#import "HookUtil.h"
#import "HookSwitchManager.h"

@implementation NSDictionary (SafeContainer)

+ (void)load
{
    if ([HookSwitchManager disableHook]) {
        return ;
    }
//    [HookUtil hookClassMethod:@selector(dictionaryWithObjectsAndKeys:)
//                   dstClasses:@[@"NSDictionary"]
//             registerSelNames:@[@"SafeContainer_dictionaryWithObjectsAndKeys:"]
//                     callBack:^(BOOL ok, NSString *msg) {
//                         NSLog(@"-------ok:%d msg:%@",ok, msg);
//                     }];
    
    [HookUtil hookClassMethod:@selector(dictionaryWithObjects:forKeys:)
                   dstClasses:@[@"NSDictionary"]
             registerSelNames:@[@"SafeContainer_dictionaryWithObjects:forKeys:"]
                     callBack:^(BOOL ok, NSString *msg) {
                         NSLog(@"------> ok:%d msg:%@",ok, msg);
                     }];
    
    [HookUtil hookInstanceMethod:@selector(initWithObjects:forKeys:)
                      dstClasses:@[@"NSDictionary"]
                registerSelNames:@[@"SafeContainer_initWithObjects:forKeys:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(removeObjectForKey:)
                      dstClasses:@[@"__NSDictionaryM"]
                registerSelNames:@[@"SafeContainer_removeObjectForKey:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(setObject:forKey:)
                      dstClasses:@[@"__NSDictionaryM"]
                registerSelNames:@[@"SafeContainer_setObject:forKey:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
    [HookUtil hookInstanceMethod:@selector(setObject:forKeyedSubscript:)
                      dstClasses:@[@"__NSDictionaryM"]
                registerSelNames:@[@"SafeContainer_setObject:forKeyedSubscript:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
    
//    [HookUtil hookInstanceMethod:@selector(setObject:forKey:)
//                      dstClasses:@[@"__NSDictionary0"]
//                registerSelNames:@[@"SafeContainer_0_setObject:forKey:"]
//                        callBack:^(BOOL ok, NSString *msg) {
//                            NSLog(@"------> ok:%d msg:%@",ok, msg);
//                        }];

}

+ (id)SafeContainer_dictionaryWithObjects:(NSArray *)objs forKeys:(NSArray *)keys
{
    if (objs.count != keys.count) {
        LOGW_F("%s | count of objects (%d) differs from count of keys (%d)",__FUNCTION__,objs.count, keys.count);
        return nil;
    }
    return [[self class] SafeContainer_dictionaryWithObjects:objs forKeys:keys];
}

- (id)SafeContainer_initWithObjects:(NSArray *)objs forKeys:(NSArray *)keys
{
    if (objs.count != keys.count) {
        LOGW_F("%s | count of objects (%d) differs from count of keys (%d)",__FUNCTION__,objs.count, keys.count);
        return nil;
    }
    return [self SafeContainer_initWithObjects:objs forKeys:keys];
}

- (void)SafeContainer_removeObjectForKey:(id)key
{
    if (!key) {
        LOGW_F("%s | key cannot be nil",__FUNCTION__);
        return ;
    }
    return [self SafeContainer_removeObjectForKey:key];
}

- (void)SafeContainer_setObject:(id)obj forKey:(id)key
{
    if (!key) {
        LOGW_F("%s | key cannot be nil",__FUNCTION__);
        return ;
    }
    
    if (!obj) {
        LOGW_F("%s | object cannot be nil",__FUNCTION__);
        return ;
    }

    return [self SafeContainer_setObject:obj forKey:key];
}

- (void)SafeContainer_setObject:(id)obj forKeyedSubscript:(id)key
{
    if (!key) {
        LOGW_F("%s | key cannot be nil",__FUNCTION__);
        return ;
    }
    
    if (!obj) {
        //obj为nil 移除该Key
        [self SafeContainer_removeObjectForKey:key];
        return ;
    }
    
    return [self SafeContainer_setObject:obj forKeyedSubscript:key];
}

- (void)SafeContainer_0_setObject:(id)obj forKey:(id)key
{
    if (!key) {
        LOGW_F("%s | key cannot be nil",__FUNCTION__);
        return ;
    }

    if (!obj) {
        LOGW_F("%s | object cannot be nil",__FUNCTION__);
        return ;
    }

    return [self SafeContainer_0_setObject:obj forKey:key];
}

//+ (id)SafeContainer_dictionaryWithObjectsAndKeys:(NSString *)firstObject, ...
//{
//
//    NSMutableString *mstr = [[NSMutableString alloc] init];
//
//    va_list list;
//    //使用第一个参数来初使化list指针
//    va_start(list, firstObject);
//    while (YES)
//    {
//        //返回可变参数，va_arg第二个参数为可变参数类型，如果有多个可变参数，依次调用可获取各个参数
//        NSString *string = va_arg(list, NSString*);
//        if (!string) {
//            break;
//        }
//        [mstr appendString:string];
//        NSLog(@"%@",string);
//    }
//    //结束可变参数的获取
//    va_end(list);
//
//    return [[self class] SafeContainer_dictionaryWithObjectsAndKeys:mstr];
//}

@end
