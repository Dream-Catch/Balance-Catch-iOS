//
//  SelectQuestionThemeView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct SelectQuestionThemeView: View {
    var body: some View {
        ZStack {
            NavigationLink("Next") {
                SelectQuestionView()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct SelectQuestionThemeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionThemeView()
    }
}
