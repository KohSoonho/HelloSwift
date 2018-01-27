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

// These closure function assist iterate.
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

// Objects and Class

/*
 * Use class followed by the class's name to create class.
 * Mehotd and function declaretions are written the same way.
 */

class Shape {
    var number_of_sides = 0
    func simple_description() -> String{
        return "A shape with \(number_of_sides) sides"
    }
}

//Create as instance of a class by putting parentheses after class name.
//Use dot syntax to access the properties and methods of instance.

var shape = Shape()
shape.number_of_sides = 7
var shape_descriprion = shape.simple_description()

// An initializer to set up the class when an instance is created. Use init to create one.

class NamedShape {
    // Every property needs a value assigned - either in its declaration (as with number_of_sides) or in the initializer (as with name).
    var number_of_sides: Int = 0  // This is defined default value, so it need not init.
    var name: String              // In default, init is nil, but it is not optional and return error.
    
    init(name: String) {
        self.name = name          // Define defalut value = name.
        // `self` is used to distinguish the name property from name argument to the initializer.
    }
    
    func simple_description() -> String {
        return "A shape with \(number_of_sides) sides."
    }
}

// Subclass include their superclass after their name, separated by a colon.

class Square: NamedShape {
    // Square inherits properties of NamedShape
    var side_length: Double
    
    init (side_length: Double, name: String) {
        self.side_length = side_length
        super.init(name: name)
        number_of_sides = 4
    }
    
    func area() -> Double {
        return side_length * side_length
    }
    
    override func simple_description() -> String {
        // `override` override subclass's implementation marked with override only in a subclass
        return "A square with sides of length \(side_length)."
    }
}

let test = Square(side_length: 5.2, name: "my test square")
test.area()                       // return 5.2 * 5.2
test.simple_description()         // return "A square with sides of length 5.2"

// Make another subclass of NamedShape called Circle.

class Circle: NamedShape {
    var radius: Float
    
    init (radius: Float, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Float {
        return radius * radius * Float.pi
    }
    
    override func simple_description() -> String {
        return "A circle widh radius of length \(radius)"
    }
    
}

let test2 = Circle(radius: 2.0, name: "my test circle")
test2.area()
test2.simple_description()

// Properties can have getter and a setter.

class EquilaterTriangle: NamedShape{
    var side_length: Double = 0.0
    
    init(side_length: Double, name: String) {
        self.side_length = side_length
        super.init(name: name)
        number_of_sides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0 * side_length
        }
        set{
            side_length = newValue / 3.0
            // In the setter for perimeter, the new value has the implicit name newValue.
            // I can provide an explicit name in parentheses after set.
        }
    }
    
    override func simple_description() -> String {
        return "An equilateral triangle with sides of length \(side_length)."
    }
}

var triangle = EquilaterTriangle(side_length: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.simple_description()

triangle.perimeter = 9.9          // Set newValue = 9.9, side_length change to 3.3 at this point.
print(triangle.side_length)
triangle.simple_description()

/*
 * Notice that the initializer for the EquilateralTriangle class has three different step:
 *  1. Setting value of properties that the subclass declares.
 *  2. Calling the superclass's initializer.
 *  3. Changing the value of properties defined by the superclass.
 *     Any additional setup work that uses methods, getters, or setters can also be done at this point.
 */

// If you don't need to compute the property but still need to provide code that is run before and after setting a new value, use `didSet` and `willSet`.
class TriangleAndSquare {
    var triangle: EquilaterTriangle{
        willSet {
            square.side_length = newValue.side_length
        }
    }
    var square: Square {
        willSet{
            triangle.side_length = newValue.side_length
        }
    }
    
    init(size: Double, name: String) {
        square   = Square(side_length: size, name: name)
        triangle = EquilaterTriangle(side_length: size, name: name)
    }
}

var triangle_and_square = TriangleAndSquare(size: 10, name: "another test shape")
print(triangle_and_square.square.side_length)
print(triangle_and_square.triangle.side_length)

triangle_and_square.square = Square(side_length: 50, name: "larger square")
print(triangle_and_square.triangle.side_length)

// Properties with set/get do NOT store values!!!
// Properties with willSet/didSet DO store values.

// When working with optional value, you can write ? before operations.

let optional_square: Square? = Square(side_length: 2.5, name: "optional square")
let side_length = optional_square?.side_length

