import Cocoa

//Задачи:
//Создайте 5 констант разных типов (целое число, дробное число, строка, bool, символ), а затем создайте 5 переменных таких же типов

let a1: Int = 5
let b1: Double = 5.5
let c1: String = "qwerty"
let d1: Bool = false
let e1: Character = "a"

var aa: Int = 5
var bb: Double = 5.5
var cc: String = "qwerty"
var dd: Bool = false
var ee: Character = "a"

//Создайте константу “a”, которая будет равна 10, а затем создайте переменную “b”, которая будет равна 0. Напишите код: если “a” больше или равно 7, то увеличить “b” на 7, а если меньше, то необходимо уменьшить “b” на 7.

var a: Int = 10
var b: Int = 0

if (a >= b) {
    b += 7
} else {
    b -= 7
}

//Используя переменные и константы из предыдущего задания напишите код: если “a” плюс “b” больше 15 и “b” больше или равно 7, то “b” нужно увеличить в 2 раза, в противном случае “b” необходимо увеличить на 3.

if (a + b) > 15 && b >= 7 {
    b *= 2
} else {
    b *= 3
}

//Используя переменные и константы из предыдущего задания напишите код: если “a” находится в диапазоне от 0 до 7, то вывести в консоль результат сложения “a” и “b”, если “a” в диапазоне от 8 до 20, то вывести в консоль результат вычисления “a” - “b”, если “a” в диапазоне от 21 до 50. то вывести в консоль результат перемножения “a” и “b”. Во всех остальных случаях вывести в консоль, что нет подходящих диапазонов.


switch a {
case 0...7: print(a+b)
case 8...20: print(a-b)
case 21...50: print(a*b)
default: print("out of range error")
}

//Используя переменные и константы из предыдущего задания напишите код: если “a” больше 10 и “b” меньше 20 и “a” + “b” больше 15, то “b” уменьшить на 10, в противном случае, если “a” - “b” меньше 20, то вывести в консоль b, в противном случае увеличить “b” на 7

if (a > 10) && (b < 20) && ((a + b) > 15) {
    b -= 10
} else if (a-b) < 20 {
    print(b)
} else {
    b += 7
}

//Используя переменные и константы из предыдущего задания напишите код: если “a” плюс “b” больше 20 или “b” - “a” меньше 7.  то вывести в консоль “a”, в противном случае вывести в консоли “b”

if a + b > 20 || b - a < 7 {
    print(a)
} else {
    print(b)
}

//Используя переменные и константы из предыдущего задания напишите код: если (“a” больше 15 или “b” меньше 7) и “a” + “b” - 7 не равно 17.  то вывести в консоль “a”, в противном случае вывести в консоли “b”

if (a > 15 || b < 7) && (a + b - 7 != 17) {
    print (a)
} else {
    print (b)
}

//Вывести в консоль все нечетные числа от 0 до 100, используя цикл

for a in 0...100 {
    if a % 2 != 0 {
        print (a)
    }
}

//Задачи:
//Используя переменные и константы из предыдущих заданий напишите код: сделайте “a” переменной, затем, пока “a” не станет равно 50 уменьшать “b” на 2


while a != 50 {
    b -= 2
    a += 1
}

//Используя переменные и константы из предыдущих заданий напишите код: последовательно увеличить “b” сначала на 3, потом на 4, потом на 5, используя цикл

for i in 3...5 {
    b += i
}

//Используя переменные и константы из предыдущих заданий напишите код: в диапазоне от 1 до 10, если “a” плюс текущее число в диапазоне  больше “b”, то увеличить “b”  на 30, в противном случае уменьшить “b” на 10

for i in 1...10 {
    if a + i > b {
        b += 30
    } else {
        b -= 10
    }
}


//Создайте переменную “k”, равную 5. В диапазоне от 20 до 30 ( не включая 30), если текущее число больше 25, то “k” уменьшить на 4, в противном случае “k” увеличить на 10

var k: Int = 5

for i in 20..<30 {
    if i > 25 {
        k -= 4
    } else {
        k += 10
    }
}

//Если “k” больше  20, то уменьшите k на 10, в противном случае добавьте к “k” 1

k = (k > 20 ? k - 10 : k - 1)

//Пока “k” не будет равно 40 необходимо уменьшать “b” на 3, а “a” увеличивать на 10, затем, если  “a” находится в диапазоне от 10 до 30, то вывести в консоль результат сложения “a” и “b”, если “a” в диапазоне от 31 до 50, то вывести в консоль результат вычисления “a” - “b”, если “a” в диапазоне от 51 до 100. то вывести в консоль результат перемножения “a” и “b”. Во всех остальных случаях перейти к следующей итерации

while k != 40 {
    b -= 3
    a += 10
    k += 1
    switch a {
    case 10...30 : print (a + b)
    case 31...50 : print (a - b)
    case 51...100 : print (a * b)
    default: continue
    }
}
