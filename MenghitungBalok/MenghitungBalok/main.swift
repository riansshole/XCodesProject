//
//  main.swift
//  MenghitungBalok
//
//  Created by Rian on 01/06/21.
//

import Foundation

// Membuat form menghitung balok
print("Selamat datang di DiCoding Academy")

// kode untuk memasukkan input dari user

print("Masukkan lebar balok: "); let width = readLine()
print("Masukkan panjang balok: ");let length = readLine()
print("Masukkan tinggi balok: "); let height = readLine()

// proses perhitungan
if let length = Double(length ?? "0"), let height = Double(height ?? "0"), let width = Double(width ?? "0") {
    
    let volume = length * height * width
    let surfaceArea = 2 * ((width * length) + (width * height) + (height + length))
    let circumference = 4 * (width + length + height)
    
    print("------------------")
    
    print("""
    Anda memiliki sebuah balok dengan:\n
    1. Lebar \(width)\n
    2. Panjang \(length)\n
    3. Tinggi \(height)\n
    4. Volume \(volume)\n
    5. Luas permukaan \(surfaceArea)\n
    6. Kelilingnya adalah \(circumference)\n
    """)

} else {
    // ketika input tidak valid
    print("------------")
    print("Input tidak valid")
    print("------------")
}
