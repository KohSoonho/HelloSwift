//: A Swift Tour
//: This is basic phrase of Swift

print("Hello Swift!")

// `let` make a constant
let myConstant = 42

// `var` make a variable
var myVariable = 42

// Var can be changed
myVariable = 50

/*
 * Constant can't be changed
 * Error: myConstant = 50
 */

// Constant and variable must have the same type as the value you want to assign it.

// Error: myVariable = "Hellow"  can't assign chr to int
// Error: myVariable = 5.5       can't assign dbl to int

// Specify the type by writing it after the varible, separated by a colon.

let implicitInteger: Int = 70
let inplicitDouble: Double = 70
let inplicitString: String = "70"  // If make strings enclose

// Experiment
// Create Float
let expFloat: Float = 4  // float is 4 digits

let label = "This width is "
let width = 94

// Values are never implicity converted another type
// Error: let widthLabel = label + width     width does not change chr automatically (The difference from R)
let widthLabel = label + String(width)       // change type of 94 to chr

// Simpler way to include values in str; \()
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let CRP: Float = 1.32
let testResult = "My CRP is \(CRP)"

// Use """ for strings that take up multiple lines.
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges)
piecies of fruits."
"""

// Array and dictionaries
/*
 *
 * Create arrays and dictionaries using [].
 * All contents must have same type. (It is like vector in R. [] is like c() in R.)
 * Access their elements by writing the index or key in branckets.
 *
 */

// Array is like vector in R.
var shoppinglist = ["catfish", "water", "tulips", "blue paint"]
shoppinglist[1]  // In Swift first element are accessed [0], not [1]. This is difference from R
shoppinglist[1] = "bottle of water"          // shoppinglist[5] = "x" is error! Can't add new contents.
print(shoppinglist)

// Dictionary is like vector having name in R.
var occupation = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic"
]
occupation["Jayne"] = "Public Relations"     // add new contents
print(occupation)

// Create empty array or dictionary, use the initializer syntax

let emptyStrArray = [String]()
let emptyStrDictionary = [String: Float]()
shoppinglist = []
occupation = [:]

print(shoppinglist)  // Becom empty array
print(occupation)    // Become empty dictionary

// Control Flow
// If sentens and For loop
let individual_scores = [75, 43, 103, 87, 12]
var team_score = 0

for score in individual_scores {  // The condition expression does not need "()" in for loop.
    if score > 50 {               // The condition expression does not need "()" in if satement, too.
        team_score += 3
    }else{
        team_score += 1
    }
}
print(team_score)

/*
 * I can use `if` and `let` together to work with values that might be missing.
 * These value represent "optional".
 * An optional value contains a value or nil. (nil is NULL at R)
 * Write ? after type of value to mark the value as optional.
 */

var optional_string: String? = "Hello"    // optional string
var optional_string2: String = "Hello"    // normal string

print(optional_string == nil)
/*
 * If value is nil, the condition is false.
 * print(optional_string2 == nil)  It return warining
 */

var optional_name: String? = "Soonho"
var greeting = "Hello!"
if let name = optional_name {
    greeting = "Hello!, \(name)"
}

var optional_name2: String? = nil
var greeting2 = "Hello!"
if let name2 = optional_name2 {
    greeting2 = "Hello!, \(name2)"    // If value is nil, the code is blank.
}

/*
 * Another way to handle optional value is to provide a default
 * value using the ?? operator.
 * If optional value is missing, the default value is used instead.
 */

let nickname: String? = "Hiro"
let full_name: String = "Koh Soonho"
let informal_greeting = "Hi \(nickname ?? full_name)"    // return nickname (optional value)

let country1: String? = nil
let country2: String  = "Korea"
let I_was_born = "I was born in \(country1 ?? country2)" // return country2 (default value)

// Switch support any kind of data and a wide variety of comparison operations
let vegetable = "red pepper"
switch vegetable {                               // switch is not need ()
case "celery":
    print("Add some raising and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwitch.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spisy \(x)?")
default:
    print("Everything tastes good in soup.")     // switch must be exhausitive, default must be needed
}

print(vegetable)
/*
 * Execution of switch does not continue to next case.
 * So switch can apply constants
 */
 
// For-in iterate over items in a dictionary by providing a pair of names to use for each key-value pair.

let interesting_numbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var name = ""

for (kind, numbers) in interesting_numbers {
    for number in numbers {
        if number > largest {
            largest = number
            name = kind
        }
    }
}

largest    // it return largest number in overall
name       // it return largest name in overall

var largest2 = 0
var name2 = ""

// This code return same result.
for (kind, numbers) in interesting_numbers {
    for number in numbers {
        if number > largest2 {
            (name2, largest2) = (kind, number)
        }
    }
}

largest2
name2

// Using "_" make for loop over dictionary without warning.
// But imformation about name is not got.

var largest3: Int = 0
for(_, numbers) in interesting_numbers {
    for number in numbers {
        if number > largest3 {
            largest3 = number
        }
    }
}
largest3

//While loop
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// it return 128 (when n > 100, it is different form R's while loop)

// This code return same result.
var m = 2
repeat {
    m *= 2
}while m < 100
print(m)

var total = 0
for i in 0..<4 { // omit upper value
    total += i   // 0 + 1 + 2 + 3
}
print(total)

var prod = 1
for i in 1...4 { // include upper and lower
    prod *= i    // 1 * 1 * 2 * 3 * 4
}
print(prod)

// Error: for i 1<..4 is not used in for loop

// Function and closures

/*
 * Use func to declare a function.
 * Use -> to separate the parameter namesand types from the function's return type
 */
 
func greet (person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

greet(person: "Bob", day: "Tuesday")

/*
 * By default, function use their parameter names as labels for their arguments.
 * Write a custom argument label for their arguments. ("on" day)
 * Write "_" to use no argument label. ("_" person)
 */
 
func greet2 (_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

greet2("Jhonson", on: "Wednesday")

// Use a tuple to make a compound value.
func calculate_statistics (scores: [Int])
    -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            }else if score < min{
                min = score
            }
            sum += score
        }
        
        return(min, max, sum)
        
}

let statistics = calculate_statistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)    // This mean statistics$sum in R
print(statistics.2)      // This mean statistics[3] in R

// Func can be nested.
// Nested function have access to variable in outer func. (closure)

func return_fifteen () -> Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y
}

return_fifteen()

// Closure save argument in func.
func increacementer() -> (() -> Int) {
    var count = 1
    func increacement() ->Int {
        count += 1
        return count
    }
    return increacement
}

var counter = increacementer()
counter()
counter()
counter()

// Function can return another function as value
func make_increacement() -> ((Int) -> Int) {  // This func return ((input: Int) -> output: Int)
    func add_one(number: Int) -> Int {
        return 1 + number
    }
    return add_one
}

var increment = make_increacement()
increment(7)

// Function can take another function as one of its arguments.
func has_any_match(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func less_than_ten(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
has_any_match(list: numbers, condition: less_than_ten)

// Closure can be written ({}).
// Use "in" to separate the arguments and return type from the body.

// `map` iterate
numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

let mapped_numbers = numbers.map({
    number in 3 * number
})

print(mapped_numbers)

// `filter` select
numbers.filter({(numbers: Int) -> Bool in
    return numbers % 2 == 1
})

// `Reduce` accumulate to one contain
numbers.reduce(0, {(total: Int, numbers: Int) -> Int in
    return total + numbers
})

// `Sorted` sort numbers
let sorted_number = numbers.sorted {
    $0 > $1
}
print(sorted_number)
