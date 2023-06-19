//
//  LoserButtonStyle.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/19.
//

import SwiftUI

struct LoserButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width,
                   height: height)
            .font(.subTitle)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25),
                    radius: 2,
                    x: 0,
                    y: 4)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.balanceCatchBlue.opacity(1),lineWidth: 4))
    }
}
