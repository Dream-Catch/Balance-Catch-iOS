//
//  APIError.swift
//  Balance-Catch-iOS
//
//  Created by SeungMin on 2023/05/04.
//

import Foundation

enum APIError: Error {
    case http(ErrorData)
    case unknown
}

struct ErrorData: Codable {
    var statusCode: Int
    var errorName: String
    var message: String?
}

struct Response<T> {
    let value: T
    let reponse: URLResponse
}

struct APIData<T: Decodable>: Decodable {
//    var statusCode: Int
//    var message: String
    var data: T
}

struct EmptyData: Codable {
//    var statusCode: Int
//    var message: String
}

struct QuestionDataResponseModel: Decodable {
    let id: String
    let question: String
    let good: Int
    let bad: Int
    let firstQuestionScore: Int
    let secondQuestionScore: Int
}
