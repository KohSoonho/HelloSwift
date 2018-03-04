//: Playground - noun: a place where people can play

import Cocoa

/* String */
/* Make String */
// If you want to make String, you enclose String by ""
let message = "Hello! Swift."
var bird:String
bird = "Swift"

// If you want to make String having many lines, you enclose sentence by """---""". (This is new function of Swift4)
let sentence = """
I am a doctor.
I specialize hematology.
Recent my hobby is learning programming!
"""

print(sentence)

let sentence2 = "I am a doctor.\nMy hobby is watching NBA"   // Of course, you can use escape sequence to make a new line.
print(sentence2)

// You can make empty String by ""
let emptyString = ""
// isEmpty check wheter String is empty or not
message.isEmpty
emptyString.isEmpty

// Repeat Character in String
// String(repeating: ,count: ) make repeated character.
let apples = String(repeating:"  ", count:10)


/* Count number of characters in String */
// .count check number of characters in String
message.count
sentence.count


/* Cast to String */
// To cast to String, use String().
String(10)

// In String you use \() to cast to String insted of String().
let heroLV = "Lv of Enix is \(10)."
let heroLVUp = "Lvel up!, Lv of Enix become \(10 + 1)"


/* Connect Swift */
// In Swift, `+` or `+=` can be used in String!
let firstName = "Soonho"
let lastName = "Koh"

let fullName = firstName + " " + lastName

let week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
var oneweek = ""
for day in week {
    oneweek += day
}
print(oneweek)

/* Calculation from String */
// When you calculate from String ("10", "3.14"), you need cast to Int or Double.
let r = "10"
let pi = "3.14"
let circle_area = pow(Double(r)!, 2) * Double(pi)!
// When you cast "abc" to number Double("abc") return nil. (nil is NULL in R)
// Swift need optional value when var and const may became nil, and optional value can not be caluculated
// You need to write Double(r)! to unwrap optional value. (Add "!")

print("area of circle is \(circle_area).")


/* Extract characters from String */
let textBook = "Text book of Swift!"
// .startIndex extract index of first character
let startIndex = textBook.startIndex
// .endIndex extract index of end character
let endIndex = textBook.endIndex

// [] extract specific character by index
let start = textBook[textBook.startIndex]  // This sentence extract first character.
type(of: start)                            // Note type of first is Character not String.

// Error: let result = "First character is " + first + "."   Character is not controlled as String.
let result = "First character is \(start)."   // You need to cast character to String.

// Extract index of specific position
// .index(after: ): You can extract after index.
let secondFromStart = textBook.index(after: startIndex)  // It extract second index from start. (after start index)

// .index(before: ): You can extract before index.
let secondFromEnd = textBook.index(before: endIndex)     // It extract second index from end. (before end index)

// .index(_ i: Index, offsetBy n: IndexDistance): You can extract specific index by distance.
let index1 = textBook.index(startIndex, offsetBy: 3)     // You extract 1 + 3 th index from start.
let index2 = textBook.index(endIndex, offsetBy: -2)      // You extract 1 + 2 th index from end.

// You can make range of index by above method.
let subStr1 = textBook[index1...index2]    // Extract 4th - 16th characters
let subStr2 = textBook[index1..<index2]    // Extract 4th - 15th characters

// range omit start and end
let half = textBook.count / 2
let halfIndex = textBook.index(startIndex, offsetBy: half)

let halfstr1 = textBook[..<halfIndex]      // Extract before halfIndex
let halfstr2 = textBook[halfIndex...]      // Extract after halfIndex

// Extract all character from start.
func extract_char (_ str:String) -> [Character] {
    let num = str.count
    let startIndex = str.startIndex
    var charArray:[Character] = []
    for i in 1...num {
        charArray.append(str[str.index(startIndex, offsetBy: i - 1)])
    }
    return charArray
}

extract_char(textBook)
extract_char("Swift")
extract_char("Japan R")


/* toupper and tolower */
// .lowercased is tolower() in R, .uppercased is toupper() in R.
let country = "japan"
country.lowercased()
country.uppercased()

// Make function cap() it first character to upper and other characters to lower.
func cap (_ str:String) -> String {
    let start = str.startIndex
    let second = str.index(after: start)
    let startChar = str[start]
    let startStr = String(startChar)
    let otherStr = str[second...]
    let capStr = startStr.uppercased() + otherStr.lowercased()
    return capStr
}

cap("jaPan")
cap("Apple")


/* Compare and explore String */
/* Compare */
// Identical of String is checked by "==" like other type.
"Swift" == "Swift"
"Swift" == "swift"   // It is false, Swift distinguish upper and lower like other programming.

// Order of String
"A" < "Z"
"あ" < "ん"
"A" < "a"
"a" < "あ"
"あ" < "ア"
"iPhone" > "iPad"    // true
"IPhone" > "ipad"    // false

// If you compare String without upper and lower, you use .lowercased() or .uppercased()
"IPhone".uppercased() > "ipad".uppercased() // true

/* Explore */
// .hasPrefix() return bool whether first String is same or not.
textBook.hasPrefix("Text")
// .hasSuffix() return bool whether end String is same or not.
textBook.hasSuffix("Swift!")
// .contains() return bool whether contain String or not.
textBook.contains("Swift")
// .range() return range of String
let range = textBook.range(of: "of")       // Extract range of index
textBook[range!]                           // Extract String by range. Note str.range(of: ) is optional value and you need unwrap before control this index.

if let theRange = range {                  // unwrap
    textBook[theRange.upperBound...]       // .upperBound is next index of range end. This return after String from "of".
}

if let theRange2 = range {                 // unwrap
    var textBookCopy:String = textBook
    textBookCopy.removeSubrange(theRange2) // .removeSubString() delete String having specific index.
}
