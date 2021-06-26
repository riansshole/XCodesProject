import UIKit

enum compasspoint {
    case north
    case south
    case east
    case west
}

enum planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earth = planet.earth

var directionToHead = compasspoint.west

directionToHead = .east

// memastikan nilai dengan switch

switch earth {
    case .earth:
    print("Mostly harmless")
        
    default:
    print("Not a safe place for humans")
}


// iterating over enumeration cases

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberofchoice = Beverage.allCases.count
print("\(numberofchoice) beverages available")

for i in Beverage.allCases {
    print(i)
}


// associated value

enum barcode {
    case upc(Int,Int,Int,Int)
    case qrcode(String)
}

var productcode =   barcode.upc(1, 24984, 13758, 9)
productcode = .qrcode("DICODING INDONESIA")

switch productcode {
    case .upc(let numbersystem, let manufacturer, let product, let check):
        print("UPC :\(numbersystem), \(manufacturer), \(product), \(check)")
    case .qrcode(let product):
        print("QR Code: \(product)")
}

enum ASCIIControlChar: Character {
    case tab = "\t"
    case linefeed = "\n"
    case carrigereturn = "\r"
}

// implicitly assigned raw value

enum planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint: String {
    case north, east, south, west
    
}

let earthorder = planet2.earth.rawValue
print("earth memiliki posisi \(earthorder) pada tata surya bimasakti")

let sunsetdirection = CompassPoint.west.rawValue
print("matahari tenggelam pada arah \(sunsetdirection)")

// initializing from a raw value

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let positiontofind = 11
if let somePlanet = Planet(rawValue: positiontofind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positiontofind)")
}

