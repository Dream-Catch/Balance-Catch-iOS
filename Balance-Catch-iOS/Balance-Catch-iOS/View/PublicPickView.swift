//
//  PublicPickView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/23.
//

import SwiftUI

struct PublicPickView: View {
    
    @State private var firstAmount : Double = 70.0
    @State private var secondAmount : Double = 30.0
    @State private var firstIncreAmount : Double = 0.0
    @State private var secondIncreAmount : Double = 0.0
    
    func whatIsPick(firstPer:Int,secondPer:Int )->Double
    {
        if firstAmount>secondAmount {
            return firstAmount
        }
        else{
            return secondAmount
        }
    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text("대중 pick 결과")
                .font(.title)
                .bold()
                .padding(.bottom,90)
            VStack(alignment: .leading) {
                Text("잠수이별")
                    .font(.subTitle)
                    .bold()
                    .padding(.leading,32)
                    .padding(.top,23)
                
                HStack(alignment: .center){
                    ProgressView("", value: firstIncreAmount, total: 100)
                        .padding(.top,10)
                        .padding(.trailing,10)
                        .padding(.bottom,20)
                        .accentColor(Color.balanceCatchBlue)
                    
                    Text("\(Int(firstAmount))%")
                        .font(.body)
                        .bold()
                    
                }
                .padding(.leading,32)
                .padding(.trailing, 48)
            }
            .frame(width: 300, height: 130, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.balanceCatchBlue, lineWidth: 4))
            .onReceive(timer) { _ in
                if firstIncreAmount < firstAmount {
                    firstIncreAmount += 5
                }
            }
            .padding(30)
            
            VStack(alignment: .leading) {
                Text("환승이별")
                    .font(.subTitle)
                    .bold()
                    .padding(.leading,32)
                    .padding(.top,23)
                
                HStack(alignment: .center){
                    ProgressView("", value: secondIncreAmount, total: 100)
                        .padding(.top,10)
                        .padding(.trailing,10)
                        .padding(.bottom,20)
                        .accentColor(Color.balanceCatchBlue)
                    
                    Text("\(Int(secondAmount))%")
                        .font(.body)
                        .bold()
                    
                }
                .padding(.leading,32)
                .padding(.trailing, 48)
            }
            .frame(width: 300, height: 130, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.balanceCatchBlue, lineWidth: 4))
            .onReceive(timer) { _ in
                if secondIncreAmount < secondAmount {
                    secondIncreAmount += 5
                }
            }
            .padding(30)
            
            
            ZStack {
                NavigationLink("Next") {
                   WhoIsLoserView()
                }
                .buttonStyle(RoundedBlueButton())
            }
            
            
        }
    }
    
}

struct PublicPickView_Previews: PreviewProvider {
    static var previews: some View {
        PublicPickView()
    }
}
