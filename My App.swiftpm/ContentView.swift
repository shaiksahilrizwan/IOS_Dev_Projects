import SwiftUI

struct ContentView: View {
    @State private var noOfPeople:Int = 2//no of people default
    @State private var checkAmout:Double = 0.0 //bill amount default
    @State private var percentTip:Int = 0// default tip percent
    let tipPercentages:[Int] = [0,10,15,20,25,30,35,40,45] // available tip percentages
    private var totalPerson:Double{ // commuted totalPersons
        return Double(noOfPeople+2) // add 2 to selection to fecilitate the picker start from 0
    }
    private var tipAmount:Double{ // calc Tip amount
        return checkAmout*(Double(percentTip)/Double(100))
    }
    private var perPersonBill:Double{ // per PersonBill calc
        return (checkAmout+tipAmount)/Double(totalPerson)
    } 
    var body: some View {
        NavigationStack{
            Form{
                Section{ // Bill entry
                    TextField("Enter the Bill Amount ", value: $checkAmout, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
                    Picker("Select the Number of people",selection: $noOfPeople){
                        ForEach(2..<100){
                            Text("\($0)")
                        } // no of people picker
                    }.pickerStyle(.navigationLink)
                }
                Section("How much Tip you want to give"){
                    //Text("Select share for tip")
                    Picker("Tip Percentage", selection:$percentTip){
                        ForEach(tipPercentages,id: \.self){
                            Text($0,format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }
                // Display Tip amount and Person pay amount
                Section("Total Tip Amount"){
                    Text(tipAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Per Person Amount"){
                    Text(perPersonBill,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }.navigationTitle("SplitChecks")
        }
    }
}
