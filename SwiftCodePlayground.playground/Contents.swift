//import UIKit
//
//var greeting = "Hello, playground" //changeable variable
//print(greeting)
//
//greeting = "Hello, world!"
//print(greeting)
//
//var myInt = 5
//var myString = "Hello"
//var myBool = true
//var myFloat: Float = 3.14
//
//print(myInt)
//print(myString)
//print(myBool)
//print(myFloat)
//
//
//
//let myConstantInt = 5 //unchangeable, constant



//func sayHello() {
//    var greeting = "Hello"
//    print(greeting)
//    
//}
//sayHello()



//func sayHello(m: String = "Hello") {
//    print(m)
//    
//}
//sayHello()



//func sayHello(m: String) {
//    print(m)
//    
//}
//sayHello(m:"Hello!!!")



//func sayHello(m: String) -> String {
//    print(m)
//    return m
//}
//
//let result = sayHello(m: "Hello!!!")
//print("Returned:", result)



//func doAdd(a: Int, b: Int) {
//    var sum = a + b
//    print(sum)
//}
//doAdd(a: 10, b: 20)



//func doAdd(a: Int, b: Int) -> Int {
//    var sum = a + b
//    return sum
//}
//let result = doAdd(a: 10, b: 20)
//print("Returned:", result)



//func doAdd(firstNumber a: Int, secondNumber b: Int) -> Int {
//    var sum = a + b
//    return sum
//}
//let result = doAdd(firstNumber: 10, secondNumber: 20) // add labels to parameters
//print("Returned:", result)



func doAdd(_ a: Int, _ b: Int) -> Int {
    var sum = a + b
    return sum
}
let result = doAdd(10, 20)
print("Returned:", result)
