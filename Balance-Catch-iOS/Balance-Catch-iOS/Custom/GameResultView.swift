//
//  GameResultView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/19.
//

import SwiftUI

struct GameResultView: View {
    let gameResult: GameResult
    
    var body: some View {
        VStack {
            Button("\(gameResult.title)") { }
                .buttonStyle(LoserButtonStyle(width: CGFloat.loserTitleButtonWidth, height: CGFloat.loserTitleButtonHeight))
                .disabled(true)
            
            Spacer().frame(height: 23)
            
            Image(gameResult.imageString)
            
            Spacer().frame(height: 16)
            
            Text(gameResult.subTitle)
                .font(.subTitle)
        }
    }
}

struct GameResultView_Previews: PreviewProvider {
    static var previews: some View {
        GameResultView(gameResult: .win)
    }
}
