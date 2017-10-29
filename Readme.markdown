# TimerHJQueue ![build](https://travis-ci.org/Husseinhj/TimerHJQueue.svg?branch=master) ![pod](https://img.shields.io/cocoapods/p/TimerHJQueue.svg?style=flat) ![version](https://img.shields.io/cocoapods/v/TimerHJQueue.svg?style=flat) ![li](https://img.shields.io/cocoapods/l/TimerHJQueue.svg?style=flat) ![CocoaPods](https://img.shields.io/cocoapods/dt/TimerHJQueue.svg) ![CocoaPods](https://img.shields.io/cocoapods/at/TimerHJQueue.svg)
This is a simple queue with Infinite or limit length and also dequeue periodic with timer for iOS platforms Edit Add topics

## Usage
----------
``` objc
HJQueue queue = [[HJQueue alloc] initInfiniteLength];
[queue setDelegate:self];
```
**queue :**
``` objc
[queue enqueue:@(++_counter)]
```
**dequeue :**
``` objc
NSString *obj = [queue dequeue];
```
**Time interval:**
interval is per second.
```objc
[queue setQueueTimeInterval:60];
```
**Dequeue count:**
dequeue periodic with arrayOfObjects with set dequeueCount :
``` objc
_queue.dequeueCount = 10;
```
**delegate :** 
dequeue just single object :
```objc
-(void) dequeueWithTick:(id)object{
    NSLog([NSString stringWithFormat:@"Dequeue periodic ('%.01f') with value : %@ \n",
           [queue queueTimeInterval],object]);
}
```
dequeue arrayOfObjects with set dequeueCount :
```objc
-(void) dequeueArrayWithTick:(NSArray<id> *)objects{
    NSString *message = @"";
    for (id object in objects) {
        message = [message stringByAppendingString:[NSString stringWithFormat:@"%@ \n",object]];
    }
    NSLog([NSString stringWithFormat:@"%@ Dequeue periodic ('%.01f') with value : %@ \n",_logTextView.text,[_queue queueTimeInterval],message]);
}
```

## Installation
----------
Add the following to your `Podfile`:
Install from [CocoaPod.](https://cocoapods.org/?q=TimerHJQueue)
``` ruby
    pod 'TimerHJQueue', '~> 1.0.2'
```
Then run `pod install`.
