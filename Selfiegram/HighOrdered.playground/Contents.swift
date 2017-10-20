
// Filter
var nums = [Int]()
var src = [Int](0...16)
for i in src{
    if i % 2 == 0 {
        nums.append(i)
    }
}
nums

var nums2 = Array(0...16).filter { (a:Int) -> Bool in a % 2 == 0 }
nums2

var nums3 = (0...16).filter {$0 % 2 == 0}
nums3


// Map

var strings = nums3.map{"\($0)"}
strings

var ints = strings.map{Int($0)!}
ints

var nums4 = ints.map{$0 + 10}
nums4


// Reduce

var sum = nums4.reduce(0, {$0 + $1})
sum

var maxVal = nums4.reduce(Int.min, {max($0, $1)})
maxVal

var minVal = nums4.reduce(Int.max, {min($0, $1)})
minVal

// Join

var allPrices = strings.joined(separator: "RUB, " )
allPrices + "RUB"
