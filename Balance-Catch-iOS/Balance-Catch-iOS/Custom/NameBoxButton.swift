//
//  NameBoxButton.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//


import SwiftUI

struct NameBoxButton: ButtonStyle {
    var backgroundColor = Color.white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 20)
            .padding(.horizontal, 65)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.balanceCatchBlue, lineWidth: 4))
            .frame(width: 150,
                   height: 62,
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
