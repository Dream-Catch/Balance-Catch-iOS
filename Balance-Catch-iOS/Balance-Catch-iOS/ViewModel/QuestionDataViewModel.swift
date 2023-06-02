//
//  QuestionDataViewModel.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/27.
//

import SwiftUI
import Combine

final class QuestionDataViewModel: ObservableObject {
        
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
                    print("데이터 응답 성공!")
                }
            }, receiveValue: { data in
                print("data - \(data)")
                
                let data = data.compactMap { questionDataResponseModel in
                    QuestionDataModel(response: questionDataResponseModel)
                }
                self.questionDataList.send(data)
            })
            .cancel(with: cancelBag)
    }
}
