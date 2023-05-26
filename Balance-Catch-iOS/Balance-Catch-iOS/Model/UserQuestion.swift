//
//  UserQuestion.swift
//  Balance-Catch-iOS
//
//  Created by 민지은 on 2023/05/26.
//

import Foundation

class UserQuestion: ObservableObject {
    @Published var playQuestion: String
    
    init(playQuestion: String = ""){
        self.playQuestion = playQuestion
    }
}
