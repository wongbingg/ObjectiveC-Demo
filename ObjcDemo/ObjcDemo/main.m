//
//  main.m
//  ObjcDemo
//
//  Created by 이원빈 on 7/18/24.
//

#import <Foundation/Foundation.h>
#import "NSString+Reverse.h"

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
- (NSString*) name; // instance method
- (NSString*) artist;
- (void)setName:(NSString *)newName;
- (void)setArtist:(NSString *)newArtist;
@end

@implementation Song

- (NSString *)artist 
{
    return artist;
}

- (NSString *)name 
{
    return name;
}

- (void)setName:(NSString *)newName
{
    if (name != newName) {
        [name release];
        name = [newName retain];
    }
}

- (void)setArtist:(NSString *)newArtist
{
    if (artist != newArtist) {
        [artist release]; /// receiver 인 artist 의 참조카운트를 -1
        artist = [newArtist retain]; // receiver인 newArtist의 참조카운트를 +1
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Song *mySong = [[Song alloc] init];
        [mySong setName:@"Imagine"];
        [mySong setArtist:@"John Lennon"];
        
        NSLog(@"Song Name: %@", [mySong name]);
        NSLog(@"Artist: %@", [mySong artist]);
        [mySong release];
        
        NSString *originalString = @"Hello, Objective-C!";
        NSString *reversedString = [originalString reverseString];
        NSLog(@"Original String: %@", originalString);
        NSLog(@"Reversed String: %@", reversedString);
    }
    return 0;
}

 // MARK: 메세지 호출법
/*
 
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
 */

 // MARK: Polymorphism 다형성
/*
 ex) display 란 메세지를 Rectangle, Cube 두개 모두 가지고있을 때(내부로직은 다른)
 메세지를 보내는 측에서는 id 로 두 객체를 가르킬 수 있고, 메세지를 두곳에 보낼 수 있다.
 다른 객체가 같은 메세지에 대해 반응하므로 이것도 Polymorphism에 해당한다.
 */

 // MARK: Dynamic binding 혹은 Late Binding
/*
 Objective-C 에선 객체는 id의 형태로 받고 그것에 대해 메세지를 보내기 때문에 compile 시에는 구체적으로 객체타입을 모른다.
 runtime에 타입을 알고 이것을 동적 바인딩이라고 한다. 장점 : 유연하다, 단점: 컴파일시 에러체크를 할 수 없다.
 정적 바인딩을 하면 컴파일시 잔작업을 미리 해두지만 동적 바인딩은 그렇지 않아서 성능상 이슈가 있다.
 */

// MARK: Classes
/*
 1. 상속을 지원한다. but 다중상속을 지원하지는 않는다. 하나의 superclass 만 가질 수 있다.
 1-1. NSObject 클래스
    NSObject 클래스는 root 클래스로써, superclass를 가지지 않음. cocoa 에서 이 클래스는 모든 클래스의 root 클래스가 됨.
    이 클래스를 상속하면 "runtime 시스템에서 지원을 받는 객체" 를 만들 수 있음.
 1-2. 인스턴스 변수, method가 상속됨.
    NSObject 의 isa 와 같은 인스턴스 변수는 NSObject를 상속한 모든 클래스에 자동으로 들어감.
 1-4. 오버라이딩 가능.
 1-5. Abstract class
 2-1. 정적 타이핑
    ex) Rectangle *myRect , 또는 Graphic *myRect;
    
 2-2. Type Introspection
    runtime 시 해당 인스턴스가 어떤 클래스의 인스턴스인지 등을 알아내는 것을 의미.
    ex) if ([anObject isMemberOfClass:someClass])
    위 코드는 anObject 가 someClass 타입일 시 True 를 반환.
 
    ex) if ([anObject isKindOfClass:someClass])
    위 코드는 anObject의 수퍼클래스 중 someClass가 있는가를 알아냄.( 직접적인 superclass가 아니어도 됨.)
 
 3. 클래스 객체 (Class Object)
    ex) int versionNumber = [Rectangle version];
    위처럼 클래스 이름이 receiver로 사용됐을 경우만 클래스 객체로 의미.
 
    ex) id aClass = [anObject class];
        id rectClass = [Rectangle class];
    위처럼 클래스 객체도 id 로 타입을 지정해줄 수 있다.
    
    ex) Class aClass = [anObject class];
        Class rectClass = [Rectangle class];
    이렇게도 표현 가능함. 모든 클래스 객체는 Class 타입이다.
 
 3-1. 인스턴스 만들기
    ex) id *myRect;
        myRect = [Rectangle alloc];
    alloc 메서드는 Rectangle 인스턴스의 변수들을 위해 메모리를 동적으로 할당하고, 0으로 초기화.
    단, isa 변수는 만들어진 새 인스턴스를 클래스에 연결.
    
    ex) myRect = [[Rectangle alloc] init];  OR   myRect = [Rectangle alloc]; [myRect init];
    보통 초기화 시, alloc 다음 바로 init을 수행. 객체는 항상 이렇게 allocation 이 되고 초기화 된 후에 사용해야 한다!
 
 3-2. Objective-C 클래스의 커스텀
 3-3. 변수와 클래스 객체(class object)
    ex)
    @interface myClass
    {
        static int example_class_variable;
        int name;
    }
 
    위와 같이 static 키워드를 이용해서 클래스 변수를 만들어줄 수 있다. 모든 인스턴스 객체는 이 static 변수의 내용을 공유한다.
 
3-4. 클래스 객체 초기화
    클래스가 static 이나 global 변수들을 사용한다면, initialize 메소드 사용
 
    ex)
    + (void)initialize
    {
        staitc BOOL initialized = NO;
        if(!initialized) {
            // 초기화를 여기서 진행.
            initialized = YES;
        }
    }
 
    받은 메세지를 처리할 클래스 메소드가 없을 때, 상속 관계에서 상위 클래스를 타고 올라가 최종적으로 root class의 메소드를 찾게 된다.
 4. 소스코드에서 클래스 이름
    ex) if([anObject isKindOfClass:[Rectangle class]])
    ex) if([anObject isKindOfClass:NSClassFromString(className)])
 */

// MARK: 클래스 정의하기 .
/*
 1. Interface: 한 클래스의 메소드와 인스턴스 변수를 선언. 어느 수퍼클래스로부터 상속 받는지 기입. - 보통 헤더파일인 *.h 파일에 정의
 
 ex)
    @interface ClassName: ItsSuperClass
    {
        // instance variables declaration..
    }
    // method declarations
    @end

    인터페이스는 위와같이 정의하고, 인스턴스 메서드는 - 사인, 클래스 메서드는 + 사인을 prefix로 붙임.
 
 ex)
    -(return type)MethodName:(parameter_type1)param1Name MethodName_cont:(parameter_type2)param2Name
    위 코드는 메서드 정의 형식.
 
 ex) #import <header_name.h>
 인터페이스 파일을 import 하려면 위처럼 하면 된다.
 
 ex) @class ClassA_name
 import 한 헤더파일 내에 위 클래스가 선언되어있지 않다면 이런식으로 어딘가 선언되어 있다고 컴파일러에 알려주면 된다.
 그럼 굳이 위 클래스가 선언된 헤더파일을 import 하지 않아도 된다.
 장점:
    A.h 파일, A.m 파일 | B.h 파일, B.m 파일 이렇게 존재하고 A 와 B 서로의 코드에서 서로를 사용한다면, 컴파일 시
    A를 컴파일 하려면 B를 먼저 컴파일 해놔야하고, B를 하자면 A를 먼저 컴파일 해놔야 해서 순환 의존이 발생해 컴파일을 못하게됨.
    하지만 @class directive 를 쓰면 이를 방지할 수 있다.
 
 2. Implementation : 메소드 구현부 - 보통 구현 파일인 *.m 에 구현
 
 클래스의 구현은 그 선언과 무척 비슷하게 한다.
 모든 implementation 파일은 그에 대응하는 interface 파일을 import 해야한다. 이렇게 함으로 implementation 파일에서
 수퍼 클래스의 이름, 인스턴스 변수들의 선언을 생략할 수 있다.
 ex)
    @import "ClassName.h"
    @implementation ClassName
 
 
 Interface 와 Implementation 파일을 구분해두어야 open counterpart 기능을 제공한다.

 */

/*
 MARK: @property, @synthesize, @dynamic 키워드에 대해
 
 Objective-C 에서 객체의 멤버변수를 외부에서 접근하도록 하려면 접근자 메서드 getter와 setter를 만들어주어야 한다.
 하지만 모든 프로퍼티마다 getter setter를 적용하는 반복작업은 시간이 오래걸린다..
 그래서 위 3개의 개념이 등장했다.
 @interface - @property
 @implementation - @synthesize, @dynamic
 
 @dynamic : @synthesize 대신 사용할 수 있고, getter, setter 메서드가 클래스 자신에 의해 구현되지 않고 다른 어딘가에
 구현되어 있다고 알려주어 getter/setter가 구현되어있지 않아도 컴파일러 경고를 받지 않도록 해주는 역할
 */

// MARK: Chapter 5. How Messaging Works

/*
 
 1. Selector
 
 method selector 들은 dispatch table 이란 곳에 저장됨. 타입은 SEL 로 표현.
 ex) SEL setWidthHeight; setWidthHeight = @selector(setWidth:height:);
 
 selector 는 함수 포인터 개념과 유사하다. selector를 사용해 함수 호출을 하면 이렇게 된다.
 ex) [friend gossipAbout:aNeighbor];
 ex) [friend performSelector:@selector(gossipAbout:) withObject:aNeighbor];
 
 1-1. Messaging Error 처리
 
 존재하지 않는 method를 호출했을 때 에러처리 하는 방법
 ex)
    if([anObject respondsToSelector:@selector(setOrigin::)])
        [anObject setOrigin:0.0:0.0];
    else
        fprintf(stderr, "%s can't be placed\n", [NSStringFromClass([anObject class]) cString]);
 
 방법은 respondsToSelector 를 이용하는 것. anObject가 setOrigin이란 메시지를 가지고 있는지 runtime시 알아냄.
 지금처럼 에러 메시지를 내고 빠지는 방법도 있지만, 혹은 그 능력을 가진 클래스에게 토스를 해줄 수 있다. 이를 "forwarding" 이라고 함.
 
 2. Hidden Argument
 
ex)
    -strange
    {
        id target = getTheReceiver();
        SEL method = getTheMethod();
        if (target == self || method == _cmd)
        return nil;
        return [target performSelector:method];
    }
 
self 와 _cmd 는 숨겨진 인자이다.
 
 3. Message to self and super

 */

// MARK: Chapter 6. How to Extend Classes

/*
 1. Category
 
 기존의 클래스를 수평적으로 확장하는 방법. Swift 의 Extend 와 유사.
 
 
 
 
 
 */


