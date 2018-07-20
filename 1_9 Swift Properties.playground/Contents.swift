//: Playground - noun: a place where people can play

import UIKit
import Foundation

// 类的属性

/*
 lazy 懒加载
 
懒加载的好处:

 需要的时候初始化内存，对内存开销较小，节省内部资源
 代码初始化放在一起，代码块比较好划分，方便别人和自己阅读
 
 因为用的时候进行初始化，所以要平衡内存和较率的问题。
 
 
 Swift中懒加载的本质：
 
 它本质在siwft中确实是一个闭包，执行顺序是这样的，如果这个lazy修饰的变量没值，就会执行闭包中的东西，不是每次都执行（本人补充：这也就是为什么在Swift中的懒加载没有oc中判断。if（xx==nil）{初始化xx}的代码段）。
 在第一次调用时，执行闭包并且分配空间存储闭包返回的数值
 会分配独立的存储空间
 与 OC 不同的是，lazy 属性即使被设置为 nil 也不会被再次调用
 
 */

// 属性的类型，只读，

// 属性
// 属性有三种：存储属性和计算属性，这两种是和实例绑定的实例属性。类型属性是和类绑定的类型属性


"ReadOnly   !!!"
/*
 class ReadOnly {
 private(set) var name: String
 
 init(_ name: String) {
 self.name = name
 }
 }
 
 let obj = ReadOnly.init("hah")
 //以下代码会报错
 obj.name = "hahh"

 注意点：可设置fileprivate(set)为当前文件可调用set，private(set)class内有效。
 */

// 存储属性
class DataImporter {
    var fileName: String = "data.txt"
    public func getData() -> Data? {
        do {
            return try Data.init(contentsOf: URL.init(string: fileName)!)
        }catch{
            print(error)
            return nil
        }
        
    }
}

class DataManager {
    var path: String = "root/data.txt"  // 存储属性
    lazy var importer = DataImporter()  // 这个在第一次用的时候才会被初始化  'lazy'关键字
    var data: Data {                    // 这个是计算属性,不同于存储属性存对应的值，这里用get和set方法，计算值
        get {
            let rData = importer.getData()!
            return rData
        }
        set {                           // set 方法可以没有，如果没有set 方法这个计算属性就是只读的
            print("Can not set Data")
        }
    }
}

// 计算属性
// 不分配独立的存储空间保存计算结果
// 每次调用时都会被执行
// 更像一个函数，不过不能接收参数，同时必须有返回值
/* 完整定义为
 var 计算类型的名字:类型
 {
 get {
 
 }
 set(值的名字) {
 
 }
 }
 */
// 如果没有set 方法这个计算属性就是只读的

class triangle {
    var height: Float   = 0
    var bottom: Float   = 5
    var area: Float{
        get {
            return height * bottom
        }
        set(a) { // 如果这里没有 a 则默认使用 newValue
            height = a / bottom / 2
        }
    }
}

let tr1 = triangle()
tr1.area = 40
print("triangle's height is : \(tr1.height)")

/*
常量属性和变量属性
变量属性在类里面定义的时候，必须赋予初始值。常量属性可以不需要给出初始值，而是用init函数赋值。
 */

// 属性观测器
/*
 属性观测器是两个可以附加在存储属性之后的函数。一个是willSet,另一个是didSet。前者在属性被赋值之前调用。后者在属性被赋值之后调用。
 这两个函数的参数就是你要赋的值，其名字你可以自己指定。如果不指定参数名，那么可以在函数体内用newValue代替。如下例：
 */
class stepCounter {
    var totalSteps: Int = 0{
        willSet(newTotalSteps){
            // Do something here
            print("属性totalSteps will change")
        }
        didSet {
            // Do something
            print("属性totalSteps did change")
        }
    }
}

let StpCounter = stepCounter()
StpCounter.totalSteps = 220

// 类型属性 (类型属性是在类上被读写，而不是在实例上) 和静态变量 static , 类没有实例化也有属性！！
// 类型属性是和类绑定的计算属性。Swift目前只支持计算类型属性。不支持存储类型属性。它的写法为：
class Plane {
class var elevation: Float {
        get { return 22200 } set(newElevation)
        {
            elevation = newElevation
        }
    }
    
    static var size: Float = 150        // 静态的存储属性
    static var capacity: Int {          // 静态的计算属性
        return Int(self.size / 5.0)
    }
}

// 这个时候都可以在类用使用class 和 static 属性
print("Class Plane Size : \(Plane.size)")
print("Plane's elevation : \(Plane.elevation)")
print("Class Plane Capacity: \(Plane.capacity)")

