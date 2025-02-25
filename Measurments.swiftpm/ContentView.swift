import SwiftUI
struct ContentView: View {
    private var unitsPresent:[String] = ["Temparature","Lengths","Time"]
    @State private var inputValue:Double = 0.0 //common for all the cases
    /*Default Selection values for subcases*/
    @State private var selectionOfUnit:String = "Temparature"
    @State var typeSelection:String = "Celsius"
    @State var typeSelecton2:String = "KM"
    @State var typeSelection3:String = "MM"
    @State var typeSelection4:String = "Days"
    @State var typeSelectioninternal:String = "Hrs" // same as typeSelection5 just name change
    @FocusState var isKeyPadFocused:Bool
    var body: some View {
        NavigationStack{
            Form{
                Section{ //Get the measurment type selecyion value and store it in selectionUnit
                    Picker("Coversion Type",selection: $selectionOfUnit){
                        ForEach(unitsPresent,id:\.self){
                            Text($0)
                        }
                    }
                }
                //Base upon the selectionOfUint we switch the cases 
                switch(selectionOfUnit){
                case("Temparature"):
                    // can make it let constant but for adding more left out
                    var typesTemp:[String] = ["Celsius","Fahrenheit"]
                    //@State var typeSelection:String = "Celsius"
                    // default typeSelection is defined at starting using picker to get the selection
                    Picker("Select the initial Units",selection: $typeSelection){
                        ForEach(typesTemp,id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    //getting the input value and storing it
                    TextField("Enter the initial values",value:$inputValue,format: .number).keyboardType(.decimalPad).focused($isKeyPadFocused)
                    // based upon typeSelection autmatically selecting output type
                    var output:String = (typeSelection=="Celsius") ? "Fahrenheit" : "Celsius"
                    Section((typeSelection == "Celsius") ? "Fahrenheit":"Celsius"){
                        if(typeSelection=="Celsius"){
                          // Output value after conversion  
                            Text(((inputValue/100.0)*180)+32,format: .number)
                            
                        }else{
                            Text(((inputValue)-32.0)*(5.0/9.0),format: .number)
                        }
                    }
                    // case Lengths
                case("Lengths"):
                    // defining the possible options for the conversions of lengths
                    var typesLength:[String] = ["KM","M","CM","MM"]
                    Section{
                        // the default value for the typeSelection2 and 3 are defined earlier
                        //getting the input type using picker
                        Picker("Select the input units type",selection:$typeSelecton2){
                            ForEach(typesLength,id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                        // getting the input value and storing 
                        TextField("Enter the Value to Convert",value: $inputValue,format: .number).keyboardType(.decimalPad).focused($isKeyPadFocused)
                    }
                    // getting the output type using picker and storing in typeSelection3
                    Section{
                        Picker("Select the Output units type",selection: $typeSelection3){
                            ForEach(typesLength,id:\.self){
                                Text($0)
                            }
                        }
                    }
                    // after getting input now determining the output value 
                    Section("The Units in \(typeSelection3)"){
                        // based upon the input type switching cases
                        switch(typeSelecton2){
                            // after determinig the input type based on possible output type
                            // calculations are performed
                        case("KM"):
                            if(typeSelection3=="M"){
                                Text((inputValue*1000),format: .number)
                            }else if(typeSelection3 == "CM"){
                                Text((inputValue*100000),format: .number)
                            }else if(typeSelection3 == "MM"){
                                Text((inputValue*1000000),format: .number)
                            }else{
                                Text((inputValue),format: .number)
                            }
                        case("M"):
                            if(typeSelection3=="KM"){
                                Text((inputValue/1000),format: .number)
                            }else if(typeSelection3 == "CM"){
                                Text((inputValue*100),format: .number)
                            }else if(typeSelection3 == "MM"){
                                Text((inputValue*1000),format: .number)
                                
                            }else{
                                Text((inputValue),format: .number)
                            }
                        case("CM"):
                            if(typeSelection3 == "KM"){
                                Text((inputValue/100000),format: .number)
                            }else if(typeSelection3 == "M"){
                                Text((inputValue/100),format: .number)
                            }else if(typeSelection3 == "MM"){
                                Text((inputValue*10),format: .number)
                                
                            }else{
                                Text((inputValue),format: .number)
                            }
                        case("MM"):
                            if(typeSelection3=="M"){
                                Text((inputValue/1000),format: .number)
                            }else if(typeSelection3 == "CM"){
                                Text((inputValue/100),format:.number)
                            }else if(typeSelection3 == "KM"){
                                Text((inputValue/1000000),format:.number)
                            }else{
                                Text((inputValue),format: .number)
                            }
                            // this may not be executed at all but for swift TM standards only
                        default:
                            Text("Select any one unit atleast")
                        }
                        }
                    // case time
                case("Time"):
                    // definig the possible conversion types
                    var typesOfTimes:[String] = ["Hrs","Mins","Days","Sec"]
                    Section{
                        //getting the input type from the user using picker and storing it in 
                        //typeSelection4
                        Picker("SELECT THE UINTS",selection: $typeSelection4){
                            ForEach(typesOfTimes,id:\.self){
                                Text($0)
                            }
                        }.pickerStyle(.automatic)
                        TextField("Enter the Time in \(typeSelection4)",value:$inputValue,format: .number).keyboardType(.decimalPad).focused($isKeyPadFocused)
                    }
                    Section{
                        // grtting the output type and storing it in typeSelectioninternal
                        Picker("SELECT THE UNITS TO BE CONVERTED",selection: $typeSelectioninternal){
                            ForEach(typesOfTimes,id:\.self){
                                Text($0)
                            }
                        }.pickerStyle(.automatic)
                        switch(typeSelection4){
                            // based on the selection of input type switching cases
                        case("Days"):
                            if(typeSelectioninternal=="Hrs"){
                                Text(inputValue*24,format: .number)
                            }else if(typeSelectioninternal=="Mins"){
                                Text(inputValue*24*60,format: .number)
                            }else if(typeSelectioninternal=="Sec"){
                                Text(inputValue*24*60*60,format: .number)
                            }else
                            {
                                Text(inputValue,format: .number)
                            }
                            // and evaluating the output by checking the output type
                        case("Hrs"):
                            if(typeSelectioninternal=="Days"){
                                Text(inputValue/24,format: .number)
                            }else if(typeSelectioninternal=="Mins"){
                                Text(inputValue*60,format: .number)
                            }else if(typeSelectioninternal=="Sec"){
                                Text(inputValue*60*60,format: .number)
                            }else
                            {
                                Text(inputValue,format: .number)
                            }
                            
                        case("Mins"):
                            if(typeSelectioninternal=="Days"){
                                Text(inputValue/(60*24),format: .number)
                            }else if(typeSelectioninternal=="Hrs"){
                                Text(inputValue/60,format: .number)
                            }else if(typeSelectioninternal=="Sec"){
                                Text(inputValue*60,format: .number)
                            }else
                            {
                                Text(inputValue,format: .number)
                            }
                            
                        case("Sec"):
                            if(typeSelectioninternal=="Days"){
                                Text(inputValue/(60*60*24),format: .number)
                            }else if(typeSelectioninternal=="Hrs"){
                                Text(inputValue/(60*60),format: .number)
                            }else if(typeSelectioninternal=="Mins"){
                                Text(inputValue/60,format: .number)
                            }else
                            {
                                Text(inputValue,format: .number)
                            }
                        default:
                            Text("No valid conversion selected")
                        }    
                    }
                    
                default:
                    Text("There should be at least one case selected")
                    }
                    
                
            }// form ends
            .toolbar(){
                if(isKeyPadFocused){
                    Button("Done"){
                        isKeyPadFocused=false
                    }
                }
            }
                
            }.navigationTitle("Measurments")
        }
    }
