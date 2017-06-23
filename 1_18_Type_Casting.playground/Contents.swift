//: Playground - noun: a place where people can play

import UIKit

// Type Casting 类型转换
/*
 Type Casting是一种用来判断实例类型的方法，
 Type Casting 的操作符 is 和 as。用来检查和转换类型
 Type Casting 也可以用来判断某一个类是否遵守某一个协议
*/

// 下面是一个有继承关系的类

// 定义一个 媒体 MediaItem 类
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// 定义两个 MediaItem 的子类, 一个是Movie 一个Song
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// 现在用一个库（数组）装这些个 电影啊，歌啊

let library = [
    Movie.init(name: "南京南", director: "张文龙"),
    Song.init(name: "苍天在上", artist: "郑钧"),
    Song.init(name: "贤良", artist: "苏阳乐队"),
    Movie.init(name: "小寡妇成仙记", director: "蔡成杰"),
    Song.init(name: "一无所有", artist: "崔健"),
    Movie.init(name: "游泳", director: "王迪"),
]

// 现在进行类型判断，并计算歌和电影的总数有多少
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {         // 这里用 is 操作符，判断是不是某一个类型
        movieCount += 1
    }else if item is Song {
        songCount += 1
    }
}

print("在库里面，歌有：\(songCount) 首， 电影有：\(movieCount)")


// Downcasting 向下类型转换

/*
 有些实例可以使用类型转换操作符（ as? 或 as! ）将它向下类型转换至其子类类型。
 由于向下类型转换能失败，类型转换操作符就有了两个不同形式。条件形式， as? ，返回了一个你将要向下类型转换的值的可选项。强制形式， as! ，则将向下类型转换和强制展开结合为一个步骤。
 */

// 现在要将库里所有电影和歌的信息打印出来，怎么做？是不是要将媒体类转换成电影或歌，才好访问其对应的属性
for item in library {
    if let movie = item as? Movie {
        print("电影：\(movie.name) 导演: \(movie.director)")
    }else if let song = item as? Song {
        print("音乐：\(song.name) 歌手为：\(song.artist)")
    }
}

// Any 和 AnyObject 的类型转换 还记不记得Object-c里面的 id 类型
/*
 Swift 为不确定的类型提供了两种特殊的类型别名：
 - AnyObject  可以表示任何类类型的实例。
 - Any  可以表示任何类型，包括函数类型。
 
 只有当你确切需要使用它们的功能和行为时再使用 Any 和 AnyObject 。在写代码时使用更加明确的类型表达总要好一些。
 */

// 来一个可以装任何类型的数组
var things = [Any]()

// 装些乱七八糟的东西进去
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

// 这个时候要你找出任意位置的数据的类型，怎么弄？

// 当然是使用 as 和 is 了
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

/*
 注意
 
 Any类型表示了任意类型的值，包括可选类型。如果你给显式声明的Any类型使用可选项，Swift 就会发出警告。如果你真心需要在Any值中使用可选项，如下所示，你可以使用as运算符来显式地转换可选项为Any。
 
 let optionalNumber: Int? = 3
 things.append(optionalNumber)        // Warning
 things.append(optionalNumber as Any) // No warning
 */
