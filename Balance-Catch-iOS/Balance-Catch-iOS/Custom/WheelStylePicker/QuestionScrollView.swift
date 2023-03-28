//
//  QuestionScrollView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/21.
//

import SwiftUI

struct QuestionScrollView: View {
    let questions: [Question]
    @State private var selectedQuestionMinY: CGFloat = 13
    @Binding var selectedQuestion: Question
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(alignment: .center, spacing: 12) {
                    ForEach(questions, id: \.self) { question in
                        QuestionItemView(question: question)
                            .scaleEffect(selectedQuestion == question ? 1.2 : 1)
                            .animation(.easeInOut(duration: 0.2), value: selectedQuestion)
                            .onTapGesture {
                                selectedQuestion = question
                                proxy.scrollTo(question, anchor: .center)
                            }
                        
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: CGFloat.superViewFrameHeight / 2)
    }
}

