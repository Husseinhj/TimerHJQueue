# TimerHJQueue ![travis](https://travis-ci.org/Husseinhj/TimerHJQueue.svg?branch=master) ![yamel](https://img.shields.io/cocoapods/p/TimerHJQueue.svg?style=flat)![yamel](https://img.shields.io/cocoapods/l/TimerHJQueue.svg?style=flat)
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
**delegate :** 
```objc
-(void) dequeueWithTick:(id)object{
    NSLog([NSString stringWithFormat:@"Dequeue periodic ('%.01f') with value : %@ \n",
           [queue queueTimeInterval],object]);
}
```

## Installation
----------
Add the following to your `Podfile`:
Install from [CocoaPod.](https://cocoapods.org/?q=HJqueue)
``` ruby
    pod 'HJQueue', '~> 1.0'
```
Then run `pod install`.
