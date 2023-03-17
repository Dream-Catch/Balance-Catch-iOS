//
//  LaunchScreenView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .center) {
                    Color.white
                    VStack {
                        Image(.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / 2,
                                   alignment: .center)
                            .padding(.bottom, 74)
                        NavigationLink("Start!") {
                            BeforePlayRuleDescriptionView()
                        }
                        .buttonStyle(RoundedBlueButton())
                    }
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
