//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TOCommon)

+ (NSString *)to_stringFromUTF8String:(NSString *)UTF8String;

- (NSString *)to_UTF8String;

@end