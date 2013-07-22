//
//  HJViewController.m
//  HeadphoneJackSample
//
//  Created by naoty on 2013/07/22.
//  Copyright (c) 2013年 Naoto Kaneko. All rights reserved.
//

#import "HJViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

static void audioRouteChangeListenerCallback(void *inUserData, AudioSessionPropertyID inPropertyID, UInt32 inPropertyValueSize, const void *inPropertyData)
{
    NSLog(@"audioRouteChangeListenerCallback");
}

static void recordingCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, const AudioTimeStamp *inStartTime, UInt32 inNumberPacketDescriptions, const AudioStreamPacketDescription *inPacketDescs)
{
    NSLog(@"recordingCallback");
}

@interface HJViewController ()

@end

@implementation HJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // オーディオセッションの初期化
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // 録音用カテゴリの設定
    NSError *setCategoryError = nil;
    BOOL setCategorySuccess = [session setCategory:AVAudioSessionCategoryRecord error:&setCategoryError];
    if (setCategorySuccess) {
        NSLog(@"Successfully set category.");
    } else {
        NSLog(@"Failed to set category: %@", setCategoryError);
    }
    
    // オーディオの経路変化を検知する
    AudioSessionPropertyID routeChangeID = kAudioSessionProperty_AudioRouteChange;
    AudioSessionAddPropertyListener(routeChangeID, audioRouteChangeListenerCallback, NULL);
    
    // オーディオセッションのアクティブ化
    NSError *activationError = nil;
    BOOL activationSuccess = [session setActive:YES error:&activationError];
    if (activationSuccess) {
        NSLog(@"Successfully activated.");
    } else {
        NSLog(@"Failed to activate: %@", activationError);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
