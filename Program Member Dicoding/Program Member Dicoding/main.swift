//
//  main.swift
//  Program Member Dicoding
//
//  Created by Rian on 16/06/21.
//

import Foundation

// Function input user

func getInputString(message: String) -> String {
    print(message, terminator: ": ");
    return readLine() ?? ""
}

func getInputInt(message: String) -> Int {
    return Int(getInputString(message: message)) ?? 0
}

// Blueprint class

protocol personProtocol {
    var firstName: String {set get}
    var lastName: String {set get}
    var address: String {set get}
    func fullName() -> String
}

class Person: personProtocol {
    var firstName: String
    var lastName: String
    var address: String
    init(firstName: String, lastName: String, address: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
    
    func fullName() -> String {
        var parts: [String] = []
        parts += [firstName]
        parts += [lastName]
        return parts.joined(separator: " ")
    }
}

protocol  studentProtocol {
    var school: String {set get}
    func getInformation() -> String
}

class Student: Person, studentProtocol {
    var school: String = ""

    func getInformation() -> String {
        return "Perkenalkan, nama saya \(fullName()). Saya sekolah di \(school). \nMari belajar bersama"
    }
}

print("Selamat datang di aplikasi DiCoding Member")
print("Mari belajar bersama!")

let firstName = getInputString(message: "Masukkan nama depan kamu")
let lastName = getInputString(message: "Masukkan nama belakang kamu")
let address = getInputString(message: "Masukkan alamat kamu")
let school = getInputString(message: "Masukkan asal sekolah kamu")

let member = Student(firstName: firstName, lastName: lastName, address: address)
member.school = school

print("-------------------------------")
print(member.getInformation())

print("-------------------------------")
print("Terima kasih, selamat datang kembali")
