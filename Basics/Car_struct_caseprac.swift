struct Car{
    private let company:String 
    private let model:String
    private var currentTrip:Int=0{
        didSet{
            print ("Current trip distance set to \(currentTrip)")
        }
    }
    private var currentGear:Int=0{
        willSet{
            print("The gear before change is \(currentGear)")
        }
        didSet{
            print("The gear after change is \(currentGear)")
        }
    }
    private let milageofCar:Int
    public var milageLeft:Int {
        milageofCar-currentTrip
    }
    // 0 means neutral 
    public mutating func changeGear(_ gearNo:Int)->Void{
        currentGear=gearNo
    }
    public mutating func goForTrip(_ tripDistance:Int)->Void{
        if(milageLeft<tripDistance){
            print("Can not possible to go !!!")
        }
        currentTrip=tripDistance
    }
    public init(_ name:String,_ model:String, _ milageOfCar:Int ){
        company=name 
        self.milageofCar=milageOfCar 
        self.model=model 
    }
}

var car=Car("Maruthy","SwiftDesire",100)
car.changeGear(6)
car.goForTrip(20)
print(car.milageLeft)
