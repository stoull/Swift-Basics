//: Playground - noun: a place where people can play

import UIKit

// 类和结构体
//在Swift 中没有 interface 和 implementation 文件了

/* 类和结构体的共同点：
 1. 定义属性。
 2. 定义方法。
 3. 定义方法属性的访问方法。
 4. 定义初始化器，初始化它们的状态。
 5. 可通过扩展增加功能
 6. 可遵守协议对某类提供标准功能及接口
 */

/* 类特有的特性
 1. 可继承
 2. 类型转换允许在运行时检查和解释一个类实例的类型
 3. 取消初始化器允许一个类实例释放任何其所被分配的资源
 4. 引用计数允许对一个类的多次引用
*/



// 类？ 属性，方法，抽象，初始化，继承，重载，实例化，类方法...

// 创建一个类
class kungFuPanda {
    var age: Int        = 1
    var name: String    = "kungFuPanda"
    var skill: String   = "WuXi Finger"
    var internalForce: Float    = 80
    var force: Float {
        return Float(Float(age) * internalForce)
    }
    
    public func descripte() -> String {
        return "\(self.name) have Force \(self.force)"
    }
}

// 实例化一个类
let po = kungFuPanda()
po.name = "Po"
po.age = 26
print(po.descripte())




// 创建一个结构体
struct Resolution {
    var width = 0
    var height = 0
}

// 再一个类
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    public func descri() -> Void{
        print("VideoMode : \(name!) info: \n resolution: \(resolution) \n interlaced: \(interlaced) \n frameRate: \(frameRate)")
    }
}

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)

let blueMode = VideoMode.init()
blueMode.resolution = hd
blueMode.interlaced = true
blueMode.frameRate = 50.0
blueMode.name = "Blue"
blueMode.descri()


// 类都是引用类型，就是说你声明N个变量等于一个对象，那么所有的变量都指向同一个对象，比如：
let otherMode = blueMode
otherMode.name = "otherMode"
otherMode.resolution = vga
blueMode.descri()       // 这个变了吧


/* 因为类都是引用类型，所以有时候需要要比较他们是不是同一个对象，这里需要用到一个运算符：“Identity Operators”
Identical to (===)
Not identical to (!==)

还有一个运算符是 == 和 != 名字叫 “Equal to”

 ===(Identity to): 比较两个是对象是不是同一个实例化的对象
 == (Equal to)   : 比较两个对象的值是不是相等
 */

if otherMode === blueMode {
    print("otherMode and blueMode is the smae instances")
}


// 选择 类 和 结构体
print("记住结构体是传值，类是引用类型，就是传引用，指针？hahah")


print("注意！！！！！！！ String, Array and Dictionary 的复制问题")
// 和Foundation 里面的NSString, NSArray,和NSDictionary不一样的是。Swift中的String, Array and Dictionary 是结构体，而不是类
// 所以在复制这些基本数据的时候，他们都是将对应的值 Copy了一份，！！！



// 结构体的用法

// 结构体可以 扩充构造函数 和方法
struct Location{
    var x: Double
    var y: Double
    
    public init(x: Double, y: Double){
        self.x = x
        self.y = y
    }
    
    public init(xyString: String){
       let str = xyString.components(separatedBy: ",")
        self.x = Double(str.first!)!
        self.y = Double(str.last!)!
    }
    
    mutating func addX(x: Double){
        self.x += x
    }
    
    mutating func addY(y: Double) {
        self.y += y
    }
}

let lcoationA = Location.init(x: 123.00, y: 44.25)
var locationB = Location.init(xyString: "55.32,56.36")
locationB.addX(x: 55)    // 使用扩充方法一定要使用变量

// 当一个结构体被别人定义之后也可扩充 注意（delaration is only valid at file scope）
// 独立于class和struct,不能 在 class和struct 里面
extension Location{
    mutating func desc(){
        print("Location info: x-\(x) y-\(y)")
    }
}

locationB.desc()
 


