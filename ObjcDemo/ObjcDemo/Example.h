//
//  Example.h
//  ObjcDemo
//
//  Created by 이원빈 on 2024/07/19.
//

#ifndef Example_h
#define Example_h

@interface Example : NSObject
{
    float value;
}
//- (float)value;
//- (void)setValue:(float)newValue;
/// 원래는 위처럼 getter, setter 를 선언해주었다. 하지만 @property를 이용하면 아래처럼 표현 가능하다.
@property float value;
@end

#endif
