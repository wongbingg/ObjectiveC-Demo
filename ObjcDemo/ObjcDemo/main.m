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

/*
 // MARK: 메세지 호출법
 
 
 ex) [객체 method]
 ex) [receiver message]
 receiver 라는 객체가 message 라는 메서드를 호출할 때 위처럼 표현.
 
 ex) [myRect setWidth:10.0 height:15.0]
 myRect 라는 객체에 setWidth 라는 함수를 실행.
 
 ex) -(void) setWidth: (float) width height: (float) height
             [메서드이름]         [인자]  [이름]           [인자]
 
 제일 앞의 - 는 이 메서드가 instance method 라는 것을 의미.  + 는 class method를 의미.
 (void) 는 반환값 타입을 의미
 
 인자는 함수 내부로 가져와서 사용할 때 , 이름은 외부에서 메서드 사용시 쓸 파라미터이름
 
 // MARK: Polymorphism 다형성
 
 ex) display 란 메세지를 Rectangle, Cube 두개 모두 가지고있을 때(내부로직은 다른)
 메세지를 보내는 측에서는 id 로 두 객체를 가르킬 수 있고, 메세지를 두곳에 보낼 수 있다.
 다른 객체가 같은 메세지에 대해 반응하므로 이것도 Polymorphism에 해당한다.
 
 // MARK: Dynamic binding 혹은 Late Binding
 
 Objective-C 에선 객체는 id의 형태로 받고 그것에 대해 메세지를 보내기 때문에 compile 시에는 구체적으로 객체타입을 모른다.
 runtime에 타입을 알고 이것을 동적 바인딩이라고 한다. 장점 : 유연하다, 단점: 컴파일시 에러체크를 할 수 없다.
 정적 바인딩을 하면 컴파일시 잔작업을 미리 해두지만 동적 바인딩은 그렇지 않아서 성능상 이슈가 있다.
 */
