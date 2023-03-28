//
//  SelectButton.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct SelectButton: ButtonStyle {
    
    @Binding var isActivated :Bool
    
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            //.fontWeight(.bold)
            .frame(width: 300, height: 150)
            .foregroundColor(.black)
            //.background(Color.white)
            .background(self.isActivated ? Color("LightBlue") : Color.white)
            .cornerRadius(20)
            .shadow(color:.gray,radius:2,x:3,y:4)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
    }
}
