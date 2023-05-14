//
//  CustomProgressView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/04/08.
//

import SwiftUI

struct CustomProgressView: ProgressViewStyle {
    var isWin: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading){
            Rectangle()
                .cornerRadius(40)
                .frame(width: 160, height: 5)
                .foregroundColor(.white)
                
            
            Rectangle()
                .cornerRadius(40)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0)*160, height: 5)
                .foregroundColor(isWin ? .balanceCatchBlue : .lightBlue)
                
        }
    }
}


