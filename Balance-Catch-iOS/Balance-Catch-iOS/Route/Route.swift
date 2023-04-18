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
    case selectQuestionThemeView
    case selectTypeView
    case selectQuestionView(isRandomPick: Bool)
    case userFirstSelectView(selectedQuestion: Question)
    case timerView
    case firstTeamSpeakingView
    case secondTeamSpeakingView
    case userFinalSelectView
    case recommandOrNotView
    case publicPickView
    case whoIsLoserView
}
