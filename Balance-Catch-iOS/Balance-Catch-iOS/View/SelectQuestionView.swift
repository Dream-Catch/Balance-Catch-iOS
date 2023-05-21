//
//  SelectQuestionView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/21.
//

import SwiftUI

struct SelectQuestionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var isRandomPick: Bool
    @State var selectedIndex: Int
    @State var isRetryButtonEnabled = false
    @State var questionViewId = UUID()
    @Binding var path: [Route]
    
    var questions: [Question] = getNewQuestionList()
    
    init(isRandomPick: Bool, selectedIndex: Int = 0, path: Binding<[Route]>) {
        _isRandomPick = State(initialValue: isRandomPick)
        _selectedIndex = State(initialValue: isRandomPick ? (0..<questions.count).randomElement() ?? 0 : 0)
        _path = path
    }
    
    var body: some View {
        VStack(spacing: 16) {
            QuestionPickerView(questions: questions,
                               isRandomPick: isRandomPick,
                               selectedIndex: $selectedIndex)
            .id(questionViewId)
            
            HStack(alignment: .center, spacing: 20) {
                if isRandomPick {
                    Button("Reset") {
                        questionViewId = UUID()
                        tappedResetButton()
                    }
                    .buttonStyle(RoundedBlueButton())
                    .disabled(!isRetryButtonEnabled)
                } else { EmptyView() }
                
                if isRandomPick && !isRetryButtonEnabled {
                    Button("Next") { }
                        .buttonStyle(RoundedBlueButton())
                } else {
                    NavigationLink("Next",
                                   value:
                                    Route.userFirstSelectView(selectedQuestion: questions[selectedIndex],index: 0))
                    .buttonStyle(RoundedBlueButton())
                }
            }
        }
        .onAppear() {
            isRetryButtonEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isRetryButtonEnabled = true
            }
        }
        .balanceCatchBackButton {
            dismiss()
        }
    }
    
    private func tappedResetButton() {
        isRetryButtonEnabled = false
        selectedIndex = (0..<questions.count).randomElement() ?? 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isRetryButtonEnabled = true
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
        SelectQuestionView(isRandomPick: true, path: Binding.constant([]))
    }
}
