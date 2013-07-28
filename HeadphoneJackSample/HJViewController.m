//
//  HJViewController.m
//  HeadphoneJackSample
//
//  Created by naoty on 2013/07/22.
//  Copyright (c) 2013年 Naoto Kaneko. All rights reserved.
//

#import "HJViewController.h"
#import "HJAudioQueueObject.h"

@interface HJViewController ()

@end

@implementation HJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // オーディオセッションのアクティブ化
    AudioSessionSetActive(true);
    
    // オーディオキューを用意して入力開始
    HJAudioQueueObject *queueObject = [[HJAudioQueueObject alloc] init];
    [queueObject record];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
