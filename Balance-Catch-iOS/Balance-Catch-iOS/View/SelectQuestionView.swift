//
//  SelectQuestionView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/21.
//

import SwiftUI

struct SelectQuestionView: View {
    var questions: [Question] = getNewQuestionList()
    @State private var selectedQuestion: Question = Question(text: QuestionTexts().list[4])
    
    var body: some View {
        VStack(spacing: 16) {
            QuestionScrollView(questions: questions, selectedQuestion: $selectedQuestion)
            
            
            NavigationLink("Next") {
                
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct SelectQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionView()
    }
}

func getNewQuestionList() -> [Question] {
    let qustionTexts = QuestionTexts().list
    var newQuestionList: [Question] = []
    
    qustionTexts.forEach { questionText in
        let newQuestion = Question(text: questionText)
        newQuestionList.append(newQuestion)
    }
    return newQuestionList
}
