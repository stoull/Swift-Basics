//: Playground - noun: a place where people can play

import UIKit

// let声明常量，var声明变量 会自动识别对应变量的数据类型. 不能直接使用C的基本数据类型
// Swift provides its own versions of all fundamental C and Objective-C types, including Int for integers, Double and Float for floating-point values, Bool for Boolean values, and String for textual data.

let aStr = "A string" // string
let doubletype = 2.30    // double
let hexadecimalInteger = 0x11     // 17 的十六进制表示法

// 如果要指定对应的类型
var k: Double = 3.8
let intWc: Int = 3

// 强制转换类型
let intK = Int(k)

// 给swift的数据类型定义一个别名，就是你可以用自己定义的别名，来使用这个数据类型。如果每个人都使用自已喜欢的别名，这样对代码阅读好不好？
typealias int = Int      // 请不要做这么危险的动作， 这里只是举一个例子
let intMax = int.max
typealias phoneNumberType = UInt8

// optional binding 可选变量
// 可选表示"那儿有一个值，并且它等于 变量名 "或者"那儿没有值, 是nil"。
// 在可选变量后面加个！号，就是说“那里确定有值在那里，并把它给我”，所以如果如果那个可选，其是没有值的话，它就会给你一红色错误，当然你可用 ?? （Nil-Coalescing Operator） 运算符问它有你没有值啊，有的话就给我啊
var optionName: String? = "John"

if let name = optionName {
    print(name)             // if optionString have value do
}else{
    print("name == nil")    // if optionString have no value ...
}

// 给可选变量设置默认值,如果不设置则为nil
let defautName: String = "Jack"
let greeting = "Hi \(optionName ?? defautName)"

//! 可选变量 解包???
let unWrapStr: String = optionName!
//let canNotUnwrapStr = defautName!

// Tuples
// 元组? 这个有点像数组字典，因为它有点像数组，又有点像字典或Map
let http404Error = (httpCode: 404, message: "Not Found") //也可以写成(404, "Not Found")， 这个类型就是(Int, String)
let httpCode = http404Error.0
let httpCode2 = http404Error.httpCode
let message = http404Error.1

// 如果可选变量为nil这里就不行
let opString : String? = nil
//let ss = opString!

let assumedString: String! = "An implicitly unwrapped optional string."

// 断言 下面断言一个的年龄不可能小于0
let age = -3

//assert(age >= 0, "A person's age cannot be less than zero")
