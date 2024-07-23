//
//  NSString+Reverse.m
//  ObjcDemo
//
//  Created by 이원빈 on 7/23/24.
//

#import "NSString+Reverse.h"

@implementation NSString (Reverse)

- (NSString *)reverseString {
    NSUInteger length = [self length];
    NSMutableString *reveredString = [NSMutableString stringWithCapacity:length];
    
    for (NSInteger i = length - 1; i >= 0; i--) {
        [reveredString appendFormat:@"%C", [self characterAtIndex:i]];
    }
    
    return reveredString;
}

@end
