//
//  HookUtil.m
//  189Mail
//
//  Created by qinzj on 2017/10/9.
//

#import "HookUtil.h"
#import <objc/runtime.h>

@implementation HookUtil


#define CallBlock(ok, msg) if(block) { block(ok, msg);}

+ (void)hookClassMethod:(SEL)srcSel
             dstClasses:(NSArray<NSString *> *)clsNames
       registerSelNames:(NSArray<NSString *> *)selNames
               callBack:(void (^)(BOOL ok, NSString *msg))block
{
    [HookUtil hookMethodImplement:srcSel
                       dstClasses:clsNames
                 registerSelNames:selNames
                       methodType:YES
                         callBack:block];
}

+ (void)hookInstanceMethod:(SEL)srcSel
                dstClasses:(NSArray<NSString *> *)clsNames
          registerSelNames:(NSArray<NSString *> *)selNames
                  callBack:(void (^)(BOOL ok, NSString *msg))block
{
    [HookUtil hookMethodImplement:srcSel
                       dstClasses:clsNames
                 registerSelNames:selNames
                       methodType:NO
                         callBack:block];
}

+ (void)hookMethodImplement:(SEL)srcSel
                 dstClasses:(NSArray<NSString *> *)clsNames
           registerSelNames:(NSArray<NSString *> *)selNames
                 methodType:(BOOL)class
                   callBack:(void (^)(BOOL ok, NSString *msg))block
{
    if (clsNames.count != selNames.count) {
        CallBlock(NO, @"clsNames.count != selNames.count")
        return ;
    }
    
    void (^coreHook) (NSString *clsName, NSString *selName) = ^(NSString *clsName, NSString *selName){
        if (IS_EMPTY_STR(selName) || IS_EMPTY_STR(clsName)) {
            CallBlock(NO, @"selName or clsName is nil")
            return ;
        }
        SEL newSel = sel_registerName([selName UTF8String]);
        Class cls = NSClassFromString(clsName);
        Method srcMethod = class ? class_getClassMethod(cls, srcSel) : class_getInstanceMethod(cls, srcSel);
        Method newMethod = class ? class_getClassMethod(cls, newSel) : class_getInstanceMethod(cls, newSel);
        if (srcMethod && newMethod) {
            method_exchangeImplementations(srcMethod, newMethod);
            CallBlock(YES, nil)
        }else{
            CallBlock(NO, @"srcMethod or newMethod is nil")
        }
    };

    [clsNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        coreHook(obj, selNames[idx]);
    }];
    return ;
}

@end
