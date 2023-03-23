//
//  PlayerNumInputView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct PlayerNumberInputView: View {
    @State private var numberOfPeople = 2
    var body: some View {
        ZStack {
            VStack{
                Text("인원을 입력해주세요.")
                    .font(Font.custom("Arial", size: 24))
                
                TextField(
                    "",
                    value: $numberOfPeople,
                    format: .number
                ).font(Font.custom("Arial", size: 60))
                    .padding()
                    .multilineTextAlignment(.center)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 5))
                    .padding(.horizontal, 45.0)
                    .padding(.vertical, 27.0)
                
                NavigationLink(destination: PlayerNameInputView(numberOfPeople: numberOfPeople)) {
                    Text("Next")
                }
                .buttonStyle(RoundedBlueButton())
            }
        }
    }
}

struct PlayerNumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNumberInputView()
    }
}
