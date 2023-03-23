//
//  SelectBox.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/03/23.
//

import SwiftUI

struct SelectBox: View {
    
    @Binding
    var isActivated: Bool
    
    init(isActivated: Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    
    var body: some View {
      
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 150)
            .foregroundColor(self.isActivated ? Color("LightBlue") : Color.white)
            .shadow(color:.gray,radius:2,x:3,y:4)
            .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color("BalanceCatchBlue").opacity(1),lineWidth: 4))
            
            
        
    }
}

struct SelectBox_Previews: PreviewProvider {
    static var previews: some View {
        SelectBox()
    }
}
