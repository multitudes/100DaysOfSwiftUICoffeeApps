//
//  ContentView.swift
//  GuessTheCoffeeCountry
//
//  Created by Laurent B on 14/01/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var coffees = ["AbelSanchez","Aramosa","Chania","Coocamu","Edido","DambiUddo","ElDurazno","ElMarcelo","ElMirador","ElTito","Himalaya","IvanDosSantos"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                VStack {
                    Text("Tap the country for the coffee:").foregroundColor(.white)
                    Text("\(coffees[correctAnswer])").foregroundColor(.white)
                }
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                Image(self.coffees[number]).renderingMode(.original)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your Score is ??? "), dismissButton: .default(Text("Continue")))
            }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        coffees.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//        ZStack{
//            AngularGradient(gradient: Gradient(colors: [.red, .green, .blue, .pink]), center: .center).edgesIgnoringSafeArea(.all)
//            VStack{
//                Button(action: {
//                    self.showingAlert = true
//                }) {
//                       Text("show Alert")
//                        .alert(isPresented: $showingAlert){  Alert(title: Text("alert"), message: Text("This is some alert"), dismissButton: .default(Text("ok")))
//                    }
//                }
//                            Spacer()
//            }
//        }
//        RadialGradient(gradient: Gradient(colors: [.red, .blue, .pink, .yellow]), center: .trailing, startRadius: 20, endRadius: 200)
