//
//  PublicPickView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct Question {
    var gameResult: GameResult
    var percent: Double
}

struct PublicPickView: View {
    @EnvironmentObject private var viewModel: QuestionDataViewModel
    @Binding var path: [Route]
    
    @State var winner = Question(gameResult: .draw,
                                 percent: 50.0)
    @State var loser = Question(gameResult: .draw,
                                percent: 50.0)
    @State var winViewId = UUID()
    @State var loseViewId = UUID()
    
    var body: some View {
        
        VStack {
            Text("대중 PICK 결과")
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                .padding(.bottom, 50)
            
            ScoreView(gameResult: winner.gameResult,
                      percent: winner.percent)
            .id(winViewId)
            
            
            ScoreView(gameResult: loser.gameResult,
                      percent: loser.percent)
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
    }
    
    func setupData() {
        guard let selectedQuestionData = viewModel.selectedQuestionData else { return }
        
        if selectedQuestionData.firstQuestionScore == selectedQuestionData.secondQuestionScore {
            winner.gameResult = .draw
            loser.gameResult = .draw
        } else {
            winner.gameResult = .win
            loser.gameResult = .lose
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
