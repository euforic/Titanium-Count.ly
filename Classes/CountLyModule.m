/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "CountLyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#include <UIKit/UIKit.h>
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation CountLyModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"ad1ce2b6-9511-403b-b5de-50c40542c433";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"count.ly";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)start:(id)args
{
	ENSURE_ARG_COUNT(args, 2);
	NSString* apikey = [TiUtils stringValue:[args objectAtIndex:0]];
	NSString* apiHost = [TiUtils stringValue:[args objectAtIndex:1]];
    TiThreadPerformOnMainThread(^{[[Countly sharedInstance] start:apikey withHost:apiHost];}, NO);
}


- (void)event:(id)args
{
    NSDictionary * params = [args objectAtIndex:0];
    int numberOfArgs = [params count];
    NSString* event = [TiUtils stringValue:[params objectForKey:@"name"]];
    int count = [TiUtils intValue:[params objectForKey:@"count"]];
    double sum = [TiUtils doubleValue:[params objectForKey:@"sum"]];
    NSDictionary* segmentation = [params objectForKey:@"segmentation"];

    for (id key in params) {

        NSLog(@"key: %@, value: %@", key, [params objectForKey:key]);

    }

    if([segmentation count]){

        if(sum){

            [[Countly sharedInstance]recordEvent:event segmentation:segmentation count:count sum:sum];

        }else{

            [[Countly sharedInstance]recordEvent:event segmentation:segmentation count:count];

        }

    }else if(sum){

        [[Countly sharedInstance]recordEvent:event count:count sum:sum];


    }else{

        [[Countly sharedInstance]recordEvent:event count:count];

    }

}

- (id)device
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

- (id)deviceName
{
  return [[UIDevice currentDevice] name];
}

- (id)platform
{
  return [[UIDevice currentDevice] model];
}

- (id)multitaskingSupported
{
  return NUMBOOL([[UIDevice currentDevice] isMultitaskingSupported]);
}

- (id)orientation
{
  //Obtaining the current device orientation
  UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
  
  NSString* value = @"portrait";
  
  switch(orientation){
    // Device oriented vertically, home button on the bottom
    case UIDeviceOrientationPortrait:
      value = @"PORTRAIT";
      break;
    // Device oriented vertically, home button on the bottom
    case UIDeviceOrientationPortraitUpsideDown:
      value = @"PORTRAIT_UPSIDE_DOWN";
      break;
    // Device oriented vertically, home button on the top
    case UIDeviceOrientationLandscapeLeft:
      value = @"LANDSCAPE_LEFT";
      break;
    // Device oriented horizontally, home button on the right
    case UIDeviceOrientationLandscapeRight:
      value = @"LANDSCAPE_RIGHT";
      break;
    // Device oriented flat, face up
    case UIDeviceOrientationFaceUp:
      value = @"FACE_UP";
      break;
    // Device oriented flat, face down
    case UIDeviceOrientationFaceDown:
      value = @"FACE_DOWN";
      break;
    default:
      value = @"UNKNOWN";
      break;
  }

  return value;
}

- (id)osVersion
{
	return [[UIDevice currentDevice] systemVersion];
}

- (id)systemName
{
  return [[UIDevice currentDevice] systemName];
}

- (id)carrier
{
	if (NSClassFromString(@"CTTelephonyNetworkInfo"))
	{
		CTTelephonyNetworkInfo *netinfo = [[[CTTelephonyNetworkInfo alloc] init] autorelease];
		CTCarrier *carrier = [netinfo subscriberCellularProvider];
    if ([carrier carrierName]) {
      return [carrier carrierName];
    }
		return @"Simulator";
	}

	return @"Unknown";
}

- (id)resolution
{
	CGRect bounds = [[UIScreen mainScreen] bounds];
	CGFloat scale = [[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.f;
	CGSize res = CGSizeMake(bounds.size.width * scale, bounds.size.height * scale);
	return [TiUtils sizeToDictionary:res];
  
}

- (id)locale
{
	return [[NSLocale currentLocale] localeIdentifier];
}

- (id)appVersion
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}

- (id)proximityState
{
  return NUMBOOL([[UIDevice currentDevice] proximityState]);
}

@end