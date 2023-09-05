//
//  UINavigationController+UIGestureRecognizerDelegate.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/09/05.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
