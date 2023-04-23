//
//  SelectTypeView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct SelectTypeView: View {
    @State
    public var selectedTheme: String
    @Binding var path: [Route]
    
    @State
    private var isActivated1: Bool = false
    @State
    private var isActivated2: Bool = false
    
    var body: some View {
        //        let _ = print("이동 후: " + selectedTheme)
        VStack{
            
            
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
    } //body
}

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeView(selectedTheme:"커플", path: Binding.constant([]))
    }
}
