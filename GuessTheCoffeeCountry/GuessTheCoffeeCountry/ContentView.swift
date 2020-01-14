//
//  ContentView.swift
//  GuessTheCoffeeCountry
//
//  Created by Laurent B on 14/01/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI

let date = Date()
let components = Calendar.current.dateComponents([.hour,.minute], from: date)

struct ContentView: View {
    
    
    var body: some View {
        Form{
            Section {
                
                Text("Hello, World!")
                Text("Date \(date)")
                //Text("Hour \(components.hour ?? 0)")
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
