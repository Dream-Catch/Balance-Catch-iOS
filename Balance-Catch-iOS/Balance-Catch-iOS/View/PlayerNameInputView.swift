//
//  PlayerNameInputView.swift
//  Balance-Catch-iOS
//
//  Created by Keith on 2023/03/16.
//

import SwiftUI

struct PlayerNameInputView: View {
    let numberOfPeople: Int
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Text("각자 이름을 입력해주세요")
                    .font(Font.custom("Arial", size: 24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                
                Spacer()
                
                ForEach(0 ..< numberOfPeople) { index in
                    VStack{
                        Text("Player \(index + 1)")
                            .font(Font.custom("Arial", size: 19))
                            .fontWeight(.bold)
                            .shadow(color:.gray,radius:2,x:3,y:3)
                        TextField("Name", text: .constant(""))
                            .font(Font.custom("Arial", size: 19))
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 45.0)
                                .padding(.vertical, 30.0)
                                .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 5))
                    }
                    .padding(.horizontal, 45.0)
                }
                
                Spacer()
                
                NavigationLink("Next") {
                    SelectQuestionThemeView()
                }
                .buttonStyle(RoundedBlueButton())
                
                Spacer()
            }
        }
    }
    
}



struct PlayerNameInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNameInputView(numberOfPeople: 4)
    }
}
