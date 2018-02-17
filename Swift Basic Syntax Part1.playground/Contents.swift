//: Playground - noun: a place where people can play

import Cocoa

/* declaration of constant and variable */

// let declare constant, constant cannot be changed
let name:String = "Koh"
let height:Int = 175, weight:Double = 80.0
print(height, weight)
// Error: name = "Other String"

// If you do not define constant at first time, you can assign constant only one time.
let price:Int
price = 2500  // You can assign constant one time.

// var declare variable, variable can be changed.
var hero:String = "Arus"
var Lv:Int = 1, Attack:Int = 10
print(hero, Lv)

hero = "Enix"  // You can change value of variable.
Lv = 3
print(hero, Lv)

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

typesOfSwift
