//
//  ThemeButtonStyle.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/04/05.
//

import SwiftUI

struct ThemeButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 295, height: 75)
            .padding(.horizontal, 16)
            .foregroundColor(.black)
            .background(isSelected ? Color("LightBlue") : Color.white)
            .cornerRadius(20)
            .shadow(color:.gray,radius:2,x:3,y:4)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4)
            )
    }
}
