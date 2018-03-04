//: Playground - noun: a place where people can play

import Cocoa

/* Set */
// Set control plural variables by group.
var colorSet:Set<String> = ["red", "green", "blue", "green"]  // Make Set
print(colorSet)     // Duplicated green is not displayed, but result is not distinguished from array.
type(of: colorSet)  // Check whether rhiai is set or not

var colorArray = ["red", "green", "blue", "green"]
var colorSet2 = Set(colorArray)  // Array can cast to Set.

print(colorArray)  // Duplicated value is not deleted.
print(colorSet2)   // Duplicated value is deleted.

// Empty Set
var EmptySet:Set<Int> = []
var EmptySet2 = Set<Character>()

// .insert() add new value to Set.
var numSet:Set<Int> = []
numSet.insert(3)
numSet.insert(5)
numSet.insert(7)
numSet.insert(3)  // duplicated value is ignored.

print(numSet)

// .remove() delete value in Set.
numSet.remove(5)

print(numSet)

// .count return number of value and .isEmpty check whether Set is empty or not.
colorSet.count      // return 3
EmptySet.count      // return 0

colorSet.isEmpty    // return true
EmptySet.isEmpty    // return false

// .contains check whether Set contain a value or not.
numSet.contains(7)  // return true
numSet.contains(4)  // return false

// for-in extract all values from Set.
for color in colorSet.sorted() {    // extract sorted values.
    print(color)
}

/* Set operator */
let fruitSetA:Set<String> = ["apple", "orange", "peach", "strawbery"]
let fruitSetB:Set<String> = ["strawbery", "water melon", "orange", "banana"]

let unionSet = fruitSetA.union(fruitSetB)               // union
print(unionSet)

let intersectionSet = fruitSetA.intersection(fruitSetB) // intersection
print(intersectionSet)

let subtractSet = fruitSetA.subtracting(fruitSetB)      // substracting
print(subtractSet)

let symmetricDifferenceSet = fruitSetA.symmetricDifference(fruitSetB)  // symmetric difference
print(symmetricDifferenceSet)

fruitSetA == fruitSetB   // "==" is equal set, it return false.
colorSet == colorSet2    // true

fruitSetA.isDisjoint(with: fruitSetB)    // .disjoint() check isDisjoint or not. It return false.
fruitSetA.isDisjoint(with: colorSet)     // it is true
// Note: != evaluate == is true or not.

fruitSetA.isSubset(of: fruitSetB)       // .isSubset() check Set is subset or not.
intersectionSet.isSubset(of: fruitSetA) // It return true.

fruitSetA.isSuperset(of: intersectionSet)  // .isSuperset() check Set is superset or not.

