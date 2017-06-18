//: Playground - noun: a place where people can play

import UIKit

// Swift Optional Chaining
/*
 Swift 可选链
 可选链（Optional Chaining）是一种可以请求和调用属性、方法和下标的过程，用于请求或调用的目标可能为nil。
 可选链返回两个值：
 如果目标有值，调用就会成功，返回该值
 如果目标为nil，调用将返回nil
 多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效。
 */

/*
  ======================

// 可选链和强制拆包解决包的对比

class Person {
    var residence: Residence? // 有一个可选类型的属性
}

class Residence {
    var numberOfIDs = 33334444
}


let AChang = Person()

// 这里用强制解包会出问题的，因为AChang这个人的residence为 nil
//let roomOfAchange = AChang.residence!.numberOfIDs

// 用可选链可以去判断这个属性是不是nil，这样不会出错，如下：
if let IdNubmer = AChang.residence?.numberOfIDs {
    print("阿长的身份证号码是：\(IdNubmer)")
} else {
    print("阿长这个人没有身份证号码!")
}

AChang.residence = Residence()

if let IdNumbers = AChang.residence?.numberOfIDs {
    print("阿长的身份证号码是：\(IdNumbers)");
}else{
    print("阿长这个人还是没有身份证")
}
 
 ======================
 */

// 为可选链定义模型类, 主要是用来判断你访问的对象是否存在，不存在就返回nil
class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        return rooms[i];
    }
    
    func printNumberOfRooms() {
        print("房间号为 \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    var name: String
    init(name: String) {
        self.name = name;
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if (buildingNumber != nil){
            return buildingNumber
        }else{
            return nil
        }
    }
}

let AChang = Person()
if ((AChang.residence?.printNumberOfRooms()) != nil) {
    print("阿长的房间号)")
}else {
    print("无法输出房间号")
}

// 能过上面的可选链，printNumberOfRooms 如果有响应返回类型为void，无响应就会返回nil

//var room1 = Room.init(name: "浴室")
//var room2 = Room.init(name: "客厅")
//var residense001 = Residence()
//residense001.rooms = [room1, room2]
//
//AChang.residence = residense001

// 使用可选链调下标脚本
if let firstRoomNmae = AChang.residence?[0].name {
    print("第一个房间名 \(firstRoomNmae)")
}else {
    print("未能获得第一个房间的名字")
}

// 访问可选类型的下标
/*如果下标返回可空类型值，比如Swift中Dictionary的key下标。可以在下标的闭合括号后面放一个问号来链接下标的可空返回值：
 */

var testScores = ["Dave": [86, 23, 45], "Bev": [21, 88, 23]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++


// 连接多层链接
if let achangsStreet = AChang.residence?.address?.street {
    print("阿长的地址为：\(achangsStreet)")
}else {
    print("阿长没有地址")
}

/*
 对返回可选值的函数进行链接
 我们还可以通过可选链接来调用返回可空值的方法，并且可以继续对可选值进行链接。
 */
let AChang = Person()
if ((AChang.residence?.printNumberOfRooms()) != nil) {
    print("阿长的房间号)")
}else {
    print("无法输出房间号")
}







