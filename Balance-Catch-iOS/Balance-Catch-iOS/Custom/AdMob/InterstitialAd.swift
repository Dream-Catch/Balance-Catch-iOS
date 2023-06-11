//
//  InterstitialAd.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/11.
//

import GoogleMobileAds
import SwiftUI

final class InterstitialAd: NSObject, GADFullScreenContentDelegate, ObservableObject {
    
    private let appUnitId = "ca-app-pub-7789747740418821/9601686839"
    var ad: GADInterstitialAd?
    
    override init() {
        super.init()
        setupTestDevice()
    }
    
    func load() {
        let request = GADRequest()
        
        GADInterstitialAd.load(withAdUnitID: appUnitId,
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
            print("전면 광고 적재 완료!")
        })
    }
    
    private func setupTestDevice() {
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [GADSimulatorID]
    }
    
    func show() {
        guard let ad = ad,
              let window = UIApplication.firstWindow,
              let rootViewController = window.rootViewController
        else { return }
        
        ad.present(fromRootViewController: rootViewController)
        print("전면 광고 띄우기 성공!")
    }
}

extension InterstitialAd {
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
        print("Ad error - \(error.localizedDescription)")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
}
