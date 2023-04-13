//
//  TimerView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct TimerView: View {
    
    @State var isStartButtonPressed = false
    @State var isNextButtonPressed = false
    
    
    var body: some View{
        
        VStack{
            Text("전체 토론 TIME")
                .font(.system(size:36))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding(.bottom, 45)
            
            CircleTimer(timerManager: TimerManager(counter: 25),
                        isStartButtonPressed: $isStartButtonPressed,
                        isNextButtonPressed: $isNextButtonPressed,
                        alertMessageType: .whole)
            .id(UUID())
            .padding(.bottom, 50)
            
            Button(isStartButtonPressed ? "Next" : "Start") {
                if(!self.isStartButtonPressed){
                    self.isStartButtonPressed = true
                } else {
                    self.isNextButtonPressed = true
                }
            }
            .buttonStyle(RoundedBlueButton())
            
            NavigationLink("", destination: FirstTeamSpeakingView(), isActive: $isNextButtonPressed)
        }//Vstack
        .onAppear() {
            isStartButtonPressed = false
            isNextButtonPressed = false
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
