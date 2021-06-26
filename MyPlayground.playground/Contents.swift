import UIKit

var shoppingList = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 6)
shoppingList.remove(at: 4)
shoppingList.removeLast()
print(shoppingList)

var someValues = Array(repeating: 2, count: 3)
var anotherValues = someValues + Array(repeating: 3, count: 2)
print(anotherValues)


var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("Jazz")
favoriteGenres.remove("Rock")
print(favoriteGenres.sorted())

var someValues2 = Array(repeating: 2, count: 3)
print(someValues)

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports["LHR"] = "London"
airports.updateValue("Dublin Airport", forKey: "DUB")
airports.removeValue(forKey: "DUB")
print(airports)

let anotherPoint = (2, 0)
switch anotherPoint {
    case (let x, 0):
        print("On the x-axis with an x value of \(x)")
    case (0, let y):
        print("On the y-axis with a y value of \(y)")
    case let (x, y):
        print("Somewhere else at (\(x), \(y))")
}

var i = 1, n = 3
repeat {
    print(i)
    i+=1
} while i < n

let base = 2, power = 4
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

var shorthand: (String, String) -> String
shorthand = { $1 }
print(shorthand("100", "200"))

enum CompassPoint {
     case north, south, east, west
}
var directionToHead = CompassPoint.west
directionToHead = .south
switch directionToHead {
    case .north:
        print("Bahasa Jawanya adalah \"Lor\"")
    case .south:
        print("Bahasa Jawanya adalah \"Kidul\"")
    case .east:
        print("Bahasa Jawanya adalah \"Kulon\"")
    case .west:
        print("Bahasa Jawanya adalah \"Wetan\"")
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int { return multiplier * index }
}
let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[5])

class Person {
    let name: String
    init(name: String) { self.name = name; print("\(name) is being initialized") }
    deinit { print("\(name) is being deinitialized") }
}
var reference1: Person? = Person(name: "Dicoding indonesia")
var reference2: Person? = reference1
var reference3: Person? = reference1
reference1 = nil
reference2 = nil
reference3 = nil
