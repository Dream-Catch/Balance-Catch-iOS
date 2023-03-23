//
//  View2.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct BeforePlayRuleDescriptionView: View {
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                
                Text("룰 설명")
                
                Spacer()
                
                NavigationLink("Next") {
                    PlayerNumberInputView()
                }
                .buttonStyle(RoundedBlueButton())
                
                Spacer()
            }
            .frame(width: 342, height: 700)
            .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 4))
        }.lineLimit(1)
    }
}

struct BeforePlayRuleDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePlayRuleDescriptionView()
    }
}
