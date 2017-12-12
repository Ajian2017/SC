//
//  HookSwitchManager.h
//  SafeContainerTest
//
//  Created by qinzj on 2017/12/1.
//  Copyright © 2017年 21cn. All rights reserved.
//

#import <Foundation/Foundation.h>

//考虑到有些应用可能不需要此能力,或者已经集成类似能力,加入开关控制是否开启安全容器能力

@interface HookSwitchManager : NSObject

/**
 * @return 返回是否开启安全容器能力
 */
+ (BOOL)disableHook;

/**
 * !brief 设置是否开启安全容器能力
 *
 * @param disable 如果为YES 则不开启安全容器能力 为NO开启安全容器能力
 */
+ (void)setDisableHook:(BOOL)disable;

@end
