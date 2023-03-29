//
//  UserFirstSelectView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct UserFirstSelectView: View {
    
    @State private var isActivated1: Bool = false
    @State private var isActivated2: Bool = false
    @State var showingSubview = false
    
    var body: some View {
        VStack{
            Text("1차 선택")
                .font(.system(size:24))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding(.bottom, 51)
            
            // Player 1 제리
            HStack{
                Text("Player 1")
                    .font(.system(size:24))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                
                Text("제리")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .frame(width: 150, height: 56)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                    .padding(.leading, 24)
                
            }.padding(.bottom, 40)
            
            
            ZStack{
                
                VStack{
                    Button(action: {
                        if(isActivated2==true){
                            self.isActivated1.toggle()
                            self.isActivated2 = false
                        }
                        else{
                            self.isActivated1.toggle()
                        }
                    })
                    {
                        Text("잠수이별")
                            .font(.system(size: 27))
                            .fontWeight(.bold)
                    }
                    .offset(x: showingSubview ? 0 : -150, y: 0)
                    .buttonStyle(SelectButton(isActivated: $isActivated1))
                    .zIndex(0)
                    .offset(x:-90)
                    
                    
                    
                    
                    Button(action: {
                        if isActivated1 {
                            self.isActivated1 = false
                        }
                        
                        self.isActivated2.toggle()
                    }) {
                        Text("환승이별")
                            .font(.system(size: 27))
                            .fontWeight(.bold)
                        
                    }
                    .buttonStyle(SelectButton(isActivated: $isActivated2))
                    .padding(.bottom, 23)
                    .zIndex(0)
                    .offset(x: 90)
                    .offset(x: showingSubview ? 0 : 150, y: 0)
                    
                }
                
                Text("VS")
                    .font(.system(size:64))
                    .fontWeight(.black)
                    .shadow(color:.gray,radius:2, x: 3, y:3)
                    .zIndex(1)
            }
            
            NavigationLink("Next") {
                TimerView()
            }
            .buttonStyle(RoundedBlueButton())
        }
        .task {
            withAnimation(.easeInOut(duration: 1)) {
                showingSubview.toggle()
            }
        }
        .padding(.top,100)
        .padding(.bottom,100) //임시값
    }
}

struct UserFirstSelect_Previews: PreviewProvider {
    static var previews: some View {
        UserFirstSelectView()
    }
}
