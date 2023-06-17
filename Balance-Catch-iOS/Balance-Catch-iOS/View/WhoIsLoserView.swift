//
//  WhoIsLoserView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct WhoIsLoserView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State public var loserQuestionIdx: Int
    @State private var showDetails = false
    @State private var loserList: [(name: String, index: Int)] = []
    
    @EnvironmentObject var playerList: PlayerList
    @EnvironmentObject private var questionDataViewModel: QuestionDataViewModel
    
    @Binding var path: [Route]
    
    var body: some View {

        ZStack {
            VStack {
                Text("벌칙 당첨자💣")
                    .font(.system(size: 36, weight: .bold))
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom, 85)
                
                ForEach(0 ..< loserList.count, id: \.self) {idx in
                    HStack{
                        Text("Player \(loserList[idx].index + 1)")
                            .padding(21)
                            .font(.subTitle)
                            .shadow(color: .black.opacity(0.25),
                                    radius: 2,
                                    x: 0,
                                    y: 4)
                        Text("\(loserList[idx].name)")
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: 150, height: 62, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color:.gray,radius:2,x:3,y:3)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                    }
                    .padding(.bottom, 56)
                    
                }
                Button("Replay") {
                    moveToSelectTypeView()
                }.buttonStyle(RoundedBlueButton())
            }
            
            if showDetails {
                VStack {
                    Text("대중픽을 선택한 경우 승리!\n\n모두 대중픽이면 패스~, 모두가 소수픽이면 마시기\n\n대중픽이 50:50이면 다 같이 마셔요!\n\n자~ 행운이 왔을까요~?🍀")
                        .font(.system(size: 15))
                        .fontWeight(.black)
                        .frame(width: CGFloat.superViewFrameWidth -  32 - 40, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(12)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color:.gray,radius:2,x:3,y:3)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                        .padding(.top, UIApplication.safeAreaInsetsTop + 20)
                    
                    Spacer()
                }
            }
        }
        .onAppear {
            setLoserPlayerList()
        }
        .frame(width: CGFloat.superViewFrameWidth,
               height: CGFloat.superViewFrameHeight,
               alignment: .center)
        .parchment {
            withAnimation {
                self.showDetails.toggle()
            }
        }
    }
    
    private func setLoserPlayerList () {
        for (index, player) in playerList.players.enumerated() {
            if player.select == loserQuestionIdx {
                loserList.append((name: player.name, index: index))
            } else if loserQuestionIdx == -1 {
                loserList.append((name: player.name, index: index))
            }
        }
        
        // 테스트를 위한 프린트 입니다. 테스트 후 지워주세요.
        print("------Player-------")
        print(playerList.players)
        print("------loser(\(loserQuestionIdx))-------")
        for loser in loserList {
            print("Name: \(loser.name), Index: \(loser.index)")
        }
        // 여기까지 지워주시면 됩니다.
    }
    
    private func moveToPlayerNumberInputView() {
        for route in path.reversed() {
            if route == .playerNumberInputView {
                break
            } else { path.removeLast() }
        }
    }
    
    private func moveToSelectTypeView() {
        for route in path.reversed() {
            if route == .selectTypeView {
                break
            } else { path.removeLast() }
        }
    }
    
}

struct WhoIsLoserView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsLoserView(loserQuestionIdx: 1, path: Binding.constant([]))
    }
}
