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
                    ScrollView {
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
                        }.padding(.horizontal, 45.0)
                    }
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

struct PlayerNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameInputView(numberOfPeople: 4)
    }
}
