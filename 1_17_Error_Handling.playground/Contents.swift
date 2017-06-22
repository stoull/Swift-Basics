//: Playground - noun: a place where people can play

import UIKit

// swift 中的异常处理
// Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue.

// 显示和抛出异常 Swift 中的异常是 遵守 Error协议的对象

func canThrowError() throws -> Bool {
    enum VendingMachineerror: Error {
        case invalidSelection
        case insufficientFunds(coinsNeeded: Int)
        case outOfStock
    }
    
    throw VendingMachineerror.insufficientFunds(coinsNeeded: 5)
}


// 在 Swift 中有四种方法处理异常
/*
 1. Propagating Errors Using Throwing Functions
 2.
 
 */


// 1. 使用 throws 处理错误
func canThrowErrors() throws -> String{
    return "canTrhowEorrs"
}

func cannotThrowErros() -> String{
    return "cannotThrowEorrs"
}

/* guard 语句
 和if一样，guard是基于一个表达式的布尔值去判断某些代码是否该被执行
 和if不一样的地方是，guard只有在条件不满足（布尔值==false时）才会执行，类似反if
 */

// 官方的示例代码
enum VendingMachineError: Error {
    case invalidSelection
    case insufficeientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "雪碧" : Item(price: 12, count: 17),
        "Caffe" : Item(price: 10, count: 4),
        "宝矿力特" : Item(price: 7, count: 21)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
//        let item: Item = inventory[name]!
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficeientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("成攻买得: \(name)")
    }
}

//// 上面那个售买机已经给出所有的异常情况，使用 do-catch 语句, try?, 或者 try!—or continue to propagate them？？
//// 定义一些人最喜欢的喝的饮料
//let favoriteSnacks = [
//    "Alice" : "Chips",
//    "Bob" : "Licorice",
//    "Eve" : "Pretaels",
//]
//
//func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
//    let snackName = favoriteSnacks[person] ?? "Caffe"
//    try vendingMachine.vend(itemNamed: snackName)
//}
//
var streetMachine = VendingMachine()
streetMachine.coinsDeposited = 2 // 用户放入 12 个硬币
try streetMachine.vend(itemNamed: "Caffe")

// 当然也可以在初始化的时候，抛出异常，像这样子
struct PurchasedSnak {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: "")
        self.name = name
    }
}




