//
//  BiggerRoundBlueButton.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//
import SwiftUI

struct BiggerRoundedBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 140,
                   height: 56,
                   alignment: .center)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .background(.balanceCatchBlue)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.25),
                    radius: 2,
                    x: 0,
                    y: 4)
    }
}
