

// Optional binding - обход форса(анврапинга) на переменной str
var str:String? = nil //"Hello"

if let n = str {        // Optional binding
    let str2 = n + " World"
} else {
    print("ERROR")
}


// Optional chaining
class Test {
    var arr:[Int]? = [900, 600]
}

var test:Test? = Test()
test?.arr?[0]           // Optional chaining - на каждом шаге происходит проверка(?), есть ли там значение или это nil
