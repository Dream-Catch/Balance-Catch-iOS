//
//  View2.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct BeforePlayRuleDescriptionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: [Route]
    
    var body: some View {
       // GeometryReader { geometry in
            
            VStack{
                
                Spacer()
                
                Text("Game Rule")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom, 60)
                
                Text("1. 각자 주제에 대해 자신의 의견을 선택합니다.\n\n2. 최종 선택 시, 자신의 선택이 대중픽일 경우 승리!\n\n3. 행운을 빌어요~! 🍀")
                    .font(.system(size: 15))
                    .fontWeight(.black)
                    .frame(width: 340, height: 180)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 4))
                    .padding(.bottom, 60)
                  
            
                NavigationLink("Next", value: Route.playerNumberInputView)
                    .buttonStyle(RoundedBlueButton())
                
                Spacer()
            }
            /*
             .frame(width: 380, height: 200)
             .frame (width: geometry.size.width * 0.87)
             .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 4))
             .padding(40)
             .frame (width: geometry.size.width, height: geometry.size.height)*/
            
            
            
            
        //}
        .balanceCatchBackButton {
            dismiss()
        }
   }
}

struct BeforePlayRuleDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePlayRuleDescriptionView(path: Binding.constant([]))
    }
}
