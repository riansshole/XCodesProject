//
//  main.swift
//  LatihanClosure
//
//  Created by Rian on 10/06/21.
//

import Foundation

// Function untuk mendapatkan item dari customer
func getInput(message: String) -> String? {
    print(message, terminator: ": ");
    return readLine()
}

func getInputInt(message: String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
    } else {
        return nil
    }
}

// speedTotal untuk menampung variable speed

var speedTotal = 0

// closure untuk menambahkan kecepatan

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    func Incrementer() -> Int {
        speedTotal += amount
        return speedTotal
    }
    return Incrementer
}

// closure untuk mengurangi kecepatan

func makeDecrement(forDecrement amount: Int) -> () -> Int {
    func Decrementer() -> Int {
        speedTotal -= amount
        return speedTotal
    }
    return Decrementer
}

// menentukan nilai penambahan dan pengurangan

let incrementByTen = makeIncrement(forIncrement: 10)
let decrementByTen = makeDecrement(forDecrement: 10)


// menyalakan motor listrik

func turnOnEngine() {
    print("Hidupkan mesin...")
    print("Selamat datang di motor listrik DiCoding")
    print("Brrppp..")
}

func turnOffEngine() {
    print("Sampai jumpa kembali")
}

func showSpeed() {
    print("Kecepatan saat ini: \(speedTotal) km/h")
}
// memberi aksi ke motor listrik

func action() {
    print("---------")
    print("Ayo beraksi: ")
    print("[1] Tambah kecepatan")
    print("[2] Kurangi kecepatan")
    print("[3] Matikan mesin")
    
    if let state = getInputInt(message: "Masukkan pilihan") {
        switch state {
        case 1:
            speedTotal = incrementByTen()
            showSpeed()
            action()
        case 2:
            if speedTotal > 0 {
                speedTotal = decrementByTen()
                showSpeed()
                action()
            } else {
                turnOffEngine()
                break
            }
        case 3:
            turnOffEngine()
            break
        default:
            break
        }
    } else {
        print("Input tidak valid")
    }
}

// memulai program

// Memulai program

turnOnEngine()
action()
