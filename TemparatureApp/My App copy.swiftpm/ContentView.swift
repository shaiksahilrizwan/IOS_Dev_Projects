import SwiftUI

struct ContentView: View {
    @State private var celsiusTemp:Double = 0.00
    // c * 9/5 +32
    private var fahrenheitTemp:Double{
        return (celsiusTemp*(9.0/5))+32
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("Enter the Temparature in Celsius")
                    TextField("Enter in Centigrate Degrees",value:$celsiusTemp,format: .number).keyboardType(.decimalPad)
                }
                Section{
                    Text("The Temparature in Fahrenheit")
                    Text(fahrenheitTemp,format: .number)
                }
            }.navigationTitle("Temparature Converter")
        }
    }
}

