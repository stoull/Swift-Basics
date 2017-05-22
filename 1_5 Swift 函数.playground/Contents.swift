//: Playground - noun: a place where people can play

import UIKit

// 定义一个买花的函数
func buyFlowerWithMoney(pay: Double) -> String {
    let flower: String
    switch pay {
    case 0..<2.0:
        flower = "风信子";
    case 2.0..<5.0:
        flower = "栀子花";
    case 5.0..<10.0:
        flower = "紫罗兰";
    case 10.0..<20.0:
        flower = "迷迭香";
    default:
        flower = "向日葵";
    }
    return "你买到了" + flower;
}

let flowerOne = buyFlowerWithMoney(pay: 2.3)

// 没有参数的函数
func sayHellowWorld() -> String {
    return "Hellow, world"
}

// 没有返回值的函数
func pringDescrible(){
    print("我是机器人Jo")
}

// 有多个参数的函数
func goPee(person: String, isBoy: Bool) -> String{
    if isBoy{
        return person +  "go to the men's toilets"
    } else {
        return person +  "women's toilets"
    }
}
print(goPee(person: "Tom", isBoy: true))


// 当函数被调用的时候，其返回的参数可以被忽略
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "I'm here")
printWithoutCounting(string: "Hello, my friend")

// 返回值为可选元组 这个时候返回的元组有可能为nil，像这样(Int, Int)?

// 求数组中最大最小值
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {return nil}
    var currentMin = array[0];
    var currentMax = array[0];
    for indexValue: Int in array[1..<array.count]{
        if currentMax < indexValue {
            currentMax = indexValue
        }else if currentMin > indexValue {
            currentMin = indexValue
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [3, 4, -5, 23, -66, 64]) {
    print("Max : \(bounds.max)\n Min : \(bounds.min)")
}


// 函数变量标签和参数名 标签是调用该函数的时候使用，参数名则是在 implementation 后使用。如下：
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func aGreet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}

print(aGreet(person: "Bill", from: "Beijing"))











