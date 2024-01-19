//
//  ContentView.swift
//  WeSplit
//
//  Created by Luis Leal on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0;
    
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
                
                
                
            }.navigationTitle("We Split")
        }
    }
}

#Preview {
    ContentView()
}
