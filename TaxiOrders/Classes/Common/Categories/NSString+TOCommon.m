//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "NSString+TOCommon.h"

@implementation NSString (TOCommon)

+ (NSString *)to_stringFromUTF8String:(NSString *)UTF8String {
    NSData *data = [UTF8String dataUsingEncoding:NSUTF8StringEncoding];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)to_UTF8String {
    return [NSString to_stringFromUTF8String:self];
}

@end