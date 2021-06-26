import UIKit

// structure

struct Resolution {
    var width = 0
    var height = 0
}

class videoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = videoMode()
let vga = Resolution(width: 640, height: 480)

// menggunakan dot syntax
print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// mengubah value dengan dot syntax

someVideoMode.resolution.width = 1280

print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise initializer for Structure Type

print(vga)

// Structure and Enumeration merupakan Tipe Data Nilai / Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("Cinema is now \(cinema.width) pixels wide.")

print("Hd is still \(hd.width) pixels wide.")

// Enumeration

enum CompassPoint {
    case north, east, south, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

// Class merupakan tipe data reference

let tenEighty = videoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoteneighty = tenEighty
alsoteneighty.frameRate = 30.0

print("The framerate property of tenEighty is now \(tenEighty.frameRate) frame per second.")
print("The framerate property of alsoTenEIghty is now \(alsoteneighty.frameRate) frame per second.")

if tenEighty === alsoteneighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
} else {
    print("tenEighty and alsoTenEighty doesn't have the same framerate property")
}


// Properties

struct fixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = fixedLengthRange(firstValue: 0, length: 3)
print("Jangkauan tersebut memiliki nilai \(rangeOfThreeItems)")

rangeOfThreeItems.firstValue = 6
print("Jangkauan tersebut sekarang memiliki nilai \(rangeOfThreeItems)")

// stored properties of constant structure instance

var rangeOfFourItems = fixedLengthRange(firstValue: 0, length: 4)
// jangkauan tersebut memiliki nilai integer 0, 1, 2

rangeOfFourItems.firstValue = 6

// apabila rangeOfFourItems di deklarasikan sebagai let/constanta, tidak bisa diubah dengan .firstvalue


// Lazy Stored Properties

class dataImporter {
    // DataImporter adalah class untuk mengimpor data dari berkas eksternal
    // Class ini diasumsikan akan mengambil jumlah waktu yang tak ditentukan

    var filename = "data.txt"
}

class dataManager {
    lazy var importer = dataImporter()
    var data = [String]()
}

let manager = dataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.filename)


print("Getter Setter")

struct Point {
    var x = 0.0, y = 0.0
}

struct Shape {
    var origin = Point()
    var center: Point {
        get {
            return Point(x: origin.x / 2, y: origin.y / 2)
        }
        
        set(newCenter) {
            origin.x = newCenter.x / 2
            origin.y = newCenter.y / 2
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume).")

// Property observer

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newSteps) {
            print("About to set totalSteps to \(newSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 50
stepCounter.totalSteps = 150
stepCounter.totalSteps = 420

// Properties

struct someStructure {
    static var storedTypeProperties = "Some value."
    static var computedTypeProperties: Int {
        return 1
    }
}

enum someEnumeration {
    static var storedTypeProperties = "Some value."
    static var computedTypeProperties: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperties = "Some value."
    static var computerTypeProperties: Int {
        return 27
    }
    
    class var overrideableComputerTypeProperties: Int {
        return 107
    }
}


// method

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0

counter.increment()
// the counter value is now 1

counter.incrementBy(amount: 5)
// the counter value is now 6

counter.reset()
// the counter value is now back to 0

counter.incrementBy(amount: 100)
print(counter.count)

struct Point2 {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somepoint = Point2(x: 4.0, y: 5.0)

if somepoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// modifying value types

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point3(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

// Assigning to self within a Mutating Method

struct Point4 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point4(x: x + deltaX, y: y + deltaY)
    }
}

// Mutating Method to Enumeration

enum triStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = triStateSwitch.low
ovenLight.next()
print("ovenLight sama dengan to \(ovenLight)")

ovenLight.next()
print("oveLight sama dengan to \(ovenLight)")

// type methods

class SomeClass2 {
    static func someTypeMethod() {
        // code
    }
}

SomeClass2.someTypeMethod()


// SUBSCRIPT

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// SUBSCRIPT USAGE

var numberOfLegs = ["Spider" : 8, "Ant" : 6, "Cat" : 4]

numberOfLegs["bird"] = 2

print("Menampilkan numberOfLegs \(numberOfLegs)")


// SUBSCRIPT OPTION

struct Matrix {
    let rows: Int, collumns: Int
    var grid: [Double]

    init(rows: Int, collumns: Int) {
        self.rows = rows
        self.collumns = collumns
        grid = Array(repeating: 0.0, count: rows * collumns)
    }
    
    func indexIsValid(row: Int, collumn: Int) -> Bool {
        return row >= 0 && row < rows && collumn >= 0 && collumn < collumns
    }
    
    subscript(row: Int, collumn: Int) -> Double {
        get {
            assert(indexIsValid(row: row, collumn: collumn), "index out of range")
            return grid [(row * collumns) + collumn]
        }
        set {
            assert(indexIsValid(row: row, collumn: collumn), "index out of range")
            grid[(row * collumns) + collumn] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, collumns: 2)

matrix[0,1] = 1.5
matrix[1,0] = 3.2


print(matrix)

// type subscript

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)

class Vehicle {
    var currentspeed = 0.0
    var description: String {
        return "Traveling at \(currentspeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing
    }

}

class Bicycle : Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentspeed = 15.0
print("Bicylce: \(bicycle.description)")

class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentspeed = 22.0
print("Tandem: \(tandem.description)")

// OVERRIDING

class Train : Vehicle {
    override func makeNoise() {
        print("Choo choo")
    }
}

let train = Train()
train.makeNoise()




class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentspeed = 25.0
car.gear = 3
print("Car: \(car.description)")


// INITIALIZATION

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) degree Fahrenheit")

struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = (kelvin - 273.15)
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print("boilingPointOfWater.temperatureInCelsius bernilai \(boilingPointOfWater.temperatureInCelsius)")

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print("freezingPointOfWater.temperatureinCelsius bernilai \(freezingPointOfWater.temperatureInCelsius)")

// Initializer

struct size {
    var width = 0.0, height = 0.0
}

let twobytwo = size(width: 2.0, height: 2.0)


class Size3 {
    var width: Double, height: Double
    init(w: Double, h: Double) {
         width = w
         height = h
    }
}

let twobytwo2 = Size3(w: 2.0, h: 2.0)

// required initializer

class SomeClass3 {
    required init() {
        // initializer akan diimplementasikan disini
    }
}

// DEINITIALIZATION

var counter2 = 3; // for reference counting

class BaseClass {
    init() {
        counter2 += 1
    }
    deinit {
        counter2 -= 1
    }
}

var base: BaseClass? = BaseClass()
print(counter2)
print(counter2)

// PROTOCOL

protocol FullyNamed {
    var fullName: String { get }
}

struct person: FullyNamed {
    var fullName: String
}

let John = person(fullName: "John Appleased")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print("ncc1701.fullname adalah \"\(ncc1701.fullName)\"")

// method requirements

protocol randomNumberGenerator {
    func random() -> Double
}

class linearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = linearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

// mutating method requirements

protocol Togglable {
    mutating func toggle()
}

enum onoffscwitch : Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightswtich = onoffscwitch.off
lightswtich.toggle()

print("Lightswitch is now equal to \(lightswtich)")

lightswtich.toggle()
print("Lightswitch is now equal to \(lightswtich)")



protocol tcpprotocol {
    init(a: Int)
}

class mainClass {
   var a: Int // local storage

   init(a: Int) {
      self.a = a // initialization
   }
}


class subClass: mainClass, tcpprotocol{
    var b: Int
    
    init (a: Int, b: Int) {
        self.b = b
        super.init(a: a)
    }
    
    required override convenience init(a: Int) {
        self.init(a:a, b:0)
    }
}

let resultMainClass = mainClass(a: 30)
let resultSubClass = (a: 50, b: 60)

print("result is: \(resultMainClass.a)")
print("result is: \(resultSubClass.a)")
print("result is: \(resultSubClass.b)")


// EXTENSION

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meter")

let threefeet = 3.ft
print("Three feet is \(threefeet) meter")

// initializer

struct size2 {
    var width = 0.0, height = 0.0
}

struct Point5 {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point5()
    var size = size2()
    
}

let defaultrect = Rect()
let memberwiserect = Rect(origin: Point5(x: 2.0, y: 2.0), size: size2(width: 5.0, height: 5.0))

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    mutating func square() {
        self = self * self
    }
}

4.repetitions {
    print("Hello")
}

// mutating instance method

var someInt = 3
someInt.square()
print("someInt is now \(someInt)")

// Subscript

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

func swapToInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var int1 = 4
var int2 = 157
swapToInts(&int1, &int2)
print("int1 is now \(int1), and int2 is now \(int2)")

func swaptovalues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var int3 = 83
var int4 = 203
swaptovalues(&int3, &int4)
print("int3 is now \(int3), int4 is now \(int4)")

var something = "dicoding"
var something2 = "indonesia"
swaptovalues(&something, &something2)
print("something is now \(something), something2 is now \(something2)")

// generic type stack

struct Stack<Element>{
    var items = [Element] ()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var dicodingAcademy = Stack<String>()
dicodingAcademy.push("Memulai pemrograman dengan Kotlin")
dicodingAcademy.push("Menjadi android developer expert")
dicodingAcademy.push("Belajar android untuk pemula")
dicodingAcademy.push("Memulai pemrograman dengan Swift")

// stack dicodingAcademy sekarang terdapat 4 nilai

let fromTheTop = dicodingAcademy.pop()
// fromTheTop sama dengan "Memulai pemrograman dengan Swift". Dan saat ini dicodingAcademy memiliki 3 value

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items [items.count - 1]
    }
}

if let topItem = dicodingAcademy.topItem{
    print("The top item on the stack is \(topItem)")
}


protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> Item { get }
}
