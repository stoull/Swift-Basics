//: Playground - noun: a place where people can play

import UIKit

// Object-c 中是不是有 init 方法。。。。。

// Swift 中的构造方法不像OC 中的构造方法，要返回一个id 或 instance 类型，它只是用来初始化一些东西，创建初始值

/*
 可选属性类型
 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。
 当存储属性声明为可选时，将自动初始化为空 nil。
 */

// 定义一个矩形
struct Rectangle {
    var length: Double?
    init(fromBreath breath: Double) { // 注意内外变量名
        length = breath * 10
    }
    
    init(frombre bre: Double) {
        length = bre * 30
    }
    
    init(_ area: Double) {          // 这个时候没有外部名
        length = area
    }
    
    init(){                         // 提供默认值
        length = 10
    }
    
    init(area: Double){             // 自动生成一个跟内部名字相同的外部名
        
    }
}

let rectarea = Rectangle(180)
let rectarea1 = Rectangle(fromBreath: 20.0)
let rectarea2 = Rectangle(area: 20.0)


