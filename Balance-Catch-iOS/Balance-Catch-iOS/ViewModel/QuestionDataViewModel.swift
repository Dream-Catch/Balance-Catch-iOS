//
//  QuestionDataViewModel.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/27.
//

import SwiftUI
import Combine

final class QuestionDataViewModel: ObservableObject {
    
    @Published var isLoading = false
    var questionDataList = CurrentValueSubject<[QuestionDataModel], Never>([])
    var selectedQuestionData: QuestionDataModel? = nil
    var cancelBag = CancelBag()
    
    func getQuestionMetaData() {
        isLoading = true
        NetworkManager.shared.getQuestionMetaData()
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print("데이터 응답 성공!")
                case .failure(let error):
                    print("error - \(error.localizedDescription)")
                    self.isLoading = false
                }
            } receiveValue: { data in
                let data = data.compactMap { questionDataResponseModel in
                    QuestionDataModel(response: questionDataResponseModel)
                }
                self.questionDataList.send(data)
                self.isLoading = false
            }
            .cancel(with: cancelBag)
    }
    
    func putQuestionLike() {
        guard let selectedQuestionData = selectedQuestionData else { return }
        
        isLoading = true
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
                self.isLoading = false
            }
        } receiveValue: { data in
            self.isLoading = false
        }
        .cancel(with: cancelBag)
    }
}
