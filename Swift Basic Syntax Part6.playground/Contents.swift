//: Playground - noun: a place where people can play

import Cocoa

/* Dictionay */
// Dictionary is like array, but dictionary doesn't have index number.
// Dictionary have pair of key:value.

var sizeTable = ["S":47, "M":52, "L":55]
var numDic = [10:"a", 20:"b", 30:"c"]
var resultDic = ["A":true, "B":false, "C":true]
var pointDic = ["p1":(10, 20), "p2":(30, 50), "p3":(20, 40)]
// Error: ["S":10, "S":20]  key does not have duplicated values.

// Dictionary can define type like array.
var boolDic:[Int:Bool] = [0:true, 1:false, 2:true, 3:false]
var theUser:[String:Any] = ["name":"Aoi", "age":29, "point":[67, 82]]
// "Any" can contain all types.

// Empty dictionay
var EmptyDic:[String:Int] = [:]
var EmptyDic2 = Dictionary<String, String>()

// .isEmpty check whether dictionary is empty or not.
EmptyDic.isEmpty
sizeTable.isEmpty

// .count check how many elements dictionary have.
EmptyDic.count
sizeTable.count

// Dictionary can be made from tupples.
let a = ("A", 1)
let b = ("B", 2)
let c = ("C", 3)

let abcDic = Dictionary(dictionaryLiteral: a, b, c)

// Extract elements from dictionary.
// To extract elements, we use key.
sizeTable["S"]
sizeTable["A"]  // It return nil. sizeTable["key"] is optional value.

// Dic["key"] is optional value, so you need to unwrap if you want use elements of dictionary.
// Error: "S size is \(sizeTable["S"])"   need to unwrap!
"S size is " + String(sizeTable["S"]!) + "."

// When you want to extract all elements from dictionary, you use for-loop.
for value in sizeTable {
    value   // This is tupple as (key, value)
}

// You can get elements as tupple's var.
for (key, value) in sizeTable {
    print("Key is \(key), value is \(value).")   // This is not optional value.
}

// .keys extract only key, .values extract value
for key in sizeTable.keys {
    key
}

for value in sizeTable.values {
    value
}

// Array(dictionary.keys) or Array(dictionary.values) make keys array and values array
Array(sizeTable.keys)
Array(sizeTable.values)

// Dictionary["key"] = value, you can set new value
sizeTable
sizeTable["L"] = 60
sizeTable

// .updateValue() can change value and get oldvalue
sizeTable.updateValue(62, forKey: "L")  // This is old value.
sizeTable  // "L" value be changed to 62.

// If you set unset key, you add element to dictionary
sizeTable["XL"] = 75
sizeTable

// .removeValue(forKey:) delete element of dictionary
resultDic
resultDic.removeValue(forKey: "A")
resultDic

// Assign value to nil, you can delete element, too.
numDic
numDic[30] = nil
numDic

// .removeAll() can delete all elements of dictionary.
resultDic.removeAll()
resultDic

// Copy dictionary
var dic1 = ["a":1, "b":2, "c":3]
let dic2 = dic1    // copy dictionary.
dic1.updateValue(99, forKey: "a")
dic1               // dic1 is changed.
dic2               // dic2 is not changed. (remember lazy copy is done in Swift)
