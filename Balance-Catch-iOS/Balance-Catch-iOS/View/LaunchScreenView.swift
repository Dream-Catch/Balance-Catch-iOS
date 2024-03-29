//
//  LaunchScreenView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .center) {
                Color.white
                VStack {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat.superViewFrameWidth / 1.5,
                               alignment: .center)
                        .padding(.bottom, 65)
                    NavigationLink("Start!", value: Route.beforePlayRuleDescriptionView)
                        .buttonStyle(RoundedBlueButton())
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .beforePlayRuleDescriptionView:
                    BeforePlayRuleDescriptionView(path: $path)
                case .playerNumberInputView:
                    PlayerNumberInputView(path: $path)
                case .playerNameInputView(let numberOfPeople):
                    PlayerNameInputView(numberOfPeople: numberOfPeople,
                                        path: $path)
                case .selectTypeView:
                    SelectTypeView(path: $path)
                case .selectQuestionView(let isRandomPick):
                    SelectQuestionView(isRandomPick: isRandomPick,
                                       path: $path)
                case .userFirstSelectView(let index):
                    UserFirstSelectView(index: index,
                                        path: $path)
                case .timerView:
                    TimerView(path: $path)
                case .firstTeamSpeakingView:
                    FirstTeamSpeakingView(path: $path)
                case .secondTeamSpeakingView:
                    SecondTeamSpeakingView(path: $path)
                case .userFinalSelectView(let index):
                    UserFinalSelectView(index: index, path: $path)
                case .recommandOrNotView:
                    RecommandOrNotView(path: $path)
                case .publicPickView:
                    PublicPickView(path: $path)
                case .whoIsLoserView(let selectType):
                    WhoIsLoserView(loserSelectType: selectType, path: $path)
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
