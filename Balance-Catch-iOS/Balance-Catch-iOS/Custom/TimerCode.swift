//
//  TimerCode.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct TimerCode: View {
    let date = Date()
    @State var timeRemaining : Int = 100
    let timer = Timer.publish(every: 1,on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                .font(.system(size: 96))
                .fontWeight(.bold)
                .onReceive(timer){ _ in
                    timeRemaining -= 1
                }
        }
        .onAppear{
            calcRemain()
        }
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        if(minutes<=0&&seconds<=0){
            return String(format: "%02i:%02i",0,0)
        }
        else{
            return String(format: "%02i:%02i",minutes,seconds)
        }
    }

    func calcRemain(){
        let calendar = Calendar.current
        let targetTime : Date = calendar.date(byAdding: .second, value: 30,to: date,wrappingComponents: false) ?? Date()
        let remainSeconds = Int(targetTime.timeIntervalSince(date))
        self.timeRemaining = remainSeconds
        
    }
    
}



struct TimerCode_Previews: PreviewProvider {
    static var previews: some View {
        TimerCode()
    }
}
