//
//  WhoIsLoserView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct WhoIsLoserView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var playerList: PlayerList
    @EnvironmentObject private var questionDataViewModel: QuestionDataViewModel
    
    @State public var loserSelectType: SelectType
    @Binding var path: [Route]
    
    @State private var showGameRule = false
    @State private var loserList: [Player] = []
    @State private var scrollViewHeight: CGFloat = 0
    @State private var scrollViewMaxHeigth: CGFloat = 420
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                // 다 걸렸을 때
                if loserList.count == playerList.players.count || loserSelectType == .none {
                    Text("모두 벌칙에 당첨됐습니다!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 14)
                }
                
                // 아무도 안 걸렸을 때
                else if loserList.isEmpty {
                    Text("다들 심리전에 고수시군요~")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 14)
                }
                
                // 누군가 걸렸을 때
                else {
                    Text("벌칙 당첨자💣")
                        .font(.system(size: 36, weight: .bold))
                        .shadow(color:.gray,radius:2,x:3,y:3)
                        .padding(.bottom, 46)
                    
                    ScrollView {
                        VStack {
                            ForEach(0..<loserList.count, id: \.self) { idx in
                                HStack(spacing: 12) {
                                    Text("Player \(loserList[idx].index)")
                                        .font(.subTitle)
                                        .shadow(color: .black.opacity(0.25),
                                                radius: 2,
                                                x: 0,
                                                y: 4)
                                        .frame(width: 150, height: 56, alignment: .center)
                                    
                                    Text("\(loserList[idx].name)")
                                        .font(.system(size: 24, weight: .bold))
                                        .frame(width: 150, height: 56, alignment: .center)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(color:.gray,radius:2,x:3,y:3)
                                        .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 14)
                            }
                        }
                        .background(
                            GeometryReader { geometry in
                                Color.clear
                                    .preference(key: ViewHeightKey.self, value: geometry.size.height)
                            }
                        )
                    }
                    .onPreferenceChange(ViewHeightKey.self) { height in
                        DispatchQueue.main.async {
                            self.scrollViewHeight = height
                        }
                    }
                    .frame(maxHeight: scrollViewHeight)
                }
                
                Spacer().frame(height: 22)
                
                Button("Replay") {
                    moveToSelectTypeView()
                }
                .buttonStyle(RoundedBlueButton())
            }
            
            if showGameRule {
                VStack {
                    Text("대중픽을 선택한 경우 승리!\n\n모두 대중픽이면 패스~ 모두가 소수픽이면 마시기\n\n대중픽이 50:50이면 다 같이 마셔요!\n\n자~ 행운이 왔을까요~?🍀")
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
            ViewHeightKey.maxValue = CGFloat.loserViewHeight * 4 + CGFloat.loserViewHeight / 2 // 벌칙자가 최대 3개까지 보이도록 설정
        }
        .frame(width: CGFloat.superViewFrameWidth,
               height: CGFloat.superViewFrameHeight,
               alignment: .center)
        .parchment {
            withAnimation {
                self.showGameRule.toggle()
            }
        }
    }
    
    private func setLoserPlayerList() {
        for player in playerList.players {
            if player.selectType == loserSelectType {
                loserList.append(player)
            }
        }
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
        WhoIsLoserView(loserSelectType: .none,
                       path: Binding.constant([]))
    }
}
