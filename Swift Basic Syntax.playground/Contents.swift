//: Playground - noun: a place where people can play

import Cocoa

/* declaration of constant and variable */

// let declare constant, constant cannot be changed
let name:String = "Koh"
let height:Int = 175, weight:Double = 80.0
// Error: name = "Other String"

// If you do not define constant at first time, you can assign constant only one time.
let price:Int
price = 2500  // You can assign constant one time.

// var declare variable, variable can be changed.
var hero:String = "Arus"
var Lv:Int = 1, Attack:Int = 10

hero = "Enix"  // You can change value of variable.
Lv = 3

// var can be declared without assignment of value, too.
var Defence:Int
Defence = 10

/* type inference */
// If you define type of constant/variable, Swift infer type of value.
// You can check type of value to use type(of: ).
var Speed = 10                 // This is Int.
type(of: Speed)
let gameName = "DRAGON QUEST"  // This is String.
type(of: gameName)

/* Cast: change type */
let tax:Double = 0.08
// Error: price * (1 + tax)  You can use only same type to caluculate
// ---() can chage value to --- type (cast).
Double(price) * (1 + tax)  // Change price to double, you can caluculate.

/* Global constant */
// Some number is defined global constant.
M_E     // e
M_LOG2E // log2(e)
M_LN2   // loge(2)
M_1_PI  // 1/pi

// pi is defined double and float. These are different digits.
Double.pi
Float.pi

/* tuple */
// tuple make you control plural values as one value.
var Party = ("Hero", "Warrior", "Wizard", "Priest")
// tuple can contain various type of value
let Japan:(String, Int) = ("prefecture", 48)
// In tuple, inference of type is done as same as constant/variable.

// Error: Party = (1, 2, 3, 4) you cannot assign different type value.

// Extract data of tupple
let data = (10, 20)
let (num1, num2) = data   // You can assign num1 = 10, num2 = 20
num1 + num2               // return 30

let (num3, _) = data      // Wild card("_") can be used instead of empty.
num3

// You can extract value from tuple using index number.
data.0    // Note: index number of first element is 0 not 1.
data.1

// You can set label of tuple.
var myParty = (Hero:"Arus", Fighter:"Ryu", Chief:"Yufi", Priest:"Krift", fights:10)
// You can extract value from tuple by label.
myParty.Hero
myParty.fights

// If you declare labeling tuple, write name:(label:type, ...)
var typesOfSwift:(INT:Int, DBL:Double, STR:String, CHR:Character, BOOL:Bool)
typesOfSwift.INT = 1
typesOfSwift.DBL = 0.5
typesOfSwift.STR = "Hello!"
typesOfSwift.CHR = "A"
typesOfSwift.BOOL = true

/* Control flow */
/* if statement */
// if statement control condition == true or not
let point1 = 100, point2 = 60, point3 = 0

if point1 > 80 {
    print("You are great!")                      // The statement is done if condition == true.
} else if (point1 <= 80) && (point1 > 40) {
    print("Your score is normal")                // The statement is done else-if condition == true.
    // else-if condition can add any times.
} else {
    print("You are foolish!")                    // The statement is done any condition != true
}

// point1 print "You are great!"

if point2 > 80 {
    print("You are great!")
} else if (point1 <= 80) && (point1 > 40) {      // "&&"(and) and "||"(or) express logical product.
    print("Your score is normal")
    // else-if condition can add any times.
} else {
    print("You are foolish!")
}

if point3 > 80 {
    print("You are great!")
} else if (point1 <= 80) && (point1 > 40) {
    print("Your score is normal")
    // else-if condition can add any times.
} else {
    print("You are foolish!")
}

/* switch statement */
// swith statement control case value.
// In Swift, switch can control any type.
let signalColor = "green"

switch signalColor {
    case "red", "yellow":
        print("danger!")
    case "green":
        print("safe")
    default:
        print("This is not signal color!")  // switch must be exhaustive.
}

// range is useful for switch
switch Attack {
    case (0..<30):
        print("Weak")
    case 31, (32..<40):                     // "," can connect condition.
        print("Middle")
    default:
        print("Strong")
}

// switch can control tupple
let size = (4, 11)    // Check this value.

switch size {
    case (0, 0):
        print("It's too small")
    case (5...10, 5...10):
        print("Good size")
    case(5...10, _):                // wild card can be any value.
        print("Width \(size.1) is not good size")
    case(let sizeWidth, 5...10):    // get size.0 as new value "sizeWidth" (value binding)
        print("Heith \(sizeWidth) is not good size")
    default:
        print("Both height and width are not good size")
}

// where + value binding, you can use condition in switch steatement.
let size2 = (45, 40, 100)

switch size2 {
    // Get value as new constant, and evaluate where(condition)
    case let(width, height, _) where (width >= 60) || (height >= 60):
        print("Over Size")
    case let (_, _, weight) where (weight >= 80):
        print("Over Weight")
    default:
        print("Good Size")
}

// Omit default
// If you write exhausitive in switch, you can omit default.
let APoint = (50, 100)

switch APoint {
    case (0, 0):
        print("Center")
    case let (x, y):             // Any cases enter into this condition. You can omit default.
        print("\(x), \(y)")
}

// fallthrough
// In Swift, you need not "break" when you break loop. And connect cases in switch sentence.
// To use fallthrough, you do not stop loop in switch sentence.
// It like switch in other programing language when you do not write "break".

var testBools = (a:false, b:false, c:false)

let testFall = "b"

switch testFall {
    case "a":
        testBools.a = true     // testFall != "a", this steatement is not done.
        fallthrough
    case "b":
        testBools.b = true     // testFall == "b", this statement is done.
        fallthrough            // "fallthrough" make loop continue, this loop does not break.
    case "c":
        testBools.c = true     // This loop does not break, so this statement is done.
        fallthrough            // This loop does not break.
    default:
        print(testBools)      // This loop does not break, so this statement is done.
}
