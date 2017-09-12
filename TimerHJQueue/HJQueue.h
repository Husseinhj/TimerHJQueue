//
//  HJQueue.h
//  HJQueue
//
//  Created by Hussein Habibi on 6/20/1396 AP.
//  Copyright © 1396 AP Hussein.Juybari. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HJQueueDelegate <NSObject>

/**
 * Invoked when enqueue:object called and queueTimeInterval was set, Invoked priodic until queue was empty.
 * @author Hussein.Juybari
 *
 * @param object is you value in queue.
 */
-(void) dequeueWithTick:(id) object;

@end

@interface HJQueue : NSObject

/**
 * Maximum of queue length
 * @author Hussein.Juybari
 *
 */
@property (nonatomic) NSInteger max;

/**
 * This is readonly property and check timer was started or not.
 * @author Hussein.Juybari
 *
 */
@property (nonatomic) BOOL isTimerStarted;

/**
 * Yes means you have infinite queue length, If set YES excludes max property.
 * @author Hussein.Juybari
 *
 */
@property (nonatomic) BOOL infiniteLength;

/**
 * Interval of queue, invoke periodicly dequeueWithTick:object delegate.
 *      Note: Invoke dequeueWithTick:object when enqueue:object called.
 * @author Hussein.Juybari
 *
 */
@property (nonatomic) NSTimeInterval queueTimeInterval;

/**
 * Delegate for invoke dequeueWithTick:object.
 * @author Hussein.Juybari
 *
 */
@property (nonatomic,strong) id<HJQueueDelegate> delegate;

/**
 * Init with max = 20 and infiniteLength = NO and timer is not active.
 * @author Hussein.Juybari
 *
 */
-(instancetype) init;

/**
 * Init with infiniteLength
 * @author Hussein.Juybari
 *
 */
-(instancetype) initInfiniteLength;

/**
 * Init with max and infiniteLength = NO and timer is not active.
 * @author Hussein.Juybari
 *
 */
-(instancetype) initWithMax:(NSInteger) max;

/**
 * Init with set infiniteLength to YES and set timerInterval for dequeue priodicly.
 * @author Hussein.Juybari
 *
 */
-(instancetype) initInfiniteLengthAndTimerInterval:(NSTimeInterval) timerInterval;

/**
 * Init with max and set timerInterval for dequeue priodicly.
 * @author Hussein.Juybari
 *
 */
-(instancetype) initWithMax:(NSInteger) max andTimerInterval:(NSTimeInterval) timerInterval;

/**
 * Peek first item from queue without removing from queue.
 * @author Hussein.Juybari
 *
 */
-(id) peekFirstObject;

/**
 * Peek last item from queue without removing from queue.
 * @author Hussein.Juybari
 *
 */
-(id) peekLastObject;

/**
 * Get first object from queue and remove from queue.
 * @author Hussein.Juybari
 *
 */
-(id) dequeue;

/**
 * Insert object to queue
 * @author Hussein.Juybari
 *
 */
-(BOOL) enqueue:(id) object;

/**
 * Check queue isFull or not.
 * @author Hussein.Juybari
 *
 */
-(BOOL) isFull;

/**
 * Check queue isEmpty or not.
 * @author Hussein.Juybari
 *
 */
-(BOOL) isEmpty;

/**
 * Stop invoke timer delegate.
 * @author Hussein.Juybari
 *
 */
-(BOOL) stopTimerInterval;

@end
