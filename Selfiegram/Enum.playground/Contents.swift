
// Simple

enum Fruit {
    
    case Apple
    case Pear
    case Orange
    
}

let f:Fruit = .Apple

// Complex

enum TrafficLight {

    case Green
    case Yellow
    case Red
    
    mutating func nextLight() {
        switch self {
            case .Green:
                self = .Yellow
            case .Yellow:
                self = .Red
            case .Red:
                self = .Green
        }
        
    }
    
}

var tf:TrafficLight = .Green
tf.nextLight()
tf.nextLight()
tf.nextLight()

// Complex 2

enum Car:String {
    
    case Toyota = "Japan"
    case Lada = "Russia"
    case BMW = "Germany"
    
}

let c = Car.BMW
c.rawValue

enum CustomCar {
    
    case NonameFromChina(name: String)
    case NonameFromSomewheare(name: String)
    
}

var cc = CustomCar.NonameFromChina(name: "GreatWall")
cc = CustomCar.NonameFromSomewheare(name: "UFO")
