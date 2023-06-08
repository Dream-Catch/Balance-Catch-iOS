//
//  Balance_Catch_iOSApp.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

@main
struct Balance_Catch_iOSApp: App {
    @StateObject var playerList = PlayerList(players: [])
    @StateObject var selectQuestionViewModel = QuestionDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
//            PublicPickView(path: Binding.constant([]))
                .environmentObject(playerList)
                .environmentObject(selectQuestionViewModel)
        }
    }
}

