//
//  SelectQuestionThemeView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct SelectQuestionThemeView: View {
    let questionThemes = ["커플", "직장인", "솔로", "음식", "학생", "극과극", "생활"]
    @State private var selectedTheme: String = ""
    @Binding var path: [Route]
    
    var body: some View {
        VStack {
            Text("질문 테마를 선택 해주세요")
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
            
            Spacer()
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(questionThemes, id: \.self) { theme in
                        Button(action: {
                            selectedTheme = theme
                        }) {
                            Text(theme)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                        .buttonStyle(ThemeButtonStyle(isSelected: selectedTheme == theme))
                    }
                }
                .padding()
            }
            
            Spacer()
            
            NavigationLink("Next", value: Route.selectTypeView)
                .buttonStyle(RoundedBlueButton())
                .disabled(selectedTheme.isEmpty)
        }
        .padding()
    }
}


struct SelectQuestionThemeView_Previews: PreviewProvider {
    static var previews: some View {
        return SelectQuestionThemeView(path: Binding.constant([]))
    }
}
