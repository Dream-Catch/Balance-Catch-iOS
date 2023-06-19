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
    case userFirstSelectView(index: Int)
    case timerView
    case firstTeamSpeakingView
    case secondTeamSpeakingView
    case userFinalSelectView(index: Int)
    case recommandOrNotView
    case publicPickView
    case whoIsLoserView(loserSelectType: SelectType)
}
