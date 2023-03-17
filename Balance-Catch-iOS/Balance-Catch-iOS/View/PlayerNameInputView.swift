//
//  PlayerNameInputView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct PlayerNameInputView: View {
    var body: some View {
        ZStack {
            NavigationLink("Next") {
                SelectQuestionThemeView()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct PlayerNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameInputView()
    }
}
