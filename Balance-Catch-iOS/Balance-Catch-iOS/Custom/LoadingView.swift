//
//  LoadingView.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/02.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(2)
                .colorInvert()
                .brightness(0.4)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
