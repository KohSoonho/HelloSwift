//: A Swift Tour
//: This is basic phrase of Swift

print("Hello Swift!")

/* `let` make a constant */
let myConstant = 42

/* `var` make a variable*/
var myVariable = 42

// var can be changed
myVariable = 50

// constant can't be changed
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
let expFloat: Float = 4



