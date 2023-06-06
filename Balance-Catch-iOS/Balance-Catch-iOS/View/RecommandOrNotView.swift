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
    
    @Binding var path: [Route]
    
    @State var isLoading = false
    var cancelBag = CancelBag()
    
    var body: some View {
        ZStack {
            VStack{
           
                Text("잠수이별환승이별환승이별환승이별 VS 환승이별환승이별환승이별")
                    .font(.system(size:24, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.leading,5)
                    .padding(.trailing,5)
                    .padding()
                Text("재미있는 질문이였나요?")
                    .font(.subTitle)
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
                            }))
                    }
                }
            }
            
            if isLoading { LoadingView() }
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
    
    private func bindCombine() {
        questionDataViewModel.isLoading
            .receive(on: DispatchQueue.main)
            .sink { value in
                if value { self.isLoading = true }
                else { self.isLoading = false }
            }
            .cancel(with: cancelBag)
    }
}

struct RecommandOrNotView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandOrNotView(path: Binding.constant([]))
    }
}
