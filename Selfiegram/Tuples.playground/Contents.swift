

// Returned type
func getLikes()->(likes: Int, name: String) {
    return (30, "Imya")
}

getLikes().likes

func getLikes2()->(likes: Int, name: String)? {
    return nil
}

getLikes2()?.name

// Tuple in Dictionary
var dict = ["Vovan": 30, "Loh": 100]

var s = ""
for i in dict {
    s += i.0+", "
}
s

// Variable
let names = ("Vova", "Loh", "Ugar", "Toje")
