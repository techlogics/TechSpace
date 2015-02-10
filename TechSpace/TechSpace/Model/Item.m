//
//  Item.m
//  TechSpace
//
//  Created by Kenichi Saito on 2/9/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

#import "Item.h"

@interface Item()<NSCoding> {
    NSString* _identifier;
}

@end

@implementation Item

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    CFUUIDRef uuid;
    uuid = CFUUIDCreate(NULL);
    _identifier = (NSString*)CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
    CFRelease(uuid);
    
    return self;
}

- (id)initWithCoder:(NSCoder*)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _identifier = [decoder decodeObjectForKey:@"identifier"];
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder {
    [encoder encodeObject:_identifier forKey:@"identifier"];
}

- (void)dealloc {
    
    
}

@end
