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
            NavigationLink("Next") {
                PlayerNumberInputView()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct BeforePlayRuleDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePlayRuleDescriptionView()
    }
}
