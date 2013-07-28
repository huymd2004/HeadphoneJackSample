//
//  HJViewController.h
//  HeadphoneJackSample
//
//  Created by naoty on 2013/07/22.
//  Copyright (c) 2013年 Naoto Kaneko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface HJViewController : UIViewController
{
    AudioQueueRef _queue;
}

@end
