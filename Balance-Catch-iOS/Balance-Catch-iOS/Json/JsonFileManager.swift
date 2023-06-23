//
//  JsonFileManager.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/06/23.
//

import Foundation

final class JsonFileManager {
    
    static var shared = JsonFileManager()
    
    var questionDataList = [QuestionDataModel]()
    
    init() {
        setupData()
    }
    
    private func setupData() {
        if let path = Bundle.main.path(forResource: "QuestionData", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                questionDataList = try decoder.decode([QuestionDataResponseModel].self, from: jsonData).compactMap({ questionData in
                    QuestionDataModel(response: questionData)
                })
            } catch {
                print("Error reading JSON file: \(error)")
            }
        } else {
            print("경로 이상!")
        }

    }
}
