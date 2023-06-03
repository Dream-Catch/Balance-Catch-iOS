//
//  QuestionItemView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/22.
//

import SwiftUI

struct QuestionItemView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .lineLimit(1)
    }
}
