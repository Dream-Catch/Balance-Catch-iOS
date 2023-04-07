//
//  WLProgressViewStyle.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/04/08.
//

import SwiftUI


struct LBProgressView: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 160, height: 5)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 100)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0)*160, height: 5)
                .foregroundColor(.lightBlue)
        }
                
    
    }
}

struct BBProgressView: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 160, height: 5)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 50)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0)*160, height: 5)
                .foregroundColor(.balanceCatchBlue)
        }
                
    
    }
}
