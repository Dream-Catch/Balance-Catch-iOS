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
    var nextPath: Route
    var alertMessageType: AlertMessageType
    @Binding var isStartButtonPressed: Bool
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                ZStack{
                    Circle() // 전체 시간 원
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35,lineCap: .round))
                        .frame(width: 280, height: 280)
                    
                    Circle() // 시간 줄어드는 원
                        .trim(from: 0, to: CGFloat(timerManager.counter) / CGFloat(timerManager.totalTime))
                        .stroke(timerManager.counter > 10 ? Color("BalanceCatchBlue") : Color.red, style: StrokeStyle(lineWidth: 35,lineCap: .round)) // 10초 밑으로 떨어지면 색상 변경
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        Text(String(format:"%02i:%02i",timerManager.counter/60,timerManager.counter%60))
                            .font(.system(size: 65, weight: .bold))
                    }
                }
            }
        }
        .onReceive(timerManager.$shouldShowAlert) { shouldShowAlert in
            if shouldShowAlert {
                timerManager.pause()
                self.shouldShowAlert = true
            }
        }.alert(alertMessageType.title,
                isPresented: Binding.constant(timerManager.shouldShowAlert),
                presenting: alertMessageType) { _ in
            NavigationLink("Close", value: nextPath)
        } message: { alertMessageType in
            Text(alertMessageType.message)
        }
        .onAppear() {
            timerManager.counter = 0
            timerManager.shouldShowAlert = false
            shouldShowAlert = false
            
            timerManager.pause()
            if isStartButtonPressed { timerManager.start() }
        }
        .onDisappear() {
            timerManager.pause()
        }
    }
}
