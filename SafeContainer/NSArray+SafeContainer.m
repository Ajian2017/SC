//
//  NSArray+SafeContainer.m
//  SafeContainer
//
//  Created by qinzj on 2017/10/16.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import "NSArray+SafeContainer.h"
#import "HookUtil.h"
#import "HookSwitchManager.h"

#define CHECK_INPUT_INDEX_EXCEPTION(index)if (index >= self.count) {\
LOGW_F("%s | index %d beyond array count %d",__FUNCTION__,index, self.count);\
return nil;\
}

#define CHECK_INPUT_ARRAY_EXCEPTION(arr) if (arr && ![arr isKindOfClass:[NSArray class]]) {\
    LOGW_F("%s | otherArray argument is not an NSArray",__FUNCTION__);\
    return ;\
}

#define CHECK_INPUT_RANGE_EXCEPTION(range) if (range.location > self.count || range.location + range.length > self.count) {\
LOGW_F("%s | range {%d,%d} beyond array count %d",__FUNCTION__,range.location, range.length, self.count);\
return ;\
}

#define CHECK_INPUT_RANGE_EXCEPTION_WITH_FEEDBACK if (range.location > self.count || range.location + range.length > self.count) {\
LOGW_F("%s | range {%d,%d} beyond count %d",__FUNCTION__,range.location, range.length, self.count);\
return NSNotFound;\
}

#define CHECK_INPUT_RANGE_EXCEPTION_WITH_COUNT(range, count) if (range.location > count || range.location + range.length > count) {\
LOGW_F("%s | range {%d,%d} beyond array count %d",__FUNCTION__,range.location, range.length, count);\
return ;\
}

@implementation NSArray (SafeContainer)

+ (void)load
{
    if ([HookSwitchManager disableHook]) {
        return ;
    }
    [[self class] hookObjectAtIndexedSubscript];
    [[self class] hookObjectAtIndex];
    [[self class] hookIndexOfObjectInRange];
    [[self class] hookIndexOfObjectIdenticalInRange];
    
    [[self class] hookArrayWithObject];
    [[self class] hookInsertObjectAtIndex];
    [[self class] hookSetObjectAtIndexedSubscript];
    [[self class] hookInsertObjectsAtIndexs];
    
    [[self class] hookRemoveObjectsInRange];
    [[self class] hookRemoveObjectInRange];
    [[self class] hookRemoveObjectIdenticalToInRange];
    [[self class] hookRemoveObjectsAtIndexes];

    [[self class] hookReplaceObjectAtIndex];
    [[self class] hookReplaceObjectsInRanges];
    [[self class] hookReplaceObjectsInRange];
    [[self class] hookReplaceObjectsInIndexes];

    [[self class] hookExchangeObjectAtIndex];

}

+ (void)hookReplaceObjectsInIndexes
{
    [HookUtil hookInstanceMethod:@selector(replaceObjectsAtIndexes:withObjects:)
                      dstClasses:@[@"NSMutableArray"]
                registerSelNames:@[@"SafeContainer_replaceObjectsAtIndexes:withObjects:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}


+ (void)hookReplaceObjectsInRange
{
    [HookUtil hookInstanceMethod:@selector(replaceObjectsInRange:withObjectsFromArray:)
                      dstClasses:@[@"NSMutableArray"]
                registerSelNames:@[@"SafeContainer_replaceObjectsInRange:withObjectsFromArray:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookReplaceObjectsInRanges
{
    [HookUtil hookInstanceMethod:@selector(replaceObjectsInRange:withObjectsFromArray:range:)
                      dstClasses:@[@"NSMutableArray"]
                registerSelNames:@[@"SafeContainer_replaceObjectsInRange:withObjectsFromArray:range:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookExchangeObjectAtIndex
{
    [HookUtil hookInstanceMethod:@selector(exchangeObjectAtIndex:withObjectAtIndex:)
                      dstClasses:@[@"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_exchangeObjectAtIndex:withObjectAtIndex:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookReplaceObjectAtIndex
{
    [HookUtil hookInstanceMethod:@selector(replaceObjectAtIndex:withObject:)
                      dstClasses:@[@"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_replaceObjectAtIndex:withObject:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookRemoveObjectsInRange
{
    [HookUtil hookInstanceMethod:@selector(removeObjectsInRange:)
                      dstClasses:@[@"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_removeObjectsInRange:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookRemoveObjectIdenticalToInRange
{
    [HookUtil hookInstanceMethod:@selector(removeObjectIdenticalTo:inRange:)
                      dstClasses:@[@"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_removeObjectIdenticalTo:inRange:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookRemoveObjectsAtIndexes
{
    [HookUtil hookInstanceMethod:@selector(removeObjectsAtIndexes:)
                      dstClasses:@[@"NSMutableArray"]
                registerSelNames:@[@"SafeContainer_removeObjectsAtIndexes:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookRemoveObjectInRange
{
    [HookUtil hookInstanceMethod:@selector(removeObject:inRange:)
                      dstClasses:@[@"NSMutableArray"]
                registerSelNames:@[@"SafeContainer_removeObject:inRange:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookInsertObjectAtIndex
{
    [HookUtil hookInstanceMethod:@selector(insertObject:atIndex:)
                      dstClasses:@[@"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_insertObject:atIndex:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookSetObjectAtIndexedSubscript
{
    [HookUtil hookInstanceMethod:@selector(setObject:atIndexedSubscript:)
                      dstClasses:@[@"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_setObject:atIndexedSubscript:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookInsertObjectsAtIndexs
{
    [HookUtil hookInstanceMethod:@selector(insertObjects:atIndexes:)
                      dstClasses:@[@"NSMutableArray"]
                registerSelNames:@[@"SafeContainer_insertObjects:atIndexes:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookArrayWithObject
{
    [HookUtil hookClassMethod:@selector(arrayWithObject:)
                   dstClasses:@[@"NSArray"]
             registerSelNames:@[@"SafeContainer_arrayWithObject:"]
                     callBack:^(BOOL ok, NSString *msg) {
                         NSLog(@"------> ok:%d msg:%@",ok, msg);
                     }];
}

+ (void)hookObjectAtIndexedSubscript
{
    [HookUtil hookInstanceMethod:@selector(objectAtIndexedSubscript:)
                      dstClasses:@[@"__NSArrayI", @"__NSArrayM"]
                registerSelNames:@[@"SafeContainer_I_objectAtIndexedSubscript:",@"SafeContainer_M_objectAtIndexedSubscript:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookObjectAtIndex
{
    [HookUtil hookInstanceMethod:@selector(objectAtIndex:)
                      dstClasses:@[@"__NSSingleObjectArrayI", @"__NSArrayI", @"__NSArrayM", @"__NSArray0"]
                registerSelNames:@[@"SafeContainer_SingleObjectAtIndex:",@"SafeContainer_I_objectAtIndex:",@"SafeContainer_M_objectAtIndex:",@"SafeContainer_0_objectAtIndex:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookIndexOfObjectInRange
{
    [HookUtil hookInstanceMethod:@selector(indexOfObject:inRange:)
                      dstClasses:@[@"NSArray"]
                registerSelNames:@[@"SafeContainer_indexOfObject:inRange:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (void)hookIndexOfObjectIdenticalInRange
{
    [HookUtil hookInstanceMethod:@selector(indexOfObjectIdenticalTo:inRange:)
                      dstClasses:@[@"NSArray"]
                registerSelNames:@[@"SafeContainer_indexOfObjectIdenticalTo:inRange:"]
                        callBack:^(BOOL ok, NSString *msg) {
                            NSLog(@"------> ok:%d msg:%@",ok, msg);
                        }];
}

+ (id)SafeContainer_arrayWithObject:(id)obj
{
    if (!obj) {
        LOGW_F("%s | attempt to insert nil object from objects[0]",__FUNCTION__);
        return nil;
    }
    return [self SafeContainer_arrayWithObject:obj];
}

#pragma mark - lookup

- (id)SafeContainer_SingleObjectAtIndex:(NSUInteger)index
{
    CHECK_INPUT_INDEX_EXCEPTION(index)
    return [self SafeContainer_SingleObjectAtIndex:index];
}

- (id)SafeContainer_I_objectAtIndex:(NSUInteger)index
{
    CHECK_INPUT_INDEX_EXCEPTION(index)
    return [self SafeContainer_I_objectAtIndex:index];
}

- (id)SafeContainer_M_objectAtIndex:(NSUInteger)index
{
    CHECK_INPUT_INDEX_EXCEPTION(index)
    return [self SafeContainer_M_objectAtIndex:index];
}

- (id)SafeContainer_I_objectAtIndexedSubscript:(NSUInteger)index
{
    CHECK_INPUT_INDEX_EXCEPTION(index)
    return [self SafeContainer_I_objectAtIndexedSubscript:index];
}

- (id)SafeContainer_M_objectAtIndexedSubscript:(NSUInteger)index
{
    CHECK_INPUT_INDEX_EXCEPTION(index)
    return [self SafeContainer_M_objectAtIndexedSubscript:index];
}

- (id)SafeContainer_0_objectAtIndex:(NSUInteger)index
{
    CHECK_INPUT_INDEX_EXCEPTION(index)
    return [self SafeContainer_0_objectAtIndex:index];
}

- (NSUInteger)SafeContainer_indexOfObject:(id)anObject inRange:(NSRange)range
{
    CHECK_INPUT_RANGE_EXCEPTION_WITH_FEEDBACK
    return [self SafeContainer_indexOfObject:anObject inRange:range];
}

- (NSUInteger)SafeContainer_indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
    CHECK_INPUT_RANGE_EXCEPTION_WITH_FEEDBACK
    return [self SafeContainer_indexOfObjectIdenticalTo:anObject inRange:range];
}

#pragma mark - insert

- (void)SafeContainer_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (!anObject) {
        LOGW_F("%s | object cannot be nil",__FUNCTION__);
        return ;
    }
    if (index > self.count) {
        LOGW_F("%s | index %d beyond array count %d",__FUNCTION__, index, self.count);
        return ;
    }
    return [self SafeContainer_insertObject:anObject atIndex:index];
}

- (void)SafeContainer_setObject:(id)anObject atIndexedSubscript:(NSUInteger)index
{
    if (index > self.count) {
        LOGW_F("%s | index %d beyond array count %d",__FUNCTION__, index, self.count);
        return ;
    }
    return [self SafeContainer_setObject:anObject atIndexedSubscript:index];
}

- (void)SafeContainer_insertObjects:(NSArray *)objs atIndexes:(NSIndexSet *)indexs
{
    CHECK_INPUT_ARRAY_EXCEPTION(objs)
    
    if (indexs.count != objs.count) {
        LOGW_F("%s | count of array (%d) differs from count of index set (%d)",__FUNCTION__,objs.count, indexs.count);
        return ;
    }
    
    if (indexs.firstIndex > self.count) {
        LOGW_F("%s | first index %d in index set beyond array count %d",__FUNCTION__,indexs.firstIndex, self.count);
        return ;
    }

    return [self SafeContainer_insertObjects:objs atIndexes:indexs];
}

#pragma mark - remove

- (void)SafeContainer_removeObjectsInRange:(NSRange)range
{
    CHECK_INPUT_RANGE_EXCEPTION(range)
    return [self SafeContainer_removeObjectsInRange:range];
}

- (void)SafeContainer_removeObject:(id)anObject inRange:(NSRange)range
{
    CHECK_INPUT_RANGE_EXCEPTION(range)
    return [self SafeContainer_removeObject:anObject inRange:range];
}

- (void)SafeContainer_removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
    CHECK_INPUT_RANGE_EXCEPTION(range)
    return [self SafeContainer_removeObjectIdenticalTo:anObject inRange:range];
}

- (void)SafeContainer_removeObjectsAtIndexes:(NSIndexSet *)indexs
{
    if (indexs.firstIndex > self.count) {
        LOGW_F("%s | first index %d in index set beyond array count %d",__FUNCTION__,indexs.firstIndex, self.count);
        return ;
    }
    
    if (indexs.firstIndex + indexs.count > self.count) {
        LOGW_F("%s | indexSet {%d,%d} beyond array count %d",__FUNCTION__,indexs.firstIndex, indexs.count, self.count);
        return ;
    }
    return [self SafeContainer_removeObjectsAtIndexes:indexs];
}

#pragma mark - replace

- (void)SafeContainer_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (!anObject) {
        LOGW_F("%s | object cannot be nil",__FUNCTION__);
        return ;
    }
    if (index >= self.count) {
        LOGW_F("%s | index %d beyond array count %d",__FUNCTION__, index, self.count);
        return ;
    }
    return [self SafeContainer_replaceObjectAtIndex:index withObject:anObject];
}

- (void)SafeContainer_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray
{
    CHECK_INPUT_ARRAY_EXCEPTION(otherArray)
    CHECK_INPUT_RANGE_EXCEPTION(range)
    return [self SafeContainer_replaceObjectsInRange:range withObjectsFromArray:otherArray];
}

- (void)SafeContainer_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange
{
    CHECK_INPUT_ARRAY_EXCEPTION(otherArray)
    CHECK_INPUT_RANGE_EXCEPTION(range)
    CHECK_INPUT_RANGE_EXCEPTION_WITH_COUNT(otherRange, otherArray.count)
    return [self SafeContainer_replaceObjectsInRange:range withObjectsFromArray:otherArray range:otherRange];
}

- (void)SafeContainer_replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
    CHECK_INPUT_ARRAY_EXCEPTION(objects)

    if (indexes.count != objects.count) {
        LOGW_F("%s | count of array (%d) differs from count of index set (%d)",__FUNCTION__,objects.count, indexes.count);
        return ;
    }

    if (indexes.firstIndex > self.count) {
        LOGW_F("%s | first index %d in index set beyond array count %d",__FUNCTION__,indexes.firstIndex, self.count);
        return ;
    }
    
    if (indexes.firstIndex + indexes.count > self.count) {
        LOGW_F("%s | index %d in index set beyond array count %d",__FUNCTION__,indexes.firstIndex + indexes.count, self.count);
        return ;
    }
    
    [self SafeContainer_replaceObjectsAtIndexes:indexes withObjects:objects];
}

#pragma mark - exchange

- (void)SafeContainer_exchangeObjectAtIndex:(NSUInteger)index withObjectAtIndex:(NSUInteger)index2
{
    if (index >= self.count) {
        LOGW_F("%s | index %d beyond array count %d",__FUNCTION__,index, self.count);
        return ;
    }
    if (index2 >= self.count) {
        LOGW_F("%s | index2 %d beyond array count %d",__FUNCTION__, index, self.count);
        return ;
    }
    return [self SafeContainer_exchangeObjectAtIndex:index withObjectAtIndex:index2];
}

@end
