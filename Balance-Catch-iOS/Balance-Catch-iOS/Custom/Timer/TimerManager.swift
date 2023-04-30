//
//  TimerManager.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/04/12.
//

import SwiftUI
import Combine

final class TimerManager: ObservableObject {
    
    var totalTime: Int
    
    @Published var counter: Int = 0 // 사람 수 * 일정 시간 을 받아와서 시간 설정을 해야할 듯
    @Published var shouldShowAlert: Bool = false
    var cancellable: Cancellable?
    
    init(totalTime: Int) {
        self.totalTime = totalTime
    }
    
    func start() {
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .scan(totalTime) { time, _ in time - 1 }
            .prefix(while: { $0 > -1 })
            .sink { time in
                withAnimation {
                    self.counter = time
                }
                if self.counter == 0 { self.shouldShowAlert = true }
            }
    }
    
    func pause() {
        self.cancellable?.cancel()
        self.cancellable = nil
    }
    
    func resume() {
        self.start()
    }
}
