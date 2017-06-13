//: Playground - noun: a place where people can play

import UIKit

// Deinitialization 析构?? 
/*
在Object-c 中的 dealloc 方法， 在swift中的函数是 deinit
每一个实例对象在被消毁前都会调用 deinit 方法，所以可以在deinit方法中做一些事情，比如释放一些资源
 */

/*
 下面是一个小游戏的例子，
 有一个银行类，管理货币的流通，货币总数为 10000
 一个玩家类，这个类可以获得货币，也可以使用货币。为了保持货币总数不变，所以当一个玩家注销游戏的时候，银行需要回收
 游戏中只有一个银行，但可以有多个玩家
 */

class Bank {
    
    // 下面的static声明并使用存储属性
    static var coinsInBank: Int = 10000
    
    // 下面的static 是声明类型方法
    static func distribute (coins nubmerOfCoinsRequested: Int) -> Int {
        let numberOfCoinsInVend = min(nubmerOfCoinsRequested, coinsInBank) // 不能取比银行里还多的货币
        self.coinsInBank = self.coinsInBank - numberOfCoinsInVend
        return numberOfCoinsInVend
    }
    
    // 下面的static 是声明类型方法
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) -> Int {
        return self.coinsInPurse + Bank.distribute(coins: coins)
    }
    
    // 当然玩家和其它玩家之间还可以进行交易
    
    
    //为了保持货币总数不变，所以当一个玩家注销游戏的时候，银行需要回收
    deinit {
        Bank.receive(coins: self.coinsInPurse)
    }
}


