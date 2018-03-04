//: Playground - noun: a place where people can play

import Cocoa

/* Class */
// Swift is oriented opject programing (OOP) language.

// Class is specifications for object.
// In OOP, create instance from class.
// Instance have functional and attributional data.

// Declaration of Class
class character /* class name */ {
    // instance property
    // property is declared by variable or constant.
    var name:String = "Enix"
    var attack:Int = 10
    var defence:Int = 10

    // instance method
    // method is declared by function
    func levelUp() -> (Void) {
            attack = Int(Double(attack) * 1.1)
            defence = Int(Double(defence) * 1.1)
    }
}

var hero = character()   // make instance of class.
var hero2 = character()  // make another instance having same attribution.

// Access property of instance
hero.attack
hero.defence

// Do method of instance
hero.levelUp()
hero.attack    // change to 11
hero.defence   // change to 11

hero2.attack   // this is not changed

// If you define property by var, you can change directly by "="
hero2.attack = 20
hero2.attack

/* Initializer */
// Initializer set default value of instance property
class villagers {
    // instance property
    var name:String
    
    // initializer
    init (name:String = "A") {
        self.name = name    // set init:name to property:name (self.name)
    }
    
    // method
    func hello() -> (Void) {
        print("There is in first village!")
    }
    
}

var villagerA = villagers()
// A does not default value, so name of villagerA become "A".
villagerA.name

var villagerB = villagers(name: "B")
// Set init name = "B", so name of villagerB become "B".
villagerB.name

// Class have plural initializers.
class villagers2 {
    var name:String
    // initializer 1 does not define this value, so town is defined as optional
    var town:String?
    
    // initializer 1
    init (name: String = "A") {
        self.name = name
        self.town = nil
    }
    
    // initializer 2
    init (name: String = "A", town:String = "first village") {
        self.name = name
        self.town = town
    }
    
    // method
    func hello() -> Void {
        if let townName = town {    // Optional Binding
            print("There is in " + townName + ".")
        } else {
            print("Hello!")
        }
    }
    
}

var villagerA2 = villagers2(name: "A")
// villagerA2.town = nil, so hello() return "Hello!".
villagerA2.hello()

var villagerB2 = villagers2(name: "B", town: "JIPANG")
villagerB2.hello()

// If class have plural initializer, convenience initializer can call other initializer
class shopping {
    var goods:String
    var price:Int
    
    // specified initializer (initializer 1)
    init (goods:String, price:Int) {
        self.goods = goods
        self.price = price
    }
    
    // convenience initializer (initializer 2)
    convenience init (goods:String = "smile") {
        self.init(goods: goods, price: 0)   // call initializer 1
    }
    
    // instance method
    func sell () -> Void {
        print(goods + " is \(price)G!.")
    }
    
}

var Mac = shopping()  // call initializer 2
Mac.sell()

var Free = shopping(goods: "Glucose")  // call initializer 2
Free.sell()

var weponShop = shopping(goods: "bronz sword", price: 100)   // call initializer 1
weponShop.sell()

/* Computed property */
// The properties defined by let or var is "Stored property".
// The properties defined by func is "Computed property".

// refer the value of property is "get".
// set the value of property is "set".
class battle {
    var attack = 10
    var defence = 10
    
    var damage:Int {
        get{
            return attack - defence     // calculate and return value
        }
        set (damage) {
            attack = damage + defence   // calculate attack and defence from damage
        }
    }
    
}
    
var battles = battle()
battles.damage        // damage return attack:10 - defence:10
battles.attack = 20   // change attack
battles.damage        // damage is changed to 10 (20 - 10)
battles.damage = 30   // change damage
battles.attack        // attack is shanged to 40 (30 + 10)

// If you write only get, you make "read only" property.
class battle2 {
    var attack = 10
    var defence = 10
    
    var damage:Int {
        return attack - defence   // only write get property. it is read only.
    }
    
}

var battles2 = battle2()
battles2.damage        // damage return attack:10 - defence:10
battles2.attack = 20
battles2.damage        // damage is changed
// Error: battles2.damage = 30
// damage cannot be overwritten!

/* Property Observer */
// When you set new value to property, observer can access new values and ola values.
class levelUp {
    var name:String = "Enix"
    
    var level:Int {
        willSet {
            // statement before value is changed.
            print("level of " + name + " is \(level).")
            print("Your next level is \(newValue)")
            // newValue is value after changed
            // level is value before changed
        }
        
        didSet {
            // statement after value is changed.
            print("Level up!")
            print("level of \(name) become \(oldValue) to \(level)")
            // oldValue is value before changed
            // level is new value
        }
    }
    
    init () {
        level = 1
    }
}

var EnixLevel = levelUp()
EnixLevel.level = 2    // Do willSet/didSet
EnixLevel.level = 2    // Do only willSet
EnixLevel.level = 3    // Do willSet/didSet

/* Class member */
// Class can have property and method, too.
// Property or method of instance is "instance member".
// Property or method of class is "class member".
class hunter {
    // class property
    static var guildLevel = 1
    
    // class method
    class func report() -> String {
        return "guild level is \(hunter.guildLevel)."
    }
    
    // instance property
    var level = 1
    var name:String
    
    init (name:String) {
        self.name = name
    }
    
    // instance method
    func levelUp() -> (Void) {
        print("Level UP!")
        level += 1
        hunter.guildLevel += 1
    }

}

// Create instances
var hunterA = hunter(name: "A")
var hunterB = hunter(name: "B")

hunterA.levelUp()    // do levelUp method in hunterA
hunterA.level        // hunterA.level become 2
hunterB.level        // hunterB.level is 1 (instance member is independent from other instances)

hunter.guildLevel    // hunter.guildLevel become 2

hunterB.levelUp()    // do levelUp method in hunterB
hunterA.level        // hunterA.level does not vary
hunterB.level        // hunterB.level become 2

hunter.guildLevel    // hunter.guildLevel become 3 (class member is shared in instances from same class!)

hunter.report()      // class method

// Class can have computed property
class radianToDegree {
    static var radian = 0.0
    
    class var degree:Double {
        get {
            return radian * 90 / Double.pi
        }
        
        set (degree){
            radian = degree * Double.pi / 90
        }
    }
}

radianToDegree.radian = Double.pi
radianToDegree.degree    // return 90
radianToDegree.degree = 180
radianToDegree.radian    // return 2pi

// If you don't write set{}, you make read-only class property.
class radianToDegree2 {
    static var radian = 0.0
    
    class var degree:Double {
        return radian * 90 / Double.pi
    }
}

radianToDegree2.radian = 2 * Double.pi
radianToDegree2.degree   // return 180

// Error: radianToDegree2.degree = 90     This property is read-only.

/* Authority of access */
// You can set authorty of access of class, property and method.

/*
 # free
 --------------
 open
 public
 internal     (default)
 fileprivate
 private
 ---------------
 # strict
*/

/* Extension of class */
// You can add computed property and method.
// You cannot

/*  deinition of character class (line:13)
 
 class character {
    var name:String = "Enix"
    var attack:Int = 10
    var defence:Int = 10
 
 func levelUp() -> (Void) {
    attack = Int(Double(attack) * 1.1)
    defence = Int(Double(defence) * 1.1)
    }
 }
*/

// extend character class
extension character {
    // Add computed property
    var who:String {
        get {
            return name
        }
        
        set (value){
            name = value
        }
    }
    
    // Add new method
    func introduce() -> (Void) {
        print("I am a \(name).\nMy attack is \(attack).\nMy defence is \(defence).")
    }
}

// hero is defined already. (line: 28)

// new computed property
hero.who
hero.who = "Arus"
hero.name

// new method
hero.introduce()

/* Inherit class */
// Class can ingerit other class.
// Class have propety and method of superclass.
// Class cannot inherit plural calasses
class battleCharacter:character /* super class */ {
    // new property
    var speed = 10
    var job = "Hero"
    
    // new function
    func jobChange(newJob:String) -> (Void) {
        job = newJob
    }
    
    // override
    override func levelUp() {
        super.levelUp()  // do method of super class before override
        speed = Int(Double(speed) * 1.1)
    }
}

var battleChara = battleCharacter()
// battleCharacter inherit Character's property.
battleChara.name
battleChara.attack

// battleCharacter have new property
battleChara.speed
battleChara.job

// battleCharacter have new method
battleChara.jobChange(newJob: "Wizard")
battleChara.job

battleChara.levelUp()
// attack become attack * 1.1
battleChara.attack
// speed become speed * 1.1 (override levelUp())
battleChara.speed

// Class can render multiple inheritance.
// "final class" inhibit inheritance of class
final class battleCharacter2:battleCharacter {
    
}

class battleCharacter3:battleCharacter {
    // "final func" inhibit override
    final func declaration() {
        print("This is final class, this class cannot inherit!")
    }
}

// Error: class battleCharacter4:battleCharacter2 {}    final class cannot inherit!

class battleCharacter4:battleCharacter3 {
    /* Error: final func cannot be overriden
    override func declaration {
        "statement"
    }
    */
}

/* The definition of villagers class
class villagers {
    var name:String
 
    init (name:String = "A") {
        self.name = name    // set init:name to property:name (self.name)
    }
 
    func hello() -> (Void) {
        print("There is in first village!")
    }
}
*/

class childVillager:villagers {
    var town:String
    
    init(name:String, town:String = "first village") {
        self.town = town        // self. access own class member
        super.init(name: name)  // super. access super class member
    }
}

var villagerC = childVillager(name: "C", town: "Swift Kingdom")
villagerC.name
villagerC.town
villagerC.hello()

/* Protocol */
// Protocol define specification of properties and methods which class must have.
// If you accept protocol, class return error if class doesn't have necessary members.
protocol chrName {
    var name:String {get}      // read-only var
    var job:String {get set}       // var can be read and write
}

protocol chrStatus {
    var attack:Int {get set}
    var defence:Int {get set}
    var speed:Int {get set}
    
    
    func introduce() -> String  // do not define statement of method
    func levelUp() -> Void
}

// Protocol can inherit another protocol.
// Protocol can be inherited by plural 
protocol guild:chrName, chrStatus {
    static var guildName:String {get set}
    static func introduceGuild()
}

/* Accept protocol */
class chrNameClass:chrName {
    // chrNameClass accept chrName
    // chrNameClass Must have "name" and "job"
    var name: String
    var job: String
    
    init (name:String, job:String) {
        self.name = name
        self.job = job
    }
}

// Class can accept plural protocols.
class makeChr:chrName, chrStatus {
    // class makeChr Must have members defined in protocol.
    var name: String
    var job: String
    
    var attack: Int
    var defence: Int
    var speed: Int
    
    init (name:String, job:String, attack:Int = 10, defence:Int = 10, speed:Int = 10) {
        self.name = name
        self.job = job
        self.attack = attack
        self.defence = defence
        self.speed = speed
    }
    
    func levelUp() {
        attack = Int(Double(attack) * 1.1)
        defence = Int(Double(defence) * 1.1)
        speed = Int(Double(speed) * 1.1)
    }
    
    func introduce() -> String{
        return "My name is \(name), and my job is \(job)."
    }
}
