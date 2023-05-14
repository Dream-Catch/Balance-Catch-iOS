//
//  RecommandOrNotView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/22.
//

import SwiftUI

struct RecommandOrNotView: View {
    @State  var tag:Int? = nil
    @Binding var path: [Route]
    
    var body: some View {
        VStack{
            
            Text("잠수이별 VS 환승이별")
                .font(.system(size:24))
                .fontWeight(.bold)
                .shadow(color:.gray,radius:2,x:3,y:3)
                .padding()
            Text("재미있는 질문이였나요?")
                .font(.subTitle)
                .padding(.bottom,31)
            
            HStack{
                ZStack{
                    NavigationLink("👍🏻", value: Route.publicPickView)
                        .font(.system(size: 35, weight: .bold))
                        .buttonStyle(RoundedButton())
                }
                
                ZStack{
                    NavigationLink("👎🏻", value: Route.publicPickView)
                        .font(.system(size: 35, weight: .bold))
                        .buttonStyle(RoundedButton())
                }
                
            }
            
        }
    }
}

struct RecommandOrNotView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandOrNotView(path: Binding.constant([]))
    }
}
