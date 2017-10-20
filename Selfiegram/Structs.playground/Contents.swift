import Foundation

// Classes

class Fruit:NSObject {
    
    var weight = 500
    
}

var fruit = Fruit()
var fruit2 = fruit          // Copying link

fruit2.weight = 1000
fruit.weight

var fruitIsEqual:Bool = fruit == fruit2

// Structs

struct Vegetable:CustomStringConvertible {

    var weight:Int
    var date:String
    
    var description: String {
        return "<Vegetable weight=\(weight)>"
    }
    
}

var veg = Vegetable(weight: 700, date: "2017")
var veg2 = veg              // Copying variables(structs)

veg2.weight = 2000
veg.weight
