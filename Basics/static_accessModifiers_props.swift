struct Student{
    private let name:String
    private let age:Int 
    static public var noOfStudents:Int = 0
    init(_ name:String, _ age:Int ){
        self.name=name 
        self.age=age 
        Student.noOfStudents+=1
    }
    public func getDetails()->(String,Int,Int){
        return(name,age,Student.noOfStudents)
    }
}
let stud1=Student("Sahil",19)
let stud2=Student("Riya",18)
print("The No of Students applied are \(Student.noOfStudents)")
print(stud1.getDetails())// get the details
