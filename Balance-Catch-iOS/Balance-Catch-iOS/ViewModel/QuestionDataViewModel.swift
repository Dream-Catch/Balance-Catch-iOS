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
    @Published var showAlert = false
    var questionDataList = CurrentValueSubject<[QuestionDataModel], Never>([])
    var selectedQuestionData: QuestionDataModel? = nil
    var cancelBag = CancelBag()
    
    func getQuestionMetaData() {
        self.isLoading = true
        
        NetworkManager.shared.getQuestionMetaData()
            .receive(on: DispatchQueue.main)
            .sink { result in
                self.isLoading = false
                
                switch result {
                case .finished:
                    print("데이터 응답 성공!")
                    self.showAlert = false
                case .failure(let error):
                    print("error - \(error.localizedDescription)")
                    self.showAlert = true
                }
            } receiveValue: { data in
                let data = data.compactMap { questionDataResponseModel in
                    QuestionDataModel(response: questionDataResponseModel)
                }
                self.questionDataList.send(data)
            }
            .cancel(with: cancelBag)
    }
    
    func putQuestionData() {
        guard let selectedQuestionData = selectedQuestionData else { return }
        self.isLoading = true
        
        NetworkManager.shared.putQuestionLike(id: selectedQuestionData.id,
                                              good: selectedQuestionData.good,
                                              bad: selectedQuestionData.bad,
                                              firstQuestionScore: selectedQuestionData.firstQuestionScore,
                                              secondQuestionScore: selectedQuestionData.secondQuestionScore)
        .receive(on: DispatchQueue.main)
        .sink { result in
            self.isLoading = false
            
            switch result {
            case .finished:
                print("수정 성공!")
                self.showAlert = false
            case .failure(let error):
                print("error - \(error)")
                self.showAlert = true
            }
        } receiveValue: { _ in }
            .cancel(with: cancelBag)
    }
}
