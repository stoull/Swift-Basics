//: Playground - noun: a place where people can play

import UIKit

/* 基本C操作符都支持
 
 数学运算符: +, -, *, /, % , =, ==, : , +=, etc.
 区间运算符： a..<b and a...b   这个是C中是没有的
 
 */

// 赋值运算符
let pi = 3.14159

let (originX, originY) = (23.0, 76.0) // 猜猜这个是啥类型
let origin = (X : 26.0, Y: 78.0) // 这个呢是啥类型？
let origin1 = (originX, originY)
let origin2 = origin

var hiString = "Hello" + "world"

// += -=
var a = 1
a += 1

// 条件运算符
let rowHeight = 30 + (true ? 50 : 20) // 这个好优雅

// ?? 
// ?? 是一个运算符叫 Nil-Coalescing Operator 就是：a != nil ? a! : b
let x :Int? = 4
let y = 3
x != nil ? x! : y // 如果x不为nil，就将x的值给我吧。为nil和话，就不能要你了，把y给我吧。

// tuples 元组比较
let bool = (1, "apple") < (3,"zebra") //tuples 元组? 先比较 1和3，再比较apple和zebra


// Range Operators  区间运算符
// a..<b and a...b   这个是C中是没有的 这是好玩又轻松
for i in 1...5 {
    print("\(i)")
}

// 还可以用变量
let count = 2
for j in 0..<count {
    print("\(j)");
}

// 辑运算符 NOT (!a) AND (a && b) OR (a || b)
//  这个就不用过了吧。。。。
//if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
//    print("Welcome!")
//} else {
//    print("ACCESS DENIED")
//}
