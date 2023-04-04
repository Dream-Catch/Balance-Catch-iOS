//
//  SelectQuestionThemeView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct SelectQuestionThemeView: View {
    let QuestionsThemes = ["커플", "직장인", "솔로", "음식", "학생", "극과극", "생활"]
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                
                Text("질문 테마를 선택 해주세요")
                    .font(Font.custom("Arial", size: 24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                
                Spacer()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(QuestionsThemes, id: \.self) { theme in
                            ThemeView(title: theme)
                        }
                    }
                }
                
                Spacer()

                NavigationLink("Next") {
                    SelectTypeView()
                }
                .buttonStyle(RoundedBlueButton())
            }
        }.padding()
    }
}


struct ThemeView: View {
    @State private var selectedTheme: String = ""
    @State private var showSelectTypeView: Bool = false
    let title: String
    
    var body: some View {
        Button(action: {
            selectedTheme = title
            if (showSelectTypeView) {
                showSelectTypeView = false
            } else {
                showSelectTypeView = true
            }
        }) {
            Text(title)
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
        }
        .padding(.horizontal, 20.0)
        .padding(.vertical, 10)
        .buttonStyle(SelectThemeButton(isActivated: $showSelectTypeView))
    }
}


struct SelectQuestionThemeView_Previews: PreviewProvider {
    static var previews: some View {
        return SelectQuestionThemeView()
    }
}
