import Cocoa

//Задачи 1:

//Создайте переменную “a”, в которой будет хранится массив с Tea. Создайте другую переменную “b” и присвойте ей переменную “a”. Выведете в консоль адреса массивов. Затем в “b” добавьте еще один элемент. Выведете в консоль адреса массивов. Объясните полученный результат (можно рядом в комментарии)

enum Tea1: String {
    case green, black, fruit
}

func getAddress(_ collection: UnsafeRawPointer) {
    print(Int(bitPattern: collection))
}

var a: [Tea1] = [.green, .black, .fruit]
var b = a
getAddress(a)
getAddress(b)

b.append(.black)

getAddress(a)
getAddress(b)

// copy-on-write


//Создайте класс, в котором будет одна переменная “test” типа String. Создайте экземпляр класса (название переменной, например, c). Создайте еще одну переменную (название переменной, например, d) и присвойте ей c. В переменной d измените “test”. Выведите в консоль “test” для c и d. Объясните результат

class TestClass {
    var test: String = "something"
}

var c = TestClass()
var d = c
d.test = "something else"

print(c.test)
print(d.test)

// class is a reference type object

//Создайте структуру, в котором будет одна переменная “test” типа String. Создайте переменную, в которой будет лежать структура (название переменной, например, e). Создайте еще одну переменную (название переменной, например, f) и присвойте ей e. В переменной f измените “test”. Выведите в консоль “test” для e и f. Объясните результат

struct TestStruct {
    var test: String = "something"
}

var e = TestStruct()
var f = e
f.test = "something else"

print(e.test)
print(f.test)

// structere ia value type object


//Создайте класс магазина. В нем должно быть два массива, один с товарами, второй с работниками. Для работников создайте свою структуру, а для товаров свою. Для товаров должно быть минимум 3 разных структуры, например, еда, напитки и одежда. Добавить в класс функцию, которая будет добавлять работника в массив. Написать функцию, которая будет добавлять новый товар в массив.

protocol Good{
    var name: String {get set}
    
    init(name: String)
}

struct Food: Good {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Drink: Good {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Clothes: Good {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Employee{
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class ShopOwner {
    weak var shop: Shop?
    
//    init(shop: Shop?) {
//        self.shop = shop
//    }
    
    init() {
        print("init owner")
    }
    
    deinit {
        print("deinit owner")
    }
}

class Shop{
    
    var goods: [Good]
    var employees: [Employee]
    var owner: ShopOwner?
    var cafe: Cafe
    
    init(goods: [Good], employees: [Employee]) {
        self.goods = goods
        self.employees = employees
        self.owner = ShopOwner()
        self.cafe = Cafe(menuEntries: [], owner: self.owner!)
    }
    
    func addEmployee(employee: Employee) {
        self.employees.append(employee)
    }
    
    func addGood<T:Good>(good: T){
        self.goods.append(good)
    }
    
    deinit{
        print("deinit shop")
    }
    
    func getCafeMenu() -> [String:[MenuProtocol]] {
        var result = [String:[MenuProtocol]] ()
        var arrayTea = [Tea]()
        var arraySoda = [Soda]()
        var arraySalad = [Salad]()
        var menu = cafe.getAll()
        for item in menu {
            if let item = item as? Tea {
                arrayTea.append(item)
            }
            if let item = item as? Soda {
                arraySoda.append(item)
            }
            if let item = item as? Salad {
                arraySalad.append(item)
            }
        }
        result["tea"] = arrayTea
        result["soda"] = arraySoda
        result["salad"] = arraySalad
        return result
    }
    
    func getCafePrices() -> [String:[Double]] {
        var result = [String:[Double]] ()
        for (key, value) in getCafeMenu() {
            result[key] = value.map{$0.price}
        }
        return result
    }

}

let good1 = Food(name: "Pizza")
let good2 = Drink(name: "Cola")
let good3 = Clothes(name: "Jeans")
let employee1 = Employee(name: "Piotr")
let employee2 = Employee(name: "Vasya")

var shop: Shop = Shop(goods: [good1, good2], employees: [employee1])
shop.addGood(good: good3)
shop.addEmployee(employee: employee2)



//Создать класс владельца магазина. Добавить в него свойство, в котором будет хранится магазин, которым он владеет. А в класс магазина добавить переменную, в которой будет хранится владелец магазина. Ответьте на вопрос: Есть ли в такой связке магазин -> директор и директор -> магазин какая-то проблема? Если да, то какая и как ее решить?


var shop2: Shop? = Shop(goods: [good1], employees: [employee1])
var owner: ShopOwner? = ShopOwner()
shop2?.owner = owner
owner?.shop = shop2
owner = nil
shop2 = nil



//Задачи 2:

//С прошлого семинара есть класс Cafe, в котором есть переменная menu, в которую можно добавлять и чай, и лимонад, и салат. Необходимо добавить в структуру чая свойство температуры. Написать функцию в классе Cafe, которая выведет температуру всех Tea из переменной menu.

protocol MenuProtocol {
    var price: Double { get }
    var name: String { get }
}

class Cafe {
    fileprivate var menuEntries: [MenuProtocol]
    var owner: ShopOwner
    
    init(menuEntries: [MenuProtocol], owner: ShopOwner) {
        self.menuEntries = menuEntries
        self.owner = owner
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
    
    func getTeaTemp() -> Void {
        for entry in menuEntries {
            if let entry = entry as? Tea {
                print(entry.temperature)
            }
        }
    }
}

struct Tea: MenuProtocol {
    
    enum TeaType: String {
        case black, fruit, green
    }
    
    var type: TeaType
    var name: String
    var price: Double // why not private?
    var temperature: Int = 100
    
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
        self.name = type.rawValue + " soda"
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
        self.name = type.rawValue + " salad"
    }
}

    
var tea = Tea(type: .green, price: 100)
var soda = Soda(type: .cola, price: 200)
var salad = Salad(type: .tuna, price: 300)
//var cafe = Cafe(menuEntries: [tea, soda, salad])
//cafe.getTeaTemp()

//Добавить в  ранее созданный класс магазина свойство, в котором будет хранится Cafe. Сделать так, чтобы все свойства класса магазина (массив товаров и работников, владелец магазина и кафе) устанавливались в инициализаторе, но в инициализатор передается только массив товаров и работников, а также владелец магазина. Кафе создается внутри инициализатора

//ok

//Добавить в класс кафе свойство, в котором будет хранится владелец кафе. Значение свойству должно устанавливаться в инициализаторе. Когда в классе магазина создается Cafe - владелец и у магазина и у кафе должен быть один.

//ok

//Написать в классе магазина функцию, которая возвращает меню кафе в виде словаря [<что это>: [массив позиций]], например, в меню есть [чай, чай, лимонад, салат, салат], а вернуть функция должна [“tea”: [чай, чай], “lemonade”: [лимонад], “salad”; [салат, салат] ]. Если для позиции ничего нет (например, нет ни одного лимонада), под ключом должен вернуться пустой массив

shop.cafe.add(entry: tea)
shop.cafe.add(entry: tea)
shop.cafe.add(entry: salad)
print(shop.getCafeMenu())


//Добавить в класс магазина функцию, которая на основе словаря из предыдущего задания возвращает словарь с теми же ключами, но вместо массива позиций должен быть массив стоимостей этих позиций

print(shop.getCafePrices())
