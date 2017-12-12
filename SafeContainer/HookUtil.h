//
//  HookUtil.h
//  189Mail
//
//  Created by qinzj on 2017/10/9.
//

#import <Foundation/Foundation.h>
#import "CommonUtil.h"

@interface HookUtil : NSObject

+ (void)hookClassMethod:(SEL)srcSel
             dstClasses:(NSArray<NSString *> *)clsNames
       registerSelNames:(NSArray<NSString *> *)selNames
               callBack:(void (^)(BOOL ok, NSString *msg))block;

+ (void)hookInstanceMethod:(SEL)srcSel
                dstClasses:(NSArray<NSString *> *)clsNames
          registerSelNames:(NSArray<NSString *> *)selNames
                  callBack:(void (^)(BOOL ok, NSString *msg))block;

@end
