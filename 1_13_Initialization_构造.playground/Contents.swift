//: Playground - noun: a place where people can play

import UIKit

// Object-c 中是不是有 init 方法。。。。。

// Swift 中的构造方法不像OC 中的构造方法，要返回一个id 或 instance 类型，它只是用来初始化一些东西，创建初始值

/*
 可选属性类型
 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。
 当存储属性声明为可选时，将自动初始化为空 nil。
 */

// 定义一个矩形
struct Rectangle {
    var length: Double?
    init(fromBreath breath: Double) { // 注意内外变量名
        length = breath * 10
    }
    
    init(frombre bre: Double) {
        length = bre * 30
    }
    
    init(_ area: Double) {          // 这个时候没有外部名
        length = area
    }
    
    init(){                         // 提供默认值
        length = 10
    }
    
    init(area: Double){             // 自动生成一个跟内部名字相同的外部名
        
    }
}

let rectarea = Rectangle(180)
let rectarea1 = Rectangle(fromBreath: 20.0)
let rectarea2 = Rectangle(area: 20.0)

/*
 构造过程中修改常量属性
 只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。
 对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
 */

struct Typhoon {
    let speed: Double?      // m/s
    let name: String        // 这个常量的值一定要在构造器结束前给它初始值
    init(speed: Double) {
        self.speed = speed
        self.name = "苗柏"
    }
    
    func describle() -> String {
        return "\(self.name) speed is \(String(describing: self.speed))"
    }
}

var typoon = Typhoon(speed: 23.0) // 前这个 常量speed在构造器也可以修改对应的值
print("\(typoon.describle())")


// 默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var listOne = ShoppingListItem()

print("名字为： \(String(describing: listOne.name))")
print("数量为： \(listOne.quantity)")
print("是否付款: \(listOne.purchased)")


/*
 值类型的构造器代理
 
 构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。
 
 Rect point: Point(x: 1.0, y: 1.0) size: Size(width: 22.0, height: 10.0)
 */
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

class Rect {
    var point = Point()     // 默认构造器
    var size = Size()       // 默认构造器
    
    init(origin: Point, size: Size) {
        self.point = origin
        self.size = size
    }
    
    convenience init(center: Point, size: Size) {       // 便利构造器
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x:originX, y:originY), size: size)
    }
    func describle() -> String {
        return "Rect point: \(self.point) size: \(self.size)"
    }
}

let specialRect = Rect.init(center: Point(x:12.0, y:6.0), size: Size(width:22.0 ,height:10.0))
let sameRect = Rect.init(origin: Point(x: 1.0, y: 1.0), size: Size(width: 22.0, height: 10.0))
print(specialRect.describle())
print(sameRect.describle())



/*
 类的继承和构造过程
 Swift 提供了两种类型的类构造器来确保所有类实例中存储型属性都能获得初始值，它们分别是指定构造器和便利构造器。
 */

class mainClass {
    var no1 : Int
    init(no1 : Int) {
        self.no1 = no1
    }
}


class subClass : mainClass {
    var no2 : Int
    init(no1 : Int, no2 : Int) {
        self.no2 = no2
        super.init(no1: no1)
    }
    
    //便利方法只要一个参数
    override convenience init(no1 : Int) {
        self.init(no1: no1, no2: 0)
    
    }
}

/*
 构造器的继承和重载
 Swift 中的子类不会默认继承父类的构造器。
 父类的构造器仅在确定和安全的情况下被继承。
 当你重写一个父类指定构造器时，你需要写override修饰符。
 */


class Cable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(){
        self.init(name: "Cable")
    }
}

let cable1 = Cable(name: "Thunderbolt 3")
print("\(cable1.name)")

let cable2 = Cable()
print("\(cable2.name)")           //和上面那个有啥不一样

class USBCable: Cable {
    var speed: Float
    
    init(name: String, speed: Float) {
        self.speed = speed
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, speed: 1.0)
    }
}

let usb1 = USBCable(name: "USB1")
print("\(usb1.name)")

let usb2 = USBCable(name: "USB2", speed: 30.0)
print("usb2 name : \(usb2.name) and speed : \(usb2.speed)")

/*
 类的可失败构造器
 如果一个类，结构体或枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败构造器。
 变量初始化失败可能的原因有：
 传入无效的参数值。
 缺少某种所需的外部资源。
 
 你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面加添问号(init?)
 */

class Animal {
    var species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

//通过该可失败构造器来构建一个Animal的对象，并检查其构建过程是否成功
// someCreature 的类型是 Animal? 而不是 Animal
let someCreature = Animal(species: "河马")

if let hema = someCreature {
    print("动物是：\(hema.species)")
}


/*
 覆盖一个可失败构造器
 就如同其它构造器一样，你也可以用子类的可失败构造器覆盖基类的可失败构造器。
 你也可以用子类的非可失败构造器覆盖一个基类的可失败构造器。
 你可以用一个非可失败构造器覆盖一个可失败构造器，但反过来却行不通。
 一个非可失败的构造器永远也不能代理调用一个可失败构造器。
 */

//class Snake: Animal {
//    var length: Float
//    init(lenght: Float, species: String){
//        super.species = species // assigning a property to itself
//        self.length = length
//    }
//}
//
//let snake: Snake {
//    
//}

