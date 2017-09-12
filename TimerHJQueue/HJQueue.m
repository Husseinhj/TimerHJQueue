//
//  HJQueue.m
//  HJQueue
//
//  Created by Hussein Habibi on 6/20/1396 AP.
//  Copyright © 1396 AP Hussein.Juybari. All rights reserved.
//

#import "HJQueue.h"

@interface HJQueue()

@property (nonatomic,strong) NSMutableArray *queueArray;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation HJQueue

-(instancetype) init{
    return [self initWithMax:20 andTimerInterval:-1 andInfiniteLenght:NO];
}

-(instancetype) initInfiniteLength{
    return [self initWithMax:20 andTimerInterval:-1 andInfiniteLenght:YES];
}

-(instancetype) initWithMax:(NSInteger) max{
    return [self initWithMax:max andTimerInterval:-1 andInfiniteLenght:NO];
}

-(instancetype) initWithMax:(NSInteger) max andTimerInterval:(NSTimeInterval) timerInterval{
    return [self initWithMax:max andTimerInterval:timerInterval andInfiniteLenght:NO];
}

-(instancetype) initInfiniteLengthAndTimerInterval:(NSTimeInterval) timerInterval{
    return [self initWithMax:-1 andTimerInterval:timerInterval andInfiniteLenght:YES];
}

-(instancetype) initWithMax:(NSInteger)max andTimerInterval:(NSTimeInterval)timerInterval andInfiniteLenght:(BOOL) infiniteLength{
    self = [super init];
    
    self.max = max;
    self.infiniteLength = infiniteLength;
    self.queueArray = [NSMutableArray new];
    self.queueTimeInterval = timerInterval;
    
    return self;
}

-(void) setQueueTimeInterval:(NSTimeInterval)queueTimeInterval{
    if (queueTimeInterval >= 0) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:queueTimeInterval
                                                      target:self
                                                    selector:@selector(dequeueInTick)
                                                    userInfo:nil
                                                     repeats:YES];
        _isTimerStarted = YES;
    }
    _queueTimeInterval = queueTimeInterval;
}

-(BOOL) isEmpty{
    if([_queueArray count]==0)
        return true;
    else
        return false;
}

-(BOOL) isFull{
    if([_queueArray count] == _max)
        return true;
    else
        return false;
}

-(BOOL) enqueue:(id)object{
    if (_infiniteLength || ![self isFull]) {
        [_queueArray addObject:object];
        
        if (_isTimerStarted && !_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:_queueTimeInterval
                                                          target:self
                                                        selector:@selector(dequeueInTick)
                                                        userInfo:nil
                                                         repeats:YES];
        }
        
        return YES;
    }
    NSLog(@"### HJQueue log : queue is Full :-( ###");
    return NO;
}

-(id) dequeue{
    if([self isEmpty]){
        NSLog(@"### HJQueue log : queue is Empty :-( ###");
        return nil;
    }
    else
    {
        if ([_queueArray count] > 0)
        {
            id object = [_queueArray firstObject];
            [_queueArray removeObjectAtIndex:0];
            return object;
        }
        NSLog(@"### HJQueue log : queue is Empty :-( ###");
        return nil;
    }
}

-(id) peekFirstObject{
    if([self isEmpty]){
        NSLog(@"### HJQueue log : queue is Empty :-( ###");
        return nil;
    }
    return [_queueArray firstObject];
}

-(id) peekLastObject{
    if([self isEmpty]){
        NSLog(@"### HJQueue log : queue is Empty :-( ###");
        return nil;
    }
    return [_queueArray lastObject];
}

-(void) dequeueInTick{
    if (self.isEmpty) {
        if (_timer) {
            [_timer invalidate];
            _timer = nil;
        }
        return;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(dequeueWithTick:)]) {
        [_delegate dequeueWithTick:[self dequeue]];
    } else {
        NSLog(@"### HJQueue log : dequeueWithTick delegate was not implement by You :-( ###");
    }
}

-(BOOL) stopTimerInterval{
    _isTimerStarted = NO;
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
        return YES;
    }
    return NO;
}

@end
