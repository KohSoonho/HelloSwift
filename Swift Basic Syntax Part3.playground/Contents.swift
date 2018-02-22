//: Playground - noun: a place where people can play

import Cocoa

/* Definition of function */
// func "name" (argument) -> "type of return" { body }
func dice () -> Int {
    let number = 1 + arc4random_uniform(6)
    return Int(number)
}

for _ in 1...5 {
    let num = dice() // Do function by function_name()
    print(num)       // return is Int
}

// When return of func is void, you need not weite type of return
func Swift () {
    print("Hello! Swift")
}

// You may write type Void of ()
func Swift2 () -> Void {
    print("You can fly to anywhere")
}

func Swift3 () -> () {
    print("Swift is new programing")
}

Swift()
Swift2()
Swift3()

/* guard-let statement */
// When func return nothing, return stop func.
func pokemonCenter (HP:Int) -> Void {
    if HP >= 100 {
        return    // stop func
    }
    print("you need to spend \(100 - HP)$ to use Pokemon Center")
}

pokemonCenter(HP: 10)
pokemonCenter(HP: 100)  // This function is not done.
pokemonCenter(HP: 50)

// "guard-else": if condition is NOT true do body sentence (return)
func pokemonCenter2 (HP: Int) -> Void {
    guard HP < 100 else {
        return    // If condition is NOT true do sentence (return: stop function)
    }
    print("you need to spend \(100 - HP)$ to use Pokemon Center")
}

pokemonCenter2(HP: 50)
pokemonCenter2(HP: 100)
pokemonCenter2(HP: 30)

/* defer sentence */
func funOrNot (point: Int) -> Void {
    defer {
        print("finish MANZAI!")   // Thisi is done when func finishd
    }
    guard point >=  100 else {
        return                    // poin < 100, stop function but defer sentence is done
    }
    print("This MANZAI is interesting!!!")
}

funOrNot(point: 300)  // This print "This MANZAI is interesting" and "finish MANZAI"
funOrNot(point: 50)   // This does not print "This MANZAI is interesting" (guard) but print "finish MANZAI" (defer)
funOrNot(point: 200)

// You can define many defer in func, defer is done from "last".
func goodBye (name: String) -> Void {
    defer {
        print("See you again!")      // First defer is done at last!
    }
    defer {
        print("Bye Bye!")            // Final defer is done at first!
    }
    guard name != "every one" else {
        return
    }
    print("I have a nice time with " + name + " !")
}

goodBye(name: "Mr.Green")
goodBye(name: "every one")

/* Argument of function */
// func "name" (argment name: argument type, argument name: argument type, ...) -> return type {}

func MyParty (job1:String, job2:String, job3:String, job4:String) -> String {
    return "my party is " + job1 + ", " + job2 + ", " + job3 + ", " + job4 + "!"
}

print(MyParty(job1: "Hero", job2: "Warrior", job3: "Wizard", job4: "Fighter"))

// func (argument:type...) let you make many arguments
func MyParty2 (job:String...) -> String {
    var party:String = "my party is "
    for str in job {                // Arguments is defined array named "job"
        if str != job[3] {
            party += (str + ", ")
        } else {
            party += str
        }
    }
    party += "!"
    return party
}

print(MyParty2(job: "Hero", "Warrior", "Wizard", "Fighter"))

/* Default argument value in func */
// func "name" (argument:type = deault value, ...) -> return type {}
func MyPartyName (Hero:String = "Enix", Warrior:String, Wizard:String, Fighter:String) -> Void {
    print("my party member is " + Hero + ", " + Warrior + ", " + Wizard + ", " + Fighter + "!")
}

MyPartyName(Hero: "Arus", Warrior: "Alex", Wizard: "Ellie", Fighter: "Lin")
MyPartyName(Warrior: "Alex", Wizard: "Ellie", Fighter: "Lin")                  // If you omit to define "Hero", this func return default value!

/* Plural return */
// func can return plural return
func LevelUp (LV:Int, Attack:Int, Defence:Int) -> (Int, Int, Int) {
    let new_LV = LV + 1
    let new_Attack = Int(Double(Attack) * 1.5)
    let new_Defence = Int(Double(Defence) * 1.4)
    return(LV:new_LV, Attack:new_Attack, Defence:new_Defence)  // Plural return is returned by tupple. It can define label.
}

LevelUp(LV: 1, Attack: 10, Defence: 20)

/* Over load */
// If you define many func having same name but different arguments, Swift realize these func is different func. (over load)
func calc (a:Int, b:Int) -> Int {     // calc-1
    return a + b
}

func calc (a:Int, c:Int) -> Int {     // calc-2
    return a - c
}

func calc (b:Int, c:Int) -> Int {     // calc-3
    return b * c
}

calc(a: 3, b: 4)   // do calc1
calc(a: 3, c: 2)   // do calc2
calc(b: 4, c: 2)   // do calc3

/* External parameter name */
// You can define external parameter name
func BMI (weigth kg:Double, height cm:Double) -> Double {   // kg/cm is argument name, weight/height is external parameter name.
    return (kg / pow(cm * 0.01, 2)).rounded()                  // In function, kg and cm are used as arguments.
}

BMI(weigth: 75, height: 175)  // You define value by external parameter name. (not kg/cm)

// If you define external parameter name as wild card "_", you omit argument name!
func triangleArea (_ base:Double, _ height:Double) -> Double {
    let area:Double
    area = base * height / 2
    return area
}

triangleArea(10, 20)  // func "triangleArea" does not need argument name.
