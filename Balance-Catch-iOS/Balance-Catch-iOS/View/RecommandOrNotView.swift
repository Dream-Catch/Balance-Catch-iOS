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
    var cancelBag = CancelBag()
    
    var body: some View {
        ZStack {
            VStack{
                Text("재미있는 질문이였나요?")
                    .font(.subTitle)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom,31)
                
                HStack{
                    ZStack{
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
                    }
                    
                    ZStack{
                        NavigationLink("👎🏻", value: Route.publicPickView)
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
            }
            
            if questionDataViewModel.isLoading { LoadingView() }
            else { EmptyView() }
        }
        .onAppear() {
            questionDataViewModel
                .selectedQuestionData?
                .firstQuestionScore += playerList.players.filter { $0.select == 0 }.count
            questionDataViewModel
                .selectedQuestionData?
                .secondQuestionScore += playerList.players.filter { $0.select == 1 }.count
        }
        .balanceCatchBackButton {
            dismiss()
        }
    }
}

struct RecommandOrNotView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandOrNotView(path: Binding.constant([]))
    }
}
