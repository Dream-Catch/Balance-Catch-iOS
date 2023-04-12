//
//  TimerManager.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/04/12.
//

import SwiftUI
import Combine

final class TimerManager: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var counter: Int // 사람 수 * 일정 시간 을 받아와서 시간 설정을 해야할 듯
    var cancellable: Cancellable?
    
    init(counter: Int) {
        self.counter = counter
    }
    
    func start() {
        self.cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                self.counter -= 1
                self.objectWillChange.send()
            })
    }
    
    func pause() {
        self.cancellable?.cancel()
        self.cancellable = nil
    }
    
    func resume() {
        self.start()
    }
}
