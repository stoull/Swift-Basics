//: Playground - noun: a place where people can play

import UIKit

// 类和结构体

//在Swift 中没有 interface 和 implementation 文件了

// 类？ 属性，方法，抽象，初始化，继承，重载，实例化，类方法...

// 创建一个类
class kungFuPanda {
    var age: Int        = 1
    var name: String    = "kungFuPanda"
    var skill: String   = "WuXi Finger"
    var internalForce: Float    = 80
    var force: Float {
        return Float(Float(age) * internalForce)
    }
    
    public func descripte() -> String {
        return "\(self.name) have Force \(self.force)"
    }
}

// 实例化一个类
let po = kungFuPanda()
po.name = "Po"
po.age = 26
print(po.descripte())


// 属性
// 属性有三种：存储属性和计算属性，这两种是和实例绑定的实例属性。类型属性是和类绑定的类型属性


// 计算属性
/* 完整定义为
 var 计算类型的名字:类型
 {
     get {
 
     }
     set(值的名字) {
 
     }
 }
*/

class triangle {
    var height: Float   = 0
    var bottom: Float   = 5
    var area: Float{
        get {
            return height * bottom
        }
        set(a) {
            height = a / bottom / 2
        }
    }
}

let tr1 = triangle()
tr1.area = 40
print("triangle's height is : \(tr1.height)")

// 属性观测器


 
 
 


