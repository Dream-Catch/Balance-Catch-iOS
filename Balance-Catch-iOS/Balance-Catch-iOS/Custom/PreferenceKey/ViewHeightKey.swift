//
//  ViewHeightKey.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/18.
//

import SwiftUI

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static var maxValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        let newValue = max(value, nextValue())
        value = maxValue >= newValue ? newValue : maxValue
    }
}
