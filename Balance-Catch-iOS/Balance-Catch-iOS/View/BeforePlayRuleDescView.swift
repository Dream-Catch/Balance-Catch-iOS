//
//  View2.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct BeforePlayRuleDescView: View {
    var body: some View {
        ZStack {
            NavigationLink("Next") {
                PlayerNumInputView()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct BeforePlayRuleDescView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePlayRuleDescView()
    }
}
