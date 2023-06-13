//
//  InformationButton.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/06/13.
//

import SwiftUI

struct Parchment: ViewModifier {
    var action: () -> Void 
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.action()
                    }) {
                        Image(.parchment)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            })
    }
}

extension View {
    func parchment(action: @escaping () -> Void) -> some View {
        self.modifier(Parchment(action: action))
    }
}
