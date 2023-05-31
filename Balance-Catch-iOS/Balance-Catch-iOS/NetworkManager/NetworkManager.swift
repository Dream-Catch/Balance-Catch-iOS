//
//  NetworkManager.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/04.
//

import Alamofire
import Combine
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    private var baseURL = "https://6432f56bd0127730d2de5986.mockapi.io/api/v1"
    
    // MARK: - Questions
    private let questions = "/questions"
    
//    func getQuestionMetaData() -> AnyPublisher<APIData<[QuestionDataModel]>, APIError> {
    func getQuestionMetaData() -> AnyPublisher<[QuestionDataModel], APIError> {
        let request = getRequest(URL(string: baseURL + questions))
        
        return run(request)
            .print()
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

extension NetworkManager {
    
    func getRequest(_ url: URL?, paramters: [String: Any] = [:]) -> DataRequest {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json;charset=UTF-8"]
        let request = AF.request(url!, method: .get, parameters: paramters, headers: headers)
        return request
    }
    
    func run<T: Decodable>(_ request: DataRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, APIError> {
        return request.validate().publishData(emptyResponseCodes: [200, 204, 205]).tryMap { result -> Response<T> in
            if let error = result.error {
                if let errorData = result.data {
                    let value = try decoder.decode(ErrorData.self, from: errorData)
                    throw APIError.http(value)
                } else {
                    throw error
                }
            }
            if let data = result.data {
#if DEBUG
                if let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)")
                }
#endif
                let value = try decoder.decode(T.self, from: data)
                return Response(value: value, reponse: result.response!)
            } else {
                return Response(value: Empty.emptyValue() as! T, reponse: result.response!)
            }
        }
        .mapError { (error) -> APIError in
            print(error)
            if let apiError = error as? APIError {
                return apiError
            } else {
                return .unknown
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
