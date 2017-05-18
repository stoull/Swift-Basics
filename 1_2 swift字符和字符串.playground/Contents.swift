//: Playground - noun: a place where people can play

import UIKit

/* 在 swift 里字符的类型是 Character 类型, 字符串的类型是 String 类型。
这绝对比 NSString 酷炫很多
*/

var str = "Hello"

let isStrEmpty: Bool = str.isEmpty      // str == nil ??.....

let greetString = str + "Hut"  // 没有NSMutableString! ，只要声明为变量就可变了


// 字符和字符串之间的转换
let aCharacter: Character = "!"
let aCharacters: [Character] = ["S", "t", "o", "u", "l", "l", aCharacter]
var strFromChs = String(aCharacters)        // 字符转字符串

for che in strFromChs.characters{           // 字符串转字符
    print(che)
}

strFromChs.append(aCharacter)   // 增加一个字符

var welcome = "How"


//字符串的操作
welcome.insert(".", at: welcome.endIndex)  // 插入一个字符
welcome.insert(contentsOf: " stoull".characters, at: welcome.endIndex) // 插入一个String

welcome.remove(at: welcome.index(before: welcome.endIndex))     // 返回最后一个字符之前的所有字符

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)           // 对特定位置的字符进行操作


// 字符串的比较
let quotaton = "Freedom is not worth having if it does not include the freedom to make mistakes. — Mahatma Gandhi"
let sameQuotation = "Freedom is not worth having if it does not include the freedom to make mistakes. — Mahatma Gandhi"

if quotaton == sameQuotation {
    print(quotaton)
}else{
    print("No same")
}

// 判断是否有前后缀
let remoAndJulist = "Act 1 Scene 1: A room in Capulet's mansion End"
let hasPrefiexAct = remoAndJulist.hasPrefix("Act 1")
let hasSuffixEnd = remoAndJulist.hasSuffix("End")


// Unicode  和 UTF-8 ,UTF-16 等各种编码

let dogString = "Dog‼🐶"

let utf8Dog = dogString.utf8
dogString.utf16
dogString.unicodeScalars

let queryAllowedDog = dogString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)      // 编码方式

print(utf8Dog)
print(queryAllowedDog ?? <#default value#>)

