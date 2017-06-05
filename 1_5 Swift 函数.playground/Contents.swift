//: Playground - noun: a place where people can play

import UIKit

// 想到函数会想到那些内容？函数的定义格式，函数的参数，值址传递，全局函数，函数的作用域？是的，但Swift的函数远不止这些内容

// 函数的定义格式
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

// 函数的参数标准定义为： (外部名 内部名 ：类型)。 如果没有外部名，那么函数的参数默认是局部的。
// 函数变量标签和参数名 标签是调用该函数的时候使用，参数名则是在 implementation 后使用。如下：
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

func aGreet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}

print(aGreet(person: "Bill", from: "Beijing"))

// 你也可以忽略变量标签
func aNoGreet(_ person: String, from homtown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(homtown)."
}

print(aNoGreet("Lucy", from: "YunHai"))


// 设置函数参数的默认值
func defaultParameterValue(parameterWithoutDefault: Int, parameterWithDefault: Int = 12){
    print("parameterWithoutDefault: \(parameterWithoutDefault) \n parameterWithDefault: \(parameterWithDefault)")
}

defaultParameterValue(parameterWithoutDefault: 7, parameterWithDefault: 6)  // parameterWithDefault 的值是6
defaultParameterValue(parameterWithoutDefault: 3)   // parameterWithDefault 的值是多12


// 可变长个数参数 函数 用...声明 有点像参数是一个同类型的数组，元素可以是0到多个
// 求几个数的平均值
func arithmeticMean(_ numbers: Double...) ->Double{
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}

print("\(arithmeticMean(2.3, 5.3, 6.2, 8.3))")
print("\(arithmeticMean(3.3))")

// 址传递参数的函数 用inout 声明对应的类型 （前面所说的函数都是值传递的）

// 交换两个数的值
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var intA = 88
var intB = 99
swap(&intA, &intB)

// Function Types 函数类型？ 也就是定义一个函数类型的变量，(函数类型: 参数个数及数据类型，以及返回值类型)
// 只要任何一个函数的类型和这个变量的函数类型一样，这个函数类型的变量就可以引用这些函数

// 求两个数的和函数
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// 求两个数的积函数
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("结果: \(mathFunction(2, 3))") // 这里是相加的
mathFunction = multiplyTwoInts
print("结果: \(mathFunction(2, 3))") // 这里是相乘的


// 函数类型作为函数参数
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print("结果: \(mathFunction(a, b))")
}
// 上面是一个无返回值类型的，有一个类型为 (Int, Int) -> Int 的函数参数，以及两个 Int 类型的参数
printMathResult(addTwoInts, 4, 8)

// 函数类型也可以作为返回参数
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(isBackward: Bool) -> (Int) -> Int {
    return isBackward ? stepBackward : stepForward
}

// Nested Function 内嵌函数?

// 前面讲的函数作用域都是全局的，你可以在函数里面定义函数
func anotherChooseStepFucntion(isBackward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int {return input + 1} //这两个就是内嵌函数，也就是只有在这个函数里面才有效
    func stepBackward(_ input: Int) -> Int {return input - 1}
    return isBackward ? stepBackward : stepForward
}
