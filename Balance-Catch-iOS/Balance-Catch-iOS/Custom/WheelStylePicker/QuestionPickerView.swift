//
//  QuestionPickerView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/30.
//

import SwiftUI

protocol randomPickAnimation {
    func scrollToEndIndex()
    func scrollToZeroIndex()
    func scroll(to index: Int)
}

struct QuestionPickerView: View {
    @EnvironmentObject var viewModel: SelectQuestionViewModel
    
    let questionMetaDataList: [QuestionDataModel]
    let isRandomPick: Bool
    let serialQueue = DispatchQueue(label: "serialQueue")
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        Picker("", selection: $selectedIndex) {
            ForEach(0..<questionMetaDataList.count, id: \.self) { index in
                QuestionItemView(text: questionMetaDataList[index].question)
            }
        }
        .onAppear() {
            let endIndex = selectedIndex
            
            if isRandomPick {
                scrollToEndIndex()
                scrollToZeroIndex()
                scroll(to: endIndex)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(height: 200)
        .padding([.leading, .trailing], 20)
    }
}

extension QuestionPickerView: randomPickAnimation {
    
    func scrollToEndIndex() {
        selectedIndex = 0
        for index in 0..<questionMetaDataList.count {
            serialQueue.asyncAfter(deadline: .now() + Double(index) / 25) {
                withAnimation {
                    selectedIndex = index
                }
            }
        }
    }
    
    func scrollToZeroIndex() {
        serialQueue.asyncAfter(deadline: .now() + Double(questionMetaDataList.count) / 25 + 0.3) {
            withAnimation {
                selectedIndex = 0
            }
        }
    }
    
    func scroll(to index: Int) {
        let totalEndTime: Double = Double(questionMetaDataList.count) / 25 + 0.6
        for i in 0...index {
            serialQueue.asyncAfter(deadline: .now() + totalEndTime + Double(i) / 25) {
                withAnimation {
                    selectedIndex = i
                }
            }
        }
    }
}
