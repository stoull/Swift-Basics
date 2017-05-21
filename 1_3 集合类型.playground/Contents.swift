//: Playground - noun: a place where people can play

import UIKit


// 没有Mutable 这个类型了，也只有声明成var 类型就是可变类型

// 有序集合 Array
// Create a empty Array
var someInts = Array<Int>() // [Int]()
if someInts.isEmpty {
    print("someInts is empty")
}
someInts.append(30)

// 创建一个有4个默认值为0.0的数组
var threeDoubles = Array(repeating: 0.0, count: 4)
threeDoubles[0...2] = [1.8,9.9]

// 创建一个新的引用，数组中所有元素值都会复制一遍，对新引用的操作不影响旧数组
var otherDoubles = threeDoubles

// otherDoubles变， threeDoubles 不变
otherDoubles.insert(2.30, at: 2)

print(threeDoubles) // [1.8, 0.0, 0.0, 0.0]
print(otherDoubles) // [1.8, 0.0, 2.23, 0.0, 0.0]


let arr = ["Yellow","Blue"]
let brr = arr

// 对数组元素的增删查改
var shopingList = ["Eggs", "Milk"]
shopingList.append("Four")
shopingList += ["Tissue"]
shopingList.remove(at: 3)

// 将最后一个元素Four 替换成 ["Bananas", "Pear"]
shopingList[shopingList.count - 1...shopingList.endIndex - 1] = ["Bananas", "Pear"]

shopingList // ["Eggs", "Milk", "Bananas", "Pear"]
// 遍历每一个元素的值
for (index, value) in shopingList.enumerated(){
    print("Item \(index + 1) : \(value)")
}


// Sets 无序集合，可哈希，相同元素只有一个

var letters = Set<Character>()

letters.insert("a")
letters.insert("a") // 相同元素只会存储一次

letters // ["a"]

var favoriteType: Set = ["Rock", "Classical" , "Rap"]
favoriteType.insert("Jazz")

// 是否移除对应的元素
if let remvoedType = favoriteType.remove("Funk"){
    print("\(remvoedType) ? I'm over it.")
}else{
    print("I never much care for that")
}

for type in favoriteType.sorted(){
    print("\(type)")
}

// 无序集合Set 的集合运算，主要有下面四种运算：
/*
 intersection(_:)        求交集： 求同时属于两集合的元素的集合
 union(_:)               求并集： 示两集合所有元素的集合
 symmetricDifference(_:) 求对称差集：求两个集合中只属于其中一基合元素的集合（除两集合共有元素外的所有元集的集合）
 subtracting(_:)         求差集：求不属于集中一个集合的元素集合
 */

let oddDigists: Set = [1, 3, 5, 7, 9]
let evenDigists: Set = [2, 4, 6, 8, 0]
let singleDigistPrimeNumbers: Set = [2, 3, 5, 7] // 质数(素数)

oddDigists.union(evenDigists).sorted()     // 求并
oddDigists.intersection(evenDigists).sorted() // 求交
oddDigists.symmetricDifference(singleDigistPrimeNumbers).sorted() // 求对称差
oddDigists.subtracting(singleDigistPrimeNumbers).sorted() // 求差

// 判断各集合的关系
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals) // 判断是否是谁谁的子集
farmAnimals.isSuperset(of: houseAnimals) // 判断是否是谁谁的父集了
farmAnimals.isDisjoint(with: cityAnimals) // 是否是没有任何相同元素

// Dictionaries 字典? 

// Dictionary<Key, Value>
var emptyDic = [String: String]()

var aBird = ["name" : "Arctic tern" , "length" : "28–39 cm", "brief" : "The species is strongly migratory"]

// 增
aBird["reproduction"] = "Breeding begins around the third or fourth year"
aBird["diet"] = "carnivorous"

// 改
aBird["reproduction"] = "..."
if let oldvalue = aBird.updateValue("Fourth year", forKey: "reproduction"){
    print("The old value of reproduction is \(oldvalue)")
}

// 查
if let birdName = aBird["name"] {
    print("The bird name : \(birdName)")
}else{
    print("No name")
}

// 删
aBird.removeValue(forKey: "brief")

// 遍历
for (property, value) in aBird{
    print("\(property) : \(value)")
}

for property in aBird.keys{
    print("\(property)")
}

// 取所有的key 或values
let propertys = [String](aBird.keys)
let values = [String](aBird.values)





