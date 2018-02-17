//: Playground - noun: a place where people can play

import Cocoa

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
var Attack = 10
switch Attack {
case (0..<30):
    print("Weak")
case 31, (32..<40):                     // "," can connect condition.
    print("Middle")
default:
    print("Strong")
}

// switch can control tupple
let size = (4, 9)    // Check this value.

switch size {
case (0, 0):
    print("It's too small")
case (5...10, 5...10):
    print("Good size")
case(5...10, _):                // wild card can be any value.
    print("Height \(size.1) is not good size")
case(let sizeWidth, 5...10):    // get size.0 as new value "sizeWidth" (value binding)
    print("Width \(sizeWidth) is not good size")
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
    print(testBools)       // This loop does not break, so this statement is done.
}

/* for-in sentence */
for num in 5...9 {
    let value = num * 2
    print(value, terminator: ",")
}

// When you want only to iterate, you use _ instead of variables
for _ in 1...5 {
    let num = arc4random_uniform(100)
    print(num, terminator: ",")
}

// Nesting of for loop
for i in 0...2 {
    for j in 0...2 {
        let point = (5*i, 10*j)
        print("\(i)-\(j) is \(point)")   // outside loop i iterate inside loop j
    }
}

// for-in can extract each values from array or dictionary
let numList = [3, 2, 6, 5, 8, 7, 9]
var sum = 0
for num in numList {
    sum += num
}
print(sum)

// You can get characters from String.
let message = "Hello,Swift"
for char in message {
    print(char)
}

// strinde() is like seq()
for i in stride(from: 10, to: 30, by: 3) {
    print(i, terminator: ",")
}

/* while statement */
// while statement define condition.
// while fo statement while condition == true
// Caution you do not infinite loop.

var HP = 100, count = 0
Attack

while HP > 0 {
    HP = HP - Attack
    count += 1
}
print("You spend \(count) turns to win the battle")

/* repeat-while statement */
// repeat-while is like while, but repeat-while must do first statement.
// (It is "do-while" in other programing)
var Defence = 10

while Defence < 10 {        // Condition is false.
    print("Defence up!")    // This statement does not be done.
    Defence += 1
}
Defence                     // Defence is 10 because while statement is not done.

repeat {
    print("Defence up!")    // repeat statement must be done at least one time.
    Defence += 1
} while(Defence < 10)       // Condition is false, break loop.
Defence                     // Defence is 11 because repeat sentence is done.

/* continue and break */
// continue skip statement in loop.
let vlist = [3, 5, -2, 6, -8, 2]
var total = 0

for i in vlist {
    if i < 0 {
        continue      // If i < 0, skip next statement and return the top of loop.
    }
    total += i        // This statement is done only positive int.
}
total

// break stop loop.
for i in vlist {
    if i < 0 {
        break         // If i < 0, stop for-loop
    }
    total += i        // This statement is done before loop break. (3 and 5)
}
total

/* labeling loop */
// If you do continue or break, you decide the statement done after continue and break.
xloop:for x in 0...3 {
    yloop:for y in 0...3 {
        if x<y {
            print("------------")
            continue xloop  // skip yloop and back to xloop.
        }
        print(x, y)
    }
}

let arrayList = [[4, 2], [5], [9, 8, 10], [6, 8, -9], [4, 2], [9, 3]]

outloop: for alist in arrayList {
    inloop: for i in alist {
        if i < 0 {
            print(alist)
            break outloop  // break inloop and outloop
        }
    }
}
