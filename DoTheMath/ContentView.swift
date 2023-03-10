//
//  ContentView.swift
//  DoTheMath
//
//  Created by Melody Davis on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var completedGame = false
    @State private var isPlayingGame = false
    @State private var isShowingOptions = true
    @State private var selectedTimesTable = 1
    @State private var selectedQuestionsAmount = 5
    @State private var totalCorrectAnswers = 0
    @State private var totalQuestions = 5
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.63, green: 0.77, blue: 1.00), Color(red: 0.74, green: 0.70, blue: 1.00)], startPoint: .top, endPoint: .bottom)
            VStack {
                MenuView(timesTable: selectedTimesTable, questionsToGo: selectedQuestionsAmount)
                if isShowingOptions {
                    Section {
                        Spacer()
                        Section {
                            Stepper("Please select your times table:", value: $selectedTimesTable, in: 1...12)
                                .padding(10)
                            Stepper("Please select the amount of questions:", value: $selectedQuestionsAmount, in: 5...20, step: 5)
                                .padding(10)
                        }
                        .padding(10)
                        .background(.regularMaterial)
                        Spacer()
                        Button("Ok") {
                            // temporary fix for bug that allows selectedQuestionsAmount to be a negative integer
                            if selectedQuestionsAmount == 0 {
                                selectedQuestionsAmount = 5
                            }
                            
                            totalQuestions = selectedQuestionsAmount
                            totalCorrectAnswers = 0
                            
                            withAnimation {
                                toggleGameState()
                                
                            }
                        }
                        .padding(10)
                        .font(.title)
                        .background(.ultraThickMaterial)
                        .clipShape(Capsule())
                        Spacer()
                    }
                } else {
                    Spacer()
                    GameView(timesTable: selectedTimesTable, completedGame: $completedGame, totalCorrectAnswers: $totalCorrectAnswers, questionsToGo: $selectedQuestionsAmount)
                    Spacer()
                    Button {
                        withAnimation {
                            toggleGameState()
                        }
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(10)
                    .font(.title)
                    .background(.ultraThickMaterial)
                    .clipShape(Capsule())
                    .padding(.bottom, 50)
                }
            }
            .alert("Congratulations!", isPresented: $completedGame) {
                Button("OK", action: toggleGameState)
            } message: {
                Text("You got \(totalCorrectAnswers) out of \(totalQuestions) correct!")
            }
        } .ignoresSafeArea()
    }
    
    func toggleGameState() {
        isShowingOptions.toggle()
        isPlayingGame.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
