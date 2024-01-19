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
                
            }.navigationTitle("We Split")
        }
    }
}

#Preview {
    ContentView()
}
