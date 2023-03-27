//
//  SelectQuestionThemeView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct QuestionTheme: Identifiable {
    let id = UUID()
    let title: String
}

struct SelectQuestionThemeView: View {
    
    let QuestionsThemes = [
        QuestionTheme(title: "커플"),
        QuestionTheme(title: "직장인"),
        QuestionTheme(title: "솔로"),
        QuestionTheme(title: "음식"),
        QuestionTheme(title: "학생"),
        QuestionTheme(title: "극과극")
    ]
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                
                Text("질문 테마를 선택 해주세요")
                    .font(Font.custom("Arial", size: 24))
                
                Spacer()
                
                List(QuestionsThemes) { theme in
                    ThemeView(title: theme.title)
                }
                
                
                NavigationLink("Next") {
                    SelectTypeView()
                }
                .buttonStyle(RoundedBlueButton())
            }
        }
    }
}

struct ThemeView: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(Font.custom("Arial", size: 24))
        }
        .frame(width: 293, height: 62)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 4))
    }
}


struct SelectQuestionThemeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionThemeView()
    }
}
