//
//  BalanceCatchBackButton.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/04/27.
//

import SwiftUI

struct BalanceCatchBackButton: ViewModifier {
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.action()
                    }) {
                        Image(.back)
                    }
                }
            })
    }
}

extension View {
    func balanceCatchBackButton(action: @escaping () -> Void) -> some View {
        self.modifier(BalanceCatchBackButton(action: action))
    }
}
