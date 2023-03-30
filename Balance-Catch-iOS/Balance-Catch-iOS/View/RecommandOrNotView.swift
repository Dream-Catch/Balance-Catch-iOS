//
//  RecommandOrNotView.swift
//  Balance-Catch-iOS
//
//  Created by 허은정 on 2023/03/22.
//

import SwiftUI

struct RecommandOrNotView: View {
    @State  var tag:Int? = nil
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
                    NavigationLink("👍🏻"){
                        let _ = print("좋아요")
                        PublicPickView()
                    }
                       
                    .buttonStyle(RoundedButton())
                }
                
                ZStack{
                    NavigationLink("👎🏻"){
                        let _ = print("싫어요")
                        PublicPickView()
                    }
                    .buttonStyle(RoundedButton())
                }
                
            }

        }
    }
}

struct RecommandOrNotView_Previews: PreviewProvider {
    static var previews: some View {
        RecommandOrNotView()
    }
}
