import Cocoa

//Задачи:

//Написать функцию, которая будет решать квадратное уравнение. На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d), а возвращает корни уравнения.

func squareEquationRoots(a: Double, b: Double, c: Double, d: Double) -> (Double,Double)? {
    let discriminant = b*b - 4*a*(c - d)
    guard discriminant >= 0 else { return nil }
    let root1: Double = (-b + pow(discriminant, 1/2) ) / 2*a
    let root2: Double = (-b - pow(discriminant, 1/2) ) / 2*a
    return (root1,root2)
}

print(squareEquationRoots(a: 1, b: -2, c: 20, d: 3)) // nil
print(squareEquationRoots(a: 1, b: 2, c: 1, d: 0)) // (-1, -1)
print(squareEquationRoots(a: 1, b: 0, c: 2, d: 3)) // (1, -1)

//Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.



struct TeaPrice {
    
    enum TeaType {
        case black, fruit, green
    }
    
    var type: TeaPrice.TeaType
    
    private var price: Double
    
    init(type: TeaType, price: Double) {
        self.type = type
        self.price = price
    }
    
    func getCost(discount: Int) -> Double {
        guard (discount <= 50) else {
            print("Невозможно применить скидку.")
            return price
        }
        return price * (1 - Double(discount)/100)
    }
    

}

var greenTea: TeaPrice = TeaPrice(type: .black, price: 100)
var blackTea: TeaPrice = TeaPrice(type: .green, price: 200)
var fruitTea: TeaPrice = TeaPrice(type: .fruit, price: 150)

//Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе

class Cafe {
    private var teaCollection: [TeaPrice]
    
    init(teaCollection: [TeaPrice]) {
        self.teaCollection = teaCollection
    }
    
    func getPrice(tea: TeaPrice.TeaType, discount: Int) -> Double? {
        guard let teaLet = teaCollection.first(where: {$0.type == tea}) else {return nil}
        return teaLet.getCost(discount: discount)
 
    }
    
    func testFunc(activity: Person.Activity.TypeOfActivity, amount: Double, discount: Int) -> TeaPrice.TeaType? {
        var menu: [TeaPrice]
        switch activity{
        case .pupil:
            menu = teaCollection
        case .student:
            menu = [blackTea]
        case .employee:
            menu = [blackTea, fruitTea]
        default: return nil
        }
        
        menu = menu.filter{amount >= $0.getCost(discount:discount)}
            .sorted{$0.getCost(discount: discount) > $1.getCost(discount: discount)}
        
        guard menu.count>0 else {return nil}
        
        return menu[0].type
        
    }
}

var myCafe = Cafe(teaCollection: [greenTea, blackTea, fruitTea])

//Добавить в структуру чая функцию getCost, которая будет возвращать стоимость чая. На вход функция принимает процент скидки (только целое число), который необходимо применить к стоимости. Если скидка больше 50% напечатать в консоль о невозможности применить скидку и вернуть изначальную стоимость чая.

// see above ^^^
print("Цена с учетом скидки (если применима): " + String(greenTea.getCost(discount: 60)))

//Добавить в класс функцию, которая на вход принимает тип чая и скидку, которую нужно применить. Функция должна вернуть стоимость, которую должен заплатить покупатель. Если данного вида чая нет в массиве(меню) - вернуть nil.

// see above ^^^

print(myCafe.getPrice(tea: .green, discount: 0))



//Задачи 2:

//Сделать тип чая вложенным типом для структуры чая.

// see above ^^^

//Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.
// add private, but neet to reestablish init, as default init no longer works when you have private variables
//print( greenTea.price )
print(greenTea.getCost(discount: 0))

//Создать класс Person, внутри которого должна быть структура Activity, внутри которой должно быть перечисление TypeOfActivity (тип активности) с тремя кейсами: pupil, student, employee. Создать переменную и явно указать ей тип “тип активности”.

class Person {
    struct Activity {
        enum TypeOfActivity {
            case pupil, student, employee
        }
    }
}

let pupil: Person.Activity.TypeOfActivity = .pupil
let student: Person.Activity.TypeOfActivity = .student
let employee: Person.Activity.TypeOfActivity = .employee

//Добавить в класс Cafe функцию, которая на основе типа активности, предложенной суммы и возможной скидки возвращает доступный чая. Чай выбирается по следующим критериям: если это pupil, то доступен и черный, и зеленый, и фруктовый чай. Если это student, то только черный, а если employee, то черный и фруктовый. Если предложенной суммы хватает на все доступные виды чая, то вернуть самый дорогой. Если суммы хватает только на один, то вернуть его. Если суммы хватает на несколько доступных  видов чая, но у них одинаковая стоимость, то вернуть любой из них. Если суммы не хватает ни на один вид чая, то вернуть nil.

print(myCafe.testFunc(activity: .pupil, amount: 190, discount: 0))
