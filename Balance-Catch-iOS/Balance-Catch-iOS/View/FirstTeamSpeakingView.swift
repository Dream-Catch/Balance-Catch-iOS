//
//  FirstTeamSpeakingView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/04/04.
//

import SwiftUI

struct FirstTeamSpeakingView: View {
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
            
            Text("잠수이별") // 나중에 질문 값 받아와야 함
                .font(.system(size: 22, weight: .bold))
                .minimumScaleFactor(0.5)
                .padding(.bottom, 10)
                .padding(.top, 10)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .frame(width: 300, height: 56)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                .padding(.bottom, 40)
            
            CircleTimer(timerManager: TimerManager(totalTime: 15),
                        nextPath: Route.secondTeamSpeakingView,
                        alertMessageType: .firstTeam,
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
                NavigationLink("Next", value: Route.secondTeamSpeakingView)
                    .buttonStyle(RoundedBlueButton())
            }
        }//Vstack
        .onAppear() {
            isStartButtonPressed = false
        }
        
        
        Spacer()
        
            .balanceCatchBackButton {
                       dismiss()
                   }
        
    }
    
}


struct FirstTeamSpeakingView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTeamSpeakingView(path: Binding.constant([]))
    }
}
