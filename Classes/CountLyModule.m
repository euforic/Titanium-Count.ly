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
#import "Countly.h"

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
	// this method is called when the module is first loaded
	// you *must* call the superclass
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

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)start:(id)args
{
	ENSURE_ARG_COUNT(args, 2);
	NSString* apikey = [TiUtils stringValue:[args objectAtIndex:0]];
	NSString* apiHost = [TiUtils stringValue:[args objectAtIndex:1]];
    TiThreadPerformOnMainThread(^{[[Countly sharedInstance] start:apikey withHost:apiHost];}, NO);
}

-(id)udid
{
    NSString *udid = [DeviceInfo udid];
	return udid;
}

-(id)device
{
    NSString *device = [DeviceInfo device];
	return device;
}

-(id)osVersion
{
    NSString *osVersion = [DeviceInfo osVersion];
	return osVersion;
}

-(id)carrier
{
    NSString *carrier = [DeviceInfo carrier];
	return carrier;
}

-(id)resolution
{
    NSString *resolution = [DeviceInfo resolution];
	return resolution;
}

-(id)locale
{
    NSString *locale = [DeviceInfo locale];
	return locale;
}

-(id)platform
{
    NSString *platform = [DeviceInfo platform];
	return platform;
}

-(id)metrics
{
    NSString *metrics = [DeviceInfo platform];
	return metrics;
}

@end
