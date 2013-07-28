//
//  HJAudioQueueObject.h
//  HeadphoneJackSample
//
//  Created by naoty on 2013/07/25.
//  Copyright (c) 2013年 Naoto Kaneko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface HJAudioQueueObject : NSObject
{
    AudioQueueRef _queue;
    AudioStreamBasicDescription _format;
}

- (void)record;

@end
