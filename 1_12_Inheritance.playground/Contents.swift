//: Playground - noun: a place where people can play

import UIKit

protocol TestProtocol {
    func processingAction(action: Int)
}

// 没有继承其它类的类，称之为基类（Base Class)
class BaseCPU:TestProtocol {
    var numberOfCores: Int = 4      // 内核数
    var threadCount: Int = 8        // 线程数
    var processorFrequency: String = "4.20 GHz"   // 处理器基本频率
    var cache: String = "8 MB SmartCache"                // 缓存
    var speed: String = "8 GT/s DMI3"                // 总线速度
    
    init(numberOfCores: Int) {
        self.numberOfCores = numberOfCores
    }
    
    // CPU的功能
    func process() {
        print("开始处理计算！")
    }
    
    // 实现 TestProtocol 的方法
    func processingAction(action: Int) {
        print("The action is :\(action)")
    }
}

// 一个电脑对象继承一个CPU！！！！ 为什么不继承硬盘。。。。无语
class CPU: BaseCPU {
    var model: String = "i7-7700K"   // 型号
    init(model: String, cores: Int) {
        super.init(numberOfCores: 8)
        self.model = model
    }
    
    func descible() -> String {
        return "CPU : \(model) , nubmer of cores \(numberOfCores), threadCount \(threadCount), process of frequency \(processorFrequency)"
    }
}



var i7_CPU = CPU.init(model: "i7-7700K", cores: 8)
print(i7_CPU.descible())


// 如果一个类不想被别人继承 那么就用 final 字段
final class Dot{
    var positionX: Float        = 0.0
    var positionY: Float        = 0.0
}

// 看这里就不能 继承 了
//class line: Dot {
//    
//}


// 访问权限 Swift中的访问权限分为3个等级
/*
 public: 公有访问权限，类或者类的公有属性或者公有方法可以从文件或者模块的任何地方进行访问。那么什么样才能成为一个模块呢？一个App就是一个模块，一个第三方API, 第三等方框架等都是一个完整的模块，这些模块如果要对外留有访问的属性或者方法，就应该使用public的访问权限。
 private: 私有访问权限，被private修饰的类或者类的属性或方法可以在同一个物理文件中访问。如果超出该物理文件，那么有着private访问权限的属性和方法就不能被访问。
 internal: 顾名思义，internal是内部的意思，即有着internal访问权限的属性和方法说明在模块内部可以访问，超出模块内部就不可被访问了。在Swift中默认就是internal的访问权限。
 */

// 重写
/* 子类可以通过重写（overriding）实例方法，类方法，实例属性，或下标脚本来实现自己的定制功能 */

// 如果子类需要调用父类的方法，属性或下标脚本，则使用 super 就可以的

// 定义一个交通工具基类
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "以 \(currentSpeed) KM 的速度运行 "
    }
    
    func makeNoise() {
        // 一个抽象的交通工具，没有一个特定的声音的
    }
}

// 来一个火车子类 重写方法
class Train: Vehicle {
    override func makeNoise() {
        print("呜，呜，呜")
    }
}

let train1 = Train()
train1.makeNoise()

// 再来一个汽车子类 重写属性
class Car: Vehicle {
    var gear = 1 // 档
    override var description: String {
        return super.description + "在 \(gear) 档"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print(car.description)

// 再来一个汽车的子类-自动汽车 重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let aotuMaticCar = AutomaticCar()
aotuMaticCar.currentSpeed = 35.0
print("AutomaticCar : \(aotuMaticCar.description)")


// 防止重写

/* 
 不想被重写，不想被继承， 请用 final 修饰 包治百病
 
 像：final var, final func, final class func, 和 final subscript
 
 
 */

