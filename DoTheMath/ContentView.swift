//
//  ContentView.swift
//  DoTheMath
//
//  Created by Melody Davis on 1/30/23.
//

import SwiftUI

struct MenuView: View {
    var timesTable: Int
    var questionsToGo: Int
    
    var body: some View {
        HStack {
            VStack {
                Text("Times Table:")
                Text("\(timesTable)")
            }
            VStack {
                Text("Questions Left:")
                Text("\(questionsToGo)")
            }
        }
        .padding(.top, 100)
    }
}

struct ButtonsView: View {
    var timesTable: Int
    var multiple: Int
    var verifyAnswer: (Int) -> Void
    
    var possibleAnswers: [Int] {
        let timesTable = timesTable
        let multiple = multiple
        
        let correctAnswer = timesTable * multiple
        let maxNumber = 12 * multiple
        var numberRange = [Int](1...maxNumber)
        numberRange.remove(at: correctAnswer)
        
        let numberArray = [correctAnswer, numberRange.randomElement() ?? 1, numberRange.randomElement() ?? 1, numberRange.randomElement() ?? 1]
        // bug happens during shuffle
        return numberArray.shuffled()
    }
    
    var body: some View {
        ForEach(0..<4) { number in
            let choice = possibleAnswers[number]
            Button {
                verifyAnswer(choice)
            } label: {
                Text("\(choice)")
            }
        }
    }
}

struct GameView: View {
    var timesTable: Int
    
    @State private var multiple = Int.random(in: 1...12)
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(timesTable) X \(multiple)")
            Spacer()
            ButtonsView(timesTable: timesTable, multiple: multiple, verifyAnswer: verifyAnswer)
            Spacer()
        }
    }
    
    func verifyAnswer(_ playerChoice: Int) {
        if playerChoice == timesTable * multiple {
            print("correct")
        } else {
            print("sorry")
        }
    }
}

struct ContentView: View {
    @State private var selectedTimesTable = 1
    @State private var selectedQuestionsAmount = 5
    @State private var isShowingOptions = true
    @State private var isPlayingGame = false
    
    var body: some View {
        ZStack {
            Color(.yellow)
            VStack {
                MenuView(timesTable: selectedTimesTable, questionsToGo: selectedQuestionsAmount)
                if isShowingOptions {
                    Section {
                        Spacer()
                        Stepper("Please select your times table:", value: $selectedTimesTable, in: 1...12)
                            .padding(10)
                        Stepper("Please select the amount of questions:", value: $selectedQuestionsAmount, in: 5...20, step: 5)
                            .padding(10)
                        Spacer()
                        Button("Ok") {
                            withAnimation {
                                toggleGameState()
                            }
                        }
                        Spacer()
                    }
                } else {
                    Spacer()
                    GameView(timesTable: selectedTimesTable)
                    Spacer()
                    Button("Settings") {
                        withAnimation {
                            toggleGameState()
                        }
                    } .padding(.bottom, 50)
                }
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
