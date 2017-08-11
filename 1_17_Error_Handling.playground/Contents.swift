//: Playground - noun: a place where people can play

import UIKit

// swift 中的异常处理
// Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue.

// 显示和抛出异常 Swift 中的异常是 遵守 Error协议的对象， 这里定义一个异常对象

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
 1. 使用抛出函数传递错误
 2. 使用 Do-Catch 处理错误
 3. 转换错误为可选项
 4. 取消错误传递 (就是断言错误不会发生)
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
        
        print("成功买得: \(name)")
    }
}

var streetMachine = VendingMachine()
streetMachine.coinsDeposited = 2 // 用户放入 2 个硬币 去买Caffe

// 2个硬币去买 Caffe 严重抛异常 使用 do-catch 语句, try?, 或者 try!—or continue to propagate them？？

//try streetMachine.vend(itemNamed: "Caffe") // 这里如果不用try就标红了
//
// 当然也可以在初始化的时候，抛出异常，像这样子
struct PurchasedSnak {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: "Caff")
        self.name = name
    }
}

// 使用 Do-Catch 处理异常，就是处理抛出了哪些问题

/* Do-Catch 的语法如下
 do {
 try expression
 
 } catch pattern 1 {
 
 } catch pattern 2 where condition {
 
 }
 */

var otherMachine = VendingMachine()
otherMachine.coinsDeposited = 5
do {
    try otherMachine.vend(itemNamed: "Caffe")
    print("购买成功!")
} catch VendingMachineError.invalidSelection{
    print("没有您要买的东西")
} catch VendingMachineError.insufficeientFunds(let coinsNeeded){
    print("您的钱不够\(coinsNeeded)")
} catch VendingMachineError.outOfStock{
    print("您要买的东西已售完")
}

// 转换错误为可选项 Optional

func someThrowingFunction() throws -> Int {
    return 1
}

let x = try? someThrowingFunction()

let y: Int? // 这里变成可选
do {
    y = try someThrowingFunction()
} catch {
    y = nil
     print(error)
}

// 像处理获取数据的异常，变可选
/*
 unc fetchData() -> Data? {
 if let data = try? fetchDataFromDisk() { return data }
 if let data = try? fetchDataFromServer() { return data }
 return nil
 }
 */

// 取消错误传递
/*
 事实上有时你已经知道一个抛出错误或者方法不会在运行时抛出错误。在这种情况下，你可以在表达式前写 try!来取消错误传递并且把调用放进不会有错误抛出的运行时断言当中。如果错误真的抛出了，你会得到一个运行时错误。
 
 比如说，下面的代码使用了 loadImage(_:)函数，它在给定路径下加载图像资源，如果图像不能被加载则抛出一个错误。在这种情况下，由于图像跟着应用走，运行时不会有错误抛出，所以取消错误传递是合适的。
 */
//let photo = try! loadImage("./Resources/John Appleseed.jpg")



// 指定清理操作
/*
 使用 defer语句来在代码离开当前代码块前执行语句合集。这个语句允许你在以任何方式离开当前代码块前执行必须要的清理工作——无论是因为抛出了错误还是因为 return或者 break这样的语句。比如，你可以使用 defer语句来保证文件描述符都关闭并且手动指定的内存到被释放。
 
 defer语句延迟执行直到当前范围退出。这个语句由 defer关键字和需要稍后执行的语句组成。被延迟执行的语句可能不会包含任何会切换控制出语句的代码，比如 break或 return语句，或者通过抛出一个错误。延迟的操作与其指定的顺序相反执行——就是说，第一个 defer语句中的代码会在第二个中代码执行完毕后执行，以此类推。
 */


/*
 func processFile(filename: String) throws {
 if exists(filename) {
 let file = open(filename)
 defer {
 close(file)
 }
 while let line = try file.readline() {
 // Work with the file.
 }
 // close(file) is called here, at the end of the scope.
 }
 }
 */


/*
 上面的离子使用 defer语句来保证 open(_:)函数能调用 close(_:)。
 
 注意
 
 就算没有涉及错误处理代码，你也可以使用 defer语句。
 */
