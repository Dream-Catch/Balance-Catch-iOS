//
//  SecondTeamSpeakingView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/04/11.
//

import SwiftUI

struct SecondTeamSpeakingView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: [Route]
    
    @State var isStartButtonPressed = false
    @State var circleTimerId = UUID()
    
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
                Text("Player 2")
                    .font(.system(size:28))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:3,x:2,y:2)
                
                Text("제리") // 나중에 질문 값 받아와야 함
                    .font(.system(size: 22, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .frame(width: 150, height: 56)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                    .padding(.leading, 24)
                
            }.padding(.bottom, 40)
            
            CircleTimer(timerManager: TimerManager(totalTime: 15),
                        nextPath: Route.userFinalSelectView,
                        alertMessageType: .secondTeam,
                        isStartButtonPressed: $isStartButtonPressed)
            .id(circleTimerId)
            .padding(.bottom, 50)
            
            if !isStartButtonPressed {
                Button("Start") {
                    self.isStartButtonPressed = true
                    circleTimerId = UUID()
                }
                .buttonStyle(RoundedBlueButton())
            } else {
                NavigationLink("Next", value: Route.userFinalSelectView)
                    .buttonStyle(RoundedBlueButton())
            }
        }//Vstack
        .onAppear() {
            isStartButtonPressed = false
        }
        .balanceCatchBackButton {
            dismiss()
        }
        
        Spacer()
        
    }
    
}


struct SecondTeamSpeakingView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTeamSpeakingView(path: Binding.constant([]))
    }
}
