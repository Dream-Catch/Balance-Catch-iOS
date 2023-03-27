//
//  PercentageBar.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct PercentageBar: ProgressViewStyle{
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(Color.balanceCatchBlue)

    }
}
