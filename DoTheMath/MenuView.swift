//
//  MenuView.swift
//  DoTheMath
//
//  Created by Melody Davis on 1/31/23.
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
