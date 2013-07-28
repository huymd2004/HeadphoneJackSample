//
//  HJAudioQueueObject.m
//  HeadphoneJackSample
//
//  Created by naoty on 2013/07/25.
//  Copyright (c) 2013年 Naoto Kaneko. All rights reserved.
//

#import "HJAudioQueueObject.h"

static void recordingCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, const AudioTimeStamp *inStartTime, UInt32 inNumberPacketDescriptions, const AudioStreamPacketDescription *inPacketDescs)
{
    void* data = inBuffer->mAudioData;
    
    // もう一度バッファをオーディオキューに追加する
    AudioQueueEnqueueBuffer(inAQ, inBuffer, 0, NULL);
    
    NSLog(@"recordingCallback");
}

@implementation HJAudioQueueObject

- (id)init
{
    self = [super init];
    if (self != nil) {
        _format.mSampleRate = 44100;
        _format.mFormatID = kAudioFormatLinearPCM;
        _format.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
        _format.mFramesPerPacket = 1;
        _format.mChannelsPerFrame = 1;
        _format.mBitsPerChannel = 16;
        _format.mBytesPerPacket = 2;
        _format.mBytesPerFrame = 2;
        
        AudioQueueNewInput(&_format, recordingCallback, (__bridge void*)(self), NULL, NULL, 0, &_queue);
    }
    return self;
}

- (void)record
{
    [self setupRecording];
    AudioQueueStart(_queue, NULL);
}

- (void)setupRecording
{
    int bufferByteSize = 4096;
    int bufferIndex;
    
    for (bufferIndex = 0; bufferIndex < 20; ++bufferIndex) {
        AudioQueueBufferRef bufferRef;
        AudioQueueAllocateBuffer(_queue, bufferByteSize, &bufferRef);
        AudioQueueEnqueueBuffer(_queue, bufferRef, 0, NULL);
    }
}

@end
