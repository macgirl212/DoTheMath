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

    @State public var isShowingAnswer = false
    @State private var multiple = Int.random(in: 1...12)
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(timesTable) X \(multiple)")
            Spacer()
            ButtonsView(possibleAnswers: generatePossibleAnswers(), verifyAnswer: verifyAnswer)
            Spacer()
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
        }
        
        multiple = Int.random(in: 1...12)
        questionsToGo -= 1

        if questionsToGo == 0 {
            completedGame = true
        }
    }
}
