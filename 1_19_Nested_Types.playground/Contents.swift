//: Playground - noun: a place where people can play

import UIKit

// Nested Types 嵌套类型

// 什么都先别说，代码是最好的解释语言

/*
 A--Ace，K--King，Q--Queen，J--Jack，红桃--heart 黑桃--spade，方片--diamond，梅花--club
 
 BlackJack 汉语名称是梅花杰克又名，又名“二十一点”，起源于法国，现已流传到世界各地。
 游戏者的目标是使手中的牌的点数之和不超过 21 点且尽量大
 
 目前国际上最流行的法国式扑克上人物如下：
　四张K分别代表四位国王：大卫（黑桃K）；查理大帝或查理七世（红心K）；亚历山大大帝（梅花K）；凯撒（方块K）。
 */


// BlackjackCard 游戏者手中的一张牌BlackjackCard
struct BlackjackCard {
    
    // 这个是花色
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    // 这个是值 2-10的牌面数字为2-10. J/Q/K/王的牌面数字为10. A(ace)-的牌面数字可以是1或11.
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
        
    }
    
    // 牌和值和花色属性
    let rank: Rank, suit: Suit
    
    var description: String {
        var output = "suit is \(suit.rawValue)"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

// 游戏者手中发到一张牌
let theAceofSpades = BlackjackCard(rank: .ace, suit: .hearts)

// 查看下这张查
print("theAceOfSpades: \(theAceofSpades.description)")

// 游戏接下去就是，让游戏者的目标是使手中的牌的点数之和不超过 21 点且尽量大。。。。


// 嵌套类型的引用 struct-enum
let clubsSymbol = BlackjackCard.Suit.clubs.rawValue;

let kingRank = BlackjackCard.Rank.king.rawValue;

/*
 分析
 
 这张BlackjackCard牌，设计的怎么样？？？？简直了，用一个 struct 就灵活搞定了！！！！
 struct 里面有 enum。 enum 里面有 struct 这个就是Nested Types （嵌套类型）
 
 类，枚举，结构体之间可以相互嵌套
 嵌套类型的引用点语法即可
 
 */
