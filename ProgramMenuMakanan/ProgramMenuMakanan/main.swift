//
//  main.swift
//  ProgramMenuMakanan
//
//  Created by Rian on 11/06/21.
//

import Foundation

// function untuk mendapatkan input dari user
func getInput(message: String) -> String?{
    print(message, terminator: ": ");
    return readLine()
}

func getInputInt(message: String) -> Int?{
    if let inputString = getInput(message: message) {
        return Int(inputString)
    } else {
        return nil
    }
}

// Kelas makanan berat
enum heavyMeal: Int, CaseIterable {
    case nasiGoreng = 1, mieInstan, magelangan, nasiKuning, kwetiau, nasiPutih
}

// Kelas makanan ringan
enum sideDish: Int, CaseIterable {
    case ikan = 1, telur, tempe, tahu, kerupuk
}

// Kelas minuman
enum drinks: Int, CaseIterable {
    case esTeh = 1, esJeruk, kopi, airPutih
}

func showAllHeavyMeal(){
    var position = 1
    print("Makan berat")
    for heavyMeal in heavyMeal.allCases {
        print("[\(position)] \(heavyMeal)")
        position += 1
    }
}

func showAllSideDish(){
    var position = 1
    print("Lauk")
    for sideDish in sideDish.allCases {
        print("[\(position)] \(sideDish)")
        position += 1
    }
}

func showAllDrinks() {
    var position = 1
    print("Minuman")
    for drink in drinks.allCases {
        print("[\(position) \(drink)]")
        position += 1
    }
}

var total = 0
var item = ("","","")

func inputHeavyMeal() {
    if let position = getInputInt(message: "Pilih makanan") {
        if let heavyMeal = heavyMeal(rawValue: position) {
            switch heavyMeal {
            case .mieInstan:
                total += 6000
                item.0 = "Mie Instan"
            case .kwetiau:
                total += 10000
                item.0 = "Kwetiau"
            case .magelangan:
                total += 7000
                item.0 = "Magelangan"
            case .nasiGoreng:
                total += 9000
                item.0 = "Nasi Goreng"
            case .nasiPutih:
                total += 3000
                item.0 = "Nasi Putih"
            case .nasiKuning:
                total += 5000
                item.0 = "Nasi Kuning"
            }
        } else {
            print("Posisi \(position) tidak ditemukan")
        }
    } else {
        print("Input tidak valid")
    }
}

func inputSideDish() {
    if let position = getInputInt(message: "Pilih lauk") {
        if let sideDish = sideDish(rawValue: position) {
            switch sideDish {
            case .ikan:
                total += 5000
                item.1 = "Ikan"
            case .kerupuk:
                total += 500
                item.1 = "Kerupuk"
            case .tahu:
                total += 1000
                item.1 = "Tahu"
            case .telur:
                total += 3000
                item.1 = "Telur"
            case .tempe:
                total += 1000
                item.1 = "Tempe"
            }
        } else {
            print("Posisi \(position) tidak ditemukan")
        }
    } else {
        print("Input tidak valid")
    }
}

func inputDrinks() {
    if let position = getInputInt(message: "Pilih minuman") {
        if let drink = drinks(rawValue: position) {
            switch drink {
            case .airPutih:
                total += 0
                item.2 = "Air Putih"
            case .esJeruk:
                total += 2500
                item.2 = "Es Jeruk"
            case .esTeh:
                total += 2000
                item.2 = "Es Teh"
            case .kopi:
                total += 3000
                item.2 = "Kopi"
            }
        } else {
            print("Posisi \(position) tidak ditemukan")
        }
    } else {
        print("Input tidak valid")
    }
}

func menu() {
    print("Selamat datang di diCoding cafe!")
    print("--------------------------------")
    
    showAllHeavyMeal()
    inputHeavyMeal()
    
    print("--------------------------------")
    
    showAllSideDish()
    inputSideDish()
    
    print("--------------------------------")
    
    showAllDrinks()
    inputDrinks()
    
    print("--------------------------------")
    
    print("Anda memilih \(item.0), \(item.1), \(item.2) dengan total harga \(total)")
    print("--------------------------------")
    print("--------------------------------")
    
    print("Terima kasih. Sampai jumpa kembali")
}



menu()

