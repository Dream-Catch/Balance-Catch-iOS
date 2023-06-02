//
//  SelectTypeView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct SelectTypeView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var questionDataViewModel: QuestionDataViewModel
    @EnvironmentObject var playerList: PlayerList
    
    @State private var isActivated1: Bool = false
    @State private var isActivated2: Bool = false
    @Binding var path: [Route]
    var cancelBag = CancelBag()
    
    var body: some View {
        VStack{
            VStack {
                ForEach(playerList.players, id: \.id) { player in
                    Text(player.name)
                }
            }
            
            Text("질문 선택하기")
                .font(.system(size:24))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding(.bottom,52)
            
            
            Button(action: {
                if(isActivated2) { self.isActivated2.toggle() }
                self.isActivated1.toggle()
            }){
                Text("질문 랜덤 배정")
                    .font(.system(size:24))
                    .fontWeight(.bold)
            }.buttonStyle(SelectButton(isActivated: $isActivated1))
                .padding(.bottom,23)
            
            
            Button(action: {
                if(isActivated1) { self.isActivated1.toggle() }
                self.isActivated2.toggle()
            }){
                Text("질문 고르기")
                    .font(.system(size:24))
                    .fontWeight(.bold)
            }
            .buttonStyle(SelectButton(isActivated: $isActivated2))
            
            
            NavigationLink("Next",
                           value: Route.selectQuestionView(isRandomPick: isActivated1))
            .padding(.top, 27)
            .buttonStyle(RoundedBlueButton())
            .disabled(!isActivated1 && !isActivated2)
        } //Vstack
        .onAppear() {
            bindCombine()
        }
        .balanceCatchBackButton {
            dismiss()
        }
    } //body
    
    private func bindCombine() {
        questionDataViewModel.isAlreadyFetch
            .receive(on: DispatchQueue.main)
            .sink { flag in
                if !flag {
                    questionDataViewModel.getQuestionMetaData()
                    questionDataViewModel.isAlreadyFetch.value = true
                }
            }
            .cancel(with: cancelBag)
    }
}

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeView(path: Binding.constant([]))
    }
}
