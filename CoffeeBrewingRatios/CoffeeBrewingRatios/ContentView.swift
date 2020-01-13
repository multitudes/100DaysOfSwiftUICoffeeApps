//
//  ContentView.swift
//  CoffeeBrewingRatios
//
//  Created by Laurent B on 11/01/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var brewerType = 0
    @State private var coffeeOutput = ""
    //@State private var strength = 0
    var ratio = ""
    let brewerTypes = ["Infusion","Percolation"]
    //let strengths = ["50/lt","55/lt","60/lt","65/lt","70/lt", "75/lt"]
    var totalCoffeeNeeded: (Double, String) {
        // calculate
        switch brewerType {
            case 0:
                let a = (Double(coffeeOutput) ?? 0) * 60 / 1000
                return (a, "60 grams per liter")
            case 1:
                let a = (Double(coffeeOutput) ?? 0) * 75 / 1000
                return (a, "75 grams per liter")
            default:
                return (0, "")
        }
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("\nHow much coffee should you use to brew a cup of coffee for same strength depends of the method.\nInfusions like Aeropress and French Press are weaker and need more coffee. Percolation like V60 and pourover are stronger.\n\nEnter below how much coffee output you need (in milliliter)")){
                    
                    TextField(" ml", text: $coffeeOutput)
                        .keyboardType(.decimalPad)
                        .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Brewing method:")) {
                    Picker("", selection: $brewerType) {
                        ForEach(0..<brewerTypes.count) {
                            Text("\(self.brewerTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Ratio of water to coffee in gram/liter")) {
                    Text("Recommended ratio is: \(totalCoffeeNeeded.1)")
                }
                Section {
                    Text("Coffee beans needed: \(totalCoffeeNeeded.0, specifier: "%.1f") gr, \nfor \(coffeeOutput) ml coffee.")
                    
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


//                Text("Ratio for coffee brewing: using percolation (like V60 and pourovers) or infusion (like Aeropress or french press).\nHow much coffee should I use to brew a cup of coffee for same strength depends of the method.\nInfusions are weaker and need more coffee. (Assuming an extraction of 20% and that approx 2gr of water per gr of coffee are retained in the grounds.)"
