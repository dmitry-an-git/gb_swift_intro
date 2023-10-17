import Cocoa

//Условие:

//Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить ее в виде массива видов чая, которые хотят заказать). Необходимо последовательно выводить в консоль сколько заплатит покупатель ( необходимо вывести его номер по порядку, чай, который он заказал и стоимость)

enum teaType: String {
    case black = "Black tea"
    case green = "Green tea"
    case concentrated = "Chefir"
}

let teaDict: [teaType: Int] = [.black: 100, .green: 110, .concentrated: 500]

let teaQueue: [teaType] = [.black, .green, .black, .green, .concentrated, .green]

func runTeaQueue(tPrices: [teaType:Int], tQueue: [teaType]) {
    tQueue.enumerated().forEach{print(String(1+$0.0), $0.1.rawValue, String(tPrices[$0.1]!), separator: " \t ")}
}

runTeaQueue(tPrices: teaDict, tQueue: teaQueue)

//Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию

let arrayA: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

let arrayB = arrayA.compactMap{ $0 }
    .filter{ $0 != 0 && $0 != 4 }
    .sorted{ $0 < $1 }

print(arrayB)

//Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.

func geometricProgression(length: Int) -> [Int] {
    guard (length > 0) else {return [Int]()}
    var sequence = Array(repeating: 1, count: length)
    for index in 1..<length {
        sequence[index] = sequence[index-1] * 2 // we can use simplier code using pow, but it will have quadratic time complexity
    }
    return sequence
}

print(geometricProgression(length: 3))
