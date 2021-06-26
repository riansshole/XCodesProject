import UIKit


// closure expression

let names = ["Gilang","Rian","Toni","Farrah","Nina","Gibran","Momo"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedname = names.sorted(by: backward)
print(reversedname)

reversedname = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2 })

reversedname = names.sorted(by: {s1, s2 in return s1 > s2})

// implicit return from single-expression closures

reversedname = names.sorted(by: {s1, s2 in s1 > s2 })

// shorthand argument names

reversedname = names.sorted(by: {$0 > $1})


// operator methods

reversedname = names.sorted(by: >)
print(reversedname)

// trailing closure

func somefunctionthattakesaclosure(closure: () -> Void) {
    // Function body
}

// tanpa trailing closure
somefunctionthattakesaclosure (closure: {
})

// dengan trailing closure
somefunctionthattakesaclosure () {
}


//contoh
let digits = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (numbers) -> String in
    var number = numbers
    var output = ""
    repeat {
        output = digits[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print("Strings bertipe data array string dan memiliki nilai \(strings)")

// capturing values

func makeincrementer(forIncrement amount: Int) -> () -> Int {
    var runningtotal = 0
    func incrementer() -> Int {
        runningtotal += amount
        return runningtotal
    }
    return incrementer
}

let incrementbyten = makeincrementer(forIncrement: 10)

print(incrementbyten())
print(incrementbyten())
print(incrementbyten())

let incrementbyseven = makeincrementer(forIncrement: 7)
print(incrementbyseven())

print(incrementbyten())
print(incrementbyseven())

print("\n")
// Closure are reference type
let alsoincrementbyten = incrementbyten
print(alsoincrementbyten())
print(incrementbyten())

// escaping closure
print("\n")
var completionhandlers: [() -> Void] = []

func somefunctionwithescapingclosure(completionhandler: @escaping () -> Void) {
    completionhandlers.append(completionhandler)
}

func somefunctionwithnoneescapingclosure(closure: () -> Void) {
    closure()
}

class someclass {
    var x = 10
    func dosomething() {
        somefunctionwithescapingclosure { self.x = 100 }
        somefunctionwithnoneescapingclosure {
            x = 200
        }
    }
}

let instance = someclass()

//referensi tanpa escaping closure
instance.dosomething()
print(instance.x)

//referensi dengan escaping closure
completionhandlers.first?()
print(instance.x)



// Auto closure

var customerinline = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider()) !")
}

print(customerinline.count)

let customerprovider = {customerinline.remove(at: 0)}
print(customerinline.count)

print("Now serving \(customerprovider()) !")

print(customerinline.count)

serve(customer: customerinline.remove(at: 0))

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String){
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customerinline.remove(at: 0))
collectCustomerProviders(customerinline.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for costumerProvider in customerProviders {
    print("Now serving \(customerprovider())!")
}

print("Customer count \(customerinline.count)")
