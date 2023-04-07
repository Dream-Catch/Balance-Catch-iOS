//
//  RoundedButton.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct RoundedButton: ButtonStyle {
    var backgroundColor = Color.white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 6)
            .padding(.horizontal, 53)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.balanceCatchBlue, lineWidth: 5))
            .frame(width: 150,
                   height: 56,
                   alignment: .center
                   )
            .background(configuration.isPressed ? .balanceCatchBlue : .white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25),
                    radius: 2,
                    x: 0,
                    y: 4)
    }
}
