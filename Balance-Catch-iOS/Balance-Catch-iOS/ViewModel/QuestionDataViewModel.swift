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
    
    func getQuestionMetaData() {
        NetworkManager.shared.getQuestionMetaData()
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print("데이터 응답 성공!")
                case .failure(let error):
                    print("error - \(error.localizedDescription)")
                }
            } receiveValue: { data in
                print("data - \(data)")
                
                let data = data.compactMap { questionDataResponseModel in
                    QuestionDataModel(response: questionDataResponseModel)
                }
                self.questionDataList.send(data)
            }
            .cancel(with: cancelBag)
    }
    
    func putQuestionLike() {
        guard let selectedQuestionData = selectedQuestionData else { return }
        
        NetworkManager.shared.putQuestionLike(id: selectedQuestionData.id,
                                              good: selectedQuestionData.good,
                                              bad: selectedQuestionData.bad,
                                              firstQuestionScore: selectedQuestionData.firstQuestionScore,
                                              secondQuestionScore: selectedQuestionData.secondQuestionScore)
        .receive(on: DispatchQueue.main)
        .sink { result in
            switch result {
            case .finished:
                print("수정 성공!")
            case .failure(let error):
                print("error - \(error)")
            }
        } receiveValue: { data in
            print("data - \(data)")
        }
        .cancel(with: cancelBag)
    }
}
