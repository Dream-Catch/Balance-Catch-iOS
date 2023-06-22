//
//  Balance_Catch_iOSApp.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI
import FirebaseCore
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
    }
}

@main
struct Balance_Catch_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var playerList = PlayerList(players: [])
    @StateObject var selectQuestionViewModel = QuestionDataViewModel()
    @StateObject var interstitialAd = InterstitialAd()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environment(\.colorScheme, .light)
                .environmentObject(playerList)
                .environmentObject(selectQuestionViewModel)
                .environmentObject(interstitialAd)
        }
    }
}

