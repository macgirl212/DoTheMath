//
//  ButtonsView.swift
//  DoTheMath
//
//  Created by Melody Davis on 1/31/23.
//

import SwiftUI

struct ButtonsView: View {
    var possibleAnswers: [Int]
    
    var verifyAnswer: (Int) -> Void
    
    @State private var isCorrectChoice = false
    
    var body: some View {
        ForEach(0..<4) { number in
            let choice = possibleAnswers[number]
            Button {
                verifyAnswer(choice)
            } label: {
                Text("\(choice)")
                    .font(.title2)
            }
            .padding(20)
            .frame(width: 200)
            .background(.regularMaterial)
            .clipShape(Capsule())
        }
    }
    
    
}
