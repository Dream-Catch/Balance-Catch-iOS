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
    
    @ObservedObject var playerList = PlayerList()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Text("각자 이름을 입력해주세요")
                    .font(Font.custom("Arial", size: 24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                
                Spacer()
                
                if numberOfPeople <= 0 {
                    Text("Please enter a valid number of people")
                        .foregroundColor(.red)
                } else {
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(0 ..< playerNames.count, id: \.self) { index in
                                VStack {
                                    Text("Player \(index + 1)")
                                        .font(Font.custom("Arial", size: 19))
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.top, 20.0)
                                        .padding(.bottom, 7)
                                        .shadow(color:.gray,radius:2,x:3,y:3)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("Player \(index + 1)", text: self.$playerNames[index])
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal, 45.0)
                                        .padding(.vertical, 30.0)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20).stroke(
                                                self.playerNames[index].isEmpty ? Color.gray:
                                                        .balanceCatchBlue, lineWidth: 5
                                            )
                                        )
                                }
                            }
                        }
                        .padding(.horizontal, 45.0)
                        .padding(.bottom)
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

                Spacer()
                
                NavigationLink(destination: SelectQuestionThemeView()) {
                    Text("Next")
                }
                .buttonStyle(RoundedBlueButton())
                
                Spacer()
                    
            }
        }
        .onAppear {
            self.playerNames = Array(repeating: "", count: numberOfPeople)
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct PlayerNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameInputView(numberOfPeople: 5)
    }
}
