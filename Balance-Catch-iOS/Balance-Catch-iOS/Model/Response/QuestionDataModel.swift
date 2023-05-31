//
//  QuestionDataModel.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/04.
//

struct QuestionDataModel: Decodable {
    let id: String
    let question: String
    let good: Int
    let bad: Int
    let firstQuestionScore: Int
    let secondQuestionScore: Int
}

