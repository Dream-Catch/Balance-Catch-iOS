//
//  PublicPickView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//
import SwiftUI

struct PublicPickView: View {
    @EnvironmentObject private var questionDataViewModel: QuestionDataViewModel
    @State private var animationAmount: CGFloat = 1
    @State private var firstIncreAmount: Double = 0.0
    @State private var secondIncreAmount: Double = 0.0
    @Binding var path: [Route]
    
    @State var firstQuestion: (question: String, amount: Double) = ("", 50.0)
    @State var secondQuestion: (question: String, amount: Double) = ("", 50.0)
    
    func checkWinner(_ firstQuestionScore: Double, _ secondQuestionScore: Double) -> Bool {
        return firstQuestionScore >= secondQuestionScore
    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("대중 PICK 결과")
                .font(Font.custom("Arial", size: 24))
                .fontWeight(.bold)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
                .padding(.bottom, 70)
            
            VStack(alignment: .leading) {
                Text(checkWinner(firstQuestion.amount, secondQuestion.amount) ? firstQuestion.question : secondQuestion.question)
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(.leading, 32)
                    .padding(.top, 30)
                
                HStack(alignment: .center) {
                    ProgressView("", value: firstIncreAmount, total: 100)
                        .progressViewStyle(CustomProgressView(isWin: true))
                        .padding(.top, 20)
                        .padding(.trailing, 10)
                        .padding(.bottom, 28)
                        .accentColor(checkWinner(firstQuestion.amount, secondQuestion.amount) ? Color.balanceCatchBlue : Color.lightBlue)
                        .scaleEffect(CGSize(width: 1.0, height: 3.5))
                    
                    Text(checkWinner(firstQuestion.amount, secondQuestion.amount) ? "\(Int(firstQuestion.amount))%" : "\(Int(secondQuestion.amount))%")
                        .font(.body)
                        .bold()
                        .padding(.bottom, 28)
                }
                .padding(.leading, 32)
                .padding(.trailing, 48)
            }
            .frame(width: 300, height: 130, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.balanceCatchBlue, lineWidth: 4)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 100)
            )
            .onReceive(timer) { _ in
                if firstIncreAmount < (firstQuestion.amount > secondQuestion.amount ? firstQuestion.amount : secondQuestion.amount) {
                    firstIncreAmount += 8
                }
                if animationAmount < 1.2 {
                    animationAmount += 0.02
                }
            }
            //.overlay(Text("WIN").position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
            .overlay(StrokeText(text: "WIN", width: 2, color: Color.balanceCatchBlue).position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
            .scaleEffect(animationAmount)
            .animation(.easeIn(duration: 1).delay(1), value: animationAmount)
            .padding(30)
            
            VStack(alignment: .leading) {
                Text(firstQuestion.amount < secondQuestion.amount ? firstQuestion.question : secondQuestion.question)
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(.leading, 32)
                    .padding(.top, 23)
                
                HStack(alignment: .center) {
                    ProgressView("", value: secondIncreAmount, total: 100)
                        .progressViewStyle(CustomProgressView(isWin: false))
                        .padding(.top, 20)
                        .padding(.trailing, 10)
                        .padding(.bottom, 28)
                        .accentColor(firstQuestion.amount < secondQuestion.amount ? Color.balanceCatchBlue : Color.lightBlue)
                        .scaleEffect(CGSize(width: 1.0, height: 3.5))
                    
                    Text(firstQuestion.amount < secondQuestion.amount ? "\(Int(firstQuestion.amount))%" : "\(Int(secondQuestion.amount))%")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 28)
                }
                .padding(.leading, 32)
                .padding(.trailing, 48)
            }
            .frame(width: 300, height: 130, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.lightBlue, lineWidth: 4)
            )
            .overlay(StrokeText(text: "LOSE", width: 2, color: Color.lightBlue).position(x: 38, y: 0).font(.system(size: 29, weight: .bold)))
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
        .navigationBarBackButtonHidden()
        .onAppear {
            
            let firstQuestionScore = Double(self.questionDataViewModel.selectedQuestionData?.firstQuestionScore ?? 0)
            
            let secondQuestionScore = Double(self.questionDataViewModel.selectedQuestionData?.secondQuestionScore ?? 0)
            
            let firstPercentage = firstQuestionScore / (firstQuestionScore + secondQuestionScore) * 100
            
            let secondPercentage = secondQuestionScore / (firstQuestionScore + secondQuestionScore) * 100
            
            if firstQuestionScore > secondQuestionScore {
                firstQuestion = (question: self.questionDataViewModel.selectedQuestionData?.firstQuestion ?? "", amount: firstPercentage)
                secondQuestion = (question: self.questionDataViewModel.selectedQuestionData?.secondQuestion ?? "", amount: secondPercentage)
            }
            else {
                firstQuestion = (question: self.questionDataViewModel.selectedQuestionData?.secondQuestion ?? "", amount: secondPercentage)
                secondQuestion = (question: self.questionDataViewModel.selectedQuestionData?.firstQuestion ?? "", amount: firstPercentage)
            }
        }
    }
}


struct PublicPickView_Previews: PreviewProvider {
    static var previews: some View {
        PublicPickView(path: Binding.constant([]))
    }
}
