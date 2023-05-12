/*
// MARK: Cafe class
class Cafe {
    var coffeeFactory: CoffeeFactory
    
    init(coffeFactory: CoffeeFactory) {
        self.coffeeFactory = coffeFactory
    }
    
    func order(menu: String) {
        var order: Coffee? = coffeeFactory.makeCoffee(orderedMenu: menu)
        
        if let orderedMenu: Coffee = order {
            orderedMenu.pickup()
        } else {
            print("존재하지 않는 메뉴 입니다.")
        }
    }
}

// MARK: CoffeFactory class
//Factory method Pattern에서는 객체 생성을 담당하는 Factory class를 생성한다.
class CoffeeFactory {
    var americano: Americano = Americano()
    var latte: Latte = Latte()
    
    //생성된 객체를 반환하는 method
    func makeCoffee(orderedMenu: String) -> Coffee? {
        if orderedMenu == "americano" {
            return americano
        } else if orderedMenu == "latte" {
            return latte
        } else {
            return nil
        }
    }
}

// MARK: Coffee protocol
//OCP 원칙을 준수하기 위한 protocol과 extension
protocol Coffee {
    var menu: String {get}
}

//extension으로 protocol에서 기본적으로 구현한 method나 property 제공 가능
extension Coffee {
    func pickup() -> Void {
        print("주문 하신 \(menu) 나왔습니다.")
    }
}
*/

// MARK: Cafe protocol
protocol Cafe {
    func makeCoffee(orderedMenu: String) -> Coffee?
}

extension Cafe {
    func order(menu: String) {
        var order: Coffee? = makeCoffee(orderedMenu: menu)
        
        if let orderedMenu: Coffee = order {
            orderedMenu.pickup()
        } else {
            print("존재하지 않는 메뉴 입니다.")
        }
    }
}

// MARK: MyCafe class
class MyCafe: Cafe {
    var americano: Americano = Americano()
    var latte: Latte = Latte()
    
    //Factory method
    func makeCoffee(orderedMenu: String) -> Coffee? {
        if orderedMenu == "americano" {
            return americano
        } else if orderedMenu == "latte" {
            return latte
        } else {
            return nil
        }
    }
}

// MARK: Coffee protocol
//OCP 원칙을 준수하기 위한 protocol과 extension
protocol Coffee {
    var menu: String {get}
}

//extension으로 protocol에서 기본적으로 구현한 method나 property 제공 가능
extension Coffee {
    func pickup() -> Void {
        print("주문 하신 \(menu) 나왔습니다.")
    }
}

// MARK: Americano class
class Americano: Coffee {
    var menu: String = "americano"
}

// MARK: Latte class
class Latte: Coffee {
    var menu: String = "latte"
}

// MARK: MAIN
var cafe: Cafe = MyCafe()
cafe.order(menu: "americano")    //주문 하신 americano 나왔습니다.
