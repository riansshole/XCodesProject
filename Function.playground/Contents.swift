import UIKit

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Gilang"))
print(greet(person: "Dimas"))

func greetagain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetagain(person: "Gilang"))

// parameter dan return dalam function

// func tanpa parameter
func sayhelloworld() -> String {
    return "Hello, world"
}
print(sayhelloworld())

// func dengan parameter
func greet(person: String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted {
        return "Hello again, " + person
    } else {
        return "Hello, " + person + "!"
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

// func with minmax array

func minMax(array: [Int]) -> (min: Int, max: Int)?{
    
    if array.isEmpty { return nil }
    var currentmin = array[0]
    var currentmax = array[0]
    for value in array[1..<array.count]{
        if value < currentmin {
            currentmin = value
        } else if value > currentmax {
            currentmax = value
        }
    }
    return (currentmin, currentmax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

if let emptyBound = minMax(array: []){
    print("Min is \(emptyBound.min) and max is \(emptyBound.max)")
} else {
    print("emptyBound is empty.")
}

// func implicit return

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Gilang"))

func anothergreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}

print(anothergreeting(for: "Gilang"))

// label argumen dan nama parameter dalam function

func greet2(person: String, from: String = "Jakarta") -> String {
    return "Hello \(person), glad you could join us from \(from)"
    
}

print(greet2(person: "Gilang", from: "Bandung"))


func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)
arithmeticMean(3, 8.25, 18.75)

// in-out parameters

func swaptoints(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someint = 5
var anotherint = 905
swaptoints(&someint, &anotherint)
print("someint is now \(someint), and anotherint is now \(anotherint)")

// tipe data dalam function

func addtwoints(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplytwoints(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printmathresult(_ mathfunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    
    print("Hasilnya adalah \(mathfunction(a,b))")
}

var mathfunction: (Int, Int) -> Int = addtwoints
print("Hasil dari 2+3 adalah \(mathfunction(2,3))")
mathfunction = multiplytwoints
print("Hasil dari 2*3 adalah \(mathfunction(2,3))")
printmathresult(addtwoints, 3, 5)


func stepforward(_ input: Int) -> Int{
    return input + 1
}

func stepbackward(_ input: Int) -> Int {
    return input - 1
}

func choosestepfunction(backward: Bool) -> (Int) -> (Int) {
    return backward ? stepbackward : stepforward
}

func choosestepfunction2(forward: Bool) -> (Int) -> (Int) {
    return forward ? stepforward : stepbackward
}

var currentvalue = 3
let movenearertozero = choosestepfunction(backward: currentvalue > 0)

let movenearertohundred = choosestepfunction2(forward: currentvalue < 100)


while currentvalue != 0 {
    print("Counting to zero:")
    print("\(currentvalue)...")
    currentvalue = movenearertozero(currentvalue)
}
print("zero!")


//function bersarang

func choosestepfunction3(backward: Bool) -> (Int) -> Int {
    func stepforward(input: Int) -> Int { return input + 1}
    func stepbackward(input: Int) -> Int{ return input - 1}
    return backward ? stepbackward : stepforward
}
 var value = -4
let movetozero = choosestepfunction3(backward: value > 0)
let movetohundred = choosestepfunction3(backward: value < 100)

while value != 0 {
    print("\(value)...")
    value = movetozero(value)
}
print("Zero")

