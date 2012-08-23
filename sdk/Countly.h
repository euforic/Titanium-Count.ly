
// Countly.h
//
// This code is provided under the MIT License.
//
// Please visit www.count.ly for more information.

#import <Foundation/Foundation.h>


@interface Countly : NSObject {
	double unsentSessionLength;
	NSTimer *timer;
	double lastTime;
	BOOL isSuspended;
}

+ (Countly *)sharedInstance;
- (void)start:(NSString *)appKey withHost:(NSString *)appHost;
- (BOOL)isSuspended;
- (void)resume;
- (void)suspend;
- (void)exit;
@end

@interface DeviceInfo : NSObject{
}

+ (NSString *)udid;
+ (NSString *)device;
+ (NSString *)osVersion;
+ (NSString *)carrier;
+ (NSString *)resolution;
+ (NSLocale *)locale;
+ (NSString *)appVersion;
+ (NSString *)metrics;
@end