//
//  ContentView.swift
//  betterRestWithCoffee
//
//  Created by Laurent B on 15/01/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    
    var body: some View {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date()
        return DatePicker("pls enter a date",selection: $wakeUp, displayedComponents: .hourAndMinute)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
