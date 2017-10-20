
// For native classes
extension Int {
    
    var someValue: Int {
        return 42
    }
    
    var stringDescription: String {
        return "Number is \(self)"
    }
    
}
100.stringDescription

// Our logic
class PersonData {
    
    var age = 18
    
}

extension PersonData {
    
    func ageInMonths()-> Int {
        return age * 12
    }
    
    func ageInWeeks()-> Int {
        return age * 52
    }
    
}

let data = PersonData()
data.age
data.ageInMonths()
data.ageInWeeks()
