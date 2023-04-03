//
//  QuestionPickerView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/30.
//

import SwiftUI

struct QuestionPickerView: View {
    let questions: [Question]
    @Binding var selectedIndex: Int
    
    var body: some View {
        Picker("", selection: $selectedIndex) {
            ForEach(0..<questions.count, id: \.self) { index in
                QuestionItemView(question: questions[index])
                    .onTapGesture {
                        withAnimation {
                            selectedIndex = index
                        }
                    }
                    .id(questions[index])
            }
        }
        .onAppear() {
            let endIndex = selectedIndex
            selectedIndex = 0
            for index in 0...endIndex {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) / 20) {
                    withAnimation {
                        selectedIndex = index
                    }
                }
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(height: 200)
        .padding([.leading, .trailing], 20)
    }
}
