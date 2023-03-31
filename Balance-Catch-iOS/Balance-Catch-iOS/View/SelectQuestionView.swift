//
//  SelectQuestionView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/21.
//

import SwiftUI

struct SelectQuestionView: View {
    var questions: [Question] = getNewQuestionList()
    
    @State var isRandomPick: Bool
    @State var selectedIndex: Int
    @State var isRetryButtonEnabled = true
    @State var questionViewId = UUID()
    
    init(isRandomPick: Bool, selectedIndex: Int = 0) {
        _isRandomPick = State(initialValue: isRandomPick)
        _selectedIndex = State(initialValue: isRandomPick ? (0..<questions.count).randomElement()! : 0)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            QuestionPickerView(questions: questions, selectedIndex: $selectedIndex)
                .id(questionViewId)
            
            HStack(alignment: .center, spacing: 20) {
                isRandomPick ?
                Button("Reset") {
                    isRetryButtonEnabled = false
                    selectedIndex = (0..<questions.count).randomElement()!
                    questionViewId = UUID()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isRetryButtonEnabled = true
                    }
                }
                .buttonStyle(RoundedBlueButton())
                .disabled(!isRetryButtonEnabled) : nil
                
                NavigationLink("Next") {
                    UserFirstSelectView()
                }
                .buttonStyle(RoundedBlueButton())
            }
        }
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

struct SelectQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionView(isRandomPick: true)
    }
}
