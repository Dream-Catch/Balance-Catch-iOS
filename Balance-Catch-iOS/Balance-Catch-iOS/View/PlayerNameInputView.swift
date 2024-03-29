//
//  PlayerNameInputView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct PlayerNameInputView: View {
    @Environment(\.dismiss) private var dismiss
    @State public var numberOfPeople: Int
    @State private var playerNames: [String] = []
    @State private var scrollViewHeight: CGFloat = 0
    @Binding var path: [Route]
    
    @EnvironmentObject var playerList: PlayerList
    
    var body: some View {
        ZStack {
            VStack {
                Text("각자 이름을 입력해주세요")
                    .font(Font.custom("Arial", size: 24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                
                Spacer().frame(height: 22)
                
                ScrollView(.vertical) {
                    VStack(spacing: 22) {
                        ForEach(0 ..< playerNames.count, id: \.self) { index in
                            VStack {
                                Text("Player \(index + 1)")
                                    .font(Font.custom("Arial", size: 19))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 7)
                                    .shadow(color:.gray,radius:2,x:3,y:3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("Player \(index + 1)", text: self.$playerNames[index])
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 30.0)
                                    .padding(.vertical, 30.0)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(color:.gray,radius:2,x:3,y:3)
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(self.playerNames[index].isEmpty ? Color.gray:Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                                    .autocorrectionDisabled(true)
                            }
                            .padding(.bottom,5)
                            
                        }
                        
                    }
                    .padding(.horizontal, 45.0)
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
                
                if scrollViewHeight == ViewHeightKey.maxValue { Spacer() }
                else { Spacer().frame(height: 34) }
                
                
                
                NavigationLink("Next", value: Route.selectTypeView)
                    .buttonStyle(RoundedBlueButton())
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded {
                                for (index, playerName) in playerNames.enumerated() {
                                    if !playerName.isEmpty {
                                        playerList.addPlayer(index: index + 1,
                                                             name: playerName)
                                    } else {
                                        let newPlayerName = "Player \(index + 1)"
                                        playerList.addPlayer(index: index + 1,
                                                             name: newPlayerName)
                                    }
                                }
                            }
                    )
            }
            .padding(.top, UIApplication.safeAreaInsetsTop)
        }
        .onAppear {
            self.playerList.players = []
            self.playerNames = Array(repeating: "", count: numberOfPeople)
            ViewHeightKey.maxValue = CGFloat.superViewFrameHeight * 2 / 3 - UIApplication.safeAreaInsetsTop
        }
        .balanceCatchBackButton {
            dismiss()
        }
    }
}

struct PlayerNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameInputView(numberOfPeople: 5, path: Binding.constant([]))
    }
}
