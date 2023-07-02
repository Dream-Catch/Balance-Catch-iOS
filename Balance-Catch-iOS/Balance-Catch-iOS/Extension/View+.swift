//
//  View+.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/07/01.
//

import SwiftUI

extension View {
    
    func networkAlert(showAlert: Binding<Bool>, completion: @escaping () -> Void) -> some View {
        self.alert(isPresented: showAlert) {
            Alert(title: Text("네트워크 연결이 끊겼습니다."),
                  primaryButton: .default(Text("설정"),
                                          action: {
                openSettings()
                completion()
            }),
                  secondaryButton: .default(Text("재시도"), action: {
                completion()
            }))
        }
    }
    
    private func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
