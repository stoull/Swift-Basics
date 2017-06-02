//: Playground - noun: a place where people can play

import UIKit

// Enumerations 

// 在C 或OC里面，枚举的 “Raw” Value 只能是整数，但在Swift中Raw值可以是 String,Caharacter,或integer以及浮点型。

enum CompassPint {
    case north
    case south
    case east
    case west
}

// 也可以写成一行
enum Plant {
    case mercury, venus, earth, mars, jupiter, saturn,urnaus, nepune
}

// 取值
var directionToHead = CompassPint.west
directionToHead = .east;    // 当变量类型是CompassPoint，可直接用.

// 和 Switch 语句配合使用。Switch 如果有穷尽所有的可能性，则不需要default，如果没有穷尽所有的可能性，则需要用default

directionToHead = .west
switch directionToHead {
case .north:
    print("很多星球都有的方向")
case .east:
    print("沿着这个方向一直走可以看到企鹅")
case .south:
    print("太阳升起的方向")
case .west:
    print("在那边的天空是蓝色的")
default:
    print("无方向的方向")
}


// 在 Swift 的枚举类型中，每一个枚举项均可以携带一个或者一组关联值（Associated Values在 Swift 的枚举类型中，每一个枚举项均可以携带一个或者一组关联值（Associated Values)

// 二维码和条形码的例子
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 857464, 32324, 3) // 添加关联值
productBarcode = .qrCode("KAFGHAKFIWFDKFASDF")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code : \(productBarcode)")
}


// 原始值(Raw Values)

// 定义原始值类型
//enum ASCIIControlCharacter: Character { // Character 类型
//    case tab = "\t"
//    case lineFeed = "\n"
//    case carriageReturn = "/r"
//}

enum flower: Int {
    case tulip = 1, violet, begonia, honeysuckle
}

enum directionPoint: String {
    case north, south, east, west
}

let earthOrder = directionPoint.north.rawValue
let getFlower = flower.violet.rawValue


/* 递归枚举（recursive enumeration）
    递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。
*/

// 用关键字 indirect 告诉编译器 case 需要插入间接值
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

/* 或者在枚举的最前面使用 indirect 关键字，这样所有的case 都需要 indirect
indirect enum ArithmeticExpression {
 case number(Int)
 case addition(ArithmeticExpression, ArithmeticExpression)
 case multiplication(ArithmeticExpression, ArithmeticExpression)
 }
 */

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))





