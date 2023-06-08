//
//  ScoreView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/06.
//

import Foundation
import SwiftUI

enum GameResult {
    case win, lose, draw
    
    var text: String {
        switch self {
        case .win:
            return "WIN"
        case .lose:
            return "LOSE"
        case .draw:
            return "DRAW"
        }
    }
    
    var color: Color {
        switch self {
        case .win:
            return .balanceCatchBlue
        case .lose:
            return .lightBlue
        case .draw:
            return .drawBlue
        }
    }
}

struct ScoreView: View {
    @State var gameResult: GameResult
    @State var percent: Double
    @State var fromPercent: Double = 0.0
    @State var scale: Double = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(gameResult.text)
                .font(.system(size: 24, weight: .bold))
                .bold()
                .minimumScaleFactor(0.5)
                .padding(.trailing, 32)
                .padding(.leading, 32)
                .padding(.top, 30)
            
            HStack(alignment: .center) {
                ProgressView("", value: fromPercent, total: 100)
                    .progressViewStyle(CustomProgressView(foregroundColor: gameResult.color))
                    .padding(.top, 20)
                    .padding(.trailing, 10)
                    .padding(.bottom, 28)
                    .accentColor(gameResult.color)
                    .scaleEffect(CGSize(width: 1.0, height: 3.5))
                
                Text(String("\(Int(percent))%"))
                    .font(.body)
                    .bold()
                    .padding(.bottom, 28)
            }
            .padding(.leading, 32)
            .padding(.trailing, 48)
        }
        .frame(width: 300, height: 130, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(gameResult.color, lineWidth: 4)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 100)
        )
        .overlay(StrokeText(text: gameResult.text,
                            width: 2,
                            color: gameResult.color).position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
        .scaleEffect(gameResult == .draw ? 1 : scale)
        .animation(.easeIn(duration: 1).delay(0.2), value: fromPercent)
        .padding(20)
        .onAppear() {
            updateData()
        }
    }
    
    private func updateData() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if gameResult == .win { scale = 1.2 }
            fromPercent = percent
        }
    }
}
