//
//  QuestionPickerView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/30.
//

import SwiftUI

protocol randomPickAnimation {
    func scrollToEndIndex() async
    func scrollToZeroIndex() async
    func scroll(to index: Int) async
}

struct QuestionPickerView: View {
    let questions: [Question]
    let isRandomPick: Bool
    let serialQueue = DispatchQueue(label: "serialQueue")
    
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
            }
        }
        .onAppear() {
            let endIndex = selectedIndex
            
            if isRandomPick {
                Task {
                    await scrollToEndIndex()
                    await scrollToZeroIndex()
                    await scroll(to: endIndex)
                }
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(height: 200)
        .padding([.leading, .trailing], 20)
    }
}

extension QuestionPickerView: randomPickAnimation {
    
    func scrollToEndIndex() async {
        selectedIndex = 0
        for index in 0..<questions.count {
            serialQueue.asyncAfter(deadline: .now() + Double(index) / 25) {
                withAnimation {
                    selectedIndex = index
                }
            }
        }
    }
    
    func scrollToZeroIndex() async {
        serialQueue.asyncAfter(deadline: .now() + Double(questions.count) / 25 + 0.3) {
            withAnimation {
                selectedIndex = 0
            }
        }
    }
    
    func scroll(to index: Int) async {
        let totalEndTime: Double = Double(questions.count) / 25 + 0.6
        for i in 0...index {
            serialQueue.asyncAfter(deadline: .now() + totalEndTime + Double(i) / 25) {
                withAnimation {
                    selectedIndex = i
                }
            }
        }
    }
}
