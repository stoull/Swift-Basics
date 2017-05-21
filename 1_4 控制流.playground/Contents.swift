//: Playground - noun: a place where people can play

import UIKit

// for 循环
// _ 的使用
let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer += base
}

// While 循环
var condition = 0
while condition < 5 {
    condition += 1
}

condition = 0

// repeat while (还记不记得 do while )
repeat {
    condition += 1
} while condition < 5


// if 条件判断
var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// Switch 流程控 (没有break了...)

/* switch  不像在C中那样受限。这里的swtich可以有多个 case value值
可以是数值，字符，区间，元组。还可以使用 where 条件判断，是不是感觉世界瞬间丰富多彩
 */


//switch中的case情况要穷尽所有的可能性，如果可以穷尽（比如case是enum类型的有限几个值）则可以不加default，否则一定要加default。case中可以使用区间，开闭都可以。这个是正确的。

let aCharacter: Character = "a"
switch aCharacter {
case "a", "A":  // 这后面还可以加很多的，用','分开就好
    print("是字母 A")
default:
    print("不是字母 A")
}

// switch 中 开闭区间的使用
let approximateCount = 62
let contedThings = "的卫星环绕着土星"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "没有"
case 1..<5:
    naturalCount = "几个子"
case 5..<12:
    naturalCount = "有一些"
case 12..<100:
    naturalCount = "有好几打"
case 100..<1000:
    naturalCount = "有好几百"
default:
    naturalCount = "非常的多"
}
print("有\(naturalCount)\(contedThings)")

// 元组 Tuples 的使用
let somepoint = (1, 1)
switch somepoint {
case (0, 0):
    print("\(somepoint) 在原点上");
case (_, 0):
    print("\(somepoint) 在 x 轴上");
case (0, let y):
    print("\(somepoint) 在 y 轴上, 并且 y 坐标为：\(y)"); // 注意这里取y的值哦
case (-2...2, -2...2):
    print("\(somepoint) 在 -2 - 2 的方框框中");
default:
    print("\(somepoint) 不知道在哪里");
}


// 配合 Where的使用
let aPoint = (1, -1)
switch aPoint {
case let (x, y) where x == y:
    print("(\(x),\(y)) 在直线 x == y 上")
case let (x, y) where x == -y:
    print("(\(x),\(y)) 在直线 x == -y 上")
case let (x, y) where x == y:
    print("(\(x),\(y)) 应该不在直线 x = +-y 上")
default:
    print("What")
}

// 看看这个用的巧秒miao。。
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


// 控制转移语句
/*
 continue
 break
 fallthrough
 return
 throw
 */

// continue 告诉当前循环停止当前循环内的任何工作，立刻马上开妈下一个循环。
// break 可结束 循环和switch的控制流

// fallthrough 在swift中 switch当遇到合适的case就会结束控制流。在C中为了防止继续执行是要加一个break的，这fallthrough在swift中就相当于break
// If you need C-style fallthrough behavior,你可以这样子写
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// go to?? 给while控制加个引用？
var goodluckCount: Int = 0
goodluckLoop: while goodluckCount < 3{
    var goodluckNumber = arc4random_uniform(UInt32(10))
    switch goodluckNumber {
    case 2, 3, 5, 7, 9:
        print("")
        break goodluckLoop
    default:
        print("")
        continue goodluckLoop
    }
}


// 提前结速控制流用return

// API 可用性判断

let nameLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 44))
nameLabel.text = "Bubble"
if #available(iOS 10, *) { // 如可在 iOS 10 以上使用.font方法
    nameLabel.font = UIFont.systemFont(ofSize: 14)
} else {
    // do something here
}

// 也可以写成这样子 guard
//guard #available(iOS 10, *) else { // 如可在 iOS 10 以上不能使用.font方法
//    // do something here
//    return
//}


