//
//  CircleTimer.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/04/06.
//

import SwiftUI

enum AlertMessageType {
    case whole, firstTeam, secondTeam
    
    var title: String {
        switch self {
        case .whole:
            return "토론 시간 종료!"
        case .firstTeam:
            return "해당 의견의 최후 변론 종료!"
        case .secondTeam:
            return "양측 최후 변론 종료!"
        }
    }
    
    var message: String {
        switch self {
        case .whole:
            return "최후 변론으로 넘어갑니다"
        case .firstTeam:
            return "반대 의견의 최후 변론으로 넘어갑니다"
        case .secondTeam:
            return "최종 선택을 진행합니다"
        }
    }
}

struct CircleTimer: View {
    
    @StateObject var timerManager: TimerManager
    @Binding var isStartButtonPressed: Bool
    @Binding var isNextButtonPressed: Bool
    var alertMessageType: AlertMessageType
    
    @State var totalTime = 0
    @State var to : CGFloat = 0
    @State var shouldShowAlert = false
    
    var body: some View {
        ZStack {
            VStack{
                ZStack{
                    Circle() // 전체 시간 원
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35,lineCap: .round))
                        .frame(width: 280, height: 280)
                    
                    Circle() // 시간 줄어드는 원
                        .trim(from: 0, to: self.to)
                        .stroke(timerManager.counter > 10 ? Color("BalanceCatchBlue") : Color.red, style: StrokeStyle(lineWidth: 35,lineCap: .round)) // 10초 밑으로 떨어지면 색상 변경
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        Text(String(format:"%02i:%02i",self.timerManager.counter/60,self.timerManager.counter%60))
                            .font(.system(size: 65, weight: .bold))
                    }
                }
            }
        }
        .onReceive(timerManager.objectWillChange) { _ in
            withAnimation(.default){
                self.to = CGFloat(timerManager.counter) / CGFloat(self.totalTime) // 총 시간 (초) 를 넣어줘야함
            }
            
            if timerManager.counter == 0 {
                timerManager.pause()
                shouldShowAlert.toggle()
            }
        }.alert(isPresented: $shouldShowAlert) {
            Alert(title: Text(alertMessageType.title),
                  message: Text(alertMessageType.message),
                  dismissButton: .default(Text("Close"),
                                          action: {
                isNextButtonPressed = true
            }))
        }
        .onAppear() {
            totalTime = timerManager.counter
            timerManager.pause()
            if isStartButtonPressed { timerManager.start() }
        }
        .onDisappear() {
            timerManager.pause()
        }
    }
}
