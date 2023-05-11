class Singleton {
    //singleton object
    //static property guarantees thread safe
    private static let singleton: Singleton = Singleton()
    
    //private initializer
    private init() {
        //do something
    }
    
    public static func getInstance() -> Singleton {
        return singleton
    }
}

var singleton1: Singleton = Singleton.getInstance()
var singleton2: Singleton = Singleton.getInstance()
print(singleton1)
print(singleton2)
