//
//  ContentView.swift
//  GuessTheCoffeeCountry
//
//  Created by Laurent B on 14/01/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var allowhittesting = true
    @State private var showingScore = false
    @State private var scoreTitle = "Ready?"
    @State private var alertMessage = "Not bad but you can do better!"
    @State private var coffees = ["AbelSanchez","Aramosa","Chania","Coocamu","Edido","DambiUddo","ElDurazno","ElMarcelo","ElMirador","ElTito","Himalaya","IvanDosSantos"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var tries = 0
    var showMessage: String {
        return scoreTitle
    }
    
    struct CoffeeMapImage: View {
        var coffee: String
        
        var body: some View {
          Image(self.coffee).renderingMode(.original).clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.blue, lineWidth: 1)).shadow(color: .secondary, radius: 0.5)
        }
        
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                VStack {
                    Text("\nTap the origin for this coffee:\n").foregroundColor(.white).fontWeight(.bold)
                    Text("\(coffees[correctAnswer])").foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("current score \(score)")
                        .foregroundColor(.white)
                    Text(scoreTitle)
                        .foregroundColor(.white)
                        .font(.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                }
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        CoffeeMapImage(coffee: self.coffees[number])
                    }
                    .allowsHitTesting(self.allowhittesting ? true : false)
                }

                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text("Game Over"), message: Text(alertMessage), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                self.score = 0
                self.tries = 0
                })
            
        }
    }
    
    func flagTapped(_ number: Int) {
        allowhittesting = false
        tries += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        if tries == 10 {
            if score == 10 {
                alertMessage = "Score: \(score)\nVery good! 👍🏻"
            }
            if score > 7 && score != 10 {
                alertMessage = "Score: \(score)\nNot bad but you can do better!"
            }
            if score <= 7 {
                alertMessage = "Score: \(score)\nNice try but better you keep study hard! 😬"
            }
            showingScore = true
            scoreTitle = "wait..."
        }
        if showingScore == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            self.askQuestion()
            }
        }
    }
    
    func askQuestion() {
        allowhittesting = true
        scoreTitle = "Go!"
        coffees.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

