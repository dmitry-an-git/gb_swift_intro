import Cocoa

//Условие:

//Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой  процент, третий аргумент это срок. Функция возвращает сколько денег получит пользователь по итогу

func finalBalance(amount: Double, interest: Double, term: Double) -> Double {
    /*
     Assuming that
     1) the interest rate to be set as interest points, not as a fraction (ie 5% to be set as 5, not as 0.05)
     2) the rate is compound (ie we earn interest on interest)
     3) the intrest rate is annual and the term is in years
     */
    amount * pow(1+interest/100,term)
}

print(finalBalance(amount: 100, interest: 5, term: 1)) // 105.0
print(finalBalance(amount: 100, interest: 5, term: 2)) // 110.25

//Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
//Добавить возможность получения названия пиццы через rawValue

enum Pizza:String {
    case margherita = "Маргарита"
    case salami = "Салями"
    case forbidden = "С ананасами"
    
    func whoAreYou() -> String {
        return "Я пицца \"" + self.rawValue + "\""
    }
}

var pizza1 = Pizza.margherita
var pizza2 = Pizza.salami
var pizza3 = Pizza.forbidden

print(pizza3.rawValue) // returns "с ананасами"
print(pizza3.whoAreYou()) // returns "Я пицца "С ананасами"

