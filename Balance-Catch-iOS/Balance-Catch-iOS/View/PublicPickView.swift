//
//  PublicPickView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct PublicPickView: View {
<<<<<<< HEAD
    
    @State private var animationAmount: CGFloat = 1
=======
    @State private var animationAmount:CGFloat = 1
>>>>>>> 1d4cb13c350953411a0eb8044b5eeb1507bf1037
    @State private var firstIncreAmount : Double = 0.0
    @State private var secondIncreAmount : Double = 0.0
    @Binding var path: [Route]
    
    @State var firstQuestion = (question: "잠수이별", amount: 50.0)
    @State var secondQuestion = (question: "환승이별", amount: 50.0)
    
    
  func IsFirstWinner(firstPer:Double,secondPer:Double) -> Bool
    {
        if firstQuestion.amount >= secondQuestion.amount{
            return true
        }
        else{
            return false
        }
            
    }
    
    
//    func whatIsPick(firstPer:Int,secondPer:Int )->Double
//    {
//        if firstAmount>secondAmount {
//            return firstAmount
//        }
//        else{
//            return secondAmount
//        }
//    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text("대중 pick 결과")
                .font(.title)
                .bold()
                .padding(.bottom,90)
            VStack(alignment: .leading) {
                Text(IsFirstWinner(firstPer:firstQuestion.amount, secondPer:secondQuestion.amount) ? firstQuestion.question : secondQuestion.question)
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(.leading,32)
                    .padding(.top,30)
                
                HStack(alignment: .center){
                    ProgressView("", value: firstIncreAmount, total: 100)
                        .progressViewStyle(CustomProgressView(isWin: true ))
                        .padding(.top,20)
                        .padding(.trailing,10)
                        .padding(.bottom,28)
                        .accentColor(IsFirstWinner(firstPer:firstQuestion.amount, secondPer:secondQuestion.amount) ? Color.balanceCatchBlue : Color.lightBlue)
                        .scaleEffect(CGSize(width: 1.0, height: 3.5))
                    
                    Text(IsFirstWinner(firstPer:firstQuestion.amount, secondPer:secondQuestion.amount) ? "\(Int(firstQuestion.amount))%" : "\(Int(secondQuestion.amount))%")
                        .font(.body)
                        .bold()
                        .padding(.bottom,28)
                    
                }
                .padding(.leading,32)
                .padding(.trailing, 48)
            }
            .frame(width: 300, height: 130, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.balanceCatchBlue, lineWidth: 4)
                .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 100)
            )
            .onReceive(timer) { _ in
                if firstIncreAmount < (firstQuestion.amount > secondQuestion.amount ? firstQuestion.amount : secondQuestion.amount){
                    firstIncreAmount += 8
                }
                if animationAmount < 1.2 {
                    animationAmount += 0.02
                }
            }
            .overlay(Text("WIN").position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
            .scaleEffect(animationAmount)
            .animation(.easeIn(duration: 1).delay(1), value: animationAmount)
            .padding(30)
            
            
            
            
            
            
            VStack(alignment: .leading) {
                Text(firstQuestion.amount < secondQuestion.amount ? firstQuestion.question : secondQuestion.question)
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(.leading,32)
                    .padding(.top,23)
                
                HStack(alignment: .center){
                    ProgressView("", value: secondIncreAmount, total: 100)
                        .progressViewStyle(CustomProgressView(isWin: false))
                        .padding(.top,20)
                        .padding(.trailing,10)
                        .padding(.bottom,28)
                        .accentColor(firstQuestion.amount < secondQuestion.amount ? Color.balanceCatchBlue : Color.lightBlue)
                        .scaleEffect(CGSize(width: 1.0, height: 3.5))
                    
                    Text(firstQuestion.amount < secondQuestion.amount ? "\(Int(firstQuestion.amount))%" : "\(Int(secondQuestion.amount))%")
                        .font(.body)
                        .bold()
                        .padding(.bottom,28)
                    
                }
                .padding(.leading,32)
                .padding(.trailing, 48)
            }
            .frame(width: 300, height: 130, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.lightBlue, lineWidth: 4))
            .overlay(Text("LOSE").position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
            .scaleEffect(1)
            .animation(.easeIn(duration: 1).delay(1), value: animationAmount)
            .onReceive(timer) { _ in
                if secondIncreAmount < (firstQuestion.amount < secondQuestion.amount ? firstQuestion.amount : secondQuestion.amount) {
                    secondIncreAmount += 8
                }
            }
            .padding(30)
            
            
            ZStack {
                NavigationLink("Next", value: Route.whoIsLoserView)
                    .buttonStyle(RoundedBlueButton())
            }
        }
    }
}

struct PublicPickView_Previews: PreviewProvider {
    static var previews: some View {
        PublicPickView(path: Binding.constant([]))
    }
}
