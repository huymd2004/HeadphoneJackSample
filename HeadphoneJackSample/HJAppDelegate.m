//
//  HJAppDelegate.m
//  HeadphoneJackSample
//
//  Created by naoty on 2013/07/22.
//  Copyright (c) 2013年 Naoto Kaneko. All rights reserved.
//

#import "HJAppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>

// 割り込み時コールバック
static void interruptionCallback(void *inUserData, UInt32 interruptionStatus)
{
    NSLog(@"interruptionCallback");
}

// 経路変化時コールバック
static void audioRouteChangeListenerCallback(void *inUserData, AudioSessionPropertyID inPropertyID, UInt32 inPropertyValueSize, const void *inPropertyData)
{
    NSLog(@"audioRouteChangeListenerCallback");
}

@implementation HJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // オーディオセッションの初期化
    AudioSessionInitialize(NULL, NULL, interruptionCallback, (__bridge void *)(self));
    
    // 録音用カテゴリの設定
    UInt32 sessionCategory = kAudioSessionCategory_RecordAudio;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(sessionCategory), &sessionCategory);
    
    // オーディオの経路変化を検知する
    AudioSessionPropertyID routeChangeID = kAudioSessionProperty_AudioRouteChange;
    AudioSessionAddPropertyListener(routeChangeID, audioRouteChangeListenerCallback, NULL);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
