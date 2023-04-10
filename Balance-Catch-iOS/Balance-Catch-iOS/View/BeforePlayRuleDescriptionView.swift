//
//  View2.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct BeforePlayRuleDescriptionView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack(spacing: 16) {
                    
                    Spacer()
                    
                    Text("룰 설명")
                    
                    Spacer()
                    
                    NavigationLink("Next") {
                        PlayerNumberInputView()
                    }
                    .buttonStyle(RoundedBlueButton())
                    
                    Spacer()
                }
                .frame (width: geometry.size.width * 0.9)
                .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 4))
                .frame (width: geometry.size.width, height: geometry.size.height)
                
            }
        }
    }
}

struct BeforePlayRuleDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePlayRuleDescriptionView()
    }
}
