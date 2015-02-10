//
//  FeedManager.h
//  TechSpace
//
//  Created by Kenichi Saito on 2/9/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedManager : NSObject
@property (nonatomic, readonly) NSArray* feeds;

+ (FeedManager*)sharedManager;
- (void)save;
- (void)load;
@end
