//
//  Question.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/21.
//

import Foundation

struct Question: Identifiable, Hashable {
    let text: String
    let id = UUID()
}
