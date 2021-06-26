//
//  main.swift
//  PenghitungNilai
//
//  Created by Rian on 10/06/21.
//

import Foundation

print("Selamat datang di DiCoding Indonesia")
print("-------------------------------------")
print("Masukkan total nilai yang akan dinilai", terminator: ": "); let total = readLine() ?? ""
print("-------------------------------------")

if let totalitem: Int = Int(total) {
    var allvalue = [Int]()
    for index in 1...totalitem {
        print("Masukkanlah item ke \(index)", terminator: ": "); let newItem = Int(readLine() ?? "") ?? 0
        allvalue.append(newItem)
    }
    print("-------------------------------------")
    var sum :Int = 0
    
    for (_, value) in allvalue.enumerated() {
        sum += value
    }
    let average = sum / totalitem
    var grade = ""
    
    switch average {
    case 0...40:
        grade = "E";
        break
    case 41...50:
        grade = "D";
        break
    case 51...60:
        grade = "C";
        break
    case 61...70:
        grade = "C+";
        break
    case 71...80:
        grade = "B";
        break
    case 81...90:
        grade = "B+";
        break
    case 91...100:
        grade = "A";
        break
    default:
        grade = "Tidak valid";
    }
    
    if grade != "Tidak valid" {
        print("Anda mendapatkan nilai Grade nilai \(grade) dari \(total) nilai yang ada. \nAnda mendapatkan total nilai \(sum) dengan rata-rata \(average)")
    } else {
        print("Nilai tidak valid")
    }
} else {
    print("Input tidak valid")
}
print("-------------------------------------")
