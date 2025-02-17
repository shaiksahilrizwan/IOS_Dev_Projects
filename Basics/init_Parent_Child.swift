 class Employee{
    public let name:String
    public var hrs:Int 
    public init(_ name:String,_ hrs:Int ){
        self.name=name 
        self.hrs=hrs 
        print("Parent class Invoked")
    }
    public func getDetails(){
        print("My name is \(name)")
    }
}
class Dev:Employee{
//    public var role:String 
//    init(_ name:String){
//        self.role=name;
//    }
    public var role:String  
    public init(_ name:String, _ hrs:Int, _ role:String){
        self.role=role
        super.init(name,hrs)
    }
    override func getDetails(){
        print("My name is\(name) and i work for \(hrs)")
    }
}
var obj=Dev("Sahil",100,"IOS DEV")
obj.getDetails()
