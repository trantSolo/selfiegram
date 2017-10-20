//: Playground - noun: a place where people can play

import UIKit

var str:String = "HELLOW!"
var arr:Array<Int> = [1, 2, 3]
var dict:[String:Int] = ["one":1, "two":2, "three":3] //generic, like Map
var set:Set = [1, 2, 3]

// Add and get

arr.append(4) //add
arr += [5, 6, 7] //add
arr[0] //get

dict["four"] = 4 //add by key
dict["one"] //get
dict

set.insert(4) //add
set

// Remove

arr.remove(at: 1) //remove

dict["two"] = nil //remove by key, nil = null (just remove both, K & V)
dict

set.remove(2) //remove by Value
set

// Update

arr[0] = 0 //update by index
arr

dict["one"] = 0 //update by Key
dict

// Loops
    // Arrays

str = ""
for i in 1...5 {
    str += "\(i) ,"
}
str

str = ""
for j in 0 ..< arr.count {
    str += "\(arr[j]) ,"
}
str

str = ""
for k in arr {
    str += "\(k) ,"
}
str

str = ""
var l = 0
while l < arr.count {
    str += "\(arr[l]) ,"
    l += 1
}
str

str = ""
var n = 0
repeat {
    str += "\(arr[n]) ,"
    n += 1
} while n < arr.count
str
str = ""

    //Dictionary

for el in dict {
    str += el.0 + ": \(el.1), "
}
str
str = ""

    // Set

for el in set {
    str += "\(el), "
}
str
















