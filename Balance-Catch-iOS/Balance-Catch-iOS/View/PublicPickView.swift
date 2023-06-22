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
    var gameResult: GameResult
}

struct PublicPickView: View {
    @EnvironmentObject private var viewModel: QuestionDataViewModel
    @EnvironmentObject private var interstitialAd: InterstitialAd
    @Binding var path: [Route]
    
    @State private var loserSelectType: SelectType = .none
    @State private var winner = QuestionData(title: "",
                                             percent: 50,
                                             gameResult: .draw)
    @State private var loser = QuestionData(title: "",
                                            percent: 50,
                                            gameResult: .draw)
    @State private var winViewId = UUID()
    @State private var loseViewId = UUID()
    
    var body: some View {
        
        VStack {
            Text("대중 PICK 결과")
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                .padding(.bottom, 50)
            
            ScoreView(title: winner.title,
                      percent: winner.percent,
                      gameResult: winner.gameResult)
            .id(winViewId)
            
            
            ScoreView(title: loser.title,
                      percent: loser.percent,
                      gameResult: loser.gameResult)
            .id(loseViewId)
            
            .padding(30)
            
            ZStack {
                NavigationLink("Next", value: Route.whoIsLoserView(loserSelectType: loserSelectType))
                    .buttonStyle(RoundedBlueButton())
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            setupData()
        }
        .onReceive(interstitialAd.$isDismiss) { value in
            if value {
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
            loserSelectType = .second
        } else if selectedQuestionData.firstQuestionScore < selectedQuestionData.secondQuestionScore {
            winner.gameResult = .win
            winner.title = selectedQuestionData.secondQuestion
            loser.gameResult = .lose
            loser.title = selectedQuestionData.firstQuestion
            loserSelectType = .first
        } else {
            winner.gameResult = .draw
            winner.title = selectedQuestionData.firstQuestion
            loser.gameResult = .draw
            loser.title = selectedQuestionData.secondQuestion
            loserSelectType = .none
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
