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
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environmentObject(playerList)
        }
    }
}

