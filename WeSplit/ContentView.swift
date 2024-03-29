//
//  ContentView.swift
//  WeSplit
//
//  Created by Luis Leal on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0;
    @State private var name = "";
    
    let users = ["Leal", "Alfredo", "Chaires"]
    @State private var selectedUser = "Leal"
    
    @State private var checkAmount = 100.0;
    @State private var numberOfPeople = 2;
    @State private var percentage = 10;
    @FocusState private var isAmountFocus:Bool
    
    let percentageList = [0,10,20,30]
    
    var totalPerPerson:Double{
        let tipSelection = Double(percentage)
        let peopleCount = Double(numberOfPeople + 2)
        
        print(peopleCount)
        
        let tipValue = (checkAmount*tipSelection)/100
        
        return ((checkAmount+tipValue)/peopleCount)
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Text("Hola Mundo")
                    Text("Hola Mundo")
                    Text("Hola Mundo")
                }
                
                Section{
                    HStack(){
                        Text("\(counter)")
                        Button("+1"){
                            counter+=1
                        }.padding()
                        
                    }
                }
                
                Section{
                    TextField("Enter your name", text: $name)
                    Text("Your name is: \(name)")
                }
                
                Section{
                    Picker("Select your student", selection: $selectedUser){
                        ForEach(users, id:\.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    VStack{
                        Text("CHECK CALCULATOR").font(.title.bold())
                        HStack{
                            Text("Check")
                            TextField("Amount",
                                      value: $checkAmount,
                                      format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad).focused($isAmountFocus)
                                      
                        }
                        Picker("Number of people", selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }
                        Section("How much would you like to tip"){
                            Picker("Tip percentage", selection: $percentage){
                                ForEach(percentageList, id:\.self){
                                    Text($0, format: .percent)
                                }
                            }.pickerStyle(.segmented)
                        }
                        Text("TOTAL PER PERSON IS: $\(totalPerPerson.formatted())").padding(.top).bold()
                    }
            
                }
                
            }.navigationTitle("We Split")
                .toolbar{
                    if isAmountFocus {
                        Button("Done"){
                            isAmountFocus = false
                        }
                    }}
        }
    }
}

#Preview {
    ContentView()
}
