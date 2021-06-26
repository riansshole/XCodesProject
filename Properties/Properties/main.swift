//
//  main.swift
//  Properties
//
//  Created by Rian on 11/06/21.
//

import Foundation

print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
