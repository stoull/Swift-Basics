//: Playground - noun: a place where people can play

import UIKit

// Subscripts 下标 就是通过 实例名称后面加方括号[]来访问给实例赋值和获取。在数组中,我们称之为索引,而在字典中我们叫做key键值。如Array[3], Dictionary["aKey"]。现在这些下标的赋值和获取可以自定义！！！！！！！

// Classes, structures, and enumerations can define subscripts

// 定义一个一天的饭的类型, 而且可以用下标去设置和查询今天吃什么
class DailyMeal
{
    enum MealTime {   // 一天呀的有三餐,如果有的地方只有二餐就定义二餐
        case Breakfast
        case Lunch
        case Dinner
    }
    
    var meals: [MealTime : String] = [:]   // 这个类型装吃的，哪一餐吃什么
    
    // 用 subscript 定义用下标存取值,是用[]不是.语法哦，这里最不像计算属性
    subscript (requestedMeal : MealTime) -> String {
        
        // 下标取值 用 get 实现
        get {
            if let thisMeal = meals[requestedMeal]
            {
                return thisMeal
            }else {
                return "Noodles"
            }
        }
        
        // 下标设值 用 set 实现
        set (newValue) {
            meals[requestedMeal] = newValue
        }
    }
}

// 设置一天要吃什么 (我都是用下标设置的，不是用方法，不是用.)
var thursdayMeal = DailyMeal()
thursdayMeal[.Breakfast] = "Cookie"
thursdayMeal[.Lunch] = "Rice"
thursdayMeal[.Dinner] = "茄子"

// 看着我是用[]去查看要吃什么哦,(不是.  不是. 不是.)

print("星期四的晚上吃：\(thursdayMeal[.Dinner])") // 是不是很 6, 可以用计算属性.语法去实现

// 所以这里的下标可以是任何类型

// 用 [] 实现一个阶乘 (这个是只读哦,也就是不能用[]去设置值)
struct FactorialGenerator {
    subscript(factorial: Int) -> Int{
        get{
            var total = 1
            if factorial > 0
            {
                for value in 1...factorial
                {
                    total = total * value
                }
                
            }
            return total
        }
    }
}

let factorialGenerator = FactorialGenerator()
print("5 的 5 次方等于：\(factorialGenerator[5])")


// 前面的下标都是只有一个值 也可以多个值

// 玩一下一个矩形，可以通下标（对应的行列值）去设置和访问对应的行列值

struct Matrix {
    let rows: Int , columns: Int;
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row > 0 && row < rows && column > 0 && column < columns
    }
    
    subscript (row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "超出了范围")
            return grid[row * column + column]
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "超出了范围")
            self.grid[row * column + column] = newValue
        }
    }
}

var aMatrix = Matrix(rows: 5, columns: 5)
for i: Int in 5...10 {
    for j: Int in 10...15 {
        aMatrix[i, j] = Double(i * j)
    }
}

print("aMatrix[7, 12] = \(aMatrix[7, 12])")






