//
//  SelectQuestionView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/21.
//

import SwiftUI
import UIKit
import Combine
import Foundation

struct SelectQuestionView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: QuestionDataViewModel
    
    @State var isRandomPick: Bool
    @State var selectedIndex: Int = 0
    @State var isRetryButtonEnabled = false
    @State var questionViewId = UUID()
    @Binding var path: [Route]
    
    init(isRandomPick: Bool, selectedIndex: Int = 0, path: Binding<[Route]>) {
        _isRandomPick = State(initialValue: isRandomPick)
        _path = path
    }
    
    var body: some View {
        VStack(spacing: 16) {
            QuestionPickerView(questionDataList: viewModel.questionDataList.value,
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
                                    Route.userFirstSelectView(index: 0))
                    .buttonStyle(RoundedBlueButton())

                }
            }
        }
        .onAppear() {
            changeSelectedQuestionData()
            
            isRetryButtonEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isRetryButtonEnabled = true
            }
        }
        .onChange(of: selectedIndex, perform: { index in
            if !viewModel.questionDataList.value.isEmpty {
                viewModel.selectedQuestionData = viewModel.questionDataList.value[selectedIndex]
            }
        })
        .balanceCatchBackButton {
            dismiss()
        }
    }
    
    private func changeSelectedQuestionData() {
        if isRandomPick {
            selectedIndex = (0..<viewModel.questionDataList.value.count).randomElement() ?? 0
        }
        
        if !viewModel.questionDataList.value.isEmpty {
            viewModel.selectedQuestionData = viewModel.questionDataList.value[selectedIndex]
        }
    }
    
    private func tappedResetButton() {
        changeSelectedQuestionData()
        
        isRetryButtonEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isRetryButtonEnabled = true
        }
    }
}

struct SelectQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuestionView(isRandomPick: true, path: Binding.constant([]))
    }
}
