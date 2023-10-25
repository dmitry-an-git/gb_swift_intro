import Cocoa

//Задачи:

//Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only

protocol MenuProtocol {
    var price: Double { get }
    var name: String { get }
}

//Создайте класс кафе, в нем должен быть массив с наименованиями меню  и инициализатор. Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”, то есть, например, для черного чая должно быть black tea, а для зеленого green tea

class Cafe {
    fileprivate var menuEntries: [MenuProtocol]
    
    init(menuEntries: [MenuProtocol]) {
        self.menuEntries = menuEntries
    }
    
    func add(entry: MenuProtocol) {
        self.menuEntries.append(entry)
    }
    
    func getAll() -> [MenuProtocol] {
        return menuEntries
    }
    
    func getBudgeted(budget: Double) -> [MenuProtocol] {
        return menuEntries.filter{$0.price <= budget}
    }
}

struct Tea: MenuProtocol {
    
    enum TeaType: String {
        case black, fruit, green
    }
    
    var type: TeaType
    var name: String
    var price: Double // why not private?
    
    init(type: TeaType, price: Double) {
        self.type = type
        self.price = price
        self.name = type.rawValue + " tea"
    }
    
    func getCost(discount: Int) -> Double {
        guard (discount <= 50) else {
            print("Невозможно применить скидку.")
            return price
        }
        return price * (1 - Double(discount)/100)
    }
}

var test = Tea(type: .green, price: 100)
print(test.name)


//Создайте еще 3 кафе, для которых класс Cafe будет родительским.

class Cafe1: Cafe {
    override func add(entry: MenuProtocol) {
        super.add(entry: entry)
        print(entry.name)
    }
}
class Cafe2: Cafe {}
class Cafe3: Cafe {}

//Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она еще таковой не является

// above

//Сделать так, чтобы в первом из трех классов наследников(например, FirstCafe) функция add помимо того, что выполняла все тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.

// cant override a function from an extension
//extension Cafe1 {
//    override func add(entry: Tea) {
//        super.add(entry: entry)
//        print(entry.name)
//    }
//}

//Создать класс автомата с едой, не реализовывать в нем ни методов, ни свойств, однако этот класс должен уметь делать все тоже самое, что и FirstCafe
//Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.

final class VendingMachine: Cafe1 {
    
    func getItem(number: Int, budget: Double) -> MenuProtocol? {
        guard number > 0 && number <= menuEntries.count else {return nil}
        guard menuEntries[number - 1].price < budget else {return nil}
        return menuEntries[number - 1]
    }
}


//Задачи:

//Создать две структуры: лимонад и салат. Сделать так, чтобы и то и то можно  добавить в меню кафе.

struct Soda: MenuProtocol {
    
    enum SodaType: String {
        case cola, pepsi, baikal
    }
    
    var type: SodaType
    var name: String
    var price: Double // why not private?
    
    init(type: SodaType, price: Double) {
        self.type = type
        self.price = price
        self.name = type.rawValue + " tea"
    }
}

struct Salad: MenuProtocol {
    
    enum SaladType: String {
        case ceasar, tuna
    }
    
    var type: SaladType
    var name: String
    var price: Double // why not private?
    
    init(type: SaladType, price: Double) {
        self.type = type
        self.price = price
        self.name = type.rawValue + " tea"
    }
}

    
var tea = Tea(type: .green, price: 100)
var soda = Soda(type: .cola, price: 200)
var salad = Salad(type: .tuna, price: 300)
var cafe = Cafe(menuEntries: [tea, soda, salad])


//Добавить в класс кафе функцию, которая возвращает все позиции меню

// above

//Добавить в класс кафе функцию, которая на основе цены возвращает массив позиции которые можно купить (Например, есть черный чай за 50, зеленый за 60, лимонад за 100 и салат за 150. Функция получае 90, значит она должна вернуть черный чай и зеленый чай)

print(cafe.getBudgeted(budget: 210))

//Задать переменной с меню в классе Cafe уровень fileprivate

// ok

//Добавить в класс автомата с едой функцию, которая на основе полученного номера (номер элемента в массиве) и денег возвращает товар под необходимым номером, если денег хватает и nil, если денег не хватает. Если товар не найден, тоже вернуть nil

var vendingMachine = VendingMachine(menuEntries: [tea, soda, salad])
print(vendingMachine.getItem(number: 1, budget: 110))

//Создать протокол, в котором будет содержаться две функции: start и final.

protocol testProtocol {
    func start()
    func final()
}

//Для класса автомата с едой создать расширение, в котором будут содержаться функции из протокола из пункта 6 (класс должен быть подписан на протокол). В функции start должно печататься о начале работы автомата, а в final о завершении

extension VendingMachine: testProtocol {
    func start() {
        print("Vending machine is ON")
    }
    func final() {
        print("Vending machine if OFF")
    }
}

