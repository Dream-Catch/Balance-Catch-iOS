//
//  SecondTeamSpeakingView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/04/11.
//

import SwiftUI

struct SecondTeamSpeakingView: View {
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 15 // 사람 수 * 일정 시간 을 받아와서 시간 설정을 해야할 듯
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var showingAlert = false
    @State var tag : Int? = nil
    @State var startButtonPressed = false
    @State var nextButtonPressed = false
    
    
    var body: some View{
        
        Spacer()
        
        VStack{
            Text("최후 변론 TIME")
                .font(.system(size:36))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding(.bottom, 35)
                .padding(.top,-10)
            
            HStack{
                Text("Player 1")
                    .font(.system(size:28))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:3,x:2,y:2)
                
                Text("제리") // 나중에 질문 값 받아와야 함
                    .font(.system(size: 22, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .frame(width: 150, height: 56)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
                    .padding(.leading, 24)
                
            }.padding(.bottom, 40)
            
            ZStack { //타이머 관련 코드
                
                VStack{
                    
                    ZStack{
                        Circle() // 전체 시간 원
                            .trim(from: 0, to: 1)
                            .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35,lineCap: .round))
                            .frame(width: 280, height: 280)
                        
                        Circle() // 시간 줄어드는 원
                            .trim(from: 0, to: self.to)
                            .stroke(count > 5 ? Color("BalanceCatchBlue") : Color.red, style: StrokeStyle(lineWidth: 35,lineCap: .round)) // 5초 밑으로 떨어지면 색상 변경
                            .frame(width: 280, height: 280)
                            .rotationEffect(.init(degrees: -90))
                        
                        VStack{
                            Text(String(format:"%02i:%02i",self.count/60,self.count%60))
                                .font(.system(size: 65, weight: .bold))
                        }
                    }
                    
                    
                }
                
                NavigationLink(destination: UserFinalSelectView(),tag: 1, selection: self.$tag ) {}
            }
            .onReceive(self.time) { (_) in
                if startButtonPressed {
                    if self.count != 0 {
                        self.count -= 1
                        
                        withAnimation(.default){
                            self.to = CGFloat(self.count) / 15 // 총 시간 (초) 를 넣어줘야함
                            
                        }
                    }
                    if self.count == 0 {
                        if tag != nil { //tag가 nill이 아닐 경우
                            self.showingAlert = false
                        }else{
                            if self.nextButtonPressed == false {
                                self.showingAlert = true
                            }
                        }
                    }
                }
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("양측 최후 변론 종료!"),
                      message: Text("최종 선택을 진행합니다"),
                      dismissButton: .default(Text("Close"),
                                              action: {
                    self.nextButtonPressed = true
                    self.tag = 1
                }))
            }.padding(.bottom, 50)
            
            Button(action: {
                if(self.startButtonPressed == false){
                    self.startButtonPressed = true
                } else {
                    self.tag = 1
                    self.nextButtonPressed = true
                }
            }, label : {
                Text(startButtonPressed ? "Next" : "Start")
            })
            .buttonStyle(RoundedBlueButton())
        }//Vstack
        
        Spacer()
        
    }
    
}


struct SecondTeamSpeakingView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTeamSpeakingView()
    }
}
