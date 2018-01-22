//: A Swift Tour
//: This is basic phrase of Swift

print("Hello Swift!")

/* `let` make a constant */
let myConstant = 42

/* `var` make a variable*/
var myVariable = 42

// Var can be changed
myVariable = 50

// Constant can't be changed
// Error: myConstant = 50

// Constant and variable must have the same type
// as the value you want to assign it.

// Error: myVariable = "Hellow"  can't assign chr to int
// Error: myVariable = 5.5       can't assign dbl to int

// Specify the type by writing it after the varible, separated by a colon.
let implicitInteger: Int = 70
let inplicitDouble: Double = 70
let inplicitString: String = "70"  /* If make strings enclose "" */

// * Experiment
// Create Float
let expFloat: Float = 4  /* float is 4 digits */

let label = "This width is "
let width = 94

// Values are never implicity converted another type
// Error: let widthLabel = label + width     width does not change chr automatically (The difference from R)
let widthLabel = label + String(width) /* change type of 94 to chr */

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
// Create arrays and dictionaries using [].
// All contents must have same type. (It is like vector in R. [] is like c() in R.)
// Access their elements by writing the index or key in branckets.

// Array is like vector in R.
var shoppinglist = ["catfish", "water", "tulips", "blue paint"]
shoppinglist[1]  /* In Swift first element are accessed [0], not [1]. This is difference from R */
shoppinglist[1] = "bottle of water" // shoppinglist[5] = "x" is error! Can't add new contents.
print(shoppinglist)

// Dictionary is like vector having name in R.
var occupation = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic"
]
occupation["Jayne"] = "Public Relations"  /* add new contents */
print(occupation)

// Create empty array or dictionary, use the initializer syntax
let emptyStrArray = [String]()
let emptyStrDictionary = [String: Float]()
shoppinglist = []
occupation = [:]

print(shoppinglist)  /* Becom empty array */
print(occupation)    /* Become empty dictionary */

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

// I can use `if` and `let` together to work with values that might be missing.
// These value represent "optional".
// An optional value contains a value or nil. (nil is NULL at R)
// Write ? after type of value to mark the value as optional.

var optional_string: String? = "Hello"  /* optional string */
var optional_string2: String = "Hello"  /* normal string */

print(optional_string == nil)         // If value is nil, the condition is false.
// print(optional_string2 == nil)  It return warining

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

// Another way to handle optional value is to provide a default
// value using the ?? operator.
// If optional value is missing, the default value is used instead.
let nickname: String? = "Hiro"
let full_name: String = "Koh Soonho"
let informal_greeting = "Hi \(nickname ?? full_name)"    // return nickname (optional value)

let country1: String? = nil
let country2: String  = "Korea"
let I_was_born = "I was born in \(country1 ?? country2)" // return country2 (default value)

