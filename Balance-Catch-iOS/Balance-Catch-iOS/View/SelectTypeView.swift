//
//  SelectTypeView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct SelectTypeView: View {
    
    @State
    private var isActivated1: Bool = false
    @State
    private var isActivated2: Bool = false
    
    var body: some View {
        
            VStack{


                Text("질문 선택하기")
                    .font(.system(size:24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom,52)

                
                Button(action: {
                    if(isActivated2==true){
                        self.isActivated1.toggle()
                        self.isActivated2 = false
                    }
                    else{
                        self.isActivated1.toggle()
                    }
                }){
                    Text("질문 랜덤 배정")
                        .font(.system(size:24))
                }.buttonStyle(SelectButton(isActivated: $isActivated1))
                    .padding(.bottom,23)
                 
                
            
                Button(action: {
                    self.isActivated1.toggle()
                    if(isActivated1==true){
                        self.isActivated1 = false
                        self.isActivated2.toggle()
                    }
                    else{
                        self.isActivated2.toggle()
                    }
                }){
                    Text("질문 고르기")
                        .font(.system(size:24))
                }
                .buttonStyle(SelectButton(isActivated: $isActivated2))
                
            
                
                NavigationLink("Next") {
                    if(isActivated1==true){
                        UserFirstSelectView()
                    }
                    else if(isActivated2==true){
                        UserFinalSelectView()
                    }
                }
                .padding(.top, 27)
                .buttonStyle(RoundedBlueButton())
                
            } //Vstack
    } //body
}

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeView()
    }
}
