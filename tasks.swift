// Part 1
func printWelcome() {
    print("Welcome to the Swift Functions")
}

printWelcome()

func greetUser(name: String) {
    print("Hello, \(name)")
}

greetUser(name: "Madias")
greetUser(name: "Tamerlan")

print()

// Part 2
func addNumbers(a: Int, b: Int) -> Int {
    return a + b
}

let sum = addNumbers(a: 10, b: 5)
print("Sum: \(sum)")

func getStats() -> (String, Int, Bool) {
    return ("Warrior", 5, true)
}

let stats = getStats()
print("Stats: \(stats.0), Level: \(stats.1), Active: \(stats.2)")

print()

// Part 3
func printRole(role: String = "Guest") {
    print("Role: \(role)")
}

printRole()
printRole(role: "Admin")

func sumAll(_ numbers: Int...) -> Int {
    var total = 0
    for n in numbers {
        total += n
    }
    return total
}

print("Total sum: \(sumAll(1, 2, 3, 4, 5))")

func doubleVal(_ val: inout Int) {
    val *= 2
}

var num = 10
doubleVal(&num)
print("Doubled: \(num)")

print()

// Part 4
func checkAge(_ age: Int) {
    guard age >= 18 else {
        print("Too young")
        return
    }
    print("Adult access granted")
}

checkAge(16)
checkAge(20)

func readFile() {
    print("Opening file")
    defer {
        print("Closing file")
    }
    print("Reading data")
}

readFile()

print()

// Part 5
var multiply = { (a: Int, b: Int) -> Int in
    return a * b
}

print("Product: \(multiply(4, 6))")

let fastMult: (Int, Int) -> Int = { $0 * $1 }
print("Fast product: \(fastMult(3, 3))")

print()

// Part 6
func process(_ n: Int, action: (Int) -> Void) {
    action(n)
}

process(42) { val in
    print("Value is \(val), squared is \(val * val)")
}

print()

// Part 7
let list = [10, 5, 8, 3, 12]
let doubled = list.map { $0 * 2 }
let evens = list.filter { $0 % 2 == 0 }
let sorted = list.sorted { $0 < $1 }

print("Doubled: \(doubled)")
print("Evens: \(evens)")
print("Sorted: \(sorted)")

print()

// Part 8 
struct BreathingTechnique {
    let name: String
    let style: String
    var damage: Double
    let staminaCost: Double
}

let techniques = [
    BreathingTechnique(name: "Water Surface Slash", style: "Water", damage: 75, staminaCost: 20),
    BreathingTechnique(name: "Thunderclap and Flash", style: "Thunder", damage: 95, staminaCost: 35),
    BreathingTechnique(name: "Dance of the Fire God", style: "Sun", damage: 100, staminaCost: 50),
    BreathingTechnique(name: "Beast Fang", style: "Beast", damage: 70, staminaCost: 15),
    BreathingTechnique(name: "Constant Flux", style: "Water", damage: 85, staminaCost: 30)
]

func displayTechnique(_ tech: BreathingTechnique) {
    print("\(tech.name) [\(tech.style)] - Damage: \(tech.damage)")
}

print("All Breathing Techniques")
techniques.forEach { displayTechnique($0) }

let calculateEfficiency = { (tech: BreathingTechnique) -> Double in
    return tech.damage / tech.staminaCost
}

func analyzeTechnique(_ tech: BreathingTechnique, analyze: (BreathingTechnique) -> Double) {
    let result = analyze(tech)
    print("\(tech.name): Efficiency = \(result)")
}

print("\nTechnique Analysis")
techniques.forEach { analyzeTechnique($0, analyze: calculateEfficiency) }

let totalConcentration = techniques.map { tech -> BreathingTechnique in
    var boosted = tech
    boosted.damage += 15
    return boosted
}

print("\nAfter Total Concentration Breathing")
totalConcentration.forEach { print("\($0.name): \($0.damage) damage") }

let hashiraLevel = totalConcentration.filter { $0.damage >= 95 }

print("\nHashira-Level Techniques (95+ damage)")
hashiraLevel.forEach { print("\($0.name)") }

let ranked = techniques
    .map { ($0.name, $0.style, calculateEfficiency($0)) }
    .sorted { $0.2 > $1.2 }

print("\nTechniques Ranked by Efficiency")
for (index, tech) in ranked.enumerated() {
    print("\(index + 1). \(tech.0) (\(tech.1)) - \(tech.2)")
}

if let best = ranked.first {
    print("\nMost Efficient: \(best.0) from \(best.1) Breathing!")
}