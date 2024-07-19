//
//  Example.m
//  ObjcDemo
//
//  Created by 이원빈 on 2024/07/19.
//

#import <Foundation/Foundation.h>
#import "Example.h"

@implementation Example
//-(float) value
//{
//    return value;
//}
//-(void) setValue: (float) newValue
//{
//    value = newValue;
//}
/// 원래는 위처럼 하나하나 getter/setter 구현해주어야 하지만 @property를 썻으므로 이쪽에선 @synthesize로 받아줄 수 있다.
@synthesize value;

@end
