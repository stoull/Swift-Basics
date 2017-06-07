//: Playground - noun: a place where people can play

import UIKit

// Methods 方法

/* 方法就是与类，结构体，枚举相关联的函数
对没错，不像在C和OC，只可以在类中定义函数。Swfit 中可以在类，结构体，枚举中定义函数
 
 类方法，实例方法？重写？

*/

/*
 方法和函数的参数的重要区别。
 读者可能还记得。函数的参数标准定义为： (外部名 内部名 ：类型)。 如果没有外部名，那么函数的参数默认是局部的。方法于此是不同的，方法的第一个参数默认是局部的。剩余的其他参数，则是默认同时是局部和外部的，如果你不明确定义外部名。第二个参数开始的其他所有参数的外部名，默认等同于内部名。
 
 在方法的定义里，如果你想给第一个参数一个相同的外部名，那么可以用#关键字。如果你不想让第二个开始的其他参数有外部名，那么可以用_ (下划线)关键字。
 
 这段定义非常麻烦。作者认为很大程度上，这是为了方便调用object-c的一些方法。
 
 引用自：http://www.jianshu.com/p/31ae2fb8fc93
 */

// 实例方法 
class Counter {
    var count:Int = 0
    func increment() {
        count += 1
    }
    func inrement(by amount: Int) { // 这个方法和上面那个方法同名 叫 多态
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print("count: \(counter.count)")
counter.inrement(by: 32)
print("count: \(counter.count)")
counter.reset()
print("count: \(counter.count)")

// self 属性
/* 每个实例都有一个 self 属性 表示这个实例本身
self 在一个情况下，当方法参数名和实例属性名相同，傻傻分不清楚的时候特别有效果
 self.propertyName 表示实例的属性，像下面这个
 */

// 关键字 mutating

/*
 结构体和枚举 是 数值类型，数值类型的属性不能通过实例方法去改变。但可以用 mutating,前提是其实例要是var类型
 */

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
        // 如果不用self.x 用 x > x 分不清楚
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 2.0, y: 5.0)
if somePoint.isToTheRightOf(x: 3.0) {
    print("这个点在 直线 x = 1.0 的右边")
}else {
    print("这个点在 直线 x = 1.0 的左边")
}
somePoint.moveBy(x: 2.0, y: 4.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("这个点在 直线 x = 1.0 的右边")
}

/*
  mutating 的方法 可以把 self 都改变掉！！！。。。啥情况，说可以用来颠倒是非
 */

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
ovenLight.next()


// 类方法
/*
 用 static 修饰，在类中如果用class修饰，表示可被子类重写（override）
 此时的 self 表示类本身，而不是实例
 */

// 下面是一个跟踪用户游戏过关的 结构体
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var curretnLevel = 1
    
    static func unlock(_ level: Int){
        if level > highestUnlockedLevel { highestUnlockedLevel == level}
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    /*
     默认情况下编译器就是会去检查返回参数是否有被使用，没有的话就会给出警告。如果你不想要这个警告，可以自己手动加上 @discardableResult
     */
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            curretnLevel = level
            return true
        } else {
            return false
        }
    }
}

// 定义一个玩家类
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

// 开始玩游戏了
var player = Player(name: "Hut")
player.complete(level: 1)
print("highest unlocked level is now \(player.tracker.curretnLevel)")

player = Player(name: "Beta")
if player.tracker.advance(to: 6) {
    print("玩家现在在第 : \(player.tracker.curretnLevel) 关")
}else {
    print("第六关还没有解锁 ")
}










