import Cocoa

//Условие:

//Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками


struct Employee {
    
    enum Position: String {
        case cashier, cook
    }
    
    var name: String
    var position: Position
    var salary: Double
    
    init(name: String, position: Position, salary: Double) {
        self.name = name
        self.position = position
        self.salary = salary
    }
    
}

class Pizzeria {

    var employees: [Employee]
    var tables: [Table]
    
    init(employees: [Employee], seats: Int...) {
        self.employees = employees
        self.tables = []
        for seat in seats {
            tables.append(Table(capacity: seat, pizzeria: self))
        }
    }
    
    func checkTables(guests: Int) {
        for table in tables {
            if table.canFit(guests: guests) {
                print(String(format: "This table is for %d people and can fit %d guests", table.capacity, guests))
            } else {
                print(String(format: "This table is for %d people and can't fit %d guests", table.capacity, guests))
            }
            
        }
    }
}

//Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задается в инициализаторе

class Table {
    
    var capacity: Int
    var pizzeria: Pizzeria
    
    init(capacity: Int, pizzeria: Pizzeria) {
        self.capacity = capacity
        self.pizzeria = pizzeria
    }
    
    func canFit(guests: Int) -> Bool {
        return capacity >= guests
    }
}

//Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра


let employee1 = Employee(name: "Vasya", position: .cook, salary: 100)
let employee2 = Employee(name: "Piotr", position: .cook, salary: 1000)
let employee3 = Employee(name: "Angella", position: .cashier, salary: 10000)

var geekPizza = Pizzeria(employees: [employee1, employee2, employee3], seats: 3, 4, 5, 10)

geekPizza.checkTables(guests: 8)
