////
////  FinalCircleTimer.swift
////  Balance-Catch-iOS
////
////  Created by 민지은 on 2023/04/10.
////
//
//import SwiftUI
//
//struct FinalCircleTimer: View {
//    
//    @State var start = false
//    @State var to : CGFloat = 0
//    @State var count = 20 // 최후 변론이라서 시간을 짧게 가져감
//    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    @State private var showingAlert = false
//    @State var tag : Int? = nil
//    
//    var body: some View {
//        
//        ZStack {
//            
//            VStack{
//                
//                ZStack{
//                    Circle() // 전체 시간 원
//                        .trim(from: 0, to: 1)
//                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35,lineCap: .round))
//                        .frame(width: 280, height: 280)
//                    
//                    Circle() // 시간 줄어드는 원
//                        .trim(from: 0, to: self.to)
//                        .stroke(count > 10 ? Color("BalanceCatchBlue") : Color.red, style: StrokeStyle(lineWidth: 35,lineCap: .round)) // 10초 밑으로 떨어지면 색상 변경
//                        .frame(width: 280, height: 280)
//                        .rotationEffect(.init(degrees: -90))
//                    
//                    VStack{
//                        Text(String(format:"%02i:%02i",self.count/60,self.count%60))
//                            .font(.system(size: 65, weight: .bold))
//                    }
//                }
//                
//                
//            }
//            
//            NavigationLink(destination: UserFinalSelectView(paths: paths), tag: 1, selection: self.$tag ) {}
//        }
//        .onReceive(self.time) { (_) in
//            
//            if self.count != 0 {
//                self.count -= 1
//                
//                withAnimation(.default){
//                    self.to = CGFloat(self.count) / 20 // 총 시간 (초) 를 넣어줘야함
//                    
//                }
//            }
//            if self.count == 0 {
//                if tag != nil { //tag가 nill이 아닐 경우
//                    self.showingAlert = false
//                }else{
//                    self.showingAlert = true
//                }
//            }
//        }.alert(isPresented: $showingAlert) {
//            Alert(title: Text("최후 변론 종료!"),
//                  message: Text("최종 선택으로 넘어갑니다"),
//                  dismissButton: .default(Text("Close"),
//                                          action: {
//                self.tag = 1
//            }))
//        }
//    }
//}
//
//
//struct FinalCircleTimer_Previews: PreviewProvider {
//    static var previews: some View {
//        FinalCircleTimer()
//    }
//}
