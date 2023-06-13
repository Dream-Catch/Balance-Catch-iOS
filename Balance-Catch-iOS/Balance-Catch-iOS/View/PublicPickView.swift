//
//  PublicPickView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct QuestionData {
    var title: String
    var percent: Double
    var scale: Double
    var gameResult: GameResult
}

struct PublicPickView: View {
    @EnvironmentObject private var viewModel: QuestionDataViewModel
    @EnvironmentObject private var interstitialAd: InterstitialAd
    @Binding var path: [Route]
    
    @State var winner = QuestionData(title: "",
                                     percent: 50.0,
                                     scale: 1.0,
                                     gameResult: .draw)
    @State var loser = QuestionData(title: "",
                                    percent: 50.0,
                                    scale: 1.0,
                                    gameResult: .draw)
    @State var winViewId = UUID()
    @State var loseViewId = UUID()
    @State var isActive = false
    
    var body: some View {
        
        VStack {
            Text("대중 PICK 결과")
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                .padding(.bottom, 50)
            
            ScoreView(title: winner.title,
                      percent: winner.percent,
                      scale: winner.scale,
                      gameResult: winner.gameResult)
            .id(winViewId)
            
            
            ScoreView(title: loser.title,
                      percent: loser.percent,
                      scale: loser.scale,
                      gameResult: loser.gameResult)
            .id(loseViewId)
            
            .padding(30)
            
            ZStack {
                NavigationLink("Next", value: Route.whoIsLoserView)
                    .buttonStyle(RoundedBlueButton())
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            setupData()
        }
        .onReceive(interstitialAd.$isDismiss) { value in
            if value {
                winner.scale = 1.2
                winViewId = UUID()
                loseViewId = UUID()
            }
        }
    }
    
    private func setupData() {
        guard let selectedQuestionData = viewModel.selectedQuestionData else { return }
        
        if selectedQuestionData.firstQuestionScore > selectedQuestionData.secondQuestionScore {
            winner.gameResult = .win
            winner.title = selectedQuestionData.firstQuestion
            loser.gameResult = .lose
            loser.title = selectedQuestionData.secondQuestion
        } else if selectedQuestionData.firstQuestionScore < selectedQuestionData.secondQuestionScore {
            winner.gameResult = .win
            winner.title = selectedQuestionData.secondQuestion
            loser.gameResult = .lose
            loser.title = selectedQuestionData.firstQuestion
        } else {
            winner.gameResult = .draw
            winner.title = selectedQuestionData.firstQuestion
            loser.gameResult = .draw
            loser.title = selectedQuestionData.secondQuestion
        }
        
        let maxValue = Double(max(selectedQuestionData.firstQuestionScore, selectedQuestionData.secondQuestionScore))
        let minValue = Double(min(selectedQuestionData.firstQuestionScore, selectedQuestionData.secondQuestionScore))
        winner.percent = (maxValue / (maxValue + minValue) * 100).rounded(.toNearestOrEven)
        loser.percent = (minValue / (maxValue + minValue) * 100).rounded(.toNearestOrEven)
        
        winViewId = UUID()
        loseViewId = UUID()
    }
}

struct PublicPickView_Previews: PreviewProvider {
    static var previews: some View {
        PublicPickView(path: Binding.constant([]))
    }
}
