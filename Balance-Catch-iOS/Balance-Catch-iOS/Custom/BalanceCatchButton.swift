//
//  BalanceCatchButton.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct RoundedBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: .RoundedButtonWidth,
                   height: .RoundedButtonHeight,
                   alignment: .center)
            .font(.subTitle)
            .foregroundColor(.white)
            .background(.balanceCatchBlue)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.25),
                    radius: 2,
                    x: 0,
                    y: 4)
    }
}
