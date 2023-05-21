//Adaptee
protocol UsbCInterface {
    func connect(type port: String) -> Void
}

//Target
protocol UsbAInterface {
    func connect() -> Void
}

//Adatee를 구현한 class
class UsbCPort: UsbCInterface {
    func connect(type port: String) -> Void {
        print("USB type-\(port) 메모리를 사용할 준비가 되었습니다.")
    }
}

//Adapter
class Adapter: UsbAInterface {
    private var usbCPort: UsbCPort
    
    init() {
        usbCPort = UsbCPort()
        print("USB type-A 메모리와 호환됩니다.")
    }
    
    func connect() -> Void {
        usbCPort.connect(type: "A")
    }
}

//Client
class MacBook {
    var usbCPort: UsbCInterface
    var adapter: Adapter
    
    init() {
        usbCPort = UsbCPort()
        adapter = Adapter()
    }
    
    func testConnect_C() -> Void {
        usbCPort.connect(type: "C")
    }
    
    func testConnect_A() -> Void {
        adapter.connect()
    }
}

// MARK: - Main
let macbook: MacBook = MacBook()
macbook.testConnect_A()    //USB type-A 메모리를 사용할 준비가 되었습니다.
macbook.testConnect_C()    //Usb type-C 메모리를 사용할 준비가 되었습니다.
