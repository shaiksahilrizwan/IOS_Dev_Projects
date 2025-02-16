enum employeeLeaveConstraint:Error{
    case employeeLeaveExceed
}
struct Employee{
    var name:String 
    var leavAlloc:Int = 14
    var leavTaken:Int = 0{
        didSet{
            print("Leaves Taken upto Now are \(leavTaken)")
        }
    }
    var RemainingLeave:Int{
        get{
            leavAlloc-leavTaken 
        }set{
            return leavAlloc=leavAlloc+newValue
        }
    }
    mutating func getLeave(_ leave:Int)throws->Void{
        if(leave>RemainingLeave){
            throw employeeLeaveConstraint.employeeLeaveExceed 
        }else{
            leavTaken+=leave 
        }
    }
}
var emp1=Employee(name:"Jani")
do{
    try emp1.getLeave(10)
    print("New Leave application")
    try emp1.getLeave(1)
}catch(employeeLeaveConstraint.employeeLeaveExceed){
    print("\(emp1.name) the Leaves allocated to you are not sufficient to compansate")
}
emp1.RemainingLeave=1
do{
    try emp1.getLeave(1)
    print("New Leave application")
    try emp1.getLeave(1)
}catch(employeeLeaveConstraint.employeeLeaveExceed){
    print("\(emp1.name) the Leaves allocated to you are not sufficient to compansate")
}
