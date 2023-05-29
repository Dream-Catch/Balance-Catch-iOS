//
//  WhoIsLoserView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct WhoIsLoserView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [Route]
    
    var body: some View {
        VStack
        {
            Text("벌칙 당첨자💣")
                .font(.system(size: 36, weight: .bold))
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding(.bottom,96)
            
           
            HStack{
                Text("player 2")
                    .font(.subTitle)
                    .padding(21)
                    .shadow(color: .black.opacity(0.25),
                            radius: 2,
                            x: 0,
                            y: 4)
                
                    Text("윌")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 150, height: 62, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color:.gray,radius:2,x:3,y:3)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))

            }
            
            HStack{
                Text("player 3")
                    .padding(21)
                    .font(.subTitle)
                    .shadow(color: .black.opacity(0.25),
                            radius: 2,
                            x: 0,
                            y: 4)
                
                Text("소낙")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 150, height: 62, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
            }
            .padding(.bottom,56)
            
            HStack{
                Button("Plus Person gogo") {
                    moveToPlayerNumberInputView()
                }
                .frame(width: 220,
                       height: 56,
                       alignment: .center)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .background(.balanceCatchBlue)
                .cornerRadius(25)
                .shadow(color: .black.opacity(0.25),
                        radius: 2,
                        x: 0,
                        y: 4)

                Button("Replay") {
                    moveToSelectTypeView()
                }
                .buttonStyle(BiggerRoundedBlueButton())
            }
        }
        .balanceCatchBackButton {
                   dismiss()
               }
        
    }
    
    private func moveToPlayerNumberInputView() {
        path.removeLast(12)
    }
    
    private func moveToSelectTypeView() {
        path.removeLast(9)
    }
}

struct WhoIsLoserView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsLoserView(path: Binding.constant([]))
    }
}
