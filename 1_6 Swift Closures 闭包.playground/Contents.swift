//: Playground - noun: a place where people can play

import UIKit

// Closures 翻译成闭包？ 相似于OC／C中的Block


/*
 Swift 中的 Closures 相当于C 和 Objective-C中的Block.
 Closures 是一级对象，所以可以用来内嵌和传值？？（就是像Objective-C中Block那样的功能，传值或获取参数等）
 Swift 中的函数就是一种 Closures
*/

// 复习下函数
func jediGreet(name: String, ability: String) -> (farewell: String, mayTheForceBeWithYou: String){
    return ("Good bye, \(name).", "May the \(ability) be with you")
}

let returnGreetValue = jediGreet(name: "old friend", ability: "force")

print(returnGreetValue)
print(returnGreetValue.farewell)
print(returnGreetValue.mayTheForceBeWithYou)


//函数类型 （Functiojn types）如：
func sum(x: Int, y: Int) -> (Int) {
    return x + y
}
// 函数的类型为 (Int, Int) -> (Int)。这个是可以用来作函数参数或返回值

// 下面这个函数的返回值是另外一个函数，这个返回的函数可以用一个变量引用和使用
func jediTrainer() -> ((String, Int) -> String){
    func train(name: String, times: Int) -> (String){
        return "\(name) has been trained in the Force \(times) times"
    }
    return train;
}

let goJediTrain = jediTrainer()
goJediTrain("Obi Wan", 3)

// 可变长个数参数 函数 用...声明 有点像参数是一个同类型的数组，元素可以是0到多个
func jediBladeColor (colors: String...) -> (){
    for color in colors {
        print("\(color)")
    }
}

jediBladeColor(colors: "white", "red", "green", "blue")

print("==============================")

// Closure 的定义

/*
{ (params) -> returnType in
    statements
}
 
 Closure 用一对 "{}" 花括号括起来，Closure头，定义的函数类型为 () -> ()，前面为参数，后面为返回值。用关键字 in 将 Closure头和体分离
*/

// 如Array中map函数的使用:
let padawans: Array = ["Knox", "Avitla", "Mennaus"]
padawans.map { (padawan: String) -> String in
    print("\(padawan) has been trained")
    return padawan
}

// 如果一个 Closure 的参数类型确定了，像这样子
func applyMutliplication(value: Int, multFunction: (Int) -> Int) -> Int {
    return multFunction(value)
}

// 可以这样子用：
applyMutliplication(value: 2, multFunction: {value in
    value * 3
})

// 示例：
let resuletInt1 = applyMutliplication(value: 2, multFunction: {_ in 2 * 3})

// Closure arguments can be references by position ($0, $1, ...) rather than by name 所以可简写为
let resuletInt2 = applyMutliplication(value: 2, multFunction: {$0 * 3})
// 也可简写为
let resuletInt3 = applyMutliplication(value: 2) {$0 * 3}
// 也可简写为

print("resuletInt1 :\(resuletInt1) \nresuletInt2: \(resuletInt2) \nresuletInt3 :\(resuletInt3)")
//print(resuletInt)


// Autoclosures
// Escaping Closures

/* 用这个熟悉一下概念
 int (^myBlock)(int , int ) = ^int (int a, int b)
 {
 return a > b ? a : b;
 }
 */
