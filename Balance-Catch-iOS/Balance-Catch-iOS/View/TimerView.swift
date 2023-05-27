//
//  TimerView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [Route]
    @EnvironmentObject var userQuestion: UserQuestion
    
    @State var isStartButtonPressed = false
    @State var circleTimerId = UUID()

    init(path: Binding<[Route]>){
        questionArray = []
        _path = path
    }
    
    var questionArray: [String]
    
    var body: some View{
        
        VStack{
            
            Text("전체 토론 TIME")
                .font(.system(size:36))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding(.bottom, 45)
            
            CircleTimer(timerManager: TimerManager(totalTime: 3),
                        nextPath: Route.firstTeamSpeakingView(questionArray: userQuestion.playQuestion.components(separatedBy: " vs ")),
                        alertMessageType: .whole,
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
                NavigationLink("Next", value: Route.firstTeamSpeakingView(questionArray: userQuestion.playQuestion.components(separatedBy: " vs ")))
                    .buttonStyle(RoundedBlueButton())
            }
        }//Vstack
        .onAppear() {
            isStartButtonPressed = false
        }
        .balanceCatchBackButton {
                   dismiss()
               }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(path: Binding.constant([]))
    }
}
