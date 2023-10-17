import Cocoa

//Задачи:



//Создать массив [5, 6, -14, 25], а затем создать новую переменную с отсортированным по возрастанию ранее созданным массивом.

var arrayA: [Int] = [5, 6, -14, 25]
var arrayB = arrayA.sorted{ $0 < $1 }
print(arrayB)

//Создать массив, а затем создать переменную, в которой будет хранится ранее созданные массив, но в нем каждое значение должно быть увеличено на 5.

var arrayC: [Int] = [5, 6, -14, 25]
var arrayD = arrayC.map{ $0 + 5 }
print(arrayD)

//Создать массив,  а затем создать переменную, в которой будет хранится ранее созданные массив, но в нем не должно быть ни отрицательных чисел, ни числа 12, а также каждое значение должно быть увеличено в 2 раза.

var arrayE: [Int] = [5, 6, -14, 25, 12]
var arrayF = arrayE.filter{ $0 >= 0 }.map { $0 * 2 }.filter{ $0 != 12 }
print(arrayF)

//Создать словарь, в котором ключ будет целым числом, а значение строкой

//var dicA: Dictionary<Int, String> = [:]
var dicA = [Int: String]()

//Создать массив [2, 6, 25, 4, 2, 2, 10, 2], затем создать новую переменную, в которой будут те же значения, что и в ранее созданном массиве, но не должно быть повторяющихся значений.

var arrayH = [2, 6, 25, 4, 2, 2, 10, 2]
var setH = Set(arrayH)
print(setH)

//Написать функцию, которая на вход принимает массив целых чисел, а возвращает true или false. true, если результат сложения всех чисел массива больше или равно 100, false, если меньше 100

func isSumOver100(array: [Int]) -> Bool {
    var sum: Int = 0
    for item in array {
        sum += item
    }
    return sum >= 100
}

func viaReduce(array: [Int]) -> Bool {
    array.reduce(0, +) > 100
}

var arrayG = [50, 49, 2]
var arrayJ = [50,50]
var arrayK = [49, 25, 0]

print(isSumOver100(array: arrayG))
print(isSumOver100(array: arrayJ))
print(isSumOver100(array: arrayK))

//Создать переменную, в которой будет хранится замыкание, в которое передается словарь с ключом типа Int и значением типа String, а в ходе выполнения замыкания в консоль печатаются все значения словаря, ключ у которых больше 5

var closure = { (dict:[Int: String]) -> Void in
    for (key,value) in dict {
        if key > 5 {
            print(value)
        }
    }
}

var dictA = [1:"one", 2:"two", 3:"three", 6:"six", 7:"seven"]
closure(dictA)

//Задачи 2:

//Создать перечисление, которое имеет в виде кейсов три вида чая: зеленый, черный и фруктовый. Затем создать словарь, в котором ключ это вид чая, а значение это стоимость и заполнить этот словарь.

enum Tea {
    case green
    case black
    case fruit
}

var green = Tea.green
var black = Tea.black
var fruit = Tea.fruit

var teaDict = [Tea: Double]()

teaDict[green] = 100
teaDict[black] = 200
teaDict[fruit] = 300

print(teaDict)

//Написать функцию, которая на вход принимает такой же словарь, как в задании 1, а возвращает новый, который создан по следующим правилам: у фруктового чая стоимость должна быть увеличена на 30%, у черного уменьшена в 1.6 раза, а у зеленого уменьшена на 9.5%

func adjustTeaPrice(teaDict : [Tea:Double]) -> [Tea:Double] {
    var newTea = [Tea: Double]()
    for (key, value) in teaDict {
        switch key {
        case green: newTea[green] = value * 1.3
        case black: newTea[black] = value / 1.6
        case fruit: newTea[fruit] = value * (1 - 0.095)
        default: print("unexpected tea type")
        }
    }
    return newTea
}

var newTea = adjustTeaPrice(teaDict: teaDict)
print(newTea)

//Написать функцию, которая на вход принимает два целочисленных массива, которые содержат координаты начала и конца отрезка соответственно. Первый элемент массива это x, а второй y. Функция должна вернуть массив, который содержит координаты середины отрезка

func median(arrayA: [Int], arrayB: [Int]) -> [Int] {
    arrayC = [Int]()
    var index = 0
    for _ in arrayA{
        arrayC.append((arrayA[index] + arrayB[index])/2)
        index += 1
    }
    return arrayC
}

var start = [1,1,1]
var end = [-1,-1,-1]
var arrayCT = median(arrayA: start, arrayB: end)
print(arrayCT)

//Написать функцию, которая на вход принимает массив из 4 целых чисел (если чисел меньше или больше должно вернуться nil). Функция возвращает новый массив, который состоит из 3 элементов, первый элемент это первый элемент переданного массива, второй элемент это сумма второго и третьего элемента (индексы 1 и 2) переданного массива, последний элемент это последний элемент переданного массива. Также этот массив должен быть отсортирован по убыванию.

func modifyArray(array:[Int]) -> [Int]? {
    //var newArray: Array<Int>? = nil
    
    if array.count != 4 {
        return nil
    }
    
    var newArray : [Int] = []
    newArray.append(array[0])
    newArray.append((array[1]+array[2]))
    newArray.append(array[3])
    newArray = newArray.sorted{ $0 > $1 }
    
    return newArray
    
}

func test2(array:[Int]) -> [Int]? {
    guard array.count == 4 else {return nil}
    return [array[1], array[2]+array[3], array[4]].sorted{$0>$1}
}

print(modifyArray(array: [1,2,3,4]))
print(modifyArray(array: [1,2,3]))

//Создайте массив, который состоит из всех целых чисел от 1 до 50

var arrayFifty = [Int]()
for i in 1...50 {
    arrayFifty.append(i)
}

print(arrayFifty)

//Напишите замыкание, которое принимает на вход два целых числа и возвращает их сумму, затем вызовите это замыкание

let sumClosure = { (intA:Int, intB:Int) -> Int in
    return intA + intB
}

let cl: ((Int,Int) -> Int) = {a,b in
    a+b
}

print(sumClosure(2,3))

//Напишите функцию, которая на вход будет принимать замыкание, которое на вход принимает целое число, но ничего не возвращает. Функция также не должна ничего возвращать. Внутри функции должен печататься тип замыкания

let dummyClosure = {(var:Int) -> Void in
    print("closure works")
}


func dummyFunction ( someInt:Int, test: (Int) -> Void) {
    print(type(of: test(someInt)))
}

func dummyFunction (dummyClosure: (Int) -> Void) {
    print(type(of: dummyClosure))
}

dummyFunction{number in }

//Создать массив и при помощи forEach вывести в консоль все значения

var lastArray = [0, 2, 3, 4, 9, 2, 5, 5]
lastArray.forEach{print($0)}
