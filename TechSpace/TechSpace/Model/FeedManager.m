//
//  FeedManager.m
//  TechSpace
//
//  Created by Kenichi Saito on 2/9/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

#import "FeedManager.h"

@interface FeedManager() {
    NSMutableArray* _feeds;
}

@end

@implementation FeedManager

@synthesize feeds = _feeds;

static FeedManager* _sharedInstance = nil;

+ (FeedManager*)sharedManager {
    
    if (!_sharedInstance) {
        _sharedInstance = [[FeedManager alloc] init];
    }
    
    return _sharedInstance;
}

- (id)init {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _feeds = [NSMutableArray array];
    
    return self;
}

- (NSString*)feedDir {
    NSArray* paths;
    NSString* path;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    if ([paths count] < 1) {
        return nil;
    }
    
    path = paths[0];
    
    path = [path stringByAppendingPathComponent:@".feeds"];
    
    return path;
}

- (NSString*)feedPath {
    NSString* path;
    path = [[self feedDir] stringByAppendingPathComponent:@"feed.dat"];
    
    return path;
}

- (void)save {
    NSFileManager* fileMgr;
    fileMgr = [NSFileManager defaultManager];
    
    NSString* feedDir;
    feedDir = [self feedDir];
    if (![fileMgr fileExistsAtPath:feedDir]) {
        NSError* error;
        [fileMgr createDirectoryAtPath:feedDir withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSString* feedPath;
    feedPath = [self feedDir];
    [NSKeyedArchiver archiveRootObject:_feeds toFile:feedPath];
}

- (void)load {
    NSString* feedPath;
    feedPath = [self feedDir];
    
    if (!feedPath || ![[NSFileManager defaultManager] fileExistsAtPath:feedPath]) {
        return;
    }
    
    NSArray* channels;
    channels = [NSKeyedUnarchiver unarchiveObjectWithFile:feedPath];
    if (!channels) {
        return;
    }
    
    [_feeds setArray:channels];
    NSLog(@"save successful");
}

@end
