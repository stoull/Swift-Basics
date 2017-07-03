//: Playground - noun: a place where people can play

import UIKit

// swift protocols 协议

/*
 协议就是规定一些方法和属性，让别的类签署这些协议，别的类去实现协议的内容。
 */

// 起草一份星期五晚上洗碗的协议
protocol WashTheDishesOnFridayProtocol {
    var mabu: String {get set}    // 需要一块抹布
    func washTheDishes() -> Void  // 这里需要洗碗
}

// 现在小明决定每个星期五他洗碗，所以他应该有抹布，并且会洗碗。如果他没有抹布，也不会洗碗，那xcode就是前责他，给他标红
class XiaoMing: WashTheDishesOnFridayProtocol {
    var mabu: String                // 必需要有抹布
    func washTheDishes() {          // 必需要会洗碗
        print("小明在星期五洗碗了")
    }
    init(mabu: String) {
        self.mabu = mabu
    }
}

let xiaoMing = XiaoMing(mabu: "抹布")
xiaoMing.washTheDishes()

// 来看官方正版的代码

// 协议对属性的约定
/*
 1. 协议可以规定其遵循者提供特定名称与类型的实例属性(instance property)或类属性(type property)，而不管其是存储型属性(stored property)还是计算型属性(calculate property)
 2. 协议中的属性经常被加以var前缀声明其为变量属性，在声明后加上{ set get }来表示属性是可读写的，只读的属性则写作{ get }
 */


protocol FullyName {
    var fullName: String {get}
}
struct Person: FullyName {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

// 来一艏战舰,它的fullName 是计算属性
class Starship: FullyName {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + "" : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print("StarShip's name :\(ncc1701.fullName)")

// 协议对方法的约定
/*
 协议中的方法不需要大括号和方法体
 注意： 协议中的方法支持变长参数(variadic parameter)，不支持参数默认值(default value)。
 */

/*
 用 class 表示类方法。当在枚举或结构体实现类方法时，需要使用static关键字来代替
 */

protocol ClassMethodProtocol {
    static func someClassMethod()     //用 static 代替 class 表示类方法
}

protocol RandomNumberGenerder {
    func random() -> Double
}

// 线性同余方程 !!!?? 看看是什么

/*
 边的是一个遵循了RandomNumberGenerator协议的类。该类实现了一个叫做线性同余生成器(linear congruential generator)的伪随机数算法。
 */
class LinearCongruentialGenerator: RandomNumberGenerder {
    var lastRandom = 42.0
    var m = 139968.0
    var a = 3877.0
    var c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        // In swift 3.0 before ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("生成一个随机数: \(generator.random())")
print("生成另一个随机数: \(generator.random())")
print("生成另一个随机数: \(generator.random())")


// 对突变方法的规定
// 将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改实例及其属性的所属类型
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}


// 可用协议规定构造器 
protocol InitProtocol {
    init(someParameter: Int)
}

class InitClass: InitProtocol {
     init(someParameter: Int) {  // required 表示协议规定
        
    }
}

class SubInitClass: InitClass {
    required override init() { // 有协议和继承关系
        
    }
}

// 协议类型, 就是某个签署这个协议类型的类


// 委托（代理）模式 这个是很有用啊。想想Object-C
// 下文是两个基于骰子游戏的协议:
protocol DiceGame {
    var dice: Dice {get}
    func play()
}

protocol DiceGameDelegate{
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didstartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice
}



