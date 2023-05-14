//
//  PlayerNumInputView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct PlayerNumberInputView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var numberOfPeople = 2
    @State private var showAlert = false
    @Binding var path: [Route]
    
    var body: some View {
        ZStack {
            VStack{
                Text("인원을 입력해주세요.")
                    .font(Font.custom("Arial", size: 24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                
                
                
                TextField(
                    "",
                    value: $numberOfPeople,
                    format: .number
                ).font(Font.custom("Arial", size: 60))
                    .padding()
                    .multilineTextAlignment(.center)
                    //.background(RoundedRectangle(cornerRadius: 20).stroke(.balanceCatchBlue, lineWidth: 5))
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("BalanceCatchBlue")
                            .opacity(1),lineWidth: 4))
                    .padding(.horizontal, 45.0)
                    .padding(.vertical, 27.0)
                
                NavigationLink("Next", value: Route.playerNameInputView(numberOfPeople: numberOfPeople))
                    .buttonStyle(RoundedBlueButton())
                    .disabled(numberOfPeople <= 0)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("인원 수 부족"),
                            message: Text("인원 수에 0이하의 값을 넣었습니다."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .onTapGesture {
                        if numberOfPeople <= 0 {
                            showAlert = true
                        }
                    }
            }
        }
        .balanceCatchBackButton {
            dismiss()
        }
    }
}

struct PlayerNumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNumberInputView(path: Binding.constant([]))
    }
}
