//
//  QuestionDataResponseModel.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/04.
//

import Foundation

struct QuestionDataModel {
    let id: String
    let question: String
    let good: Int
    let bad: Int
    let firstQuestionScore: Int
    let secondQuestionScore: Int
    let firstQuestion: String
    let secondQuestion: String
    
    init(response: QuestionDataResponseModel) {
        self.id = response.id
        self.question = response.question
        self.good = response.good
        self.bad = response.bad
        self.firstQuestionScore = response.firstQuestionScore
        self.secondQuestionScore = response.secondQuestionScore
        
        let questionArray = response.question.components(separatedBy: " vs ")
        self.firstQuestion = questionArray.count == 2 ? questionArray[0] : ""
        self.secondQuestion = questionArray.count == 2 ? questionArray[1] : ""
    }
}
