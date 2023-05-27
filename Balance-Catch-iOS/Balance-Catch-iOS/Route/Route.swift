//
//  Route.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/04/17.
//

enum Route: Hashable {
    case beforePlayRuleDescriptionView
    case playerNumberInputView
    case playerNameInputView(numberOfPeople: Int)
    case selectTypeView
    case selectQuestionView(isRandomPick: Bool)
    case userFirstSelectView(selectedQuestion: Question,index: Int)
    case timerView
    case firstTeamSpeakingView(questionArray: [String])
    case secondTeamSpeakingView(questionArray: [String])
    case userFinalSelectView(questionArray: [String],index: Int)
    case recommandOrNotView
    case publicPickView
    case whoIsLoserView
}
