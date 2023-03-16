//
//  PlayerNumInputView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct PlayerNumInputView: View {
    var body: some View {
        ZStack {
            NavigationLink("Next") {
                PlayerNameInputView()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct PlayerNumInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNumInputView()
    }
}
