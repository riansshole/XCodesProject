//
//  main.swift
//  DataDiri
//
//  Created by Rian on 01/06/21.
//

import Foundation

print("Hello, selamat datang di Dicoding Academy")
print("----------------------") 

/*
 let firstname = "Rahmadiyan", lastname = "Muhammad"
 let fullname = firstname + " " + lastname
 let address = "Jakarta"
 let job = "iOs Developer"
 let age = 22

 print("----------------------")

 print("Apakah kalian tau \(fullname)?")
 print("\(firstname) adalah seorang \(job).")
 print("Saat ini ia berumur \(age) dan tinggal di \(address).")

 print("----------------------")

 */

//Memasukkan input user

print("Masukkan nama depan anda: "); let firstname = readLine()!
print("Masukkan nama belakang anda: "); let lastname = readLine()!
print("Masukkan umur anda: "); let age = readLine()!
print("Masukkan alamat anda: "); let address = readLine()!
print("Masukkan pekerjaan anda: "); let job = readLine()!

let fullname = firstname + " " + lastname

// output

print("----------------------")

print("Apakah kalian tau \(fullname)?")
print("\(firstname) adalah seorang \(job).")
print("Saat ini ia berumur \(age) dan tinggal di \(address).")

print("----------------------")
