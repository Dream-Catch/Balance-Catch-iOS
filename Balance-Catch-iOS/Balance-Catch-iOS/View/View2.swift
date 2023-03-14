//
//  View2.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/03/14.
//

import SwiftUI

struct View2: View {
    var body: some View {
        ZStack {
            NavigationLink("Next") {
                View3()
            }
            .buttonStyle(RoundedBlueButton())
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
