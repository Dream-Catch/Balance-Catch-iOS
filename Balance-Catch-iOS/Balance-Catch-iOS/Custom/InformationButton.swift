//
//  InformationButton.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/04/15.
//

import SwiftUI

struct InformationButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 2)
            .padding(.horizontal, 13)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.balanceCatchBlue, lineWidth: 2))
            .foregroundColor(Color.balanceCatchBlue)
            .font(.system(size: 23))
            .frame(width: 30,
                   height: 30,
                   alignment: .center
                   )
    }
}
