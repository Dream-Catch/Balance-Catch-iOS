//
//  QuestionPickerView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/30.
//

import SwiftUI
import UIKit

protocol randomPickAnimation {
    func scrollToEnd()
    func scrollToZero()
    func scrollToSelected(to endIndex: Int)
}

struct QuestionPickerView: View {
    let questionDataList: [QuestionDataModel]
    let isRandomPick: Bool
    @Binding var selectedIndex: Int
    
    let serialQueue = DispatchQueue(label: "serialQueue")
    
    @State private var zeroToEndTime: Double = 0
    let delayTime = 0.5
    let acceleration = 0.08
    
    var body: some View {
        Picker("", selection: $selectedIndex) {
            ForEach(0..<questionDataList.count, id: \.self) { index in
                QuestionItemView(text: questionDataList[index].question)
            }
        }
        .onAppear() {
            let endIndex = selectedIndex
            zeroToEndTime = delayTime + Double(sqrt(2 * Double(questionDataList.count))) * self.acceleration
            
            if isRandomPick {
                scrollToEnd()
                scrollToZero()
                scrollToSelected(to: endIndex)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .padding([.leading, .trailing], 20)
    }
}

extension QuestionPickerView: randomPickAnimation {
    
    func scrollToEnd() {
        selectedIndex = 0
        for index in 0...questionDataList.count - 1 {
            serialQueue.asyncAfter(deadline: .now() + delayTime + 0.1 + Double(sqrt(2 * Double(index))) * acceleration) {
                withAnimation {
                    selectedIndex = index
                }
            }
        }
    }
    
    func scrollToZero() {
        serialQueue.asyncAfter(deadline: .now() + zeroToEndTime + delayTime) {
            withAnimation {
                selectedIndex = 0
            }
        }
    }
    
    func scrollToSelected(to endIndex: Int) {
        for index in 0...endIndex {
            serialQueue.asyncAfter(deadline: .now() + (zeroToEndTime + delayTime * 2) + 0.1 + Double(sqrt(2 * Double(index))) * acceleration) {
                withAnimation {
                    selectedIndex = index
                }
            }
        }
    }
}


