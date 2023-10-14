import Cocoa

//Задачи:
//Написать функцию, которая на вход принимает число типа Int, а возвращает, является ли число четным

func isEven(digit: Int) -> Bool {
    if digit % 2 == 0 {
        return true
    } else {
        return false
    }
}

func isEven2(digit: Int) -> Bool {
    digit % 2 == 0
}

print(isEven2(digit:3))
print(isEven2(digit:2))

//Написать функцию, которая на вход принимает 3 числа: a, b, c и возвращает результат вычисления b^2 - 4 * a * c

func calc(a: Int, b: Int, c: Int) -> Int {
    return b * b - 4 * a * c
}

print(calc(a:1, b:2, c: 3))

//Написать функцию, которая рассчитает площадь прямоугольника. На вход два параметра: длина и ширина, на выход: площадь

func area(hight: Int, width: Int) -> Int {
    return hight * width
}

print(area(hight:2, width:3))

//Напишите функции, которая на вход принимает целое положительное число, а возвращает сумму всех чисел от 1 до переданного числа

func sum(value: Int) -> Int {
    var sum: Int = 0
    for i in 0...value {
        sum += i
    }
    return sum
}

print(sum(value:100))

//Создать опционал с типом Int и создать еще одну переменную, которая содержит значение первой переменной, но не является опционалом.  Сделать это необходимо 2 способами: при помощи force unwrapping,  nil coalescing


// force unwrapping
var c: Int? = 11
var d: Int = c!
print(d)

// nil coalescing
var b: Int? = nil
var a: Int = b ?? 5
print(a)

//Задачи 2:
//Создать перечисление, которое имеет в виде кейсов два вида чая: зеленый и черный

enum Tea: String {
    case green
    case black
    
    func color() -> String {
        switch self {
        case .black: return "black tea"
        case .green: return "green tea"
        }
    }
}
//Задать для кейсов названия “Black tea” и “Green tea”

let green = Tea(rawValue: "Green tea")
let black = Tea(rawValue: "Black tea")

print(Tea.green.rawValue)
print(Tea.black.rawValue)

//Написать внутри перечисления функцию, которая будет возвращать цвет чая в строковом формате, то есть, если это blackTea, то black, а если greenTea, то green

//func getString(tea: Tea) -> String {
//    return tea.rawValue
//}
//
//print(getString(tea: .green))
//print(getString(tea: .black))

print(Tea.green.color())

//Создать переменную с типом созданного перечисления, а затем при помощи print вывести цвет чая

var tea: Tea = .black;
print(tea.color())

//Написать функцию, которая на вход принимает параметр типа Tea, но который является опционалом. Функция должна печатать название чая, если значение есть и “Данный вид чая не найден”, если значение nil. Написать функцию нужно в 2 вариантах: используя guard let, используя if let

func teaName(_ tea: Tea?) {
    if let tea {
        print(tea.rawValue)
        return
    } else {
        print("Данный вид чая не найден")
    }
}

teaName(.black)


func teaNameGuard(_ tea: Tea?) {
    guard let tea else {
        print("Данный вид чая не найден")
        return
    }
    print(tea.rawValue)
}

teaNameGuard(.green)
