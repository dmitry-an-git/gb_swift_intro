import Cocoa


//Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)

//Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

struct PizzaParam {
    
    enum PizzaType: String {
        case margherita, peperoni, pizzachu, piehard, weirdough
    }
    
    enum Topping: String {
        case cheese, tomatoes, peperoni, garlic, beetroot, rhubarb, caviar
    }
    
    var type: PizzaType
    var price: Double
    var thick: Bool // thin dough if false, thick if true
    var toppings: [Topping]
    
    init(type: PizzaType, price: Double, thick: Bool, toppings: [Topping]) {
        self.type = type
        self.price = price
        self.thick = thick
        self.toppings = toppings
    }
}

//Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
//Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.

class Pizzeria {
    
    private var menu: [PizzaParam]
    
    init(menu: [PizzaParam]) {
        self.menu = menu
    }
        
    func addPizza(name: PizzaParam.PizzaType, newPrice: Double, thick: Bool, toppings: [PizzaParam.Topping]) {
        
        var newPizza: PizzaParam = PizzaParam(type: name, price: newPrice, thick: thick, toppings: toppings)
        menu.append(newPizza)
        print(newPizza.type.rawValue + " pizza was successfully added")
    }
    
    func addPizza(newPizza: PizzaParam) {
        
        menu.append(newPizza)
        print(newPizza.type.rawValue + " pizza was successfully added")
    }
    
    func printMenu() {
        guard menu.count > 0 else {
            print("The menu is empty")
            return
        }
        for pizza in menu {
        
            let toppingsToStrings = pizza.toppings.map { $0.rawValue }
            let singleToppingsString = toppingsToStrings.joined(separator: ", ")
            
            let dough: String
            if pizza.thick {
                dough = "thick"
            } else {
                dough = "thin"
            }
            
            print("Name: " + pizza.type.rawValue)
            print("\t" + "Dough: " + dough)
            print("\t" + "Toppings: " + singleToppingsString)
            print("\t" + "Price: " + String(pizza.price))
            
        }
    }
    
    func getMenu() -> [PizzaParam] {
        return menu
    }
}

//Создать экземпляр класса пиццерии и добавить в него несколько пицц.

let pizza1 = PizzaParam(type: .margherita, price: 100, thick: false, toppings: [.cheese, .tomatoes])
let pizza2 = PizzaParam(type: .peperoni, price: 120, thick: false, toppings: [.cheese, .tomatoes, .peperoni])
let pizza3 = PizzaParam(type: .pizzachu, price: 150, thick: false, toppings: [.cheese, .tomatoes, .rhubarb])

var GeekPizza = Pizzeria(menu: [pizza1, pizza2]) // with some initial menu

GeekPizza.addPizza(newPizza: pizza3) // adding a new pizza using an existing variable
GeekPizza.addPizza(name: .weirdough, newPrice: 200, thick: true, toppings: [.cheese, .garlic, .caviar]) // creating a new pizza from scratch

GeekPizza.printMenu()


