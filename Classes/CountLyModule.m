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


/// Tool to decoded urld encoded string that Count.ly uses to send metrics
/// Utilities for encoding and decoding URL arguments.
/// This code is from the project google-toolbox-for-mac
@interface NSString (GTMNSStringURLArgumentsAdditions)

/// Returns a string that is escaped properly to be a URL argument.
//
/// This differs from stringByAddingPercentEscapesUsingEncoding: in that it
/// will escape all the reserved characters (per RFC 3986
/// <http://www.ietf.org/rfc/rfc3986.txt>) which
/// stringByAddingPercentEscapesUsingEncoding would leave.
///
/// This will also escape '%', so this should not be used on a string that has
/// already been escaped unless double-escaping is the desired result.
- (NSString*)gtm_stringByEscapingForURLArgument;

/// Returns the unescaped version of a URL argument
//
/// This has the same behavior as stringByReplacingPercentEscapesUsingEncoding:,
/// except that it will also convert '+' to space.
- (NSString*)gtm_stringByUnescapingFromURLArgument;

@end

#define GTMNSMakeCollectable(cf) ((id)(cf))
#define GTMCFAutorelease(cf) ([GTMNSMakeCollectable(cf) autorelease])

@implementation NSString (GTMNSStringURLArgumentsAdditions)

- (NSString*)gtm_stringByEscapingForURLArgument {
	// Encode all the reserved characters, per RFC 3986
	// (<http://www.ietf.org/rfc/rfc3986.txt>)
	CFStringRef escaped =
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
	return GTMCFAutorelease(escaped);
}

- (NSString*)gtm_stringByUnescapingFromURLArgument {
	NSMutableString *resultString = [NSMutableString stringWithString:self];
	[resultString replaceOccurrencesOfString:@"+"
								  withString:@" "
									 options:NSLiteralSearch
									   range:NSMakeRange(0, [resultString length])];
	return [resultString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end

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

-(void)resume:(id)args
{
    [[Countly sharedInstance] resume];
}

-(void)suspend:(id)args
{
    [[Countly sharedInstance] suspend];

}

-(void)exit:(id)args
{
    [[Countly sharedInstance] exit];

}

-(NSNumber*)isSuspended
{
    return NUMBOOL([[Countly sharedInstance] isSuspended]);
}

-(NSString*)udid
{
    NSString *udid = [DeviceInfo udid];
	return udid;
}

-(NSString*)device
{
    NSString *device = [DeviceInfo device];
	return device;
}

-(NSString*)osVersion
{
    NSString *osVersion = [DeviceInfo osVersion];
	return osVersion;
}

-(NSString*)carrier
{
    NSString *carrier = [DeviceInfo carrier];
	return carrier;
}

-(NSString*)resolution
{
    NSString *resolution = [DeviceInfo resolution];
	return resolution;
}

-(id)locale
{
    NSLocale *locale = [DeviceInfo locale];
	return locale;
}

-(NSString*)metrics
{
    NSString *metrics = [[DeviceInfo metrics] gtm_stringByUnescapingFromURLArgument];
	return metrics;
}

@end
