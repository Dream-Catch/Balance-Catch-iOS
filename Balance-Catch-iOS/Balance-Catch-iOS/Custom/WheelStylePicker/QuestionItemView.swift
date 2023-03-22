//
//  QuestionItemView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/22.
//

import SwiftUI

struct QuestionItemView: View {
    var question: Question
    
    var body: some View {
        Text(question.text)
            .font(.headline)
            .lineLimit(1)
    }
}
