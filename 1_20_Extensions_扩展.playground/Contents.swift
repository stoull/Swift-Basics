//: Playground - noun: a place where people can play

import UIKit

// Extensions 扩展

// 回顾下 Object-C 的扩展 分类
/*
 给NSData加一个扩展 如名字为：
 
 @interface NSData ()
 @property (nonatomic, copy) NSString *md5; // 增加一个属性
 - (NSString *)getHash;                     // 增加一个方法
 @end
 
 Swift 中的扩展不像Object-C中的分类（categories）。 Swift 中的扩展没有名字。

=== 所以 扩展就是向一个已有的类、结构体或枚举类型添加新功能（functionality）。具体有这些：
 + 添加计算型属性和计算静态属性
 + 定义实例方法和类型方法
 + 提供新的构造器
 + 定义下标
 + 定义和使用新的嵌套类型
 + 使一个已有类型符合某个协议
 
 
 
 注意：
 如果你定义了一个扩展向一个已有类型添加新功能，那么这个新功能对该类型的所有已有实例中都是可用的，即使它们是在你的这个扩展的前面定义的。
 */
 
// 定义一个人类
class Person {
    let name: String
    let age: Int
    let heigth: Float
    var isThinking = false
    init(name: String, age: Int, height: Float) {
        self.name = name
        self.age = age
        self.heigth = height
    }
    
    func thinking() {
        self.isThinking = true
        print("\(self.name) 正在思考事情")
    }
    
    func stopThinking() {
        self.isThinking = false
        print("\(self.name) 停止了思考事情")
    }
}

// 扩展和语法  使用extension没有名字，应用于所有已有实例中
extension Person {
    var enhanceHgith: Float { // 这里出现变大后的高度
        return self.heigth * 3
    }
    func fly() {
        print("\(self.name) 正在飞....")
    }
    func stopFly() {
        print("\(self.name) 没有在飞....")
    }
}

protocol AnotherProtocol {}
protocol SomeProtocol {}


// 使用扩展适配多个协议（protocol）

extension Person: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
}

// 给 Double 扩展 计算属性

extension Double {
    var km: Double {return self * 1_000.0}
    var m: Double {return self}
    var cm: Double {return self * 0.001}
}
print("注意！！ 扩展可以添加新的计算属性，但是不可以添加存储属性")


// 扩展可以向已有类型添加新的构造器

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin: Point
    var size: Size
}

let oneRect = Rect(origin: Point(x: 2.9, y: 3.3), size: Size(width: 20.0, height: 32.0))
print("\(oneRect)")

