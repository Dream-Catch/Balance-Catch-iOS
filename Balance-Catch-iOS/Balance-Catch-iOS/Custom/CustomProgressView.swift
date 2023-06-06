//
//  CustomProgressView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/04/08.
//

import SwiftUI

struct CustomProgressView: ProgressViewStyle {
    var isWin: Bool
    var firstAmount: Double
    var secondAmount: Double
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading){
            Rectangle()
                .cornerRadius(40)
                .frame(width: 160, height: 5)
                .foregroundColor(.white)
                
            
            Rectangle()
                .cornerRadius(40)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0)*160, height: 5)
                .foregroundColor(graphColor())
                
        }
    }
    
    func graphColor() -> Color {
        if(firstAmount == secondAmount){
            return Color.drawBlue
        }
        else{
            if isWin {
                return Color.balanceCatchBlue
            }
            else {
                return Color.lightBlue
            }
        }
    }
}


