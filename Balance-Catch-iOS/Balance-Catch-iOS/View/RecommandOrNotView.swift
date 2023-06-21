//
//  RecommandOrNotView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/22.
//

import SwiftUI

struct RecommandOrNotView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var playerList: PlayerList
    @EnvironmentObject var questionDataViewModel: QuestionDataViewModel
    @EnvironmentObject var interstitialAd: InterstitialAd
    
    @Binding var path: [Route]
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("재미있는 질문이였나요?")
                    .font(.subTitle)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom,31)
                
                HStack(spacing: 16) {
                    NavigationLink("👍🏻", value: Route.publicPickView)
                        .font(.system(size: 35, weight: .bold))
                        .buttonStyle(RoundedButton())
                        .simultaneousGesture(TapGesture().onEnded({
                            questionDataViewModel
                                .selectedQuestionData?
                                .good += 1
                            questionDataViewModel.putQuestionLike()
                            interstitialAd.show()
                        }))
                    
                    ZStack{
                        NavigationLink("👎🏻",
                                       value: Route.publicPickView)
                        .font(.system(size: 35, weight: .bold))
                        .buttonStyle(RoundedButton())
                        .simultaneousGesture(TapGesture().onEnded({
                            questionDataViewModel
                                .selectedQuestionData?
                                .bad += 1
                            questionDataViewModel.putQuestionLike()
                            interstitialAd.show()
                        }))
                    }
                }
                
                Spacer().frame(height: 31)
                
                NavigationLink("Skip",
                               value: Route.publicPickView)
                .buttonStyle(RoundedBlueButton())
                .simultaneousGesture(TapGesture().onEnded({
                    interstitialAd.show()
                }))
            }
            
            if questionDataViewModel.isLoading { LoadingView() }
            else { EmptyView() }
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            updateQuestionScore()
        }
        .balanceCatchBackButton {
            dismiss()
        }
    }
    
    private func updateQuestionScore() {
        questionDataViewModel
            .selectedQuestionData?
            .firstQuestionScore += playerList.players.filter { $0.selectType == .first }.count
        questionDataViewModel
            .selectedQuestionData?
            .secondQuestionScore += playerList.players.filter { $0.selectType == .second }.count
    }
}

struct RecommandOrNotView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandOrNotView(path: Binding.constant([]))
    }
}
