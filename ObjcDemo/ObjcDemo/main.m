//
//  main.m
//  ObjcDemo
//
//  Created by 이원빈 on 7/18/24.
//

#import <Foundation/Foundation.h>

/*
 // MARK: 클래스 정의
 
 // MARK: 특징
 - Objective-C 에서는 instance variable 과 같은 이름의 method를 가지는 것이 가능하다.
 
*/
@interface Song : NSObject
{
    NSString *name; // instance variable
    NSString *artist;
}
-(NSString*) name; // instance method
-(NSString*) artist;

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
//        id mySong = [[Song alloc] init];
        /// id 타입은 모든 객체를 두루 포인팅할 수 있는 타입이다.
        /// mySong 은 Song 이라는 타입의 객체를 포인팅한다.
        /// id 타입은 객체에 대해 어떠한 정보도 가지고 있지 않다. 그래서 isa 라는 instnace variable을 명시적으로 가져 실제 객체가 어떤 타입인지
        /// 기록해놓는다. runtime 시에 알아낼 수 있음. 이런 메커니즘을 이용해 dynamic typing이 가능해짐.
    }
    return 0;
}
