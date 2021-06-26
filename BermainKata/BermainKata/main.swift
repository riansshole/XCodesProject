//
//  main.swift
//  BermainKata
//
//  Created by Rian on 01/06/21.
//

import Foundation

print("Selamat datang di Dicode Academy!")
print("Mari bermain kata!")
print("-----------------------------------")

print("Masukkan nama depan anda:"); let firstname = String(readLine() ?? "")
print("Masukkan nama belakang anda:"); let lastname = String(readLine() ?? "")
print("-----------------------------------")

print("Berikut ini operator yg akan digunakan:")

//operator concatenation
let concatenatestring = firstname + lastname
print("1. String Concatenation Operator: \"\(concatenatestring)\"")

//operator mutability
var mutabilitystring = ""
mutabilitystring += firstname
mutabilitystring += lastname
print("2. String Mutability Operation: \"\(mutabilitystring)\"")

//operator Comparison
var comparisonstring = ""
if firstname == lastname {
    comparisonstring = String(true)
} else {
    comparisonstring = String(false)
}
print("3. String Comparison Operator: \"\(comparisonstring)\"")
print("Berikut ini adalah fungsi fungsi yang digunakan:")

//Menggabungkan nama depan dan belakang
let fullname = firstname + " " + lastname

//fungsi is empty

let empty = firstname.isEmpty || lastname.isEmpty
print("1. Fungsi isEmpty: \"\(empty)\"")

//fungsi start index

let startindex = fullname[fullname.startIndex]
print("2. Fungsi StartIndex: \"\(startindex)\"")

//fungsi index

let index = fullname[fullname.index(after: fullname.startIndex)]
print("3. Fungsi index: \"\(index)\"")

//fungsi index lainnya

let customindex = fullname[fullname.index(fullname.startIndex, offsetBy: 5)]
print("4. Fungsi index kelima: \"\(customindex)\"")

//fungsi endindedx

let endindex = fullname[fullname.index(before: fullname.endIndex)]
print("5. Fungsi endindex: \"\(endindex)\"")

//fungsi insert

var insert = fullname
insert.insert("!", at: insert.endIndex)
print("6. Fungsi insert: \"\(insert)\"")

//fungsi remove

var remove = insert
remove.remove(at: remove.index(before: remove.endIndex))
print("7. Fungsi remove: \"\(remove)\"")

//fungsi append

var append = firstname
append.append(lastname)
print("8. Fungsi append: \"\(append)\"")

//fungsi count

let count = fullname.count
print("9. Fungsi count: \(count)")
print("================================FINISH================================")
