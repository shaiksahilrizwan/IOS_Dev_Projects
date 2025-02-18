protocol Vechicle{
    func getMilage()->Void;
    func getName()->String;
}
class Car:Vechicle{
    public var name:String 
    public var milage:Int 
    public init(_ name:String,_ milage:Int){
        self.name=name 
        self.milage=milage
    }
    public func getName() -> String {
        return name;
    }
    public func getMilage() {
        print("The Milage is \(milage)")
    }
}
var obj=Car("Srinivas",100)
obj.getMilage()
func communte(_ value:Int,obj:Car){
    obj.milage=10000
}
communte(100, obj: obj )
print(obj.milage)
