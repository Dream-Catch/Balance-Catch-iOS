//
//  UIApplication+.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/11.
//

import UIKit

extension UIApplication {
    
    static var firstWindow: UIWindow? {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = scene?.windows.first
        return window
    }
}
