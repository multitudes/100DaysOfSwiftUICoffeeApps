//
//  ContentView.swift
//  CoffeeBrewingRatios
//
//  Created by Laurent B on 11/01/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI

struct ContentView: View {


    @State private var tipPercentage = 2
    @State private var brewerType = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    let brewerTypes = ["Infusion","Percolation"]

    var totalCoffeeNeeded: Double {
        // calculate
        return 0
    }
    
    @State private var tapCount = 0
    @State private var coffeeOutput = ""
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Enter below how much coffee output you need (in milliliter)")){
                    
                    TextField(" ml", text: $coffeeOutput)
                        .keyboardType(.decimalPad)
                        .pickerStyle(SegmentedPickerStyle())
                       
                    }

                Section(header: Text("Brewing method:")) {
                    Picker("tippercentage: ", selection: $brewerType) {
                        ForEach(0..<brewerTypes.count) {
                            Text("\(self.brewerTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            
                Section{

                    Text("You want \(coffeeOutput) ml!")
                }
                Section {
                    Button("Tap it! \(tapCount)") {
                        self.tapCount += 1
                    }
                    Text("You want \(coffeeOutput) ml!")
                    
                }
            }.navigationBarTitle("CoffeeBrewingRatios", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
