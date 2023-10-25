import Cocoa

//Условие:
//В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
//Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню


protocol PizzeriaItem: CustomStringConvertible { // CSC is from stack overflow, as I want to print them in a nice way
    
    var name: String { get } // to be set automatically
    var price: Double { get set } // input at initialization
    
}

struct PizzaStruct: PizzeriaItem {
    
    enum PizzaType: String {
        case margherita, peperoni, pizzachu, piehard, weirdough
    }
    enum Topping: String {
        case cheese, tomatoes, peperoni, garlic, beetroot, rhubarb, caviar
    }
    
    var type: PizzaType
    var name: String {
        return type.rawValue + " pizza"
    }
    var price: Double
    var thick: Bool // thin dough if false, thick if true
    var toppings: [Topping]
    var description: String {
        let toppingsToStrings = toppings.map { $0.rawValue }
        let singleToppingsString = toppingsToStrings.joined(separator: ", ")
        let dough: String
                    if thick {
                        dough = "thick"
                    } else {
                        dough = "thin"
                    }
        
        return "Name: \(name); Dough: \(dough); Toppings: \(singleToppingsString); Price: \(price)"
    }
    
    init(type: PizzaType, price: Double, thick: Bool, toppings: [Topping]) {
        self.type = type
        self.price = price
        self.thick = thick
        self.toppings = toppings
    }
}

struct FriesStruct: PizzeriaItem {
    
    enum Size: String {
        case small, mid, large
    }
    
    var name = "french fries"
    var size: Size
    var price: Double
    var description: String {
        return "Name: \(name); Size: \(size); Price: \(price)"
    }
    
    init(size: Size, price: Double) {
        self.size = size
        self.price = price
    }
}

class Pizzeria {
    
    private var menu: [PizzeriaItem]
    private var name: String
    
    init(menu: [PizzeriaItem], name: String) {
        self.menu = menu
        self.name = name
    }
        
    func addItem(item: PizzeriaItem) {
        menu.append(item)
    }
    
//    func addPizza(name: PizzaStruct.PizzaType, newPrice: Double, thick: Bool, toppings: [PizzaStruct.Topping]) {
//        
//        var newPizza: PizzaStruct = PizzaStruct(type: name, price: newPrice, thick: thick, toppings: toppings)
//        menu.append(newPizza)
//        print(newPizza.type.rawValue + " pizza was successfully added")
//    }
//    
//    func addPizza(newPizza: PizzaStruct) {
//        
//        menu.append(newPizza)
//        print(newPizza.type.rawValue + " pizza was successfully added")
//    }
    
    func getMenu() -> [PizzeriaItem] {
        return menu
    }
    
    func printMenu() {
        guard menu.count > 0 else {
            print("The menu is empty")
            return
        }
        for item in menu{
            print(item)
        }
    }
}


//Создайте протокол, в котором будут содержаться функции открытия и закрытия

protocol OpenClose {
    func open()
    func close()
}

//Написать расширение для класса пиццерии, в  котором будет реализован протокол из пункта 3

extension Pizzeria: OpenClose {
    func open() {
        print("\(name) is open")
    }
    func close() {
        print("\(name) has been closed")
    }
}

let pizza1 = PizzaStruct(type: .margherita, price: 100, thick: false, toppings: [.cheese, .tomatoes])
let pizza2 = PizzaStruct(type: .peperoni, price: 120, thick: false, toppings: [.cheese, .tomatoes, .peperoni])
let pizza3 = PizzaStruct(type: .pizzachu, price: 150, thick: false, toppings: [.cheese, .tomatoes, .rhubarb])
let fries1 = FriesStruct(size: .small, price: 50)
let fries2 = FriesStruct(size: .mid, price: 75)
let fries3 = FriesStruct(size: .large, price: 100)
var geekPizza = Pizzeria(menu: [pizza1, pizza2, pizza3, fries1, fries2, fries3], name: "GeekPizza")

geekPizza.open()
geekPizza.printMenu()
geekPizza.close()

//Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания

func substract<T: Numeric>(first: T, second: T) -> T {
    return first - second
}

print(substract(first: 3, second: 2))
print(substract(first: 3.5, second: 2))
