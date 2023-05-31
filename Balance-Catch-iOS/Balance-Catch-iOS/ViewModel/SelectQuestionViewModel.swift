//
//  SelectQuestionViewModel.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/27.
//

import SwiftUI
import Combine

final class SelectQuestionViewModel: ObservableObject {
        
    var isAlreadyFetch = CurrentValueSubject<Bool, Never>(false)
    var questionDataList = CurrentValueSubject<[QuestionDataModel], Never>([])
    var selectedQuestionData: QuestionDataModel? = nil
    var cancelBag = CancelBag()
    
    func fetchQuestionMetaData() {
        NetworkManager.shared.getQuestionMetaData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("error - \(error.localizedDescription)")
                case .finished:
                    print("에러 발생!")
                }
            }, receiveValue: { data in
                print("data - \(data)")
                self.questionDataList.send(data)
            })
            .cancel(with: cancelBag)
    }
}
