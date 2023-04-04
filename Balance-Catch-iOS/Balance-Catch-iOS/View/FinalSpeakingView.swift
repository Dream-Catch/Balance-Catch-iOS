//
//  FinalSpeakingView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/04/04.
//

import SwiftUI

struct FinalSpeakingView: View {
    
    var body: some View{
        
            Spacer()
        
            VStack{
                Text("최후 변론 TIME")
                    .font(.system(size:36))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom, 35)
                    .padding(.top,-10)
                
                HStack{
                    Text("Player 1")
                        .font(.system(size:24))
                        .fontWeight(.bold)
                        .shadow(color:.gray,radius:2,x:3,y:3)
                    
                    Text("제리")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .frame(width: 150, height: 56)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color:.gray,radius:2,x:3,y:3)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                        .padding(.leading, 24)
                    
                }.padding(.bottom, 40)
                
                TimerCode()
                
                NavigationLink("Next") {
                    UserFinalSelectView()
                }
                .buttonStyle(RoundedBlueButton())
            }//Vstack
        
            Spacer()
        
    }
    
}


struct FinalSpeakingView_Previews: PreviewProvider {
    static var previews: some View {
        FinalSpeakingView()
    }
}
