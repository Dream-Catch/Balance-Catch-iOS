//
//  SelectQuestionThemeView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct ThemeButton: View {
    let theme: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(theme)
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
        .frame(width: 295, height: 75)
        .foregroundColor(.black)
        .padding(.horizontal, 16)
        .background(isSelected ? Color("LightBlue") : Color.white)
        .cornerRadius(20)
        .shadow(color:.gray,radius:2,x:3,y:4)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
    }
}

struct SelectQuestionThemeView: View {
    let questionsThemes = ["커플", "직장인", "솔로", "음식", "학생", "극과극", "생활"]
    @State private var selectedTheme: String?
    
    var body: some View {
        VStack {
            Text("질문 테마를 선택 해주세요")
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
            
            Spacer()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(questionsThemes, id: \.self) { theme in
                        ThemeButton(theme: theme, isSelected: self.selectedTheme == theme) {
                            self.selectedTheme = theme
                        }
                    }
                }
                .padding()
            }
    
            Spacer()
            
//            Mark: NavigationLink(destination: SelectTypeView(selectedTheme: selectedTheme))
            NavigationLink(destination: SelectTypeView(selectedTheme: selectedTheme ?? "")) {
                let _ = print(selectedTheme ?? "")
                Text("Next")
            }
            .buttonStyle(RoundedBlueButton())
            .disabled(selectedTheme == nil)
        }
        .padding()
    }
}

struct SelectQuestionThemeView_Previews: PreviewProvider {
    static var previews: some View {
        return SelectQuestionThemeView()
    }
}
