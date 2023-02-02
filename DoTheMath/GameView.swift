//
//  GameView.swift
//  DoTheMath
//
//  Created by Melody Davis on 1/31/23.
//

import SwiftUI

struct GameView: View {
    var timesTable: Int
    
    @Binding public var completedGame: Bool
    @Binding public var totalCorrectAnswers: Int
    @Binding public var questionsToGo: Int

    @State private var answerTitle = ""
    @State private var isShowingAnswer = false
    @State private var multiple = Int.random(in: 1...12)
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Text("\(timesTable)")
                Image(systemName: "multiply")
                Text("\(multiple)")
            }
            .font(.largeTitle)
            
            Spacer()
            ButtonsView(possibleAnswers: generatePossibleAnswers(), verifyAnswer: verifyAnswer)
            Spacer()
        } .alert(answerTitle, isPresented: $isShowingAnswer) {
            Button("Ok") {
                isShowingAnswer.toggle()
            }
        }
    }
    
    func generatePossibleAnswers() -> [Int] {
        var choicesList = [
            Int.random(in: 1...144),
            Int.random(in: 1...144),
            Int.random(in: 1...144)
        ]
        
        choicesList.insert(timesTable * multiple, at: Int.random(in: 0...3))
        
        return choicesList
    }
    
    func verifyAnswer(_ playerChoice: Int) {
        if playerChoice == timesTable * multiple {
            totalCorrectAnswers += 1
            answerTitle = "Correct!"
        } else {
            answerTitle = "Oops, try again!"
        }
        
        isShowingAnswer = true
        
        multiple = Int.random(in: 1...12)
        questionsToGo -= 1

        if questionsToGo == 0 {
            completedGame = true
        }
    }
}
