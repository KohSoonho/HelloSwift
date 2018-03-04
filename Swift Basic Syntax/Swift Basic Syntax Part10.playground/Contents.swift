//: Playground - noun: a place where people can play

import Cocoa

/* Enumeration */
// enum define plural values as one group.
enum abnormalStatus {
    case poison
    case sleep
    case paralyzed
    case confused
}

// It can write as: enum "name" {case value1, value2, value3, ...}

// Assign value of enum to other var
var status = abnormalStatus.poison
type(of: status)

status = .paralyzed   // can assinged only .__ by type inference.

// If you declare var.type = enum, you can assign only by .__
var status2:abnormalStatus
status2 = .sleep

// enum type is useful when you use switch control flow.
func checkStatus(status:abnormalStatus) /* set argument type as enum */ -> () {
    switch status {
        // To use enum, you write switch easily.
        // And you need not write default, you inhibit to write wrong values.
        case .poison :
            print("Poison!")
        case .sleep :
            print("Sleep!")
        case .paralyzed :
            print("Paralyzed!")
        case .confused :
            print("Confused!")
    }
}

checkStatus(status: status)
checkStatus(status: status2)

// enum value can have raw value
enum towns:Int {    // name:type, you define rawvalue type
    case firstTown
    case secondTown
    case thirdTown
}

// raw value can be accessed by .rawValue
// In default, enum value have 0, 1, 2, ...
towns.firstTown.rawValue

// raw value can be set and automatically sequential value.
enum towns2:Int {
    case firstVillage = 1   // set raw value as 1
    case seasideTown        // set raw value as 2, automatically
    case desertCity = 4     // raw value need not be sequential
    case SwiftKingdom       // set raw value as 5
}

towns2.seasideTown.rawValue
towns2.SwiftKingdom.rawValue

// You can assigned enum value by raw value.
var oneTown = towns2(rawValue: 2)
// Note: oneTown is optional value!
if let town = oneTown {
    print(town)
}

// enum can define type of enum
enum pattern {
    // set type as enum value
    case Monotone(_:PColor)
    case Border(color1:PColor, color2:PColor)
    case Dots(base:PColor, dot1:PColor, dot2:PColor)
    
    // enum can be defined in enum. (It can be defined at outside of enum)
    enum PColor:Int {
        case red, green, yellow, white
    }
}

var shirt1 = pattern.Monotone(.red)
var shirt2 = pattern.Border(color1: .white, color2: .green)
var shirt3 = pattern.Dots(base: .white, dot1: .yellow, dot2: .green)

// enum can define property and method
enum villagers {
    case villagerA, villagerB, villagerC
    static var villageName = "name"
    
    var who: String {
        switch self /* Access self value */{
            case .villagerA :
                return "He is villagerA"
            case .villagerB :
                return "He is villagerB"
            case .villagerC :
                return "He is villagerC"
        }
    }
    
    func hello() -> () {
        print("This is \(villagers.villageName).")
    }
    
    // If you change enum value, you use mutating func
    mutating func change () {
        if self == .villagerA {
            self = .villagerB
        }
    }
}

var villagerA = villagers.villagerA
villagers.villageName = "Swift Kingdom"
villagerA.who
villagerA.hello()
villagerA.change()
villagerA.who

/* Struct */
// Struct is like class, but it cannot inherit.

// This is a simple class
class simpleClass {
    var value = 3
}

// This is a simple struct
struct simpleStruct {
    var value = 3
}

var simpleClassValue1 = simpleClass()
var simpleClassVlaue2 = simpleClassValue1   // copy reference
simpleClassVlaue2.value = 4
// Class copy reference, therefore simpleClassValue2.value become 4!
print("\(simpleClassValue1.value), \(simpleClassVlaue2.value)")

var simpleStructValue1 = simpleStruct()
var simpleStructValue2 = simpleStructValue1 // copy value
simpleStructValue2.value = 4
// Struct copy value, therefore simpleStructValue2 is not changed.
print("\(simpleStructValue1), \(simpleStructValue2)")

// Struct can have property and method like class and enum.
// When you change self.property, you use mutating func like enum.
struct character {
    var name:String
    var job:String
    
    // Struct can have init
    init (name:String = "Enix", job:String = "Hero") {
        self.name = name
        self.job = job
    }
    
    func introduction () -> String {
        return "I am \(name). My job is \(job)."
    }
    
    // When you change property, use mutating method.
    mutating func jobChange(job:String) -> Void {
        self.job = job
    }
}

var characterA = character(name: "Lin", job: "Fighter")

characterA.introduction()
characterA.jobChange(job: "Wizard")
characterA.introduction()

// When you define subscript in struct, you can access values of struct by dictionay.
struct Pub {
    var name:String
    
    // Defined dictionary controled by subscript by dictionary
    var parties:[String:String] = [:]
    
    init (name:String = "Luida") {
        self.name = name
    }
    
    // Subscript
    subscript (job:String) -> String {
        get {
            if let value = parties[job] {
                return value
            } else {
                return "No member!"
            }
        }
        
        set {
            // newValue is set by subscript
            parties[job] = newValue
        }
    }
}

var LuidaPub = Pub()

// Register new party member
LuidaPub["Warrior"] = "Alex"
LuidaPub["Wizard"] = "Mary"

// Check party member
LuidaPub["Warrior"]   // He is Alex.
LuidaPub["Wizard"]    // She is Mary.
LuidaPub["Preast"]    // There is no perast.

// Struct can apply protocol
protocol monster {
    var monsterName:String {get set}
    var HP:Int {get set}
    mutating func updateHP(pt:Int)
}

// Make struct apply protocol
struct monsterStruct: monster {
    var monsterName:String
    var HP:Int
    
    init (name:String, HP:Int) {
        self.monsterName = name
        self.HP = HP
    }
    
    mutating func updateHP(pt:Int) -> Void {
        HP -= pt
    }
}

var Slime = monsterStruct(name: "Slime", HP: 10)
Slime.monsterName
Slime.HP

Slime.updateHP(pt: 3)
Slime.HP
