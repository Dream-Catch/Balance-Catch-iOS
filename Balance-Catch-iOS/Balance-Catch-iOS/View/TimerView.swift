//
//  TimerView.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct TimerView: View {
    
    var body: some View{

            VStack{
                Text("전체 토론 TIME")
                    .font(.system(size:36))
                    .fontWeight(.bold)
                    .shadow(color:.gray,radius:2,x:3,y:3)
                    .padding(.bottom, 5)
                
                TimerCode()
                
                NavigationLink("Next") {
                    UserFinalSelectView()
                }
                .buttonStyle(RoundedBlueButton())
            }//Vstack
        
    }
    
}


struct TiimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
