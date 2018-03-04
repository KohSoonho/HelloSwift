//: Playground - noun: a place where people can play

import Cocoa

/* Optional */
// In Swift, var/cont cannot be assigned nil!
// Error: var X = nil

// If you assign nil to var/cont, you need to make optional value by adding "?"
var X:Int? = nil     // This is optional value
X = 5                // Optional value is assigned any value.

// Note: optional value is not controled as normal value! (because it may be nil)
// Error: X * 2      // Optional value can be calculated!

print(X)             // X is Optional(5) not 5!

// In this case, Int:5 is wraped by optional type!
// If you want use Int:5, you must unwrap optional type!

/* Unwrap */
/* ! */
// This is very easy way to unwrap.
X! * 2               // It return 10.

// This way may cause error if value is nil.
X = nil
// Error: X!

// If you use if-else, "!" is used safely to unwrap optional.
var X1:Int? = 10
var X2:Int? = nil
var List = [X1, X2]

for num in List {
    if num != nil {
        print(num! * 2)           // X1 != nil, X1 is unwraped and caluculated.
    } else {
        print("This is empty!")   // X2 == nil, X2 is not unwraped
    }
}

/* ?? */
// "x ?? value" set value instead of x, if x is nil.
(X1 ?? 0) * 2    // X1 is not nil. It return X1 * 2.
(X2 ?? 0) * 2    // X2 is nil. It return 0 * 2. (0 is calculated instead of nil)

/* Optional Binding */
// Optional binding assign value to temporary var, if value is not nil. And return false if value is nil.
for num in List {
    if let temp = num {    // If num is not nil, temp is assigned num and if num is nil, return false
        print(temp * 2)    // X1 is not nil. temp is assigned X1 value and calculated.
    } else {
        print("This is empty!")  // X2 is nil. Optional binding return false and do else sentence.
    }
}

// Optional binding is used by while-loop.
var str:String? = "a"
var repeatstr:String = ""
var i:Int = 0

while let temp = str {  // If str is not nil, assign str to temp. (If str is nil, while-loop is not done.)
    repeatstr += temp
    i += 1
    if (i >= 10) {
        break         // when i = 10, while loop is broken.
    }
}

repeatstr

// Optional binding is used by guard-let.
func plusOne (num:Int?) -> (Void) {
    guard let temp = num else {
        return       // If num is nil, guard-let stop func.
    }
    print(temp + 1)  // If num is not nil, func is done.
}

plusOne(num: X1)
plusOne(num: X2)

// Optional binding is combined to condition.
if let temp = X1, temp < 5 {  // X1 is not nil, temp is assigned and condition is evaluated.
    print("big")
}

if let temp = X2, temp < 5 {  // X2 is nil, this condition is not done.
    print("big")
}

/* Optional Chain */
// When you access object._ or array._, it may cause error because it may be nil.
var Empty:[(size:Int, color:String)] = []
var notEmpty = [(size:2, color:"red")]

// Error: var sizeEmpty = Empty.first.size  (Empty.first is nil, so .size is not used)
// Error: var sizeNotEmpty = notEmpty.first.size (notEmpty.first may be nil.)

// You use "?" to use "." syntax without object when it may be nil.
var sizeEmpty = Empty.first?.size          // return nil
var sizeNotEmpty = notEmpty.first?.size    // return Optional(2)

// Combine optional binding and optional chain.
if let num = Empty.first?.size {
    print(num)
} else {
    print("empty!")
}

if let num = notEmpty.first?.size {
    print(num)
} else {
    print("empty!")
}
