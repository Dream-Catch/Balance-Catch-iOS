//
//  SelectThemeButton.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/04/03.
//

import SwiftUI

struct SelectThemeButton: ButtonStyle {
    
    @Binding var isActivated :Bool
    
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .frame(width: 295, height: 95)
            .foregroundColor(.black)
            .background(self.isActivated ? Color("LightBlue") : Color.white)
            .cornerRadius(20)
            .shadow(color:.gray,radius:2,x:3,y:4)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
    }
}
