import Cocoa

//Вывести в консоль все четные числа от 0 до 100, включая 0

print("task 01")

for i in 0...100 {
    if i % 2 == 0 {
        print(i)
    }
}

//Создать две переменных, одна равна 7, другая 20. Если результат перемножения этих переменных больше 10, то вывести в консоль первую переменную, в противном случае вывести вторую.

print("task 02")

var firstVar = 7
var secondVar = 20

if firstVar * secondVar > 10 {
    print(firstVar)
} else {
    print(secondVar)
}

//Создайте переменную “k”, равную 9. В диапазоне от 10 до 50, но только по нечетным числам,, если текущее число плюс “k” четное, то увеличьте  “k” на 2, в противном случае выведите в консоль “Next ” и перейдите к следующей итерации

print("task 03")

var k = 9

for i in 10...50 {
    if i % 2 != 0 {
        if ( i + k ) % 2 == 0 {
            k += 2
            //print("i: \(i), k: \(k)")
        } else {
            print("Next")
        }
    }
}

//Создайте переменную “k”, равную 9. В диапазоне от 10 до 50, но только по нечетным числам,, если текущее число плюс “k” четное, то увеличьте  “k” на 1, в противном случае выведите в консоль “Next ” прекратите выполнение цикла

print("task 04")

k = 9

for i in 10...50 {
    if i % 2 != 0 {
        if ( i + k ) % 2 == 0 {
            k += 1
            //print("i: \(i), k: \(k)")
        } else {
            print("Next")
            break
        }
    }
}


