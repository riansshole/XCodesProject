import UIKit

let names = ["Rian","Toni","Anto","Gendut"]

for name in names {
    print("Hello, \(name)")
}

let numberoflegs = ["laba-laba" : 8, "semut" : 6, "kucing" : 4, "ayam" : 2]
for (animalnames, legcount) in numberoflegs {
    print("\(animalnames) mempunyai \(legcount) kaki")
}


// Ular Tangga
print("=====")
print("Ular Tangga")
print("=====")

let finalsquare = 25
var board = [Int](repeating: 0, count: finalsquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] + 02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0 // Penampung kotak
var diceroll = 0 // Penampung dadu

repeat {
  diceroll += 1
    if diceroll == 7 {diceroll = 1}
    square += diceroll
    if square < board.count {
        square += board[square]
    }
    print(square)
} while square < finalsquare

print("Game over!")

// pernyataan kondisional

var tempincelcius = 35
if tempincelcius <= 25 {
    print("its very cold. Wear a jacket!")
} else if tempincelcius >= 40 {
    print("It's really warm")
} else {
    print("Its not that cold")
}


// switch

let someChar: Character = "z"

switch someChar {
case "a":
    print("The first letter of alphabet ")
case "z":
    print("The last letter of alphabet")
default:
    print("Some other character")
}

let anotherchar: Character = "a"

switch anotherchar {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}


//interval matching in switch

let approxcount = 62
let countedthings = "Moons orbiting saturn"
let naturalcount : String

switch approxcount {
case 0:
    naturalcount = "No"
case 1..<5:
    naturalcount = "A few"
case 5..<12:
    naturalcount = "Several"
case 12..<100:
    naturalcount = "Dozens of"
case 100..<1000:
    naturalcount = "Hundreds of"
default:
    naturalcount = "Many"
}

print("There are \(naturalcount) \(countedthings)")


//switch with tuples

let somepoint = (1,1)
switch somepoint {
case (0,0):
    print("\(somepoint) is at the origin")
case (_,0):
    print("\(somepoint) is on the x-axis")
case (0,_):
    print("\(somepoint) is on the y-axis")
case(-2...2, -2...2):
    print("\(somepoint) is inside of the box")
default:
    print("\(somepoint) is outside of the box")
}

//value bindings

let anotherpoint = (2,0)

switch anotherpoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x,y):
    print("somewhere else at (\(x)), \(y))")
}

//where

let thirdpoint = (1,-1)

switch thirdpoint {
case let (x,y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x,y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//compound cases

let somechar = String(1)

switch somechar {
case "a","e","i","o","u":
    print("\(somechar) is a vowel")
case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
    print("\(somechar) is a consonant")
default:
    print("\(somechar) is not a vowel nor a consonant")
}

//compound case binding

let yetanotherpoint = (9,0)

switch anotherpoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


// control transfer continue

let puzzleinput = "great minds think alike"
var puzzleoutput = ""
let chartoremove: [Character] = ["a","e","i","u","o"," "]

for character in puzzleinput {
    if chartoremove.contains(character){
        continue
    }
    puzzleoutput.append(character)
}

print(puzzleoutput)

// control transfer break

let numbersymbol: Character = "三" // Chinese symbol for number 3
var possibleintegervalue: Int?
switch numbersymbol {
case "1", "١", "一", "๑":
    possibleintegervalue = 1
case "2", "٢", "二", "๒":
    possibleintegervalue = 2
case "3", "٣", "三", "๓":
    possibleintegervalue = 3
case "4", "٤", "四", "๔":
    possibleintegervalue = 4
default:
    break
}
if let integerValue = possibleintegervalue {
    print("The integer value of \(numbersymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numbersymbol).")
}

// control transfer fallthrough

let integertodesc = 5
var description = "The number \(integertodesc) is"

switch integertodesc {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer"
}
print(description)

// early exit dengan guard

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name":"John"])

greet(person: ["name":"Jane", "location":"Cupertino"])
