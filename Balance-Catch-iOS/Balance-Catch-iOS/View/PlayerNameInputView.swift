//
//  PlayerNameInputView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct PlayerNameInputView: View {
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
                                    .cornerRadius(20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .inset(by: 3)
                                            .stroke(
                                                self.playerNames[index].isEmpty ? Color.gray:
                                                        .balanceCatchBlue,
                                                lineWidth: 5
                                            )
                                    )
                            }
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
                                if playerNames.allSatisfy({ $0.isEmpty == false }) {
                                    print("Filled", playerNames)
                                    for name in playerNames {
                                        playerList.addPlayer(name: name)
                                    }
                                }
                                else {
                                    print("Not Filled", playerNames)
                                    for i in 1...numberOfPeople {
                                        let playerName = "Player \(i)"
                                        playerList.addPlayer(name: playerName)
                                    }
                                }
                            }
                    )
            }
        }
        .onAppear {
            self.playerList.players = []
            self.playerNames = Array(repeating: "", count: numberOfPeople)
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static let maxValue = CGFloat.superViewFrameHeight * 2 / 3
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        let newValue = max(value, nextValue())
        value = maxValue >= newValue ? newValue : maxValue
    }
}

struct PlayerNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameInputView(numberOfPeople: 5, path: Binding.constant([]))
    }
}
