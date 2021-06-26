import UIKit

// Automatic Reference Counting (ARC)

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Dicoding Indonesia")
// Prints "Dicoding indonesia is being initialized"

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// Strong reference cycle between class instance

class People {
    let name: String
    init(name: String) { self.name = name }
    var apartement: Apartement?
    deinit { print("\(name) is being deinitialized") }
}

class Apartement {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartement \(unit) is being deinitialized") }
}

var memberDiCoding: Person?
var DiCodingSpace: Apartement?

memberDiCoding = Person(name: "Rahmadiyan Muhammad")
DiCodingSpace = Apartement(unit: "DiCoding Academy")


// MEMORY SAFETY

// A write access to the memory one is stored
var one = 1

// A read access to the memory one is stored
print("We are number \(one)")


func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber = 1

myNumber = oneMore(than: myNumber)
print(myNumber)

var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}

// buat salinan

var copyOfStepSize = stepSize
increment(&copyOfStepSize)

// perbarui variable yg asli

stepSize = copyOfStepSize


func balance(_ x: inout Int, y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30

print("\n")

struct Player {
    var name: String
    var health: Int
    var energy: Int
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, y: &health)
    }
}

var Rian = Player(name: "Rian", health: 10, energy: 10)
var Toni = Player(name: "Toni", health: 5, energy: 10)

Toni.shareHealth(with: &Rian)

var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, y: &playerInformation.energy)

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
