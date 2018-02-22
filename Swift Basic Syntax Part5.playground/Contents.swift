//: Playground - noun: a place where people can play

import Cocoa

/* Array */
// Array control plural datas
// make Array by "[]"
var strArray = ["a", "b", "c", "d", "e"]
var intArray = [1, 2, 3, 4, 5]
var boolArray = [true, false, true, false]
var tupleArray = [(0, 0), (100, 120), (180, 200)]

// Add element to Array
boolArray.append(true)
// Change first element
tupleArray[0] = (1, 1)

// Define type of elements of Array
let colors:[String] = ["blue", "red", "green"]
let numberList:Array<Int> = [12, 23, 35]

// Empty Array
var strEmpty:[String] = []
var intEmpty = [Int]()
var boolEmpty = Array<Bool>()

// You can check empty or not by .isEmpty
strEmpty.isEmpty
strArray.isEmpty

// You can check number of element in array by .count
strArray.count

// Array has same values by repeating/count
var zeroList = [Int](repeating:0, count:10)
// Continuous value is made by range
var numbers = [Int](1...10)
var numbers2 = [Int](1..<6)

// Connect array by `+`
var Party:[String] = ["Enix"]
var newParty:[String] = Party + ["Lin", "Alex"]

// Extract element from array
var abcArray = ["a", "b", "c", "d"]
// subscript array[index]
let str1 = abcArray[0]
let str2 = abcArray[1]
// slice array[first...end]
let str3 = abcArray[1...3]

// Change elements of array
abcArray[0] = "A"
abcArray[1] = "B"
abcArray[2...3] = ["C", "D", "E"]
print(abcArray)

// Nest of array
var nestArray = [["a1", "a2", "a3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
nestArray[0]
nestArray[1][1]
nestArray[2][2] = "Hello"
print(nestArray)

// for loop is useful to extract all elements of array
let randomArray = [53, 45, 67, 81, 77]
var sum = 0
var min = randomArray[0]
var max = randomArray[0]

for i in randomArray {
    sum += i
    if i < min {
        min = i
    } else if i > max {
        max = i
    }
}

var avg = Double(sum) / Double(randomArray.count)
print("sum: \(sum), avg: \(avg), min: \(min), max: \(max)")

// .enumerated() can extract index of array
var colorList = ["blue", "yellow", "red", "green"]
for (index, value) in colorList.enumerated() {
    print((index, value))
}

colorList.first    // It extract first element
colorList[0]
colorList.last     // It extract last element

// Error: strEmpty[0]  [0] is not used in empty array
strEmpty.first     // return nil

// Return index number
colorList.index(of: "red")
// Array.index is optional value, you must unwap if you use this value.
print("green is \(colorList.index(of: "green")!)")

// .append() add element to array
colorList.append("gray")
colorList
colorList.append(contentsOf: ["white", "black"]) // contentsOf add array

// .insert() insert element into array
colorList.insert("purple", at: 1)
colorList.insert(contentsOf: ["skyblue", "lightgreen"], at: 0)

// .remove() delete element of array
colorList.remove(at: 1)
colorList

// .removeFirst() delete first element
colorList.removeFirst()
colorList

// .removeLast() delete last element
colorList.removeLast()
colorList

// .removeAll() delete all elements
colorList.removeAll()
colorList

// When arry assign other var, copy of array is made
var Party2 = Party
Party2.append(contentsOf: ["Alex", "Len"])

Party2   // Copy of Party is changed
Party    // Party is not changed

/* Sort values */
// .sort() sort values of array
var ageArray = [34, 23, 31, 26, 28, 22]
ageArray.sort()  // Change order of array
print(ageArray)

// .sorted() make new sorted array
let fruit = ["banana", "orange", "apple"]
let fruitSorted = fruit.sorted()

fruit
fruitSorted

// .filter() select condition is true
let age30to39 = ageArray.filter({(age:Int) -> Bool in
    return (age >= 30)&&(age < 40)
})
age30to39

// This use of closeur.
/*
 {(argument:type) -> (argument type) in
    statement
 return ...}
 This is like anonymous function in R
*/

// .map() iterate elements of value.
let plusOne = ageArray.map({(age:Int) -> Int in
    return age + 1
})
plusOne
