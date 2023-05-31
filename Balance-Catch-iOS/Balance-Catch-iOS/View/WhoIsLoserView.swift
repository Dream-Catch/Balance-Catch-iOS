//
//  WhoIsLoserView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct WhoIsLoserView: View {

    var body: some View {
        
        
        VStack
        {
            Button("i"){
            }
            .padding(.top,30)
            .offset(x: 150, y: -160)
            .buttonStyle(InformationButton())
        
            }
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
                ZStack{
                    Text("윌")
                        .font(.system(size: 24, weight: .bold))
                }
                .frame(width: 150, height: 62, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.balanceCatchBlue, lineWidth: 4))
                .foregroundColor(.black)
            }
            HStack{
                Text("player 3")
                    .shadow(color: .black.opacity(0.25),
                            radius: 2,
                            x: 0,
                            y: 4)
                
                    .padding(21)
                    .font(.subTitle)
                
                ZStack{
                    Text("소낙")
                        .font(.system(size: 24, weight: .bold))
                    
                }
                .frame(width: 150, height: 62, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.balanceCatchBlue, lineWidth: 4))
                .foregroundColor(.black)
            }
            .padding(.bottom,56)
            
            // 고치기~~~~~~~~~~~~~~~~
            HStack{
                Button("New Game") {
                    moveToPlayerNumberInputView()
                }
                .buttonStyle(BiggerRoundedBlueButton())
                Button("Replay") {
                    moveToSelectTypeView()
                }
                .buttonStyle(BiggerRoundedBlueButton())
            }
        }
        
    } 


struct WhoIsLoserView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsLoserView()
    }
}
