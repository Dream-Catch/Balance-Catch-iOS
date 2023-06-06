//
//  ScoreView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/06.
//

import Foundation
import SwiftUI

struct ScoreView: View {
    @State var isWin: Bool
    @State var text: String
    @State var percent: Double
    @State var fromPercent: Double = 0.0
    @State var scale: Double = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.system(size: 24, weight: .bold))
                .bold()
                .padding(.leading, 32)
                .padding(.top, 30)
            
            HStack(alignment: .center) {
                ProgressView("", value: fromPercent, total: 100)
                    .progressViewStyle(CustomProgressView(isWin: isWin))
                    .padding(.top, 20)
                    .padding(.trailing, 10)
                    .padding(.bottom, 28)
                    .accentColor(isWin ? Color.balanceCatchBlue : Color.lightBlue)
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
                .stroke(isWin ? Color.balanceCatchBlue : Color.lightBlue, lineWidth: 4)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 100)
        )
        .overlay(StrokeText(text: isWin ? "WIN" : "LOSE",
                            width: 2,
                            color: isWin ? Color.balanceCatchBlue : Color.lightBlue).position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
        .scaleEffect(scale)
        .animation(.easeIn(duration: 1).delay(0.2), value: fromPercent)
        .padding(20)
        .onAppear() {
            updateData()
        }
    }
    
    private func updateData() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if isWin { scale = 1.2 }
            fromPercent = percent
        }
    }
}
