//
//  MenuView.swift
//  DoTheMath
//
//  Created by Melody Davis on 1/31/23.
//

import SwiftUI

struct MenuBlock: View {
    var title: String
    var number: String
    
    var body: some View {
        VStack {
            Text(title)
            Text(number)
                .font(.title)
        }
        .padding(10)
        .frame(width: 140)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct MenuView: View {
    var timesTable: Int
    var questionsToGo: Int
    
    var body: some View {
        HStack {
            Spacer()
            MenuBlock(title: "Times Table:", number: "\(timesTable)")
            Spacer()
            MenuBlock(title: "Questions Left:", number: "\(questionsToGo)")
            Spacer()
        }
        .padding(.top, 100)
    }
}
