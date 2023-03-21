//
//  PlayerNumInputView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct PlayerNumberInputView: View {
    var body: some View {
        ZStack {
            NavigationLink("Next") {
                PlayerNameInputView()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct PlayerNumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNumberInputView()
    }
}
